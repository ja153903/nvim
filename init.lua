local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

require('packer').startup(function(use)
	-- Essential plugins
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'wellle/context.vim'
  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'glepnir/lspsaga.nvim'
	use 'SirVer/ultisnips'
	use 'honza/vim-snippets'
	-- Formatting
  use 'scrooloose/nerdcommenter'
  use 'sbdchd/neoformat'
  -- Telescope
  use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- git
  use 'airblade/vim-gitgutter'
  use 'f-person/git-blame.nvim'
  -- javascript
  use 'yuezk/vim-js'
  use 'leafgarland/typescript-vim'
  use 'maxmellon/vim-jsx-pretty'
  use 'pantharshit00/vim-prisma'
  use 'jparise/vim-graphql'
  -- python
  use 'davidhalter/jedi-vim'
  use 'cespare/vim-toml'
  -- themes
  use 'EdenEast/nightfox.nvim'
	use 'folke/tokyonight.nvim'
  -- integrated terminal
  use 'voldikss/vim-floaterm'
  -- opt
  use 'lewis6991/impatient.nvim'
  -- transparency
  use 'xiyaowong/nvim-transparent'
  -- buffer
  use 'akinsho/bufferline.nvim'
	-- debugging protocol
	use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }
end)

require('impatient')
require('colors')
require('settings')
require('keymapping')
require('lspconfigrc')
require('filetypes')
require('telescoperc')
require('pluginsrc')
require('completionrc')
