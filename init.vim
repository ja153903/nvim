call plug#begin('~/.config/nvim/autoload/plug.vim')

"Python LSP
Plug 'davidhalter/jedi-vim'

"Automatically pair brackets
Plug 'jiangmiao/auto-pairs'

"Commenting Plugin
Plug 'scrooloose/nerdcommenter'

"Autoformatting
Plug 'sbdchd/neoformat'

"Themes
Plug 'fcpg/vim-fahrenheit'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/seoul256.vim'
Plug 'herrbischoff/cobalt2.vim'
Plug 'w0ng/vim-hybrid'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'ajmwagar/vim-deus'
Plug 'sainnhe/everforest'
Plug 'whatyouhide/vim-gotham'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'NLKNguyen/papercolor-theme'

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"FzF because Telescope slow
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

"gitgutter
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'

"JavaScript and TypeScript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

"JSX Support
Plug 'peitalin/vim-jsx-typescript'

"GraphQL
Plug 'jparise/vim-graphql'

"Rust
Plug 'rust-lang/rust.vim'

"Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'wellle/context.vim'
Plug 'itchyny/lightline.vim'

"terminal
Plug 'voldikss/vim-floaterm'

call plug#end()

"---- Load Files ----
source ~/.config/nvim/plugins/general.vim
source ~/.config/nvim/plugins/keymapping.vim
source ~/.config/nvim/plugins/python.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/neoformat.vim
source ~/.config/nvim/plugins/jedi.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/javascript.vim
source ~/.config/nvim/plugins/markup.vim
source ~/.config/nvim/plugins/rust.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/context.vim
source ~/.config/nvim/plugins/floaterm.vim
