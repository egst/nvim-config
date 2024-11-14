if vim.g.vscode then
    return
end

local config = require 'config'

require 'nvim-tree'.setup {
    hijack_cursor = true,
    on_attach = function (buffer)
        local api = require 'nvim-tree.api'
        local function opts (description)
            return {
                desc    = 'nvim-tree: ' .. description,
                buffer  = buffer,
                noremap = true,
                silent  = true,
                nowait  = true,
            }
        end
        local noop = function () end
        api.config.mappings.default_on_attach(buffer)
        vim.keymap.del('n', '<C-e>', {buffer = buffer})
        vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('Change root'))
    end,
    view = {
        preserve_window_proportions = true,
        width = config.treeWidth,
        side  = config.treePosition,
    },
    git = {
        ignore = false
    },
    diagnostics = {
        enable = true,
        icons  = config.icons.diagnostics.nvimtree
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
