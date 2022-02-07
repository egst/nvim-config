return {
    --colorscheme = 'dawnfox',
    colorscheme = 'duskfox',

    tabwidth  = 4,
    rulers    = {120},
    scrolloff = {x = 32, y = 8},

    whitespace = {
        tab      = ' ━ ',
        trail    = '·',
        extends  = '›',
        precedes = '‹'
    },

    langservers = {
        clangd = {
            --cmd = {'clangd', '--query-driver=/mnt/c/msys64/mingw64/bin/clang++.exe'}
            --cmd = {'clangd', '--query-driver=/usr/bin/clang++'}
        },
        cssls = {},
        psalm = {},
        --sumneko_lua = {},
        --tsserver = {},
    },

    icons = {
        mode = { -- TODO: Use the same icons in the command line powerline.
            --normal      = ' ',
            --normal      = ' ',
            --normal      = 'ﲼ ',
            --normal      = ' ',
            --insert      = '﫦',
            --insert      = ' ',
            --replace     = ' ',
            --visual      = '濾',
            --['v-line']  = '麗',
            --['v-block'] = '礪',
            --command     = 'ﲵ ',
            normal      = ' ',
            insert      = ' ',
            visual      = ' ',
            ['v-line']  = ' ',
            ['v-block'] = ' ',
            replace     = ' ',
            command     = ' ',
        },
        diagnostics = {
            --hint  = ' ',
            --info  = ' ',
            --info  = ' ',
            --warn  = ' ',
            --warn  = ' ',
            --error = ' ',
            native = {
                error = ' ',
                warn  = ' ',
                hint  = ' ',
                info  = ' ',
            },
            trouble = {
                error       = ' ',
                warning     = ' ',
                hint        = ' ',
                information = ' ',
                other       = ' ',
            },
            nvimtree = {
                error   = " ",
                warning = " ",
                hint    = " ",
                info    = " ",
            }
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
            property      = 'ﰉ ', -- TODO: This one isn't properly displayed in WT.
            snippet       = ' ',
            struct        = ' ',
            text          = ' ',
            unit          = ' ',
            value         = ' ',
            variable      = 'ﰊ ', -- TODO: This one isn't properly displayed in WT.
            reference     = ' ',
            event         = ' ',
            operator      = ' ',
            typeparameter = ' ',
        },
        source = {
            nvim_lsp = 'λ ',
            buffer   = ' ',
        },
        nvimtree = {
            default = '',
            symlink = '',
            git = {
                unstaged  = '',
                staged    = '',
                untracked = '',
                deleted   = '',
                -- TODO:
                unmerged  = '',
                renamed   = '➜',
                ignored   = '◌'
            },
            folder = {
                arrow_open   = '',
                arrow_closed = '',
                default      = '',
                open         = '',
                empty        = '',
                empty_open   = '',
                symlink      = '',
                symlink_open = ''
            }
        }
    },

    colors = {
        white   = '#dfdfe0',
        gray    = '#c0c0d0',
        black   = '#000000',
        light   = '#404050',
        --dark    = '#303040',
        dark    = '#1f1d2e', -- Matches the nightfox theme.
        blue    = '#719cd6',
        cyan    = '#63cdcf',
        green   = '#81b29a',
        magenta = '#9d79d6',
        orange  = '#f4a261',
        pink    = '#d67ad2',
        red     = '#c94f6d',
        yellow  = '#dbc074',
    },
}
