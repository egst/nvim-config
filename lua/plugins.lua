require 'helpers'

plugload(function (plug)
    -- Generic tweaks:
    plug {'nvim-lua/plenary.nvim'}   -- Various tools used by many plugins.
    plug {'adelarsq/vim-matchit'}    -- Better % matching.
    plug {'famiu/nvim-reload'}       -- Reloading lua config.
    plug {'junegunn/vim-easy-align'} -- Horizontal alignment.
    plug {'moll/vim-bbye'}           -- Simpler buffer closing.
    plug {'tpope/vim-repeat'}        -- More repeatable commands.
    plug {'tpope/vim-surround'}      -- Surrounding commands.
    plug {'vitalk/vim-shebang'}      -- Infering filetype from shebang.

    -- Language support:
    plug {'sheerun/vim-polyglot'}
    plug {'alvan/vim-closetag'}                                   -- Autoclosing HTML tags.
    plug {'captbaritone/better-indent-support-for-php-with-html'} -- HTML indentation in PHP.
    plug {'nvim-treesitter/nvim-treesitter'}                      -- Better syntax highlighting.
    plug {'neovim/nvim-lspconfig'}                                -- Native LSP.
    plug {'folke/trouble.nvim'}                                   -- Diagnostics for the native LSP.
    plug {'dcampos/nvim-snippy'}                                  -- Snippets. Required for the completion.
    plug {'hrsh7th/nvim-cmp'}                                     -- Completion tools for the native LSP.
    plug {'dcampos/cmp-snippy'}                                   -- Nvim-cmp Snippy support.
    plug {'hrsh7th/cmp-nvim-lsp'}                                 -- Nvim-cmp LSP config interface.

    -- Visual elements:
    plug {'kyazdani42/nvim-web-devicons'}        -- A lua port of the original devicons.
    plug {'lukas-reineke/indent-blankline.nvim'} -- Indentation guides.

    -- Search and navigation:
    plug {'nvim-telescope/telescope.nvim'}                          -- An alternative to the original Fzf.
    plug {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'} -- Fzf algorithms to speed up Telescope.
    plug {'junegunn/fzf'}                                           -- Core Fzf integration.
    plug {'kyazdani42/nvim-tree.lua'}                               -- A tree file explorer. Replaces netrw.
    plug {'nvim-lualine/lualine.nvim'}                              -- Status line.

    -- Focus tools:
    plug {'junegunn/limelight.vim'} -- Dimmed surrounding paragraphs.
    plug {'junegunn/goyo.vim'}      -- Single centered window view.

    -- Git integration:
    plug {'lewis6991/gitsigns.nvim'} -- Git changes marks.
    plug {'tpope/vim-fugitive'}      -- Git commands.

    -- Color themes:
    plug {'EdenEast/nightfox.nvim',         as = 'nightfox'}
    plug {'NLKNguyen/papercolor-theme',     as = 'papercolor'}
    plug {'embark-theme/vim',               as = 'embark'}
    plug {'patstockwell/vim-monokai-tasty', as = 'monokai-tasty'}
    plug {'sonph/onehalf'}

    -- Currently unused:
    --plug {'tpope/vim-vinegar'}                     --> NvimTree.
    --plug {'ibhagwan/fzf-lua'}                      --  A lua port of the original Fzf. Keeping the original Fzf, only as a Vista dependency.
    --plug {'neoclide/coc.nvim', branch = 'release'} --> Native LSP.
    --plug {'justinmk/vim-syntax-extra'}             --> TreeSitter.
    --plug {'sheerun/vim-polyglot'}                  --> TreeSitter.
    --plug {'zhaocai/LaTeX-Box'}                     --> TreeSitter.
    --plug {'gennaro-tedesco/nvim-peekup'}           --> Telescope.
    --plug {'airblade/vim-gitgutter'}                --> GitSigns.
    --plug {'junegunn/fzf.vim'}                      --  The original fzf plugin. Dependency of Vista.
    --plug {'liuchengxu/vista.vim'}                  --  Not sure if I want to use this.
    --plug {'tpope/vim-ragtag'}                      --  HTML keymaps. Not sure if I need this.
end)
