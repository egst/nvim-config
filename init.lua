--[==[

TODOs:

* Fix colors on wider characters from Devicons (e.g.  ).
    This is a Hyper problem. It's changing the color of the character under the cursor.
* Fix slow movement through options in Telescope previews.
* Setup Vista or find an alternative. What about ctags?
* Fix Goyo + NvimTree width issues.

--]==]

require 'helpers'
require 'plugins'
require 'keymaps'
require 'snippets'

--local colorscheme = 'dawnfox'
local colorscheme = 'duskfox'
local rulers      = {120}
local scrolloff   = {x = 32, y = 8}
local tabwidth    = 4
local whitespace  = {
    tab      = ' ━ ',
    trail    = '·',
    extends  = '›',
    precedes = '‹'
}
local langservers = {
    'clangd',
    --'psalm',
    --'sumneko_lua',
    --'tsserver',
}
local icons = {
    mode = { -- TODO: Use the same icons in the command line powerline.
        --normal      = ' ',
        --normal      = ' ',
        --insert      = '﫦',
        --insert      = ' ',
        --replace     = ' ',
        normal      = 'ﲼ ',
        insert      = ' ',
        visual      = '濾',
        ['v-line']  = '麗',
        ['v-block'] = '礪',
        replace     = ' ',
        command     = 'ﲵ ',
    },
    diagnostics = { -- Native LSP
        error = '﮻ ',
        warn  = ' ',
        hint  = 'ﯦ ',
        info  = ' ',
    },
    trouble = { -- Trouble plugin.
        error       = '﮻ ',
        warning     = ' ',
        hint        = 'ﯦ ',
        information = ' ',
        other       = ' ',
    },
    completion = { -- Native LSP
        class         = ' ',
        color         = ' ',
        constant      = ' ',
        constructor   = ' ',
        enum          = ' ',
        enumMember    = ' ',
        field         = ' ',
        file          = ' ',
        folder        = ' ',
        ['function']  = ' ',
        interface     = ' ',
        keyword       = ' ',
        method        = ' ',
        module        = ' ',
        property      = 'ﰉ ',
        snippet       = ' ',
        struct        = ' ',
        text          = ' ',
        unit          = ' ',
        value         = ' ',
        variable      = 'ﰊ ',
        reference     = ' ',
        event         = ' ',
        operator      = ' ',
        typeparameter = ' ',
    },
    source = {
        nvim_lsp = 'λ ',
        buffer   = ' ',
    }
}
local colors = {
    dark    = '#303040',
    gray    = '#a0a0b0',
    light   = '#404050',
    black   = '#404050',
    blue    = '#719cd6',
    cyan    = '#63cdcf',
    green   = '#81b29a',
    magenta = '#9d79d6',
    orange  = '#f4a261',
    pink    = '#d67ad2',
    red     = '#c94f6d',
    white   = '#dfdfe0',
    yellow  = '#dbc074',
}

-- General:
vim.opt.encoding       = 'utf-8'
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.wrap           = false
vim.opt.cursorline     = true
vim.opt.incsearch      = true
vim.opt.hlsearch       = true
vim.opt.tabstop        = tabwidth
vim.opt.shiftwidth     = tabwidth
vim.opt.expandtab      = true
vim.opt.foldmethod     = 'manual'
vim.opt.foldenable     = false
vim.opt.updatetime     = 500
vim.opt.hidden         = true
vim.opt.colorcolumn    = rulers
vim.opt.sidescrolloff  = scrolloff.x
vim.opt.scrolloff      = scrolloff.y
vim.opt.termguicolors  = true
vim.opt.list           = true
vim.opt.listchars      = whitespace
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

vim.cmd('colorscheme ' .. colorscheme)


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
helpinit = ftaction('help', function ()
    vim.opt.list = true
    vim.opt.listchars = {tab = '  '}
    vim.cmd [[wincmd H]]
end)
autocmd('BufWinEnter', '*', luacall 'helpinit')
treeinit = ftaction('NvimTree', 'IndentBlanklineDisable')
autocmd('BufWinEnter', '*', luacall 'treeinit')
troubleinit = ftaction('Trouble', 'IndentBlanklineDisable')
autocmd('BufWinEnter', '*', luacall 'troubleinit')
gitinit = ftaction('git', function ()
    vim.opt.list = true
    vim.opt.listchars = {tab = '  '}
    vim.cmd [[wincmd H]]
    vim.cmd [[IndentBlanklineDisable]] -- TODO: This has no effect for some reason.
end)
autocmd('BufWinEnter', '*', luacall 'gitinit')

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
vim.g.nvim_tree_indent_markers = 1
--vim.g.nvim_tree_icon_padding   = '  '
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
        ignore = false,
    }
}

-- GitSigns:
--vim.cmd [[set statusline+=%{get(b:,'gitsigns_status','')}]]

-- Goyo:
vim.g.goyo_width  = 121
vim.g.goyo_linenr = 1

-- Limelight:
vim.g.limelight_default_coefficient = 0.7
vim.g.limelight_paragraph_span      = 1

-- Vista:
vim.g.vista_default_executive = 'coc'
vim.g.vista_fzf_preview       = {'right: 50%'}
--vim.g.vista_icon_indent = {'▸ ', ''}
--vim.g.vista_icon_indent = {'╰─▸ ', '├─▸ '}

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
            item.menu = icons.source[entry.source.name]
            item.kind = icons.completion[alllower(item.kind)]
            return item
        end
    }
}

local capabilities = require 'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, server in pairs(langservers) do
    require 'lspconfig'[server].setup {capabilities = capabilities}
end

vim.cmd [[set completeopt=menuone,noinsert,noselect]]

require 'trouble'.setup {
    signs = icons.diagnostics
}

for type, icon in pairs(icons.diagnostics) do
    local hl = 'DiagnosticSign' .. firstupper(type)
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

-- Lualine:
local lltheme = {
    normal = {
        a = {bg = colors.gray,   fg = colors.black, gui = 'bold'},
        b = {bg = colors.light,  fg = colors.gray},
        c = {bg = colors.dark,   fg = colors.gray}
    },
    insert = {
        a = {bg = colors.blue,   fg = colors.black, gui = 'bold'},
        b = {bg = colors.light,  fg = colors.gray},
        c = {bg = colors.dark,   fg = colors.gray}
    },
    visual = {
        a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
        b = {bg = colors.light,  fg = colors.gray},
        c = {bg = colors.dark,   fg = colors.gray}
    },
    replace = {
        a = {bg = colors.red,    fg = colors.black, gui = 'bold'},
        b = {bg = colors.light,  fg = colors.gray},
        c = {bg = colors.dark,   fg = colors.gray}
    },
    command = {
        a = {bg = colors.green,  fg = colors.black, gui = 'bold'},
        b = {bg = colors.light,  fg = colors.gray},
        c = {bg = colors.dark,   fg = colors.gray}
    },
    inactive = {
        a = {bg = colors.dark,   fg = colors.gray, gui = 'bold'},
        b = {bg = colors.dark,   fg = colors.gray},
        c = {bg = colors.dark,   fg = colors.gray}
    }
}
local function modefmt (mode)
    --return (icons.mode[alllower(mode)] or ' ') .. mode
    return (icons.mode[alllower(mode)] or ' ')
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
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
}
