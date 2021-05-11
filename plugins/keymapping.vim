"Set the leader character
let mapleader = " "

"Remap exit from insert mode
inoremap jj <Esc>

"Copy to clipboard
map <leader>cp :%y+<CR>

"Split screen horizontally
map <leader>h :sp<CR>

"Split screen vertically
map <leader>v :vsp<CR>

"Refresh init.vim
nnoremap <silent> <leader><leader> :source $MYVIMRC<CR>

"Tab navigation
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt

nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Alternatively use
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>

"Open netrw
map <leader>e :Explore<CR>
