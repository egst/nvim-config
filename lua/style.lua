if vim.g.vscode then
    return
end

require 'helpers'

local config = require 'config'

if config.useLightScheme then
    vim.cmd('colorscheme ' .. config.lightScheme)
else
    vim.cmd('colorscheme ' .. config.darkScheme)
end

if config.transparent then
    vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
    vim.cmd 'hi NormalNC guibg=NONE ctermbg=NONE'
end

if config.useLightScheme then
    hi('CursorLine', nil, config.colors.gray)
else
    hi('CursorLine', nil, config.colors.dark)
end
