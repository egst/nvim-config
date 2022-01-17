require 'helpers'

-- Leader:
nmap('<Space>', '<Leader>')
xmap('<Space>', '<Leader>')

-- Escape:
inoremap('<C-C>', '<Esc>')
--inoremap <Esc> <C-C>

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
nnoremap('<Leader>h',  ':wincmd h<Cr>')
nnoremap('<Leader>j',  ':wincmd j<Cr>')
nnoremap('<Leader>k',  ':wincmd k<Cr>')
nnoremap('<Leader>l',  ':wincmd l<Cr>')
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

-- Numbers:
--nnoremap <F5> <C-A>
--nnoremap <F1> <C-X>

-- Xclip:
nnoremap('<Leader>y', ':call system(\'xclip\', @0)<Cr>')
nnoremap('<Leader>p', ':r !xclip -o<Cr>')

-- Buffers:
nnoremap('<C-h>', ':bp<Cr>')
nnoremap('<C-l>', ':bn<Cr>')
--nnoremap <Leader>b :b 
--nnoremap <Leader>f :e 

-- Scroll:
--nnoremap <Up>   <C-Y>
--nnoremap <Down> <C-E>

-- Search:
--nnoremap <Leader>f :b 
--nnoremap <Leader>; :e 
-- TODO: Avoid the jump.
nnoremap('*', '*N')
-- no [H]ighlight:
nnoremap('<Leader>H', ':noh<Cr>')

-- Whitespace:
-- [T]oggle [T]abs & spaces:
nnoremap('<Leader>T', ':if &expandtab | set noexpandtab | else | set expandtab | endif<Cr>')
-- [P]urge trailing whitespace:
nnoremap('<Leader>P', ':%s/\\s\\+$//e<Cr>')
-- [d]elete [r]epeated space after a <w>ord:
nnoremap('dr', 'elcw <Esc>')
-- [d]elete [R]epeated space after a <W>ord:
nnoremap('dR', 'Elcw <Esc>')

-- Settings:
-- [s]ettings:
--nnoremap('<Leader>sv', ':e ~/.vimrc<Cr>') -- vim config
nnoremap('<Leader>sv', ':e ~/.config/nvim/init.lua<Cr>') -- Lua nvim config.
nnoremap('<Leader>sw', ':e ~/.wt.json<Cr>')              -- Windows Terminal config.
nnoremap('<Leader>sh', ':e ~/.hyper.js<Cr>')             -- Hyper config
nnoremap('<Leader>st', ':e ~/.tmux.conf<Cr>')            -- Tmux config
-- [r]eload settings:
--nnoremap('<Leader>r', ':source ~/.vimrc<Cr>')
nnoremap('<Leader>r', ':Reload<Cr>')

-- Other:
-- [R]eorder (sort) lines:
xnoremap('<Leader>R', ':sort<Cr>')
-- Show [C]ursor [C]olumn:
nnoremap('<Leader>C', ':set cursorcolumn!<Cr>')

-- Plugins:
-- Up a directory (open directory view from a file buffer):
--nnoremap('-', )
-- [F]iles:
--nnoremap('<Leader>F', ':NERDTreeToggle<Bar>wincmd p<Cr>')
-- [M]arks:
--nnoremap('<Leader>M', ':marks<Cr>')
-- [d]efinition:
nnoremap('<Leader>d', ':call CocAction(\'jumpDefinition\')<Cr>')
-- [E]rror:
nnoremap('<Leader>E', '<Plug>(coc-diagnostic-next-error)')
-- [f]iles:
--nnoremap('<Leader>f', ':Files<Cr>')
-- [b]uffers:
--nnoremap('<Leader>b', ':Buffers<Cr>')
-- (rip)[g]rep:
--nnoremap('<Leader>g', ':Rg<Cr>')
-- [Z]en:
nnoremap('<Leader>Z', ':Goyo<Cr>')
-- [z]en:
nnoremap('<Leader>z', ':Limelight!!<Cr>')
-- [j]?
nnoremap('<Leader>j', ':Vista!<Cr>:Vista finder<Cr>')
-- [J]?
nnoremap('<Leader>J', ':Vista!!<Cr>')
-- [a]llign:
xmap('ga', '<Plug>(EasyAlign)')
-- [a]llign:
nmap('ga', '<Plug>(EasyAlign)')
-- reset [A]llignment:
xmap('gA', 'ga* ')
-- [S]witch [S]ource / header:
nnoremap('<Leader>S', ':call CocAction(\'runCommand\', \'clangd.switchSourceHeader\')<Cr>')
-- Telescope:
nnoremap('<Leader>ff', ':Telescope find_files<Cr>')
--nnoremap('<Leader>fF', ':FzfLua files<Cr>')
nnoremap('<Leader>fg', ':Telescope live_grep<Cr>')
nnoremap('<Leader>fc', ':Telescope grep_string<Cr>')
nnoremap('<Leader>fb', ':Telescope buffers<Cr>')
nnoremap('<Leader>fh', ':Telescope help_tags<Cr>')
nnoremap('<Leader>fs', ':Telescope current_buffer_fuzzy_find<Cr>')
nnoremap('<Leader>fm', ':Telescope marks<Cr>')
nnoremap('<Leader>fr', ':Telescope marks<Cr>')
-- Nvim tree:
nnoremap('<Leader>tt', ':NvimTreeToggle<CR>')
nnoremap('<Leader>to', ':NvimTreeOpen<CR>')
nnoremap('<Leader>tc', ':NvimTreeClose<CR>')
nnoremap('<Leader>tg', ':NvimTreeFocus<CR>')
nnoremap('<Leader>tr', ':NvimTreeRefresh<CR>')
nnoremap('<Leader>tf', ':NvimTreeFindFile<CR>')
