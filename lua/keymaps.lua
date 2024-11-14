require 'helpers'

local config = require 'config'
local vscode
if vim.g.vscode then
    vscode = require 'vscode-neovim'
end

-- Leader:
map('normal', '<Space>', '<Leader>', {remap = true})
map('visual', '<Space>', '<Leader>', {remap = true})

-- Escape:
map('insert', '<C-C>', '<Esc>')

map('normal', 'S', 'hs',  {name = 'SubstituteBack', repeatable = false}) -- TODO: How to make this repeatable?
map('normal', 'D', 'kdd', {name = 'DeleteAbove',    repeatable = true})
map('normal', 'Y', 'kyy', {name = 'YankAbove'})
map('normal', 'C', 'kcc', {name = 'CangeAbove',     repeatable = false})

map('normal', '<Leader>n', bindCmd('exec &rnu == 1 ? "set nornu" : "se rnu"'))

-- Casing:
map('normal', '~', '~h', {name = 'SwitchCase', repeatable = true})
-- To [U]ppercase
map('normal', '<Leader>U', 'f_x~h', {name = 'UpperCase', repeatable = true})
-- To [u]nderscore
map('normal', '<Leader>u', '<S-V>/[A-Z]<Cr><Esc>~hi_<Esc>:noh<Cr>', {name = 'UnderScore', repeatable = true})

-- Redo:
map('normal', 'U', '<C-R>', {name = 'Redo', repeatable = true})

-- Save:
if vim.g.vscode then
    map('normal', '<Leader>w', bindCmd(vsCodeCall('workbench.action.files.save')), {name = 'Write'})
else
    map('normal', '<Leader>w', bindCmd('w'), {name = 'Write'})
end

-- Close:
if vim.g.vscode then
    --map('normal', '<C-w>x', bindCmd(vsCodeCall('workbench.action.closeActiveEditor')), {name = 'DeleteBuffer'})
    --map('normal', '<C-w>c', bindCmd(vsCodeCall('workbench.action.closeEditorsInGroup')), {name = 'CloseWindow'})
else
    -- TODO: Consider d for buffer delete instead of x and x instead of m.
    map('normal', '<Leader>q', bindCmd('qa'),                    {name = 'Quit'})
    map('normal', '<Leader>Q', bindCmd('qa!'),                   {name = 'ForceQuit'})
    map('normal', '<Leader>x', bindCmd('Bdelete'),               {name = 'DeleteBuffer'})
    map('normal', '<Leader>X', bindCmd('Bdelete!'),              {name = 'ForceDeleteBuffer'})
    map('normal', '<Leader>c', bindCmd('wincmd c'),              {name = 'CloseWindow'})
    map('normal', '<Leader>C', bindCmd('Bdelete!<Cr>:wincmd c'), {name = 'ForceCloseWindow'})
    map('normal', '<Leader>m', bindCmd('wincmd x'),              {name = 'SwitchWindows'})
end

-- Windows:
if vim.g.vscode then
    -- TODO:
    --workbench.action.terminal.resizePaneLeft
    --workbench.action.terminal.resizePaneRight
    --workbench.action.terminal.resizePaneUp
    --workbench.action.terminal.resizePaneDown
    --map('normal', '<C-Left>',  bindCmd(vsCodeCall('workbench.action.navigateLeft')),  {name = 'WindowLeft'})
    --map('normal', '<C-Down>',  bindCmd(vsCodeCall('workbench.action.navigateDown')),  {name = 'WindowDown'})
    --map('normal', '<C-Up>',    bindCmd(vsCodeCall('workbench.action.navigateUp')),    {name = 'WindowUp'})
    --map('normal', '<C-Right>', bindCmd(vsCodeCall('workbench.action.navigateRight')), {name = 'WindowRight'})
else
    map('normal', '<Left>',     bindCmd('wincmd h'), {name = 'WindowLeft'})
    map('normal', '<Down>',     bindCmd('wincmd j'), {name = 'WindowDown'})
    map('normal', '<Up>',       bindCmd('wincmd k'), {name = 'WindowUp'})
    map('normal', '<Right>',    bindCmd('wincmd l'), {name = 'WindowRight'})
    map('normal', '<Home>',     bindCmd('wincmd <'), {name = 'WindowShrink'})
    map('normal', '<End>',      bindCmd('wincmd >'), {name = 'WindowGrow'})
    map('normal', '<PageUp>',   bindCmd('wincmd +'), {name = 'WindowShrinkVert'})
    map('normal', '<PageDown>', bindCmd('wincmd -'), {name = 'WindowGrowVert'})
    --map('normal', '<Leader>v',  bindCmd('wincmd v'), {name = 'WindowSplit'})
    --map('normal', '<Leader>V',  bindCmd('wincmd s'), {name = 'WindowSplitDown'})
end

-- Xclip:
-- TODO: Consider gy & gp
map('normal', '<Leader>y', bindCmd('call system(\'xclip -selection ' .. config.selection .. '\', @0)'), {name = 'ClipBoardYank'})
map('normal', '<Leader>p', bindCmd('r !xclip -selection ' .. config.selection .. ' -o'),                {name = 'ClipBoardPaste'})
--map('normal', '<Leader>p', bindCmd('r !xclip -o'))

-- Search:
-- TODO: Avoid the jump.
map('normal', '*', '*N', {name = 'SearchUnderCursor'})
-- no [H]ighlight:
map('normal', '<Leader>h', bindCmd('noh'), {name = 'RemoveHighlight'})

-- Scroll:
-- TODO: Doesn't work in VSC.
if not vim.g.vscode then
    --map('normal', '<C-L>', '20zl',   {name = 'ScrollLeft'})
    --map('normal', '<C-H>', '20zh',   {name = 'ScrollRight'})
    --map('normal', '<C-J>', '3<C-E>', {name = 'ScrollDown'})
    --map('normal', '<C-K>', '3<C-Y>', {name = 'ScrollUp'})
end

-- Movement:
-- TODO: jump to one line before
-- TODO: k and j don't work in VSC (K and J do).
map('normal',   '<Leader>k', bindCmd('call NextIndent(0, 0, 0, 1)'),           {name = 'JumpIndentUp'})
map('normal',   '<Leader>j', bindCmd('call NextIndent(0, 1, 0, 1)'),           {name = 'JumpIndentDown'})
map('normal',   '<Leader>K', bindCmd('call NextIndent(0, 0, 1, 1)'),           {name = 'JumpIndentParentUp'})
map('normal',   '<Leader>J', bindCmd('call NextIndent(0, 1, 1, 1)'),           {name = 'JumpIndentParentDown'})
map('visual',   '<Leader>k', '<Esc>:call NextIndent(0, 0, 0, 1)<CR>m\'gv\'\'', {name = 'JumpIndentUp'})
map('visual',   '<Leader>j', '<Esc>:call NextIndent(0, 1, 0, 1)<CR>m\'gv\'\'', {name = 'JumpIndentDown'})
map('visual',   '<Leader>K', '<Esc>:call NextIndent(0, 0, 1, 1)<CR>m\'gv\'\'', {name = 'JumpIndentParentUp'})
map('visual',   '<Leader>J', '<Esc>:call NextIndent(0, 1, 1, 1)<CR>m\'gv\'\'', {name = 'JumpIndentParentDown'})
map('operator', '<Leader>k', bindCmd('call NextIndent(0, 0, 0, 1)'),           {name = 'JumpIndentUp'})
map('operator', '<Leader>j', bindCmd('call NextIndent(0, 1, 0, 1)'),           {name = 'JumpIndentDown'})
map('operator', '<Leader>K', bindCmd('call NextIndent(1, 0, 1, 1)'),           {name = 'JumpIndentParentUp'})
map('operator', '<Leader>J', bindCmd('call NextIndent(1, 1, 1, 1)'),           {name = 'JumpIndentParentDown'})

-- Whitespace:
-- [T]oggle [T]abs & spaces:
-- TODO: In VSC works but messes up text rendering.
-- TODO: Consider <Leader>t after removing the <Leader>t mappings for nvim tree.
map('normal', '<Leader>T', bindCmd('if &expandtab | set noexpandtab | else | set expandtab | endif'))
-- [d]elete trailing white[S]pace:
map('normal', 'dS', bindCmd('%s/\\s\\+$//e'))
-- [d]elete [r]epeated space after a "word":
map('normal', 'dr', 'elcw <Esc>')
-- [d]elete [R]epeated space after a "Word":
-- TODO: Figure out if really useful.
map('normal', 'dR', 'Elcw <Esc>')

-- Diff:
if not vim.g.vscode then
    -- [d]iff [t]his:
    map('normal', '<Leader>dt', bindCmd('diffthis'))
    -- [d]iff [u]nsaved:
    map('normal', '<Leader>du', bindCmd('DiffUnsaved'))
    -- [d]iff [g]it for this file:
    map('normal', '<Leader>dg', bindCmd('Git diff %'))
    -- [d]iff [G]it for the whole project:
    map('normal', '<Leader>dG', bindCmd('Git diff'))
    -- [d]iff [o]ff:
    map('normal', '<Leader>do', bindCmd('diffoff!'))
end

-- Settings:
if not vim.g.vscode then
    -- TODO: Find a better way to do this.
    -- open [s]ettings: n[v]im:
    map('normal', '<Leader>sv', bindCmd('e ~/.config/nvim/lua/setup.lua'))
    -- open [s]ettings: nvim [k]keymaps:
    map('normal', '<Leader>sk', bindCmd('e ~/.config/nvim/lua/keymaps.lua'))
    -- open [s]ettings: nvim s[n]ippets:
    map('normal', '<Leader>sn', bindCmd('e ~/.config/nvim/lua/snippets.lua'))
    -- open [s]ettings: nvim [p]lugins:
    map('normal', '<Leader>sp', bindCmd('e ~/.config/nvim/lua/plugins.lua'))
    -- open [s]ettings: nvim [c]onfig:
    map('normal', '<Leader>sc', bindCmd('e ~/.config/nvim/lua/config.lua'))
    -- open [s]ettings: nvim [L]ocal config:
    map('normal', '<Leader>sL', bindCmd('e ~/.config/nvim/lua/env.lua'))
    -- open [s]ettings: [w]indows terminal:
    map('normal', '<Leader>sw', bindCmd('e ~/.wt.json'))
    -- open [s]ettings: [h]yper:
    map('normal', '<Leader>sh', bindCmd('e ~/.hyper.js'))
    -- open [s]ettings: [t]mux:
    map('normal', '<Leader>st', bindCmd('e ~/.tmux.conf'))
    -- open [s]ettings: [b]ash:
    map('normal', '<Leader>sb', bindCmd('e ~/.bashrc'))
    -- open [s]ettings: bash [i]nputrc:
    map('normal', '<Leader>si', bindCmd('e ~/.inputrc'))
    -- open [s]ettings: bash [a]liases:
    map('normal', '<Leader>sa', bindCmd('e ~/.config/bash/aliases'))
    -- open [s]ettings: bash [l]ocations:
    map('normal', '<Leader>sl', bindCmd('e ~/.config/bash/locations'))
    -- open [s]ettings: bash path [e]nvironment variable: (TODO: Come up with a better mnemonic.)
    map('normal', '<Leader>se', bindCmd('e ~/.config/bash/paths'))
    -- open [s]ettings: [s]tarship:
    map('normal', '<Leader>ss', bindCmd('e ~/.config/bash/starship.toml'))
    --map('normal', '<Leader>sv', bindCmd('e ~/.vimrc'))
    --map('normal', '<Leader>r', bindCmd('source ~/.vimrc'))
    -- vim [s]ettings [r]eload:
    map('normal', '<Leader>r', bindCmd('Reload<Cr>:noh'))
end

-- Other:
-- [R]eorder (sort) lines:
-- TODO: Consider <Leader>r and <Leader>s instead.
map('visual', '<Leader>R', bindCmd('sort'))
-- [S]um:
map('visual', '<Leader>S', '<Plug>VimSumVisual')
-- Show [C]ursor [C]olumn:
-- TODO Doesn't work in VSC.
map('normal', '<Leader>L', bindCmd('set cursorcolumn!'))

-- Copy [F]ile path:
map('normal', '<Leader>F', bindCmd('let @" = expand("%")'))

if not vim.g.vscode then
    -- [Z]en:
    map('normal', '<Leader>Z', bindCmd('Goyo'))
    -- [z]en:
    map('normal', '<Leader>z', bindCmd('Limelight!!'))
end

-- TODO: Maybe silent in VSC?
-- [a]llign:
map('visual', 'ga', '<Plug>(EasyAlign)')
-- [a]llign:
map('normal', 'ga', '<Plug>(EasyAlign)')
-- reset [A]llignment:
map('visual', 'gA', 'ga* ')

-- TODO:
--renameFile
--moveFileToTrash
--deleteFile
--filesExplorer.cut
--filesExplorer.copy
--filesExplorer.paste
--filesExplorer.cancelCut
--filesExplorer.openFilePreserveFocus

if vim.g.vscode then
    --map('normal', '<Leader>fg', bindCmd(vsCodeCall('rerunSearchEditorSearch')))
    -- TODO:
    --filesExplorer.findInFolder
    --filesExplorer.findInWorkspace
    --workbench.view.search
    --workbench.action.findInFiles
else
    -- [f]ind a [f]ile:
    --map('normal', '<Leader>ff', bindCmd('Telescope find_files'))
    map('normal', '<Leader>ff', bindCmd('Telescope find_files'))
    -- [f]ind with [g]rep:
    map('normal', '<Leader>fg', bindCmd('Telescope live_grep'))
    -- [f]ind the string under [c]ursor:
    map('normal', '<Leader>fc', bindCmd('Telescope grep_string'))
    -- [f]ind [b]uffer:
    map('normal', '<Leader>fb', bindCmd('Telescope buffers'))
    -- [f]ind [h]elp:
    map('normal', '<Leader>fh', bindCmd('Telescope help_tags'))
    -- [f]ind a string [l]ocally (in the current buffer):
    map('normal', '<Leader>fl', bindCmd('Telescope current_buffer_fuzzy_find'))
    -- [f]ind a [m]ark:
    map('normal', '<Leader>fm', bindCmd('Telescope marks'))
    -- [f]ind lsp definitions ([s]ource):
    map('normal', '<Leader>fs', bindCmd('Telescope lsp_definitions'))
    -- [f]ind lsp [r]eferences:
    map('normal', '<Leader>fr', bindCmd('Telescope lsp_references show_line=false'))
    -- [f]ind lsp document [o]verview:
    map('normal', '<Leader>fo', bindCmd('Telescope lsp_document_symbols'))
    -- [f]ind lsp workspace [O]verview:
    map('normal', '<Leader>fO', bindCmd('Telescope lsp_workspace_symbols'))
    -- [f]ind lsp document [d]iagnostics:
    map('normal', '<Leader>fd', bindCmd('Telescope diagnostics bufnr=0'))
    -- [f]ind lsp workspace [D]iagnostics:
    map('normal', '<Leader>fD', bindCmd('Telescope diagnostics'))
    -- TODO
    -- [f]ind custom named [k]eymaps:
    map('normal', '<Leader>fk', bindCmd('Telescope keymaps lhs_filter=Eg'))
    -- [f]ind all [K]eymaps:
    map('normal', '<Leader>fk', bindCmd('Telescope keymaps'))
end

if not vim.g.vscode then
    -- File [t]ree [t]oggle:
    map('normal', '<Leader>tt', bindCmd('NvimTreeToggle'))
    -- File [t]ree [o]pen:
    map('normal', '<Leader>to', bindCmd('NvimTreeOpen'))
    -- File [t]ree [c]lose:
    map('normal', '<Leader>tc', bindCmd('NvimTreeClose'))
    -- File [t]ree [g]o - focus:
    map('normal', '<Leader>tg', bindCmd('NvimTreeFocus'))
    -- File [t]ree [r]efresh:
    map('normal', '<Leader>tr', bindCmd('NvimTreeRefresh'))
    -- File [t]ree [f]ind current file:
    map('normal', '<Leader>tf', bindCmd('NvimTreeFindFile'))
end

-- TODO...
if not vim.g.vscode then
    -- [g]it [a]dd [a]ll:
    map('normal', '<Leader>ga', bindCmd('Git add --all'), {verbose = true, name = 'GitAdd'})
    -- [g]it [s]tatus:
    map('normal', '<Leader>gs', bindCmd('Git status'), {verbose = true, name = 'GitStatus'})
    -- [g]it [c]ommit:
    map('normal', '<Leader>gc', ':Git commit -m ', {verbose = true, name = 'GitCommit'}) -- TODO: Fix silent.
    -- [g]it [p]ush:
    map('normal', '<Leader>gp', bindCmd('Git push'), {verbose = true, name = 'GitPush'})
    -- [g]it [l]og:
    map('normal', '<Leader>gl', bindCmd('Git log --all --decorate --graph '), {verbose = true, name = 'GitLog'})
end

-- TODO: VSC.
if not vim.g.vscode then
    -- TODO: Use bindings like in vscode-neovim:
    -- gh
    -- gd - reveal definition
    -- gD - peek definition
    -- C-w gd - reveal definition aside
    -- (gf - reveal declaration)
    -- (gF - peek declaration)
    -- (gO - go to symbol)
    -- (K - focus hover)

    -- [e]rrors & diagnostics - list toggle:
    map('normal', '<Leader>ee', bindCmd('TroubleToggle'), {name = 'ErrErrors'})
    -- [e]rrors & diagnostics - list for the [w]orkspace:
    map('normal', '<Leader>ew', bindCmd('TroubleToggle workspace_diagnostics'), {name = 'ErrWorkspace'})
    -- [e]rrors & diagnostics - list for the current [d]ocument:
    map('normal', '<Leader>ed', bindCmd('TroubleToggle document_diagnostics'), {name = 'ErrDocument'})
    -- [e]rrors & diagnostics - [q]uickfix list:
    map('normal', '<Leader>eq', bindCmd('TroubleToggle quickfix'), {name = 'ErrQuickfix'})
    -- [e]rrors & diagnostics - [l]ocation list:
    map('normal', '<Leader>el', bindCmd('TroubleToggle loclist'), {name = 'ErrLocations'})
    -- [e]rrors & diagnostics - [r]eference list:
    map('normal', '<Leader>er', bindCmd('TroubleToggle lsp_references'), {name = 'ErrReferences'})
    -- [e]rrors & diagnostics - go to the [n]ext one:
    map('normal', '<Leader>en', bindCmd('lua vim.diagnostic.goto_next()'), {name = 'ErrNext'})
    -- [e]rrors & diagnostics - go to the [p]revious one:
    map('normal', '<Leader>ep', bindCmd('lua vim.diagnostic.goto_prev()'), {name = 'ErrPrev'})
    -- [e]rrors & diagnostics - [s]how:
    map('normal', '<Leader>es', bindCmd('lua vim.diagnostic.open_float(nil, {focus=false})'), {name = 'ErrShow'})
end

-- TODO: VSC.
-- TODO: <L>ls after <L>es switches to the popup window.
if vim.g.vscode then
    -- TODO...
    --map('normal', '<Leader>ls', bindCmd(vsCodeCall('editor.action.showDefinitionPreviewHover')), {name = 'LangShow'})
    --map('normal', '<Leader>ld', bindCmd(vsCodeCall('editor.action.revealDefinition')), {name = 'LangDefinition'})
    --map('normal', '<Leader>lr', bindCmd(vsCodeCall('editor.action.goToReferences')), {name = 'LangReferences'})
else
    -- [l]anguage analysis - [i]info:
    map('normal', '<Leader>ls', bindCmd('lua vim.lsp.buf.hover()'), {name = 'LangShow'})
    -- [l]anguage analysis - [d]efinition:
    map('normal', '<Leader>ld', bindCmd('lua vim.lsp.buf.definition()'), {name = 'LangDefinition'})
    -- [l]anguage analysis - [r]eferences:
    map('normal', '<Leader>lr', bindCmd('lua vim.lsp.buf.references()'), {name = 'LangReferences'})
end

-- TODO: This doesn't really work that well. Could this be done with LSP?
cStyleFunctionPattern  = [[^\s*(if|else|while|for|do)@!(\w+\_\s*)+\(\_[^{}();]*\)\_\s*(:\_\s*\w+\_\s*)?\{]]
keywordFunctionPattern = [[(^|\s)(function|fn)(\_\s+\w+)*\_\s*\(]]
arrowFunctionPattern   = [[\)\_\s*\=\>]]
functionPattern        = '\\v(' .. cStyleFunctionPattern .. ')|(' .. keywordFunctionPattern .. ')|(' .. arrowFunctionPattern .. ')'
--map('normal', '[[', [[:call search(']] .. functionPattern .. [[', 'bw')<Cr>]], {name = 'PrevFunction'})
--map('normal', ']]', [[:call search(']] .. functionPattern .. [[', 'w')<Cr>]],  {name = 'NextFunction'})

if vim.g.vscode then
    map('normal', 'gn', bindCmd(vsCodeCall('editor.action.marker.next')), {name = 'NextError'})
    map('normal', 'gN', bindCmd(vsCodeCall('editor.action.marker.prev')), {name = 'PrevError'})
    map('normal', '<Leader>l', bindCmd(vsCodeCall('settings.cycle.editor.linkedEditing')), {name = 'LinkedEditing'})
    --map('normal', '<Leader>e', bindCmd(vsCodeCall('workbench.files.action.showActiveFileInExplorer')), {name = 'RefealInExplorer'})

    -- g bindings:

    -- <Leader> bindings:

    -- keys           | custom                            | original
    ------------------|-----------------------------------|----------
    -- gn             | next diagnostic                   | search with last search pattern
    -- gN             | previous diagnostic               | search backwards with last search pattern
    -- gh             | hover                             | select mode
    -- gH             | references                        | linewise select mode
    -- gd             | reveal definition                 | go to local declaration
    -- gD             | peek definition                   | go to global declaration
    -- <C-w>gd        | reveal definition aside           |
    -- K              | focus hover                       | run man command for keyword under cursor
    -- ys*            | add surrounding chars             |
    -- cs*            | change surrounding chars          |
    -- ds*            | delete surrounding chars          |
    -- <C-w>a         |                                   |
    -- <C-w>b         |                                   | bottom-right window
    -- <C-w>c         |                                   | close window
    -- <C-w>d         |                                   | oddly specific
    -- <C-w>e         | explorer?                         |
    -- <C-w>f         |                                   | oddly specific
    -- <C-w>g*        |                                   | tabs, or oddly specific stuff
    -- <C-w>h         |                                   | left window
    -- <C-w>i         |                                   | oddly specific
    -- <C-w>j         |                                   | below window
    -- <C-w>k         |                                   | above window
    -- <C-w>l         |                                   | right window
    -- <C-w>m         |                                   |
    -- <C-w>n         |                                   | new window
    -- <C-w>o         |                                   | close other windows
    -- <C-w>p         |                                   | previous window
    -- <C-w>q         |                                   | quit window
    -- <C-w>r         |                                   | rotate windows
    -- <C-w>s         |                                   | split window
    -- <C-w>t         |                                   | top-left window
    -- <C-w>tp        | toggle panel?                     | top-left window
    -- <C-w>te        | toggle explorer?                  | top-left window
    -- <C-w>u         |                                   |
    -- <C-w>v         |                                   | split window vertically
    -- <C-w>w         |                                   | next window
    -- <C-w>x         |                                   | exchange windows
    -- <C-w>y         |                                   |
    -- <C-w>z         |                                   | close preview window
    -- <C-k><Up>      | move window above (TODO: Vim)     |
    -- <C-k><Down>    | move window below (TODO: Vim)     |
    -- <C-k><Left>    | move window left (TODO: Vim)      |
    -- <C-k><Right>   | move window right (TODO: Vim)     |
    -- <C-k><S-Up>    | move editor to above group (VSC)  |
    -- <C-k><S-Down>  | move editor to below group (VSC)  |
    -- <C-k><S-Left>  | move editor to left group (VSC)   |
    -- <C-k><S-Right> | move editor to right group (VSC)  |
    -- <Leader>l      | linked editing (VSC)              |
    -- <Leader>h      | cancel highlight                  |
    -- <Leader>y      | copy to system clipboard          |
    -- <Leader>p      | paste from system clipboard       |
    -- <Leader>n      | toggle line numbers style         |
    -- <Leader>u      | under_score                       |
    -- <Leader>U      | camelCase                         |
    -- <Leader>w      | write (TODO: ctrl+s in VSC?)      |
    -- <Leader>R      | sort                              |
    -- <Leader>S      | sum (TODO)                        |
    -- <Leader>L      | column line (TODO: VSC)           |
    -- <Leader>F      | copy file name (TODO: VSC)        |
    -- <C-S-PageUp>   | resize panel up (VSC)             |
    -- <C-S-PageDown> | resize panel down (VSC)           |
end
