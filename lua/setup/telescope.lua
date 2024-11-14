if vim.g.vscode then
    return
end

require 'helpers'

local config  = require 'config'
local actions = require 'telescope.actions'
local builtin = require 'telescope.builtin'

local mappings = {
    ['<c-x>'] = actions.delete_buffer,
    ['<c-o>'] = function (buff)
        actions.select_default(buff)
        builtin.resume()
    end,
    --['<c-q>'] = actions.send_to_qflist, -- TODO
    ['<c-f>'] = actions.smart_send_to_qflist + actions.open_qflist,
    ['<c-g>'] = function (buff)
        print(show(actions))
    end, -- TODO
}

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
        --path_display           = {'smart'}, -- TODO: This seems to slow it down.
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
        },
        mappings = {
            n = merge(mappings, {
                --
            }),
            i = merge(mappings, {
                --
            }),
        }
    }
}

--require 'telescope'
require 'telescope'.load_extension 'fzf'
--require 'telescope'.load_extension 'themes'
--require 'telescope'.load_extension 'terms'

hi('TelescopeBorder',       config.colors.dark,  config.colors.dark)
hi('TelescopePromptBorder', config.colors.light, config.colors.light)
hi('TelescopePromptNormal', config.colors.white, config.colors.light)
hi('TelescopePromptPrefix', config.colors.red,   config.colors.light)
hi('TelescopeNormal',       nil, config.colors.dark)
hi('TelescopePreviewTitle', config.colors.black, config.colors.green)
hi('TelescopePromptTitle',  config.colors.black, config.colors.red)
hi('TelescopeResultsTitle', config.colors.dark,  config.colors.dark)
hi('TelescopeSelection',    nil, config.colors.light)
hi('NormalFloat',           nil, config.colors.dark)
--hi('FloatBorder', config.colors.blue)

if config.useLightScheme then
    hi('TelescopeBorder',       config.colors.gray,  config.colors.gray)
    hi('TelescopePromptBorder', config.colors.light, config.colors.light)
    hi('TelescopeNormal',       nil, config.colors.gray)
    hi('TelescopeResultsTitle', config.colors.gray,  config.colors.gray)
    hi('TelescopeSelection',    nil, config.colors.white)
    hi('NormalFloat',           nil, config.colors.gray)
end
