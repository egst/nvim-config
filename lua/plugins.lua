local plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Generic tweaks:
plug('nvim-lua/plenary.nvim')                          -- Various tools used by many plugins.
plug('adelarsq/vim-matchit',      {as = 'matchit'})    -- Better % matching.
plug('famiu/nvim-reload')                              -- Reloading lua config.
plug('junegunn/vim-easy-align',   {as = 'easy-align'}) -- Horizontal alignment.
plug('moll/vim-bbye',             {as = 'bbye'})       -- Simpler buffer closing.
plug('tpope/vim-repeat',          {as = 'repeat'})     -- More repeatable commands.
plug('tpope/vim-surround',        {as = 'surround'})   -- Surrounding commands.

-- Language support:
plug('alvan/vim-closetag',                                    {as = 'closetag'})   -- Autoclosing HTML tags.
plug('captbaritone/better-indent-support-for-php-with-html',  {as = 'php-indent'}) -- HTML indentation in PHP.
plug('nvim-treesitter/nvim-treesitter',                       {as = 'treesitter'}) -- Better syntax highlighting.
plug('neovim/nvim-lspconfig',                                 {as = 'lspconfig'})  -- Native LSP.
plug('folke/trouble.nvim',                                    {as = 'trouble'})    -- Diagnostics for the native LSP.
plug('dcampos/nvim-snippy',                                   {as = 'snippy'})     -- Snippets. Required for the completion.
plug('hrsh7th/nvim-cmp',                                      {as = 'cmp'})        -- Completion tools for the native LSP.
plug('dcampos/cmp-snippy')                                                         -- Nvim-cmp Snippy support.
plug('hrsh7th/cmp-nvim-lsp')                                                       -- Nvim-cmp LSP config interface.

-- Visual elements:
plug('kyazdani42/nvim-web-devicons',        {as = 'devicons'})         -- A lua port of the original devicons.
plug('lukas-reineke/indent-blankline.nvim', {as = 'indent-blankline'}) -- Indentation guides.
--plug('folke/lsp-colors.nvim',               {as = 'lsp-colors'})       -- LSP colors (and icons) support for all themes.

-- Search and navigation:
plug('nvim-telescope/telescope.nvim',            {as     = 'telescope'})           -- An alternative to the original Fzf.
plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'make'})                -- Fzf algorithms to speed up Telescope.
plug('junegunn/fzf',                             {['do'] = vim.fn['fzf#install']}) -- Core Fzf integration.
plug('kyazdani42/nvim-tree.lua',                 {as = 'nvim-tree'})               -- A tree file explorer. Replaces netrw.

-- Focus tools:
plug('junegunn/limelight.vim', {as = 'limelight'}) -- Dimmed surrounding paragraphs.
plug('junegunn/goyo.vim',      {as = 'goyo'})      -- Single centered window view.

-- Git integration:
plug('lewis6991/gitsigns.nvim', {as = 'gitsigns'}) -- Git changes marks.
plug('tpope/vim-fugitive',      {as = 'fugitive'}) -- Git commands.

-- Color themes:
plug('EdenEast/nightfox.nvim',         {as = 'nightfox'})
plug('NLKNguyen/papercolor-theme',     {as = 'papercolor'})
plug('embark-theme/vim',               {as = 'embark'})
plug('patstockwell/vim-monokai-tasty', {as = 'monokai-tasty'})
plug('sonph/onehalf')

-- Currently unused:
--plug('tpope/vim-vinegar')                       --> NvimTree.
--plug('ibhagwan/fzf-lua')                        --  A lua port of the original Fzf. Keeping the original Fzf, only as a Vista dependency.
--plug('neoclide/coc.nvim', {branch = 'release'}) --> Native LSP.
--plug('justinmk/vim-syntax-extra')               --> TreeSitter.
--plug('sheerun/vim-polyglot')                    --> TreeSitter.
--plug('zhaocai/LaTeX-Box')                       --> TreeSitter.
--plug('gennaro-tedesco/nvim-peekup')             --> Telescope.
--plug('airblade/vim-gitgutter')                  --> GitSigns.
--plug('junegunn/fzf.vim')                        --  The original fzf plugin. Dependency of Vista.
--plug('liuchengxu/vista.vim')                    --  Not sure if I want to use this.
--plug('tpope/vim-ragtag')                        --  HTML keymaps. Not sure if I need this.

vim.call('plug#end')
