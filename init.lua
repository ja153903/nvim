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
Plug 'kyazdani42/nvim-web-devicons'

-- Formatting
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'

-- Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- Git
Plug 'airblade/vim-gitgutter'
Plug 'f-person/git-blame.nvim'

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
Plug 'raphamorim/lucario'
Plug 'EdenEast/nightfox.nvim'

-- Floaterm
Plug 'voldikss/vim-floaterm'

-- Impatient
Plug 'lewis6991/impatient.nvim'

-- nvim-transparent
Plug 'xiyaowong/nvim-transparent'

-- bufferline.nvim
Plug 'akinsho/bufferline.nvim'

Plug 'lukas-reineke/indent-blankline.nvim'

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
