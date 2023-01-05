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
    ['<c-q>'] = actions.send_to_qflist, -- TODO
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

--[=[
--[[table]] {
    ["smart_send_to_loclist"] = --[[table]] { [1] = --[[string]] smart_send_to_loclist, },
    ["_close"] = --[[table]] { [1] = --[[string]] _close, },
    ["complete_tag"] = --[[table]] { [1] = --[[string]] complete_tag, },
    ["edit_command_line"] = --[[table]] { [1] = --[[string]] edit_command_line,} ,
    ["set_command_line"] = --[[table]] { [1] = --[[string]] set_command_line,},
    ["edit_search_line"] = --[[table]] { [1] = --[[string]] edit_search_line,},
    ["set_search_line"] = --[[table]] { [1] = --[[string]] set_search_line,},
    ["edit_register"] = --[[table]] { [1] = --[[string]] edit_register,} ,
    ["cycle_history_prev"] = --[[table]] { [1] = --[[string]] cycle_history_prev,},
    ["open_qflist"] = --[[table]] { [1] = --[[string]] open_qflist,},
    ["open_loclist"] = --[[table]] { [1] = --[[string]] open_loclist,},
    ["cycle_previewers_next"] = --[[table]] { [1] = --[[string]] cycle_previewers_next,},
    ["paste_register"] = --[[table]] { [1] = --[[string]] paste_register,},
    ["cycle_previewers_prev"] = --[[table]] { [1] = [[string]] cycle_previewers_prev,},
    ["remove_selected_picker"] = --[[table]] { [1] = --[[string]] remove_selected_picker,},
    ["insert_symbol_i"] = --[[table]] { [1] = --[[string]] insert_symbol_i,},
    ["insert_value"] = --[[table]] { [1] = [[string]] insert_value,},
    ["git_create_branch"] = --[[table]] { [1] = [[string]] git_create_branch,},
    ["git_apply_stash"] = --[[table]] { [1] = [[string]] git_apply_stash,},
    ["git_checkout"] = --[[table]] { [1] = --[[string]] git_checkout,},
    ["close"] = --[[table]] { [1] = --[[string]] close,},
    ["move_selection_next"] = --[[table]] { [1] = --[[string]] move_selection_next,},
    ["to_fuzzy_refine"] = --[[table]] { [1] = --[[string]] to_fuzzy_refine,},
    ["move_selection_previous"] = --[[table]] { [1] = [[string]] move_selection_previous,},
    ["move_selection_worse"] = --[[table]] { [1] = --[[string]] move_selection_worse,},
    ["nop"] = --[[table]] { [1] = [[string]] nop,},
    ["delete_buffer"] = --[[table]] { [1] = --[[string]] delete_buffer,},
    ["select_default"] = --[[table]] { [1] = --[[string]] select_default,},
    ["move_to_middle"] = --[[table]] { [1] = --[[string]] move_to_middle,},
    ["send_to_qflist"] = --[[table]] { [1] = --[[string]] send_to_qflist,},
    ["move_to_bottom"] = --[[table]] { [1] = --[[string]] move_to_bottom,},
    ["add_selection"] = --[[table]] { [1] = --[[string]] add_selection,},
    ["git_delete_branch"] = --[[table]] { [1] = --[[string]] git_delete_branch,},
    ["remove_selection"] = --[[table]] { [1] = --[[string]] remove_selection,},
    ["toggle_selection"] = --[[table]] { [1] = --[[string]] toggle_selection,},
    ["select_all"] = --[[table]] { [1] = --[[string]] select_all,},
    ["git_merge_branch"] = --[[table]] { [1] = --[[string]] git_merge_branch,},
    ["git_rebase_branch"] = --[[table]] { [1] = --[[string]] git_rebase_branch,},
    ["_clear"] = --[[function]] 'function: 0x7f700a7c4200',
    ["insert_symbol"] = --[[table]] { [1] = --[[string]] insert_symbol,},
    ["git_reset_soft"] = --[[table]] { [1] = --[[string]] git_reset_soft,},
    ["git_track_branch"] = --[[table]] { [1] = --[[string]] git_track _branch,},
    ["drop_all"] = --[[table]] { [1] = --[[string]] drop_all,},
    ["toggle_all"] = --[[table]] { [1] = --[[string]] toggle_all,},
    ["preview_scrolling_up"] = --[[table]] { [1] = --[[string]] preview_scrolling_up,},
    ["git_staging_toggle"] = --[[table]] { [1] = [[string]] git_staging_toggle,},
    ["preview_scrolling_down"] = --[[table]] { [1] = --[[string]] preview_scrolling_down,},
    ["results_scrolling_up"] = --[[table]] { [1] = --[[string]] results_scrolling_up,},
    ["git_reset_mixed"] = --[[table]] { [1] = --[[string]] git_reset_mixed,},
    ["results_scrolling_down"] = --[[table]] { [1] = --[[string]] results_scrolling_down,},
    ["center"] = --[[table]] { [1] = --[[string]] center,},
    ["smart_add_to_loclist"] = --[[table]] { [1] = --[[string]] smart_add_to_loclist,},
    ["git_reset_hard"] = --[[table]] { [1] = --[[string]] git_reset_hard,},
    ["cycle_history_next"] = --[[table]] { [1] = --[[string]] cycle_history_next,},
    ["select_horizontal"] = --[[table]] { [1] = --[[string]] select_horizontal,},
    ["select_vertical"] = --[[table]] { [1] = [[string]] select_vertical,},
    ["select_tab"] = --[[table]] { [1] = --[[string]] select_tab,},
    ["send_selected_to_loclist"] = --[[table]] { [1] = --[[string]] send_selected_to_loclist,},
    ["which_key"] = --[[table]] { [1] = --[[string]] which_key,},
    ["add_selected_to_qflist"] = --[[table]] { [1] = --[[string]] add_selected_to_qflist,},
    ["git_switch_branch"] = --[[table]] { [1] = [[string]] git_switch_branch,},
    ["move_to_top"] = --[[table]] { [1] = [[string]] move_to_top,},
    ["select_drop"] = --[[table]] { [1] = --[[string]] select_drop,},
    ["select_tab_drop"] = --[[table]] { [1] = --[[string]] select_tab_drop,},
    ["move_selection_better"] = --[[table]] { [1] = --[[string]] move_selection_better,},
    ["file_edit"] = --[[table]] { [1] = --[[string]] file_edit,},
    ["file_split"] = --[[table]] { [1] = --[[string]] file_split,},
    ["file_vsplit"] = --[[table]] { [1] = --[[string]] file_vsplit,},
    ["send_selected_to_qflist"] = --[[table]] { [1] = --[[string]] send_selected_to_qflist,},
    ["file_tab"] = --[[table]] { [1] = --[[string]] file_tab,},
    ["add_to_qflist"] = --[[table]] { [1] = --[[string]] add_to_qflist,},
    ["close_pum"] = --[[table]] { [1] = --[[string]] close_pum,},
    ["add_selected_to_loclist"] = --[[table]] { [1] = --[[string]] add_selected_to_loclist,},
    ["send_to_loclist"] = --[[table]] { [1] = [[string]] send_to_loclist,},
    ["add_to_loclist"] = --[[table]] { [1] = [[string]] add_to_loclist,},
    ["git_checkout_current_buffer"] = --[[table]] { [1] = --[[string]] git_checkout_current_buffer,},
    ["smart_send_to_qflist"] = --[[table]] { [1] = --[[string]] smart_send_to_qflist,},
    ["smart_add_to_qflist"] = --[[table]] { [1] = --[[string]] smart_add_to_qflist,},
}
]=]
