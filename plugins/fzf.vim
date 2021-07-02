""Look for files
"map <leader>fi :Files<CR>

""Look for files in a git repo
"map <leader>fo :GFiles<CR>

""Fuzzy search
"map <leader>rg :Rg<CR>

"if has("nvim")
  "au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  "au FileType fzf tunmap <buffer> <Esc>
"endif

" Using lua functions
nnoremap <leader>fi <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>rg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

