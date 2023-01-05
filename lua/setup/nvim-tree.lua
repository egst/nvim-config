local config = require 'config'

--vim.g.nvim_tree_icons = config.icons.nvimtree
--vim.g.nvim_tree_indent_markers = 1
--vim.g.nvim_tree_icon_padding = '  '
local treecmd = require 'nvim-tree.config'.nvim_tree_callback
require 'nvim-tree'.setup {
    --disable_netrw = false,
    --hijack_netrw  = true,
    hijack_cursor = true,
    view = {
        preserve_window_proportions = true,
        width  = 40,
        --height = 40,
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
            git_placement = 'after',
            show = {
                folder_arrow = false
            }
            --padding = '  '
        }
    }
}
