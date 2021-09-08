call plug#begin('~/.config/nvim/autoload/plug.vim')

"Python LSP
Plug 'davidhalter/jedi-vim'
Plug 'Rigellute/rigel'

"Commenting Plugin
Plug 'scrooloose/nerdcommenter'

"Autoformatting
Plug 'sbdchd/neoformat'

"Themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-fzf-writer.nvim'

"TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

"gitgutter
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'

"JavaScript and TypeScript
"Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'leafgarland/typescript-vim'

"JSX Support
Plug 'maxmellon/vim-jsx-pretty'

"GraphQL
Plug 'jparise/vim-graphql'

"Rust
Plug 'rust-lang/rust.vim'

Plug 'wellle/context.vim'
Plug 'itchyny/lightline.vim'

Plug 'cespare/vim-toml'

Plug 'pantharshit00/vim-prisma'

Plug 'neovim/nvim-lspconfig'

Plug 'glepnir/lspsaga.nvim'

Plug 'nvim-lua/completion-nvim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

"---- Load Lua Files ----
lua require('lsp_config')
lua require('saga')
lua require('filetypes')
lua require('telescope_config')

"---- Load Files ----
source ~/.config/nvim/plugins/general.vim
source ~/.config/nvim/plugins/keymapping.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/neoformat.vim
source ~/.config/nvim/plugins/jedi.vim
source ~/.config/nvim/plugins/javascript.vim
source ~/.config/nvim/plugins/context.vim
source ~/.config/nvim/plugins/completion.rc.vim
source ~/.config/nvim/plugins/telescope.vim
