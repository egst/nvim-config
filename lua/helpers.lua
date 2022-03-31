local config = require 'config'

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

function ftautocmd (type, cmd)
    autocmd('FileType', type, cmd)
end

function firstupper (str)
    return (str:gsub("^%l", string.upper))
end

function alllower (str)
    return string.lower(str)
end

function plugload (f)
    local function plug (args)
        local handle = vim.fn['plug#']
        target = args[1]
        params = args
        params[1]    = nil
        params['do'] = params.run
        params.run   = nil
        if next(params) then
            handle(target, params)
        else
            handle(target)
        end
    end
    vim.call('plug#begin', '~/.config/nvim/plugged')
    f(plug)
    vim.call('plug#end')
end

function filetype (match, type)
    autocmd('BufNewFile,BufRead', match, 'set filetype=' .. type)
end

function syntax (match, lang)
    autocmd('BufNewFile,BufRead', match, 'set syntax=' .. lang)
end

function set (entry, value)
    if value then
        return 'set ' .. entry .. '=' .. value
    else
        return 'set ' .. entry
    end
end

function setlocal (entry, value)
    if value then
        return 'setlocal ' .. entry .. '=' .. value
    else
        return 'setlocal ' .. entry
    end
end

function comments (...)
    local shapes = {}
    for i, shape in ipairs({...}) do
        if config.comments[shape] then
            table.insert(shapes, config.comments[shape])
        end
    end
    return table.concat(shapes, ',')
end

function formatting (format)
    return config.formatting[format] or ''
end
