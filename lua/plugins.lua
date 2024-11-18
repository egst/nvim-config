require 'helpers'

plugLoad(function (plug)
    -- Generic tweaks:
    plug {'nvim-lua/plenary.nvim'}   -- Various tools used by many plugins.
    plug {'adelarsq/vim-matchit'}    -- Better % matching.
    plug {'famiu/nvim-reload'}       -- Reloading lua config.
    plug {'junegunn/vim-easy-align'} -- Horizontal alignment.
    plug {'tpope/vim-repeat'}        -- More repeatable commands.
    plug {'tpope/vim-surround'}      -- Surrounding commands.
    plug {'grepsuzette/vim-sum'}     -- Numeric selection calculator.
    plug {'chrisbra/unicode.vim'}    -- TODO: Find out if still useful.

    if not vim.g.vscode then
        plug {'vitalk/vim-shebang'} -- Infering filetype from shebang.
        plug {'moll/vim-bbye'}      -- Simpler buffer closing.
    end

    -- Language support:
    if not vim.g.vscode then
        --plug {'sheerun/vim-polyglot'}
        plug {'alvan/vim-closetag'}                                   -- Autoclosing HTML tags.
        plug {'captbaritone/better-indent-support-for-php-with-html'} -- HTML indentation in PHP.
        --plug {'nvim-treesitter/nvim-treesitter'}                      -- Better syntax highlighting.
        plug {'neovim/nvim-lspconfig'}                                -- Native LSP.
        plug {'folke/trouble.nvim'}                                   -- Diagnostics for the native LSP.
        plug {'dcampos/nvim-snippy'}                                  -- Snippets. Required for the completion.
        plug {'hrsh7th/nvim-cmp'}                                     -- Completion tools for the native LSP.
        plug {'dcampos/cmp-snippy'}                                   -- Nvim-cmp Snippy support.
        plug {'hrsh7th/cmp-nvim-lsp'}                                 -- Nvim-cmp LSP config interface.
    end

    -- Visual elements:
    if not vim.g.vscode then
        plug {'kyazdani42/nvim-web-devicons'}        -- A lua port of the original devicons.
        --plug {'lukas-reineke/indent-blankline.nvim'} -- Indentation guides.
        --plug {'edluffy/hologram.nvim'}
    end

    -- Search and navigation:
    if not vim.g.vscode then
        plug {'nvim-telescope/telescope.nvim'}                          -- An alternative to the original Fzf.
        plug {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'} -- Fzf algorithms to speed up Telescope.
        plug {'junegunn/fzf'}                                           -- Core Fzf integration.
        plug {'kyazdani42/nvim-tree.lua'}                               -- A tree file explorer. Replaces netrw.
        plug {'nvim-lualine/lualine.nvim'}                              -- Status line.
        --plug {'simrat39/symbols-outline.nvim'}                          -- Outline.
    end

    -- Focus tools:
    if not vim.g.vscode then
        plug {'junegunn/limelight.vim'} -- Dimmed surrounding paragraphs.
        plug {'junegunn/goyo.vim'}      -- Single centered window view.
    end

    -- Git integration:
    if not vim.g.vscode then
        plug {'lewis6991/gitsigns.nvim'} -- Git changes marks.
        plug {'tpope/vim-fugitive'}      -- Git commands
    end

    -- Color themes:
    if not vim.g.vscode then
        plug {'EdenEast/nightfox.nvim',         as = 'nightfox'}
        plug {'NLKNguyen/papercolor-theme',     as = 'papercolor'}
        plug {'embark-theme/vim',               as = 'embark'}
        plug {'patstockwell/vim-monokai-tasty', as = 'monokai-tasty'}
        plug {'sonph/onehalf'}
        plug {'shaunsingh/nord.nvim',           as = 'nord'}
        plug {'sainnhe/everforest'}
    end

    -- Currently unused:
    -- TODO: Remove the ones I'm not gonna use anymore.
    --plug {'tpope/vim-vinegar'}                     --> NvimTree.
    --plug {'ibhagwan/fzf-lua'}                      --  A lua port of the original Fzf. Keeping the original Fzf, only as a Vista dependency.
    --plug {'neoclide/coc.nvim', branch = 'release'} --> Native LSP.
    --plug {'justinmk/vim-syntax-extra'}             --> TreeSitter.
    --plug {'sheerun/vim-polyglot'}                  --> TreeSitter.
    --plug {'zhaocai/LaTeX-Box'}                     --> TreeSitter.
    --plug {'gennaro-tedesco/nvim-peekup'}           --> Telescope.
    --plug {'airblade/vim-gitgutter'}                --> GitSigns.
    --plug {'junegunn/fzf.vim'}                      --  The original fzf plugin. Dependency of Vista.
    --plug {'tpope/vim-ragtag'}                      --  HTML keymaps. Not sure if I need this.
    --plug {'liuchengxu/vista.vim'}                  --  Outline.
end)
