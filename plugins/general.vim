"Set line numbers
set number

"Set background
"set background=dark

"Set termguicolors
"set termguicolors

"Enable syntax
syntax enable

"Enable splitright and splitbelow
set splitright
set splitbelow

"Set colorscheme
"let ayucolor="dark"
"colorscheme dracula
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme spaceduck


set laststatus=2

"These two lines make sure that the background is transparent
"hi Normal guibg=NONE ctermbg=NONE
"autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

highlight clear SignColumn

set relativenumber
set rnu

set noswapfile
