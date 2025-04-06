vim.opt.mousemodel = 'popup'

vim.cmd [[aunmenu *]]

-- Normal mode:

vim.cmd [[nmenu PopUp.Analysis:            <Nop>]]
vim.cmd [[nmenu PopUp.\ \ Info            gh]]
vim.cmd [[nmenu PopUp.󰯂\ \ Definition      gd]]
vim.cmd [[nmenu PopUp.\ \ References      gr]]
vim.cmd [[nmenu PopUp.\ \ Error\ Info     gH]]
vim.cmd [[nmenu PopUp.󰙡\ \ Next\ Error     gn]]
vim.cmd [[nmenu PopUp.󰙣\ \ Previous\ Error gN]]

vim.cmd [[nmenu PopUp.-1- <Nop>]]

vim.cmd [[nmenu PopUp.Search:              <Nop>]]
vim.cmd [[nmenu PopUp.󱈇\ \ Buffers         <Leader>fb]]
vim.cmd [[nmenu PopUp.󰥨\ \ Files           <Leader>ff]]
vim.cmd [[nmenu PopUp.\ \ String          <Leader>fg]]
vim.cmd [[nmenu PopUp.\ \ This\ Word      <Leader>fc]]
vim.cmd [[nmenu PopUp.󰱼\ \ This\ File      <Leader>fl]]
vim.cmd [[nmenu PopUp.󱤇\ \ Marks           <Leader>fm]]
vim.cmd [[nmenu PopUp.󱎸\ \ Symbols         <Leader>fo]]
vim.cmd [[nmenu PopUp.󰦅\ \ Keymaps         <Leader>fK]]

vim.cmd [[nmenu PopUp.-2- <Nop>]]

vim.cmd [[nmenu PopUp.󰊢\ \ Git\ Blame      <Leader>gb]]

vim.cmd [[nmenu PopUp.-3- <Nop>]]

vim.cmd [[nnoremenu PopUp.\ \ Paste     p]]
vim.cmd [[nnoremenu PopUp.\ \ Copy\ All <Cmd>%y<Cr>]]

vim.cmd [[nmenu PopUp.-4- <Nop>]]

vim.cmd [[nmenu PopUp.\ \ Toggle\ AI           <Leader>a]]

-- Visual mode:

vim.cmd [[vnoremenu PopUp.󰆏\ \ Copy      y]]
vim.cmd [[vnoremenu PopUp.\ \ Cut       d]]
vim.cmd [[vnoremenu PopUp.\ \ Paste     p]]

-- Insert mode:

vim.cmd [[imenu PopUp.AI:                       <Nop>]]
vim.cmd [[imenu PopUp.󰙡\ \ Next\ Suggestion     <C-S>]]
vim.cmd [[imenu PopUp.󰙣\ \ Previous\ Suggestion <C-V>]]
vim.cmd [[imenu PopUp.󰄬\ \ Accept\ Suggestion   <C-I>]]
vim.cmd [[imenu PopUp.\ \ Accept\ Word         <C-K>]]
--vim.cmd [[imenu PopUp.\ \ Accept\ Word         <C-K>]]
vim.cmd [[imenu PopUp.󰸟\ \ Accept\ Line         <C-L>]]
vim.cmd [[imenu PopUp.󰜺\ \ Cancel\ Suggestion   <C-D>]]

vim.cmd [[imenu PopUp.-1- <Nop>]]

vim.cmd [[inoremenu PopUp.\ \ Paste     p]]
