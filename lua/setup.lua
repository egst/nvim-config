--[==[

TODOs:

* Setup Vista or find an alternative. What about ctags?
* Fix Goyo + NvimTree width issues.

--]==]

-- TODO...
--[[
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {focusable = false}
)
]]

vim.cmd [[
    function! HiGroup()
        let l:s = synID(line('.'), col('.'), 1)
        echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
    endfunction
]]
vim.cmd [[command! HiGroup :call HiGroup()]]

vim.cmd [[
    function! DiffUnsaved()
        let filetype=&ft
        diffthis
        vnew | r # | normal! 1Gdd
        diffthis
        exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
    endfunction
]]
vim.cmd [[command! DiffUnsaved :call DiffUnsaved()]]

vim.diagnostic.config({
    virtual_text = false
})
-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

require 'helpers'
require 'keymaps'
require 'plugins'
require 'snippets'

local config = require 'config'

--vim.g.autoswap_detect_tmux = 1

-- TODO: Restructure the config, so that this can be placed in it without cyclic dependencies.
--config.langservers.noverify.root_dir = require 'lspconfig.util'.root_pattern('psalm.xml', 'psalm.xml.dist')

-- General:
vim.opt.encoding       = 'utf-8'
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.wrap           = false
vim.opt.cursorline     = true
vim.opt.incsearch      = true
vim.opt.hlsearch       = true
vim.opt.tabstop        = config.tabwidth
vim.opt.shiftwidth     = config.tabwidth
vim.opt.expandtab      = true
vim.opt.foldmethod     = 'manual'
vim.opt.foldenable     = false
vim.opt.updatetime     = 500
vim.opt.hidden         = true
vim.opt.colorcolumn    = config.rulers
vim.opt.sidescrolloff  = config.scrolloff.x
vim.opt.scrolloff      = config.scrolloff.y
vim.opt.termguicolors  = true
vim.opt.list           = true
vim.opt.listchars      = config.whitespace
vim.opt.signcolumn     = 'yes'
vim.opt.mouse          = 'a'
vim.opt.ttimeout       = true
vim.opt.ttimeoutlen    = 100
vim.opt.conceallevel   = 3
vim.opt.number         = true
vim.opt.undodir        = vim.env.HOME .. '/.vim/undodir'
vim.opt.undofile       = true
vim.opt.backupcopy     = 'yes'

--vim.opt.smartindent = true

--vim.cmd 'syntax on'
--vim.cmd 'filetype on'
--vim.cmd 'filetype plugin on'
--vim.cmd 'filetype indent on'

if config.uselight then
    vim.cmd('colorscheme ' .. config.lightscheme)
else
    vim.cmd('colorscheme ' .. config.darkscheme)
end

if config.transparent then
    vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
    vim.cmd 'hi NormalNC guibg=NONE ctermbg=NONE'
end

--hi('SpecialKey', config.colors.red, nil)
hi('CursorLine', nil, config.colors.dark)

vim.cmd [[command! Esv set nosplitright | vnew | set filetype=json | read !my/es #]]
vim.cmd [[command! Es  set splitbelow   |  new | set filetype=json | read !my/es #]]

vim.cmd [[command! Phpv set splitbelow   | vnew | read !php #]]
vim.cmd [[command! Php  set splitbelow   |  new | read !php #]]

vim.cmd [[command! -nargs=* Sqlv set splitbelow   | vnew | read !my/mysql <args> "$(cat #)"]]
vim.cmd [[command! -nargs=* Sql  set splitbelow   |  new | read !my/mysql <args> "$(cat #)"]]

vim.cmd [[command! Display !display %]]
vim.cmd [[command! D Display]]

-- Indentation:

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

-- Additional languages:
fileType('*.cth', 'cynth')
syntax('*.cth', 'c')

-- Specific buffer types:

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
local function cleanvertinit ()
    cleanInit()
    vertInit()
end

init = {
    help     = ftaction('help',     cleanvertinit),
    nvimtree = ftaction('NvimTree', cleanInit),
    trouble  = ftaction('Trouble',  cleanInit),     -- TODO: trouble does not trigger BufRead nor BufWinEnter
    git      = ftaction('git',      cleanvertinit), -- TODO: indent guides are not disabled in git log
}

for type, _ in pairs(init) do
    autoCmd('BufWinEnter', '*', luaCall('init.' .. type))
end

-- Symbols Outline:
vim.g.symbols_outline = {
    --position = 'left',
}

-- Plugins:

require 'setup.git-signs'
require 'setup.telescope'
require 'setup.treesitter'
require 'setup.nvim-tree'
require 'setup.goyo'
require 'setup.limelight'
require 'setup.closetag'
require 'setup.lsp'

-- Snippy:
--[=[require 'snippy'.setup {
    mappings = {
        is = {
            ['<Tab>'] = 'expand_or_advance',
            ['<S-Tab>'] = 'previous',
        },
        nx = {
            ['<leader>x'] = 'cut_text',
        },
    },
}
]=]

-- Hologram:
--[=[
require('hologram').setup{
    auto_display = true
}
]=]
