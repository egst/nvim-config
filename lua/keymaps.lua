require 'helpers'

local config = require 'config'

-- Leader:
map('normal', '<Space>', '<Leader>', {remap = true})
map('visual', '<Space>', '<Leader>', {remap = true})

-- Escape:
map('input', '<C-C>', '<Esc>')

map('normal', 'S', 'hs')

-- Casing:
map('normal', '~', '~h')
-- To [U]ppercase
map('normal', '<Leader>U', 'f_x~h')
-- To [u]nderscore
map('normal', '<Leader>u', '<S-V>/[A-Z]<Cr><Esc>~hi_<Esc>:noh<Cr>')

-- Redo:
map('normal', 'U', '<C-R>')

-- Close:
map('normal', '<Leader>q', ':qa<Cr>')
map('normal', '<Leader>Q', ':qa!<Cr>')
map('normal', '<Leader>x', ':Bdelete<Cr>')
map('normal', '<Leader>X', ':Bdelete!<Cr>')
map('normal', '<Leader>c', ':wincmd c<Cr>')
map('normal', '<Leader>C', ':Bdelete!<Cr>:wincmd c<Cr>')
map('normal', '<Leader>m', ':wincmd x<Cr>')

-- Save:
map('normal', '<Leader>w', ':w<Cr>')

-- Windows:
map('normal', '<Left>',     ':wincmd h<Cr>')
map('normal', '<Down>',     ':wincmd j<Cr>')
map('normal', '<Up>',       ':wincmd k<Cr>')
map('normal', '<Right>',    ':wincmd l<Cr>')
map('normal', '<Leader>v',  ':wincmd v<Cr>')
map('normal', '<Leader>V',  ':wincmd s<Cr>')
map('normal', '<Home>',     ':wincmd <<Cr>')
map('normal', '<End>',      ':wincmd ><Cr>')
map('normal', '<PageUp>',   ':wincmd +<Cr>')
map('normal', '<PageDown>', ':wincmd -<Cr>')

-- Xclip:
map('normal', '<Leader>y', ':call system(\'xclip -selection ' .. config.selection .. '\', @0)<Cr>')
map('normal', '<Leader>p', ':r !xclip -selection ' .. config.selection .. ' -o<Cr>')
--map('normal', '<Leader>p', ':r !xclip -o<Cr>')

-- Search:
-- TODO: Avoid the jump.
map('normal', '*', '*N')
-- no [H]ighlight:
map('normal', '<Leader>H', ':noh<Cr>')

-- Scroll:
map('normal', '<C-L>', '20zl')
map('normal', '<C-H>', '20zh')
map('normal', '<C-E>', '3<C-E>')
map('normal', '<C-Y>', '3<C-Y>')

-- Whitespace:
-- [T]oggle [T]abs & spaces:
map('normal', '<Leader>T', ':if &expandtab | set noexpandtab | else | set expandtab | endif<Cr>')
-- [d]elete trailing white[S]pace:
map('normal', 'dS', ':%s/\\s\\+$//e<Cr>')
-- [d]elete [r]epeated space after a "word":
map('normal', 'dr', 'elcw <Esc>')
-- [d]elete [R]epeated space after a "Word":
map('normal', 'dR', 'Elcw <Esc>')

-- Diff:
-- [d]iff [t]his:
map('normal', '<Leader>dt', ':diffthis<Cr>')
-- [d]iff [u]nsaved:
map('normal', '<Leader>du', ':DiffUnsaved<Cr>')
-- [d]iff [g]it:
map('normal', '<Leader>dg', ':Git diff<Cr>')
-- [d]iff [o]ff:
map('normal', '<Leader>do', ':diffoff!<Cr>')

-- Settings:
-- open [s]ettings: n[v]im:
map('normal', '<Leader>sv', ':e ~/.config/nvim/lua/setup.lua<Cr>')
-- open [s]ettings: nvim [k]keymaps:
map('normal', '<Leader>sk', ':e ~/.config/nvim/lua/keymaps.lua<Cr>')
-- open [s]ettings: nvim s[n]ippets:
map('normal', '<Leader>sn', ':e ~/.config/nvim/lua/snippets.lua<Cr>')
-- open [s]ettings: nvim [p]lugins:
map('normal', '<Leader>sp', ':e ~/.config/nvim/lua/plugins.lua<Cr>')
-- open [s]ettings: nvim [c]onfig:
map('normal', '<Leader>sc', ':e ~/.config/nvim/lua/config.lua<Cr>')
-- open [s]ettings: nvim [L]ocal config:
map('normal', '<Leader>sL', ':e ~/.config/nvim/lua/env.lua<Cr>')
-- open [s]ettings: [w]indows terminal:
map('normal', '<Leader>sw', ':e ~/.wt.json<Cr>')
-- open [s]ettings: [h]yper:
map('normal', '<Leader>sh', ':e ~/.hyper.js<Cr>')
-- open [s]ettings: [t]mux:
map('normal', '<Leader>st', ':e ~/.tmux.conf<Cr>')
-- open [s]ettings: [b]ash:
map('normal', '<Leader>sb', ':e ~/.bashrc<Cr>')
-- open [s]ettings: bash [i]nputrc:
map('normal', '<Leader>si', ':e ~/.inputrc<Cr>')
-- open [s]ettings: bash [a]liases:
map('normal', '<Leader>sa', ':e ~/.config/bash/aliases<Cr>')
-- open [s]ettings: bash [l]ocations:
map('normal', '<Leader>sl', ':e ~/.config/bash/locations<Cr>')
-- open [s]ettings: bash path [e]nvironment variable: (TODO: Come up with a better mnemonic.)
map('normal', '<Leader>se', ':e ~/.config/bash/paths<Cr>')
-- open [s]ettings: [s]tarship:
map('normal', '<Leader>ss', ':e ~/.config/bash/starship.toml<Cr>')
-- vim [s]ettings [r]eload:
map('normal', '<Leader>sr', ':Reload<Cr>:noh<Cr>')
--map('normal', '<Leader>sv', ':e ~/.vimrc<Cr>')
--map('normal', '<Leader>sr', ':source ~/.vimrc<Cr>')

-- Other:
-- [R]eorder (sort) lines:
map('visual', '<Leader>R', ':sort<Cr>')
-- Show [C]ursor [C]olumn:
map('normal', '<Leader>L', ':set cursorcolumn!<Cr>')

map('normal', '<Leader>F', ':let @" = expand("%")<Cr>')

-- [Z]en:
map('normal', '<Leader>Z', ':Goyo<Cr>')
-- [z]en:
map('normal', '<Leader>z', ':Limelight!!<Cr>')

-- [a]llign:
map('visual', '<Leader>a', '<Plug>(EasyAlign)')
-- [a]llign:
map('normal', '<Leader>a', '<Plug>(EasyAlign)')
-- reset [A]llignment:
map('visual', '<Leader>A', 'ga* ')

-- [f]ind a [f]ile:
map('normal', '<Leader>ff', ':Telescope find_files<Cr>')
-- [f]ind with [g]rep:
map('normal', '<Leader>fg', ':Telescope live_grep<Cr>')
-- [f]ind the string under [c]ursor:
map('normal', '<Leader>fc', ':Telescope grep_string<Cr>')
-- [f]ind [b]uffer:
map('normal', '<Leader>fb', ':Telescope buffers<Cr>')
-- [f]ind [h]elp:
map('normal', '<Leader>fh', ':Telescope help_tags<Cr>')
-- [f]ind a string [l]ocally (in the current buffer):
map('normal', '<Leader>fl', ':Telescope current_buffer_fuzzy_find<Cr>')
-- [f]ind a [m]ark:
map('normal', '<Leader>fm', ':Telescope marks<Cr>')
-- [f]ind lsp definitions ([s]ource):
map('normal', '<Leader>fs', ':Telescope lsp_definitions<Cr>')
-- [f]ind lsp [r]eferences:
map('normal', '<Leader>fr', ':Telescope lsp_references show_line=false<Cr>')
-- [f]ind lsp document [o]verview:
map('normal', '<Leader>fo', ':Telescope lsp_document_symbols<Cr>')
-- [f]ind lsp workspace [O]verview:
map('normal', '<Leader>fO', ':Telescope lsp_workspace_symbols<Cr>')
-- [f]ind lsp document [d]iagnostics:
map('normal', '<Leader>fd', ':Telescope diagnostics bufnr=0<Cr>')
-- [f]ind lsp workspace [D]iagnostics:
map('normal', '<Leader>fD', ':Telescope diagnostics<Cr>')

-- File [t]ree [t]oggle:
map('normal', '<Leader>tt', ':NvimTreeToggle<Cr>')
-- File [t]ree [o]pen:
map('normal', '<Leader>to', ':NvimTreeOpen<Cr>')
-- File [t]ree [c]lose:
map('normal', '<Leader>tc', ':NvimTreeClose<Cr>')
-- File [t]ree [g]o - focus:
map('normal', '<Leader>tg', ':NvimTreeFocus<Cr>')
-- File [t]ree [r]efresh:
map('normal', '<Leader>tr', ':NvimTreeRefresh<Cr>')
-- File [t]ree [f]ind current file:
map('normal', '<Leader>tf', ':NvimTreeFindFile<Cr>')

map('normal', '<Leader>oo', ':NvimTreeClose<Cr>:SymbolsOutline<Cr>')

-- [g]it [a]dd [a]ll:
map('normal', '<Leader>ga', ':Git add --all<Cr>', {verbose = true})
-- [g]it [s]tatus:
map('normal', '<Leader>gs', ':Git status<Cr>', {verbose = true})
-- [g]it [c]ommit:
map('normal', '<Leader>gc', ':Git commit -m ', {verbose = true}) -- TODO: Fix silent.
-- [g]it [p]ush:
map('normal', '<Leader>gp', ':Git push<Cr>', {verbose = true})
-- [g]it [l]og:
map('normal', '<Leader>gl', ':Git log --all --decorate --graph <Cr>', {verbose = true})

-- [e]rrors & diagnostics - list toggle:
map('normal', '<Leader>ee', ':TroubleToggle<cr>')
-- [e]rrors & diagnostics - list for the [w]orkspace:
map('normal', '<Leader>ew', ':TroubleToggle workspace_diagnostics<cr>')
-- [e]rrors & diagnostics - list for the current [d]ocument:
map('normal', '<Leader>ed', ':TroubleToggle document_diagnostics<cr>')
-- [e]rrors & diagnostics - [q]uickfix list:
map('normal', '<Leader>eq', ':TroubleToggle quickfix<cr>')
-- [e]rrors & diagnostics - [l]ocation list:
map('normal', '<Leader>el', ':TroubleToggle loclist<cr>')
-- [e]rrors & diagnostics - [r]eference list:
map('normal', '<Leader>er', ':TroubleToggle lsp_references<cr>')
-- [e]rrors & diagnostics - go to the [n]ext one:
map('normal', '<Leader>en', ':lua vim.diagnostic.goto_next()<cr>')
-- [e]rrors & diagnostics - go to the previous [N] one:
map('normal', '<Leader>eN', ':lua vim.diagnostic.goto_prev()<cr>')
-- [e]rrors & diagnostics - [h]over info:
map('normal', '<Leader>eh', ':lua vim.lsp.buf.hover()<cr>')
-- [e]rrors & diagnostics - [g]o to definition:
map('normal', '<Leader>eg', ':lua vim.lsp.buf.definition()<cr>')
-- [e]rrors & diagnostics - [f]ind references:
map('normal', '<Leader>ef', ':lua vim.lsp.buf.references()<cr>')
-- [e]rrors & diagnostics - [s]tatus (log):
map('normal', '<Leader>es', ':e $HOME/.cache/nvim/lsp.log<cr>')
