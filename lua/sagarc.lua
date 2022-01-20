local saga = require "lspsaga"
local saga_opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- lsp provider to find the cursor word definition and reference
map("n", "<leader>gh", ":Lspsaga lsp_finder<CR>", saga_opts)

-- code action
map("n", "<leader>ca", ":Lspsaga code_action<CR>", saga_opts)
map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", saga_opts)

-- hover doc
map("n", "K", ":Lspsaga hover_doc<CR>", saga_opts)

-- scroll down hover doc or scroll in definition preview
map("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", saga_opts)
map("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", saga_opts)

-- show signature help
map("n", "<leader>gs", ":Lspsaga signature_help<CR>", saga_opts)

-- Rename
map("n", "<leader>rn", ":Lspsaga rename<CR>", saga_opts)

-- preview definition
map("n", "gd", ":Lspsaga preview_definition<CR>", saga_opts)

-- jump diagnostics
map("n", "<leader>sd", ":Lspsaga show_line_diagnostics<CR>", saga_opts)

-- float terminal
map("n", "<leader>th", ":Lspsaga open_floaterm<CR>", saga_opts)
map("t", "<leader>th", "<C-\\><C-n>:Lspsaga close_floaterm<CR>", saga_opts)

saga.init_lsp_saga()
