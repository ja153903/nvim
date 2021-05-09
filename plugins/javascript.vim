"Sometimes syntax highlighting can get out of sync
"We can do this to help with this
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

"Javascript spacing
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2

"Typescript spacing
autocmd FileType typescript set sw=2
autocmd FileType typescript set ts=2
autocmd FileType typescript set sts=2

"JSX spacing
autocmd FileType javascriptreact set sw=2
autocmd FileType javascriptreact set ts=2
autocmd FileType javascriptreact set sts=2

"TSX spacing
autocmd FileType typescriptreact set sw=2
autocmd FileType typescriptreact set ts=2
autocmd FileType typescriptreact set sts=2

"Vue spacing
autocmd FileType vue set sw=2
autocmd FileType vue set ts=2
autocmd FileType vue set sts=2
