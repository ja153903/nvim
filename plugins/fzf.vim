"Look for files
map <leader>fi :Files<CR>

"Look for files in a git repo
map <leader>fo :GFiles<CR>

"Fuzzy search
map <leader>rg :Rg<CR>

if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
endif
