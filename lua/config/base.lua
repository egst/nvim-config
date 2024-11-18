return {
    lsp        = false,
    treeSitter = false,

    selection = 'primary',

    lightScheme    = 'dawnfox',
    darkScheme     = 'nightfox',
    useLightScheme = false,
    transparent    = false,

    tabWidth  = 4,
    rulers    = {120},
    scrollOff = {x = 32, y = 8},

    treeWidth    = 40,
    treePosition = 'right',

    whiteSpace = {
        tab      = ' ━ ',
        trail    = '·',
        extends  = '›',
        precedes = '‹'
    },

    langServers = {},

    icons = {
        mode = {
            normal      = '󰆾 ',
            insert      = '󱄽 ',
            visual      = '󰴲 ',
            ['v-line']  = '󰒉 ',
            ['v-block'] = '󱟃 ',
            replace     = ' ',
            command     = ' ',
        },
        diagnostics = {
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
            class         = ' ',
            color         = ' ',
            constant      = ' ',
            constructor   = ' ',
            enum          = ' ',
            enumMember    = ' ',
            field         = ' ',
            file          = ' ',
            folder        = ' ',
            ['function']  = '󰊕 ',
            interface     = ' ',
            keyword       = ' ',
            method        = '󰊕 ',
            module        = '󰆧 ',
            property      = ' ', -- TODO: This one isn't properly displayed in WT.
            snippet       = ' ',
            struct        = ' ',
            text          = ' ',
            unit          = ' ',
            value         = ' ',
            variable      = ' ', -- TODO: This one isn't properly displayed in WT.
            reference     = ' ',
            event         = ' ',
            operator      = ' ',
            typeparameter = ' ',
        },
        source = {
            nvim_lsp = 'λ ',
            buffer   = ' ',
        },
        nvimtree = {
            default = '',
            symlink = '',
            git = {
                unstaged  = '',
                staged    = '',
                untracked = '',
                deleted   = '',
                unmerged  = '', -- TODO: This one looks wierd in WT.
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
        dark    = '#303030',
        blue    = '#719cd6',
        cyan    = '#63cdcf',
        green   = '#81b29a',
        magenta = '#9d79d6',
        orange  = '#f4a261',
        pink    = '#d67ad2',
        red     = '#c94f6d',
        yellow  = '#dbc074',
    },

    comments = {
        slash = '://',               -- // ...
        hash  = ':#',                -- # ...
        multi = 's1:/*,mb:*,ex:*/',  -- /** ... * ... */
        doc   = 's1:/**,mb:*,ex:*/', -- /* ... * ... */
        plain = 's1:/*,mb:,ex:*/',   -- /* ... */
    },

    formatting = {
        basic = 'jcroql' -- TODO
    }
}
