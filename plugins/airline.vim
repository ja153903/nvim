" Displays all buffers when there's only one tab open
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1

"let g:airline_theme = "solarized"
"
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'colorscheme': 'nord'
      \ }
