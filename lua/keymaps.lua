require 'helpers'

-- Leader:
nmap('<Space>', '<Leader>')
xmap('<Space>', '<Leader>')

-- Escape:
inoremap('<C-C>', '<Esc>')

-- Casing:
nnoremap('~', '~h')
-- To [U]ppercase
nnoremap('<Leader>U', 'f_x~h')
-- To [u]nderscore
nnoremap('<Leader>u', '<S-V>/[A-Z]<Cr><Esc>~hi_<Esc>:noh<Cr>')

-- Redo:
nnoremap('U', '<C-R>')

-- Close:
nnoremap('<Leader>q', ':qa<Cr>')
nnoremap('<Leader>x', ':Bdelete<Cr>')
nnoremap('<Leader>c', ':wincmd c<Cr>')
nnoremap('<Leader>m', ':wincmd x<Cr>')

-- Save:
nnoremap('<Leader>w', ':w<Cr>')
nnoremap('<C-S>',     ':w<Cr>')

-- Windows:
nnoremap('<Left>',     ':wincmd h<Cr>')
nnoremap('<Down>',     ':wincmd j<Cr>')
nnoremap('<Up>',       ':wincmd k<Cr>')
nnoremap('<Right>',    ':wincmd l<Cr>')
nnoremap('<Leader>v',  ':wincmd v<Cr>')
nnoremap('<Leader>V',  ':wincmd s<Cr>')
nnoremap('<Home>',     ':wincmd <<Cr>')
nnoremap('<End>',      ':wincmd ><Cr>')
nnoremap('<PageUp>',   ':wincmd +<Cr>')
nnoremap('<PageDown>', ':wincmd -<Cr>')

-- Xclip:
nnoremap('<Leader>y', ':call system(\'xclip\', @0)<Cr>')
nnoremap('<Leader>p', ':r !xclip -o<Cr>')

-- Search:
-- TODO: Avoid the jump.
nnoremap('*', '*N')
-- no [H]ighlight:
nnoremap('<Leader>H', ':noh<Cr>')

-- Whitespace:
-- [T]oggle [T]abs & spaces:
nnoremap('<Leader>T', ':if &expandtab | set noexpandtab | else | set expandtab | endif<Cr>')
-- [d]urge [t]railing whitespace:
nnoremap('dt', ':%s/\\s\\+$//e<Cr>')
-- [d]elete [r]epeated space after a <w>ord:
nnoremap('dr', 'elcw <Esc>')
-- [d]elete [R]epeated space after a <W>ord:
nnoremap('dR', 'Elcw <Esc>')

-- Settings:
-- open [s]ettings: [v]im:
nnoremap('<Leader>sv', ':e ~/.config/nvim/init.lua<Cr>')
-- open [s]ettings: [w]indows terminal:
nnoremap('<Leader>sw', ':e ~/.wt.json<Cr>')
-- open [s]ettings: [h]yper:
nnoremap('<Leader>sh', ':e ~/.hyper.js<Cr>')
-- open [s]ettings: [t]mux:
nnoremap('<Leader>st', ':e ~/.tmux.conf<Cr>')
-- open [s]ettings: [b]ash:
nnoremap('<Leader>sb', ':e ~/.bashrc<Cr>')
-- vim [s]ettings [r]eload:
nnoremap('<Leader>sr', ':Reload<Cr>:noh<Cr>')
--nnoremap('<Leader>sv', ':e ~/.vimrc<Cr>')
--nnoremap('<Leader>r', ':source ~/.vimrc<Cr>')

-- Other:
-- [R]eorder (sort) lines:
xnoremap('<Leader>R', ':sort<Cr>')
-- Show [C]ursor [C]olumn:
nnoremap('<Leader>C', ':set cursorcolumn!<Cr>')

-- [Z]en:
nnoremap('<Leader>Z', ':Goyo<Cr>')
-- [z]en:
nnoremap('<Leader>z', ':Limelight!!<Cr>')

-- [a]llign:
xmap('ga', '<Plug>(EasyAlign)')
-- [a]llign:
nmap('ga', '<Plug>(EasyAlign)')
-- reset [A]llignment:
xmap('gA', 'ga* ')

-- [f]ind a [f]ile:
nnoremap('<Leader>ff', ':Telescope find_files<Cr>')
-- [f]ind with [g]rep:
nnoremap('<Leader>fg', ':Telescope live_grep<Cr>')
-- [f]ind the string under [c]ursor:
nnoremap('<Leader>fc', ':Telescope grep_string<Cr>')
-- [f]ind [b]uffer:
nnoremap('<Leader>fb', ':Telescope buffers<Cr>')
-- [f]ind [h]elp:
nnoremap('<Leader>fh', ':Telescope help_tags<Cr>')
-- [f]ind a [s]tring in the current buffer:
nnoremap('<Leader>fs', ':Telescope current_buffer_fuzzy_find<Cr>')
-- [f]ind a [m]ark:
nnoremap('<Leader>fm', ':Telescope marks<Cr>')

-- File [t]ree [t]oggle:
nnoremap('<Leader>tt', ':NvimTreeToggle<Cr>')
-- File [t]ree [o]pen:
nnoremap('<Leader>to', ':NvimTreeOpen<Cr>')
-- File [t]ree [c]lose:
nnoremap('<Leader>tc', ':NvimTreeClose<Cr>')
-- File [t]ree [g]o - focus:
nnoremap('<Leader>tg', ':NvimTreeFocus<Cr>')
-- File [t]ree [r]efresh:
nnoremap('<Leader>tr', ':NvimTreeRefresh<Cr>')
-- File [t]ree [f]ind current file:
nnoremap('<Leader>tf', ':NvimTreeFindFile<Cr>')

-- [g]it [a]dd [a]ll:
nnoremap('<Leader>ga', ':Git add --all<Cr>', true)
-- [g]it [s]tatus:
nnoremap('<Leader>gs', ':Git status<Cr>', true)
-- [g]it [c]ommit:
nnoremap('<Leader>gc', ':Git commit -m ', true) -- TODO: Fix silent.
-- [g]it [p]ush:
nnoremap('<Leader>gp', ':Git push<Cr>', true)
-- [g]it [l]og:
nnoremap('<Leader>gl', ':Git log --all --decorate --graph <Cr>', true)

-- [e]rror list toggle:
nnoremap('<Leader>ee', ':TroubleToggle<cr>')
-- [e]rror list for the [w]orkspace:
nnoremap('<Leader>ew', ':TroubleToggle workspace_diagnostics<cr>')
-- [e]rror list for the current [d]ocument:
nnoremap('<Leader>ed', ':TroubleToggle document_diagnostics<cr>')
-- [e]rror [q]uickfix list:
nnoremap('<Leader>eq', ':TroubleToggle quickfix<cr>')
-- [e]rror [l]ocation list:
nnoremap('<Leader>el', ':TroubleToggle loclist<cr>')
-- [e]rror [r]eference list:
nnoremap('<Leader>er', ':TroubleToggle lsp_references<cr>')
-- [e]rror - go to the [n]ext one:
nnoremap('<Leader>en', ':lua vim.diagnostic.goto_next()<cr>')
-- [e]rror - go to the previous [N] one:
nnoremap('<Leader>eN', ':lua vim.diagnostic.goto_prev()<cr>')
