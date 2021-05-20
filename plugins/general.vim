"Set line numbers
set number

"Set background
"set background=dark

"Set termguicolors
set termguicolors

"Enable syntax
syntax enable

"Enable splitright and splitbelow
set splitright
set splitbelow

"Set colorscheme
"let ayucolor="dark"
colorscheme shades_of_purple
set laststatus=2

"These two lines make sure that the background is transparent
hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

highlight clear SignColumn

set relativenumber
set rnu

set noswapfile
