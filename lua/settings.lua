local set = vim.opt

set.number = true
set.splitright = true
set.splitbelow = true
set.laststatus = 2
set.relativenumber = true
set.rnu = true
set.mouse = "a"
set.swapfile = false
set.expandtab = true
set.autoindent = true
set.termguicolors = true
set.background = "dark"

vim.g.tokyonight_italic_keywords = false
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
vim.cmd "colorscheme tokyonight"

vim.cmd "syntax enable"
vim.cmd "highlight clear SignColumn"

vim.cmd "autocmd FileType netrw setl bufhidden=delete"
