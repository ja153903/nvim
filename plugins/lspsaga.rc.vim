lua << EOF
local saga = require('lspsaga')
saga.init_lsp_saga()
EOF

nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent> gr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> gp <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
nnoremap <silent><leader>tt :Lspsaga open_floaterm<CR>
tnoremap <silent><leader>tk <C-\><C-n>:Lspsaga close_floaterm<CR>
