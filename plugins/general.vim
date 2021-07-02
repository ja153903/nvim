"Set line numbers
set number


"Set termguicolors
"set termguicolors

"Enable syntax
syntax enable

"Enable splitright and splitbelow
set splitright
set splitbelow

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
"Set colorscheme
"let ayucolor="dark"
"colorscheme iceberg
"let g:seoul256_background = 234
colo cobalt2

"Set background
set background=dark

set laststatus=2

"These two lines make sure that the background is transparent
"hi Normal guibg=NONE ctermbg=NONE
"autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

highlight clear SignColumn

set relativenumber
set rnu

set noswapfile
