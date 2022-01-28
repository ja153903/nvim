local set = vim.opt

set.number = true
set.splitright = true
set.splitbelow = true
set.laststatus = 2
set.relativenumber = true
set.rnu = true
set.mouse = "n"
set.swapfile = false
set.expandtab = true
set.autoindent = true
set.termguicolors = true
set.background = "dark"

vim.cmd "syntax enable"
vim.cmd "highlight clear SignColumn"

vim.cmd "autocmd FileType netrw setl bufhidden=delete"

local trigger_transparency = function()
  vim.cmd [[
    augroup user_colors
      autocmd!
      autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
    augroup END
  ]]
end

trigger_transparency()

vim.cmd "colorscheme melange"
