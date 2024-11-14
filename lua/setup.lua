--- TODO:
---
--- * Setup Vista or find an alternative. What about ctags?
--- * Fix Goyo + NvimTree width issues.

require 'helpers'
require 'temporary'
require 'keymaps'
require 'plugins'
require 'snippets'
require 'file-types'
require 'style'
require 'commands'

local config = require 'config'

--- General:
vim.opt.encoding       = 'utf-8'
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.wrap           = false
vim.opt.incsearch      = true
vim.opt.hlsearch       = true
vim.opt.tabstop        = config.tabWidth
vim.opt.shiftwidth     = config.tabWidth
vim.opt.expandtab      = true
vim.opt.foldmethod     = 'manual'
vim.opt.foldenable     = false
vim.opt.updatetime     = 500
vim.opt.hidden         = true
vim.opt.colorcolumn    = config.rulers
vim.opt.sidescrolloff  = config.scrollOff.x
vim.opt.scrolloff      = config.scrollOff.y
vim.opt.termguicolors  = true
vim.opt.list           = true
vim.opt.listchars      = config.whiteSpace
vim.opt.signcolumn     = 'yes'
vim.opt.mouse          = 'a'
vim.opt.ttimeout       = true
vim.opt.ttimeoutlen    = 100
vim.opt.conceallevel   = 3
vim.opt.number         = true
vim.opt.undodir        = vim.env.HOME .. '/.vim/undodir'
vim.opt.undofile       = true
vim.opt.backupcopy     = 'yes'

if not vim.g.vscode then
    vim.opt.cursorline = true
end

--- Plugins:
require 'setup.closetag'
require 'setup.git-signs'
require 'setup.goyo'
require 'setup.limelight'
require 'setup.lsp'
require 'setup.lualine'
require 'setup.nvim-tree'
require 'setup.telescope'
--require 'setup.treesitter'
