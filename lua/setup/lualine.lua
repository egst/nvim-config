if vim.g.vscode then
    return
end

require 'helpers'

local config = require 'config'

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
    return config.icons.mode[allLower(mode)] or ' '
end

local function trunc (trunc_width, trunc_len, hide_width, front, ellipsis)
    ellipsis = ellipsis or (front and '‹' or '›')
    return function (str)
        local win_width = vim.fn.winwidth(0)
        if hide_width and win_width < hide_width then return ''
        elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
            if front then
                return ellipsis .. str:sub(-trunc_len)
            else
                return str:sub(1, trunc_len) .. ellipsis
            end
        end
        return str
    end
end

local function diagfmt (status)
    status = status
        :gsub('% ', config.icons.diagnostics.native.error)
        :gsub('% ', config.icons.diagnostics.native.warn)
        --:gsub('%? ', config.icons.diagnostics.native.hint) -- TODO
        --:gsub('%? ', config.icons.diagnostics.native.info) -- TODO
    return trunc(nil, nil, 70)(status)
end

local function codeium ()
    status = vim.api.nvim_call_function("codeium#GetStatusString", {})
    manual = vim.g.codeium_manual
    mode   = vim.fn.mode()
    result = nil
    if mode == 'i' then
        if status ~= nil and status:match('^%s*$') == nil then
            result = status
        end
    else
        if not manual then
            result = ' ON'
        end
    end
    return ' ' .. result
end

local function copilot ()
    result = nil
    if vim.fn['copilot#Enabled']() == 1 then
        result = ' ON '
    else
        result = ' OFF'
    end
    return ' ' .. result
end

-- TODO: Truncate the path with a different symbol at the begining.

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
        lualine_b = {
            {'branch',      fmt = trunc(120, 10, 95, true)},
            {'diff',        fmt = trunc(nil, nil, 90)},
            {'diagnostics', fmt = diagfmt},
        },
        lualine_c = {{'filename', path = 1}},
        --lualine_x = {codeium, 'encoding', 'fileformat', 'filetype'},
        lualine_x = {copilot, 'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
}
