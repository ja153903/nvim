vim.cmd [[
	inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

	set completeopt=menuone,noinsert,noselect

	set shortmess+=c

	imap <silent> <c-p> <Plug>(completion_trigger)

	imap <tab> <Plug>(completion_smart_tab)
	imap <s-tab> <Plug>(completion_smart_s_tab)
]]

vim.g["completion_enable_snippet"] = "UltiSnips"
vim.g["UltiSnipsExpandTrigger"] = "<c-x><c-o>"
vim.g["UltiSnipsJumpForwardTrigger"] = "<c-b>"
vim.g["UltiSnipsJumpBackwardTrigger"] = "<c-z>"
