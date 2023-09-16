-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'nvim-treesitter/playground'
  use 'ThePrimeagen/harpoon'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'easymotion/vim-easymotion'
  use 'folke/tokyonight.nvim'
  use 'preservim/nerdtree'
  --use ('prettier/vim-prettier', { run = 'yarn install --frozen-lockfile --production' })

  -- use {
  -- 'VonHeikemen/lsp-zero.nvim',
  -- branch = 'v2.x',
  -- requires = {
  -- -- LSP Support
  -- {'neovim/nvim-lspconfig'},             -- Required
  -- {                                      -- Optional
  -- 'williamboman/mason.nvim',
  -- run = function()
  -- pcall(vim.cmd, 'MasonUpdate')
  -- end,
  -- },
  -- {'williamboman/mason-lspconfig.nvim'}, -- Optional

  -- -- Autocompletion
  -- {'hrsh7th/nvim-cmp'},     -- Required
  -- {'hrsh7th/cmp-nvim-lsp'}, -- Required
  -- {'L3MON4D3/LuaSnip'},     -- Required
  -- }
  -- }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },

      --prettier
      { 'jose-elias-alvarez/null-ls.nvim' },
      { 'MunifTanjim/prettier.nvim' }
    }
  }
  -- install without yarn or npm
  -- use({
  --     "iamcco/markdown-preview.nvim",
  --     run = function() vim.fn["mkdp#util#install"]() end,
  -- })

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })

  use ''mileszs/ack.vim'

end)
