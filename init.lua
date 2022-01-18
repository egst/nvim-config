--[==[

TODOs:

* Fix colors on wider characters from Devicons (e.g.  ).
    This is a Hyper problem. It's changing the color of the character under the cursor.
* Fix slow movement through options in Telescope previews.
* Setup Vista or find an alternative. What about ctags?
* Fix Goyo + NvimTree width issues.

--]==]

require 'helpers'
require 'keymaps'
require 'plugins'
require 'snippets'

local config = require 'config'

-- General:
vim.opt.encoding       = 'utf-8'
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.wrap           = false
vim.opt.cursorline     = true
vim.opt.incsearch      = true
vim.opt.hlsearch       = true
vim.opt.tabstop        = config.tabwidth
vim.opt.shiftwidth     = config.tabwidth
vim.opt.expandtab      = true
vim.opt.foldmethod     = 'manual'
vim.opt.foldenable     = false
vim.opt.updatetime     = 500
vim.opt.hidden         = true
vim.opt.colorcolumn    = config.rulers
vim.opt.sidescrolloff  = config.scrolloff.x
vim.opt.scrolloff      = config.scrolloff.y
vim.opt.termguicolors  = true
vim.opt.list           = true
vim.opt.listchars      = config.whitespace
vim.opt.signcolumn     = 'yes'
vim.opt.mouse          = 'a'
vim.opt.ttimeoutlen    = 0
vim.opt.conceallevel   = 3
vim.opt.number         = true
vim.opt.undodir        = vim.env.HOME .. '/.vim/undodir'
vim.opt.undofile       = true

vim.cmd 'syntax on'
vim.cmd 'filetype on'
vim.cmd 'filetype plugin on'
vim.cmd 'filetype indent on'

vim.cmd('colorscheme ' .. config.colorscheme)

-- Syntax highlighting:

function syntax (lang)
    return 'set syntax=' .. lang
end
autocmd('BufRead,BufNewFile', '.cth', luacall('syntax', 'c'))

--vim.cmd [[hi clear TSNote]]
--vim.cmd [[hi clear Special]]

-- GitSigns:
require 'gitsigns'.setup()

-- IndentBlankline:
require 'indent_blankline'.setup()

-- Specific buffer types:

local function vertinit ()
    vim.cmd [[wincmd H]]
end
local function cleaninit ()
    vim.opt.list           = true
    vim.opt.listchars      = {tab = '  '}
    vim.opt.colorcolumn    = {}
    vim.opt.number         = false
    vim.opt.relativenumber = false
    vim.cmd [[IndentBlanklineDisable]]
end
local function cleanvertinit ()
    cleaninit()
    vertinit()
end

init = {
    help     = ftaction('help',     cleanvertinit),
    nvimtree = ftaction('NvimTree', cleaninit),
    trouble  = ftaction('Trouble',  cleaninit),     -- TODO: trouble does not trigger BufRead nor BufWinEnter
    git      = ftaction('git',      cleanvertinit), -- TODO: indent guides are not disabled in git log
}

for type, _ in pairs(init) do
    autocmd('BufRead, BufWinEnter', '*', luacall('init.' .. type))
end

-- Telescope:
require 'telescope'.setup {
    pickers = {
        find_files                = {theme = 'dropdown'},
        grep_string               = {theme = 'dropdown'},
        current_buffer_fuzzy_find = {theme = 'dropdown'},
        marks                     = {theme = 'dropdown'},
        buffers                   = {theme = 'dropdown', sort_lastused = true},
        --help_tags = {theme = 'dropdown'},
    },
}
require 'telescope'.load_extension 'fzf'

-- TreeSitter:
require 'nvim-treesitter.configs'.setup {
    ensure_installed = 'maintained',
    sync_install     = false,
    highlight = {
        enable  = true,
        disable = {},
        --additional_vim_regex_highlighting = true
    }
}

-- NvimTree:
vim.g.nvim_tree_icons = config.icons.nvimtree
vim.g.nvim_tree_indent_markers = 1
--vim.g.nvim_tree_icon_padding = '  '
local treecmd = require 'nvim-tree.config'.nvim_tree_callback
require 'nvim-tree'.setup {
    --disable_netrw = false,
    --hijack_netrw  = true,
    hijack_cursor = true,
    view = {
        width  = 40,
        height = 40,
        side = 'right',
        mappings = {
            list = {
                {key = 'C', cb = treecmd('cd')},
            }
        },
    },
    git = {
        ignore = false
    },
    diagnostics = {
        enable = true,
        icons = config.icons.diagnostics.nvimtree
    },
}

-- Goyo:
vim.g.goyo_width  = 121
vim.g.goyo_linenr = 1

-- Limelight:
vim.g.limelight_default_coefficient = 0.7
vim.g.limelight_paragraph_span      = 1

-- Closetag:
vim.g.closetag_filenames = '*.html,*.php'

-- LSP and related plugins:
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            require 'snippy'.expand_snippet(args.body)
        end,
    },
    mapping = {
        ['<C-U>']     = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-D>']     = cmp.mapping(cmp.mapping.scroll_docs(4),  {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(),      {'i', 'c'}),
        ['<C-Y>']     = cmp.config.disable, -- Not sure what's this for.
        ['<Cr>']      = cmp.mapping.confirm {select = true},
        ['<C-E>']     = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
    },
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'snippy'},
    }, {
        {name = 'buffer'},
    }),
    formatting = {
        format = function (entry, item)
            item.menu = config.icons.source[entry.source.name]
            item.kind = config.icons.completion[alllower(item.kind)]
            return item
        end
    }
}
local capabilities = require 'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, server in pairs(config.langservers) do
    require 'lspconfig'[server].setup {capabilities = capabilities}
end
vim.cmd [[set completeopt=menuone,noinsert,noselect]]
require 'trouble'.setup {
    signs = config.icons.diagnostics.trouble
}
for type, icon in pairs(config.icons.diagnostics.native) do
    local hl = 'DiagnosticSign' .. firstupper(type)
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

-- Lualine:
local lltheme = {
    normal = {
        a = {bg = config.colors.gray,   fg = config.colors.black, gui = 'bold'},
        b = {bg = config.colors.light,  fg = config.colors.gray},
        c = {bg = config.colors.dark,   fg = config.colors.gray}
    },
    insert = {
        a = {bg = config.colors.blue,   fg = config.colors.black, gui = 'bold'},
        b = {bg = config.colors.light,  fg = config.colors.gray},
        c = {bg = config.colors.dark,   fg = config.colors.gray}
    },
    visual = {
        a = {bg = config.colors.yellow, fg = config.colors.black, gui = 'bold'},
        b = {bg = config.colors.light,  fg = config.colors.gray},
        c = {bg = config.colors.dark,   fg = config.colors.gray}
    },
    replace = {
        a = {bg = config.colors.red,    fg = config.colors.black, gui = 'bold'},
        b = {bg = config.colors.light,  fg = config.colors.gray},
        c = {bg = config.colors.dark,   fg = config.colors.gray}
    },
    command = {
        a = {bg = config.colors.green,  fg = config.colors.black, gui = 'bold'},
        b = {bg = config.colors.light,  fg = config.colors.gray},
        c = {bg = config.colors.dark,   fg = config.colors.gray}
    },
    inactive = {
        a = {bg = config.colors.dark,   fg = config.colors.gray, gui = 'bold'},
        b = {bg = config.colors.dark,   fg = config.colors.gray},
        c = {bg = config.colors.dark,   fg = config.colors.gray}
    }
}
local function modefmt (mode)
    return (config.icons.mode[alllower(mode)] or ' ')
end
local function diagfmt (status)
    return status
        :gsub('% ', config.icons.diagnostics.native.error)
        :gsub('% ', config.icons.diagnostics.native.warn)
        --:gsub('%? ', config.icons.diagnostics.native.hint) -- TODO
        --:gsub('%? ', config.icons.diagnostics.native.info) -- TODO
end
require 'lualine'.setup {
    options = {
        theme = lltheme,
        component_separators = {left = '│', right = '│'},
        section_separators   = {left = '',  right = ''},
        disabled_filetypes = {
            'NvimTree',
            'Trouble',
        }
    },
    sections = {
        lualine_a = {{'mode', fmt = modefmt}},
        lualine_b = {'branch', 'diff', {'diagnostics', fmt = diagfmt}},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
}
