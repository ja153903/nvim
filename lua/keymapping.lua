local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

vim.g.mapleader = " "

map("i", "jk", "<Esc>", opts)

vim.cmd "map <leader>cp :%y+<CR>"
vim.cmd "map <leader>h :sp<cr>"
vim.cmd "map <leader>v :vsp<CR>"

map("n", "<leader>e", ":Explore<CR>", opts)

-- reload nvim
map("n", "<leader>gg", ":luafile $MYVIMRC<cr>", opts)

-- Telescope
map("n", "<leader>fi", '<cmd>lua require("telescope.builtin").find_files({ hidden = true })<cr>', opts)
map("n", "<leader>rg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>br", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope file_browser<cr>", opts)

-- Netrw
map("n", "<silent> gx", ":!open <cWORD><cr>", {})

-- toggleterm
--map("n", "<leader>th", ":ToggleTerm<CR>", opts)
--map("t", "<leader>th", "<C-\\><C-n>:ToggleTerm<CR>", opts)

-- bufferline.nvim
map("n", "<leader>1", ":BufferLinePick<CR>", opts)

-- dapui
map("n", "<leader>dpo", '<cmd>lua require("dapui").open()', opts)
map("n", "<leader>dpc", '<cmd>lua require("dapui").close()', opts)
map("n", "<leader>dpt", '<cmd>lua require("dapui").toggle()', opts)

-- formatter.nvim
map("n", "<leader>ff", ":Format<CR>", opts)

-- glow
map("n", "<leader>vp", ":Glow<CR>", opts)

-- packer
map("n", "<leader>pku", ":PackerUpdate<CR>", opts)
map("n", "<leader>pki", ":PackerInstall<CR>", opts)
map("n", "<leader>pks", ":PackerSync<CR>", opts)
