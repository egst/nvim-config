--- File type specific config.

if vim.g.vscode then
    return
end

--- Indentation:
autoCmd('FileType', 'c',   setLocal('comments', comments('multi', 'doc', 'slash')))
autoCmd('FileType', 'cpp', setLocal('comments', comments('multi', 'doc', 'slash')))
autoCmd('FileType', 'js',  setLocal('comments', comments('multi', 'doc', 'slash')))
autoCmd('FileType', 'php', setLocal('comments', comments('multi', 'doc', 'slash', 'hash')))
autoCmd('FileType', 'cth', setLocal('comments', comments('multi', 'doc', 'slash', 'hash')))
autoCmd('FileType', 'c',   setLocal('formatoptions', formatting('basic')))
autoCmd('FileType', 'cpp', setLocal('formatoptions', formatting('basic')))
autoCmd('FileType', 'js',  setLocal('formatoptions', formatting('basic')))
autoCmd('FileType', 'php', setLocal('formatoptions', formatting('basic')))
autoCmd('FileType', 'cth', setLocal('formatoptions', formatting('basic')))
autoCmd('FileType', 'c',   setLocal('cindent'))
autoCmd('FileType', 'cpp', setLocal('cindent'))
autoCmd('FileType', 'js',  setLocal('cindent'))
autoCmd('FileType', 'php', setLocal('cindent'))
autoCmd('FileType', 'cth', setLocal('cindent'))
autoCmd('FileType', 'php', setLocal('indentexpr', ''))
vim.cmd(set('cinkeys-',    '0#'))
vim.cmd(set('indentkeys-', '0#'))

--- Additional languages:
fileType('*.cth', 'cynth')
syntax('*.cth', 'c')

--- Initialization:
local function vertInit ()
    vim.cmd [[wincmd H]]
end
local function cleanInit ()
    vim.opt.list           = true
    vim.opt.listchars      = {tab = '  '}
    vim.opt.colorcolumn    = {}
    vim.opt.number         = false
    vim.opt.relativenumber = false
    --vim.cmd [[IndentBlanklineDisable]]
end
local function cleanVertInit ()
    cleanInit()
    vertInit()
end
init = {
    help     = fileTypeAction('help',     cleanVertInit),
    nvimtree = fileTypeAction('NvimTree', cleanInit),
    trouble  = fileTypeAction('Trouble',  cleanInit),     -- TODO: trouble does not trigger BufRead nor BufWinEnter
    git      = fileTypeAction('git',      cleanVertInit), -- TODO: indent guides are not disabled in git log
}
for type, _ in pairs(init) do
    autoCmd('BufWinEnter', '*', luaCall('init.' .. type))
end
