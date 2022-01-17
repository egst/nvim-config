function map (mode, keys, command, remap)
    vim.api.nvim_set_keymap(mode, keys, command, {noremap = not remap, silent = true})
end

function nmap (keys, command)
    map('n', keys, command, true)
end

function imap (keys, command)
    map('i', keys, command, true)
end

function xmap (keys, command)
    map('x', keys, command, true)
end

function nnoremap (keys, command)
    map('n', keys, command, false)
end

function inoremap (keys, command)
    map('i', keys, command, false)
end

function xnoremap (keys, command)
    map('x', keys, command, false)
end

function snippet (keys, command)
    nnoremap('<Leader>i' .. keys, command)
end

function autocmd (event, pattern, command)
    vim.cmd('autocmd ' .. event .. ' ' .. pattern .. ' ' .. command)
end

function lua (code)
    return 'lua ' .. code
end

function luacall (fun, ...)
    arg = arg or {}
    return lua(fun .. '(' .. table.concat(arg, ', ') .. ')')
end

function ftaction (filetype, action)
    return function (...)
        if vim.bo.filetype ~= filetype then return end
        if type(action) == 'function' then
            action(arg)
        else
            vim.cmd(action)
        end
    end
end

function upper (str)
    return (str:gsub("^%l", string.upper))
end

function lower (str)
    return (str:gsub("^%l", string.lower))
end
