" Displays all buffers when there's only one tab open
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
"
let g:shades_of_purple_airline = 1

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'colorscheme': 'shades_of_purple'
      \ }
