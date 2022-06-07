--[==[

TODOs:

* Fix colors on wider characters from Devicons (e.g.  ).
    This is a Hyper problem. It's changing the color of the character under the cursor.
* Fix slow movement through options in Telescope previews.
* Setup Vista or find an alternative. What about ctags?
* Fix Goyo + NvimTree width issues.

--]==]

vim.cmd [[
    function! HiGroup()
        let l:s = synID(line('.'), col('.'), 1)
        echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
    endfun
]]
vim.cmd [[command! Hg :call HiGroup()]]

require 'helpers'
require 'keymaps'
require 'plugins'
require 'snippets'

local config = require 'config'
local env    = require 'env'

-- TODO: Restructure the config, so that this can be placed in it without cyclic dependencies.
--config.langservers.noverify.root_dir = require 'lspconfig.util'.root_pattern('psalm.xml', 'psalm.xml.dist')

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
vim.opt.ttimeout       = true
vim.opt.ttimeoutlen    = 100
vim.opt.conceallevel   = 3
vim.opt.number         = true
vim.opt.undodir        = vim.env.HOME .. '/.vim/undodir'
vim.opt.undofile       = true
vim.opt.backupcopy     = 'yes'

--vim.opt.smartindent = true

--vim.cmd 'syntax on'
--vim.cmd 'filetype on'
--vim.cmd 'filetype plugin on'
--vim.cmd 'filetype indent on'

if env.light then
    vim.cmd('colorscheme ' .. config.lightscheme)
else
    vim.cmd('colorscheme ' .. config.darkscheme)
end

if env.transparent then
    vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
    vim.cmd 'hi NormalNC guibg=NONE ctermbg=NONE'
end

-- Indentation:

ftautocmd('c',   setlocal('comments', comments('multi', 'doc', 'slash')))
ftautocmd('cpp', setlocal('comments', comments('multi', 'doc', 'slash')))
ftautocmd('js',  setlocal('comments', comments('multi', 'doc', 'slash')))
ftautocmd('php', setlocal('comments', comments('multi', 'doc', 'slash', 'hash')))
ftautocmd('cth', setlocal('comments', comments('multi', 'doc', 'slash', 'hash')))

ftautocmd('c',   setlocal('formatoptions', formatting('basic')))
ftautocmd('cpp', setlocal('formatoptions', formatting('basic')))
ftautocmd('js',  setlocal('formatoptions', formatting('basic')))
ftautocmd('php', setlocal('formatoptions', formatting('basic')))
ftautocmd('cth', setlocal('formatoptions', formatting('basic')))

ftautocmd('c',   setlocal('cindent'))
ftautocmd('cpp', setlocal('cindent'))
ftautocmd('js',  setlocal('cindent'))
ftautocmd('php', setlocal('cindent'))
ftautocmd('cth', setlocal('cindent'))

ftautocmd('php', setlocal('indentexpr', ''))

vim.cmd(set('cinkeys-',    '0#'))
vim.cmd(set('indentkeys-', '0#'))

-- Additional languages:
filetype('*.cth', 'cynth')
syntax('*.cth', 'c')

-- GitSigns:
require 'gitsigns'.setup()

-- IndentBlankline:
--require 'indent_blankline'.setup()

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
    autocmd('BufWinEnter', '*', luacall('init.' .. type))
end

-- Telescope:
require 'telescope'.setup {
    pickers = {
        --find_files                = {theme = 'dropdown'},
        --grep_string               = {theme = 'dropdown'},
        --current_buffer_fuzzy_find = {theme = 'dropdown'},
        --marks                     = {theme = 'dropdown'},
        --buffers                   = {theme = 'dropdown', sort_lastused = true},
        --help_tags = {theme = 'dropdown'},
        buffers = {sort_lastused = true},
    },
    defaults = {
        --[[
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
        },
        ]]
        --file_ignore_patterns = {'node_modules'},
        prompt_prefix          = '   ',
        selection_caret        = '  ',
        entry_prefix           = '  ',
        initial_mode           = 'insert',
        selection_strategy     = 'reset',
        sorting_strategy       = 'ascending',
        layout_strategy        = 'horizontal',
        file_sorter            = require 'telescope.sorters'.get_fuzzy_file,
        generic_sorter         = require 'telescope.sorters'.get_generic_fuzzy_sorter,
        file_previewer         = require 'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer         = require 'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer       = require 'telescope.previewers'.vim_buffer_qflist.new,
        buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker,
        path_display           = {'truncate'},
        winblend               = 0,
        border                 = {},
        --borderchars            = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        borderchars            = {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
        color_devicons         = true,
        use_less               = true,
        set_env                = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        layout_config = {
            horizontal = {
                prompt_position = 'top',
                preview_width   = 0.55,
                results_width   = 0.8
            },
            vertical = {
                mirror = false
            },
            width          = 0.87,
            height         = 0.80,
            preview_cutoff = 120
        }
    }
}
--require 'telescope'
require 'telescope'.load_extension 'fzf'
--require 'telescope'.load_extension 'themes'
--require 'telescope'.load_extension 'terms'

function hi (group, fg, bg)
    if not fg then
        vim.cmd('hi ' .. group .. ' guibg=' .. bg)
    elseif not bg then
        vim.cmd('hi ' .. group .. ' guifg=' .. fg)
    else
        vim.cmd('hi ' .. group .. ' guifg=' .. fg .. ' guibg=' .. bg)
    end
end

hi('TelescopeBorder',       config.colors.dark,  config.colors.dark)
hi('TelescopePromptBorder', config.colors.light, config.colors.light)
hi('TelescopePromptNormal', config.colors.white, config.colors.light)
hi('TelescopePromptPrefix', config.colors.red,   config.colors.light)
hi('TelescopeNormal',       nil, config.colors.dark)
hi('TelescopePreviewTitle', config.colors.black, config.colors.green)
hi('TelescopePromptTitle',  config.colors.black, config.colors.red)
hi('TelescopeResultsTitle', config.colors.dark,  config.colors.dark)
hi('TelescopeSelection',    nil, config.colors.light)
hi('NormalFloat', nil, config.colors.dark)
--hi('FloatBorder', config.colors.blue)

-- TreeSitter:
if env.treesitter then
    require 'nvim-treesitter.configs'.setup {
        ensure_installed = 'maintained',
        sync_install     = false,
        highlight = {
            enable  = true,
            disable = {},
            additional_vim_regex_highlighting = true
        }
    }
end

-- NvimTree:
--vim.g.nvim_tree_icons = config.icons.nvimtree
--vim.g.nvim_tree_indent_markers = 1
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
                {key = '<C-e>', action = ''},
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
    renderer = {
        indent_markers = {
            enable = true
        },
        icons = {
            glyphs = config.icons.nvimtree,
            --padding = '  '
        }
    }
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
if env.lsp then
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
            --['<Down>']    = cmp.config.disable,
            --['<Up>']      = cmp.config.disable,
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
    for server, opts in pairs(config.langservers) do
        opts.capabilities = capabilities
        require 'lspconfig'[server].setup(opts)
    end
    vim.cmd [[set completeopt=menuone,noinsert,noselect]]
    require 'trouble'.setup {
        signs = config.icons.diagnostics.trouble
    }
    for type, icon in pairs(config.icons.diagnostics.native) do
        local hl = 'DiagnosticSign' .. firstupper(type)
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
    end
end

-- Lualine:
local lltheme = {
    normal = {
        a = {bg = config.colors.gray,   fg = config.colors.light, gui = 'bold'},
        b = {bg = config.colors.light,  fg = config.colors.gray},
        c = {bg = config.colors.dark,   fg = config.colors.gray}
    },
    insert = {
        a = {bg = config.colors.blue,   fg = config.colors.light, gui = 'bold'},
        b = {bg = config.colors.light,  fg = config.colors.gray},
        c = {bg = config.colors.dark,   fg = config.colors.gray}
    },
    visual = {
        a = {bg = config.colors.yellow, fg = config.colors.light, gui = 'bold'},
        b = {bg = config.colors.light,  fg = config.colors.gray},
        c = {bg = config.colors.dark,   fg = config.colors.gray}
    },
    replace = {
        a = {bg = config.colors.red,    fg = config.colors.light, gui = 'bold'},
        b = {bg = config.colors.light,  fg = config.colors.gray},
        c = {bg = config.colors.dark,   fg = config.colors.gray}
    },
    command = {
        a = {bg = config.colors.green,  fg = config.colors.light, gui = 'bold'},
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
        lualine_c = {{'filename', path = 1}},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
}

-- Snippy:
--[=[require 'snippy'.setup {
    mappings = {
        is = {
            ['<Tab>'] = 'expand_or_advance',
            ['<S-Tab>'] = 'previous',
        },
        nx = {
            ['<leader>x'] = 'cut_text',
        },
    },
}
]=]
