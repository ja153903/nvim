local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Essentials
Plug('nvim-treesitter/nvim-treesitter', { ['do'] =':TSUpdate' })
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'wellle/context.vim'
Plug 'hoob3rt/lualine.nvim'
Plug 'ryanoasis/vim-devicons'

-- Formatting
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'

-- Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
-- Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
-- Plug 'nvim-telescope/telescope-fzf-writer.nvim'

-- Git
Plug 'airblade/vim-gitgutter'

-- JavaScript and TypeScript
Plug 'yuezk/vim-js'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pantharshit00/vim-prisma'
Plug 'jparise/vim-graphql'
Plug('evanleck/vim-svelte', { ['branch'] = 'main' })

-- Python
Plug 'davidhalter/jedi-vim'
Plug 'cespare/vim-toml'

-- Colorschemes
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'Mangeshrex/uwu.vim'
Plug 'raphamorim/lucario'

-- Floaterm
Plug 'voldikss/vim-floaterm'

-- Impatient
Plug 'lewis6991/impatient.nvim'

-- nvim-transparent
Plug 'xiyaowong/nvim-transparent'

vim.call('plug#end')

require('impatient')
require('colors')
require('general_settings')
require('keymapping')
require('lspconfigrc')
require('lspsagarc')
require('filetypes')
require('telescoperc')
require('pluginsrc')
require('completionrc')
