function merge (...)
    result = {}
    for _, arg in pairs({...}) do
        for key, val in pairs(arg) do
            result[key] = val
        end
    end
    return result
end

function show (value) -- TODO
    if type(value) == 'table' then
        local result = '{ '
        for k, v in pairs(value) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            result = result .. '[' ..k ..'] = ' .. show(v) .. ','
        end
        representation = result .. '} '
    elseif type(value) == 'function' then
        representaion = '\'' .. tostring(value) .. '\''
    else
        representaion = tostring(value)
    end

    annotation = '--[[' .. type(value) .. ']]'

    return annotation .. ' ' .. representation
end

function include (module)
    status, result = pcall(function () return require(module) end)
    if status then
        return result
    elseif string.find(result, 'module .* not found') then
        return nil
    else
        error(result)
    end
end

function addPath (path)
    package.path = path .. ';' .. package.path
end

function hi (group, fg, bg)
    if not fg then
        vim.cmd('hi ' .. group .. ' guibg=' .. bg)
    elseif not bg then
        vim.cmd('hi ' .. group .. ' guifg=' .. fg)
    else
        vim.cmd('hi ' .. group .. ' guifg=' .. fg .. ' guibg=' .. bg)
    end
end

function map (mode, keys, command, options)
    modes = {
        normal = 'n',
        input  = 'i',
        visual = 'x',
    }
    defaultOptions = {
        remap   = false,
        verbose = false,
    }

    mode = modes[mode] or mode
    options = merge(defaultOptions, options or {})
    options = {
        noremap = not options.remap,
        silent  = not options.verbose,
    }

    --print(mode .. ' ' .. keys .. ' ' .. command)
    vim.api.nvim_set_keymap(mode, keys, command, options)
end

function snippet (keys, command)
    map('normal', '<Leader>i' .. keys, command)
end

function autoCmd (event, pattern, command)
    vim.cmd('autocmd ' .. event .. ' ' .. pattern .. ' ' .. command)
end

function lua (code)
    return 'lua ' .. code
end

function luaCall (fun, ...)
    return lua(fun .. '(' .. table.concat({...}, ', ') .. ')')
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

function firstUpper (str)
    return (str:gsub("^%l", string.upper))
end

function allLower (str)
    return string.lower(str)
end

function plugLoad (f)
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

function fileType (match, type)
    autoCmd('BufNewFile,BufRead', match, 'set filetype=' .. type)
end

function syntax (match, lang)
    autoCmd('BufNewFile,BufRead', match, 'set syntax=' .. lang)
end

function set (entry, value)
    if value then
        return 'set ' .. entry .. '=' .. value
    else
        return 'set ' .. entry
    end
end

function setLocal (entry, value)
    if value then
        return 'setlocal ' .. entry .. '=' .. value
    else
        return 'setlocal ' .. entry
    end
end

function cursorChar ()
    return vim.fn.eval [[matchstr(getline('.'), '\%' . col('.') . 'c.')]]
end
