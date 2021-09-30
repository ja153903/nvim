local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'wellle/context.vim'
  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'glepnir/lspsaga.nvim'

  use 'scrooloose/nerdcommenter'
  use 'sbdchd/neoformat'
  
  use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'airblade/vim-gitgutter'
  use 'f-person/git-blame.nvim'

  use 'yuezk/vim-js'
  use 'leafgarland/typescript-vim'
  use 'maxmellon/vim-jsx-pretty'
  use 'pantharshit00/vim-prisma'
  use 'jparise/vim-graphql'
  
  use 'davidhalter/jedi-vim'
  use 'cespare/vim-toml'

  use 'EdenEast/nightfox.nvim'
  
  use 'voldikss/vim-floaterm'

  use 'lewis6991/impatient.nvim'

  use 'xiyaowong/nvim-transparent'

  use 'akinsho/bufferline.nvim'
end)

require('impatient')
require('colors')
require('settings')
require('keymapping')
require('lspconfigrc')
require('lspsagarc')
require('filetypes')
require('telescoperc')
require('pluginsrc')
require('completionrc')
