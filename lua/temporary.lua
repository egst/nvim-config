--- Thes file containes temporary config implementations
--- that should be moved, re-implemented, or removed.

--- Jump to the next or previous line that has the same level or a lower
--- level of indentation than the current line.
--- TODO: Implement in Lua and move.
vim.cmd [[
    function! NextIndent (exclusive, forward, lowerlevel, skipblanks)
        let line = line('.')
        let column = col('.')
        let lastline = line('$')
        let indent = indent(line)
        let stepvalue = a:forward ? 1 : -1
        while (line > 0 && line <= lastline)
            let line = line + stepvalue
            if (!a:lowerlevel && indent(line) == indent || a:lowerlevel && indent(line) < indent)
                if (!a:skipblanks || strlen(getline(line)) > 0)
                    if (a:exclusive)
                        let line = line - stepvalue
                    endif
                    exe line
                    exe "normal " column . "|"
                    return
                endif
            endif
        endwhile
    endfunction
]]

--- TODO: Implement in Lua and move.
vim.cmd [[
    function! HiGroup()
        let l:s = synID(line('.'), col('.'), 1)
        echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
    endfunction
]]
vim.cmd [[command! HiGroup :call HiGroup()]]

--- TODO: Implement in Lua and move.
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

--- Show line diagnostics automatically in hover window
--vim.o.updatetime = 250
--vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
--[[
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {focusable = false}
)
]]

--- TODO: Find out what this was for and move.
--vim.g.autoswap_detect_tmux = 1

--- TODO: Restructure the config, so that this can be placed in it without cyclic dependencies.
--- TODO: Find out what this was for and move.
--config.langServers.noverify.root_dir = require 'lspconfig.util'.root_pattern('psalm.xml', 'psalm.xml.dist')

--- TODO: Find out what this was for and move.
--vim.opt.smartindent = true
--vim.cmd 'syntax on'
--vim.cmd 'filetype on'
--vim.cmd 'filetype plugin on'
--vim.cmd 'filetype indent on'

--- TODO: Find out if still relevant and move.
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

--- TODO: Find out if still relevant and move.
-- Hologram:
--[=[
require('hologram').setup{
    auto_display = true
}
]=]

--- TODO: Find out if still relevant and move.
--cmd('Esv set nosplitright | vnew | set filetype=json | read !my/es #')
--cmd('Es set splitbelow | new | set filetype=json | read !my/es #')
--cmd('-nargs=* Sqlv set splitbelow | vnew | read !my/mysql <args> "$(cat #)"')
--cmd('-nargs=* Sql set splitbelow | new | read !my/mysql <args> "$(cat #)"')

--- chrisbra/univode.vim maps this.
--- TODO: Move.
vim.cmd('silent! unmap <Leader>un')
