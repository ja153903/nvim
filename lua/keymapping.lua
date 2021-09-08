local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

vim.g.mapleader = " "

map('i', 'jj', '<Esc>', opts)

vim.cmd 'map <leader>cp :%y+<CR>'
vim.cmd 'map <leader>h :sp<cr>'
vim.cmd 'map <leader>v :vsp<CR>'

-- Tab Management
map('n', '<leader>1', '1gt', opts)
map('n', '<leader>2', '2gt', opts)
map('n', '<leader>3', '3gt', opts)
map('n', '<leader>4', '4gt', opts)
map('n', '<leader>5', '5gt', opts)

map('n', 'tl', ':tabprev<CR>', opts)
map('n', 'tt', ':tabedit<Space>', opts)
map('n', 'tm', ':tabm<Space>', opts)
map('n', 'td', ':tabclose<CR>', opts)
map('n', 'th', ':tabnext<CR>', opts)
map('n', 'tn', ':tabnew<CR>', opts)

-- Tree Exploration
map('n', '<leader>rt', ':Explore<CR>', opts)

-- LspSaga
map('n', 'gh', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
map('n', '<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
map('v', '<leader>ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)
map('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
map('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
map('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
map('n', 'gs', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
map('n', 'gr', "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
map('n', 'gp', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
map('n', '<leader>cd', "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opts)
map('n', '[e', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
map('n', ']e', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)
map('n', '<leader>tt', ":Lspsaga open_floaterm<CR>", opts)
map('t', '<leader>tk' , "<C-\\><C-n>:Lspsaga close_floaterm<CR>", opts)

-- Telescope
vim.cmd 'nnoremap <leader>fi <cmd>Telescope find_files<cr>'
vim.cmd 'nnoremap <leader>rg <cmd>Telescope fzf_writer staged_grep<cr>'
vim.cmd 'nnoremap <leader>fb <cmd>Telescope buffers<cr>'
vim.cmd 'nnoremap <leader>fh <cmd>Telescope help_tags<cr>'
