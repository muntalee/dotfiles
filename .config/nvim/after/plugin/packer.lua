vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- for packer

  use 'wbthomason/packer.nvim'

  -- web dev

  use 'alvan/vim-closetag'

  use 'tpope/vim-surround'

  use 'AndrewRadev/tagalong.vim'

  -- quality of life

  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }

  use 'christoomey/vim-tmux-navigator'

  use 'nvim-tree/nvim-tree.lua'

  use 'voldikss/vim-floaterm'

  -- theming

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'itchyny/lightline.vim'

  use 'nvim-tree/nvim-web-devicons'

  use 'daviesjamie/vim-base16-lightline'

  use 'chriskempson/base16-vim'

  -- lsp config

  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  -- prettier

  use 'sbdchd/neoformat'

  -- telescope

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }


end)
