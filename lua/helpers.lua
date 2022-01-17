function map (mode, keys, command, options)
    options = options or {}
    options = {noremap = not options.remap, silent = not options.verbose}
    vim.api.nvim_set_keymap(mode, keys, command, options)
end

function nmap (keys, command, verbose)
    map('n', keys, command, {remap = true, verbose = verbose})
end

function imap (keys, command, verbose)
    map('i', keys, command, {remap = true, verbose = verbose})
end

function xmap (keys, command, verbose)
    map('x', keys, command, {remap = true, verbose = verbose})
end

function nnoremap (keys, command, verbose)
    map('n', keys, command, {remap = false, verbose = verbose})
end

function inoremap (keys, command, verbose)
    map('i', keys, command, {remap = false, verbose = verbose})
end

function xnoremap (keys, command, verbose)
    map('x', keys, command, {remap = false, verbose = verbose})
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

function firstupper (str)
    return (str:gsub("^%l", string.upper))
end

function alllower (str)
    return string.lower(str)
end
