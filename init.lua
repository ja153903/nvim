local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'davidhalter/jedi-vim'

Plug 'scrooloose/nerdcommenter'

Plug 'sbdchd/neoformat'

Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug 'nvim-telescope/telescope-fzf-writer.nvim'

Plug('nvim-treesitter/nvim-treesitter', { ['do'] =':TSUpdate' })

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'

Plug 'yuezk/vim-js'
Plug 'leafgarland/typescript-vim'

Plug 'maxmellon/vim-jsx-pretty'

Plug 'jparise/vim-graphql'

Plug 'rust-lang/rust.vim'

Plug 'wellle/context.vim'

Plug 'cespare/vim-toml'

Plug 'pantharshit00/vim-prisma'

Plug 'neovim/nvim-lspconfig'

Plug 'glepnir/lspsaga.nvim'

Plug 'nvim-lua/completion-nvim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

vim.call('plug#end')

require('colors')
require('general_settings')
require('keymapping')
require('lspconfigrc')
require('lspsagarc')
require('filetypes')
require('telescoperc')
require('pluginsrc')
require('completionrc')
