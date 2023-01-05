local config = require 'config'

if config.treesitter then
    require 'nvim-treesitter.configs'.setup {
        --ensure_installed = 'maintained',
        sync_install     = false,
        highlight = {
            enable  = true,
            disable = {},
            additional_vim_regex_highlighting = true
        }
    }
    --require 'nvim-treesitter.install'.compilers = {'clang'}
    --[[
    if config.treesitter_compiler then
        require 'nvim-treesitter.install'.compilers = {
            config.treesitter_compiler
        }
    end
    ]]
end
