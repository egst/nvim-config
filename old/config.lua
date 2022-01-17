--vim.opt.autoindent = true
--vim.opt.cindent = true
--set path += **
--set wildmenu
--let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
--let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
--let &t_SI = "\e[5\ q"
--let &t_SR = "\e[3\ q"
--let &t_EI = "\e[7\ q"
--set guicursor=n-v-ve-r-cr:block-blinkon1,i-c-ci-sm:ver10-blinkon1,o-r:hor10

-- Color adjustments:
--local cmd_buffend = 'hi! EndOfBuffer guibg=bg guifg=bg'
--vim.cmd(cmd_buffend)
--vim.cmd('autocmd! User GoyoLeave ' .. cmd_buffend)
--hi! SpecialKey  guifg=grey40
--hi link htmlLink none
--hi Search    cterm=none ctermbg=blue ctermfg=white
--hi IncSearch cterm=none ctermbg=blue ctermfg=white

-- Ripgrep:
--command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)'

-- Indentation:
-- Not sure if I still need this.
--[=[
vim.cmd [[
    function! Indent(ind)
        if &sol
            set nostartofline
        endif
        let vcol = virtcol('.')
        if a:ind
            norm! >>
            exe "norm!". (vcol + shiftwidth()) . '|'
        else
            norm! <<
            exe "norm!". (vcol - shiftwidth()) . '|'
        endif
    endfunc
]]
]=]

-- Location:
-- Not sure if I still need this.
-- Save current view settings on a per-window, per-buffer basis.
--[=[
vim.cmd [[
    function! AutoSaveWinView()
        if !exists("w:SavedBufView")
            let w:SavedBufView = {}
        endif
        let w:SavedBufView[bufnr("%")] = winsaveview()
    endfunction
    " Restore current view settings.
    function! autoRestoreWinView()
        let buf = bufnr("%")
        if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
            let v = winsaveview()
            let atStartOfFile = v.lnum == 1 && v.col == 0
            if atStartOfFile && !&diff
                call winrestview(w:SavedBufView[buf])
            endif
            unlet w:SavedBufView[buf]
        endif
    endfunction
    " When switching buffers, preserve window view.
    if v:version >= 700
        autocmd BufLeave * call autoSaveWinView()
        autocmd BufEnter * call autoRestoreWinView()
    endif
]]
]=]

-- Other tweaks:
--autocmd('BufWinEnter', '*', [[silent! normal! g`"]])

-- GitGutter:
--vim.g.gitgutter_sign_added              = '+'
--vim.g.gitgutter_sign_modified           = '>'
--vim.g.gitgutter_sign_removed            = '-'
--vim.g.gitgutter_sign_removed_first_line = '^'
--vim.g.gitgutter_sign_modified_removed   = '<'
--vim.g.gitgutter_map_keys                = 0

--[=[
vim.cmd [[
    function! HiGroup()
        let l:s = synID(line('.'), col('.'), 1)
        echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
    endfun
]]
vim.cmd [[command! Hg :call HiGroup()]]
]=]
