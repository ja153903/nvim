local map = vim.api.nvim_set_keymap
local opts = { noremap = true }
local fmt = string.format

vim.g.mapleader = " "

map('i', 'jj', '<Esc>', opts)

vim.cmd 'map <leader>cp :%y+<CR>'
vim.cmd 'map <leader>h :sp<cr>'
vim.cmd 'map <leader>v :vsp<CR>'

vim.cmd 'nnoremap <leader>sv :source $MYVIMRC<CR>'

-- Tab Management
map('n', 'tl', ':tabprev<CR>', opts)
map('n', 'tt', ':tabedit<Space>', opts)
map('n', 'tm', ':tabm<Space>', opts)
map('n', 'td', ':tabclose<CR>', opts)
map('n', 'th', ':tabnext<CR>', opts)
map('n', 'tn', ':tabnew<CR>', opts)

-- Tree Exploration
map('n', '<leader>e', ':Explore<CR>', opts)

-- LspSaga
map('n', 'gh', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
map('n', '<leader>we', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
map('v', '<leader>we', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)
map('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
map('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
map('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
map('n', 'gs', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
map('n', 'gr', "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
map('n', 'gp', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
map('n', '<leader>sd', "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opts)
map('n', '[e', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
map('n', ']e', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)

-- Telescope
map('n', '<leader>fi', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>rg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>br', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope file_browser<cr>', opts)

-- Netrw
map('n', '<silent> gx', ':!open <cWORD><cr>', {})

-- Floaterm
map('n', '<leader>tt', ":FloatermNew<CR>", opts)
map('t', '<leader>tt', "<C-\\><C-n>:FloatermNew<CR>", opts)
map('n', '<leader>th', ':FloatermToggle<CR>', opts)
map('t', '<leader>th', '<C-\\><C-n>:FloatermToggle<CR>', opts)
map('t', '<leader>tk', '<C-\\><C-n>:FloatermKill<CR>', opts)
map('t', '<leader>tn', "<C-\\><C-n>:FloatermNext<CR>", opts)
map('t', '<leader>tp', "<C-\\><C-n>:FloatermPrev<CR>", opts)

-- barbar.nvim
map('n', '<leader>1', ':BufferLineCycleNext<CR>', opts)
map('n', '<leader>2', ':BufferLineCyclePrev<CR>', opts)

-- Closing buffers
map('n', 'bd', ':bd<cr>', opts)
