return {
    --colorscheme = 'dawnfox'
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
        'clangd',
        --'psalm',
        --'sumneko_lua',
        --'tsserver',
    },

    icons = {
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
        diagnostics = {
            --hint  = " ",
            --info  = " ",
            --warn  = " ",
            --error = " ",
            native = {
                error = '﮻ ',
                warn  = ' ',
                hint  = 'ﯦ ',
                info  = ' ',
            },
            trouble = {
                error       = '﮻ ',
                warning     = ' ',
                hint        = 'ﯦ ',
                information = ' ',
                other       = ' ',
            },
            nvimtree = {
                error   = "﮻ ",
                warning = " ",
                hint    = "ﯦ ",
                info    = " ",
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
        },
        nvimtree = {
            default = '',
            symlink = '',
            git = {
                unstaged  = "",
                staged    = "",
                untracked = "",
                deleted   = "",
                -- TODO:
                unmerged  = "",
                renamed   = "➜",
                ignored   = "◌"
            },
            folder = {
                arrow_open   = "",
                arrow_closed = "",
                default      = "",
                open         = "",
                empty        = "",
                empty_open   = "",
                symlink      = "",
                symlink_open = ""
            }
        }
    },

    colors = {
        --dark    = '#303040',
        dark    = '#1f1d2e', -- Matches the nightfox theme.
        gray    = '#c0c0d0',
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
    },
}
