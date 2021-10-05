vim.cmd 'autocmd BufEnter * :syntax sync fromstart'
vim.cmd 'autocmd BufEnter * :syntax sync clear'

-- Context.vim
vim.g['context_nvim_no_redraw'] = 1
vim.g['context_enabled'] = 0

-- Neoformat
vim.g['neoformat_basic_format_align'] = 1
vim.g['neoformat_basic_format_retab'] = 1
vim.g['neoformat_basic_format_trim'] = 1

vim.cmd 'autocmd BufWritePre *.{js,ts,jsx,tsx} Neoformat'

-- LuaLine
require('lualine').setup{
	options = {theme = 'nightfox'},
	sections = { lualine_c = {{'filename', path = 2}} }
}

-- nvim-transparent
require('transparent').setup {
	enable = false
}

vim.opt.termguicolors = true
require('bufferline').setup {}

local nightfox = require('nightfox')
nightfox.setup {
		fox = "nordfox", -- change the colorscheme to use nordfox
		styles = {
			comments = "italic", -- change style of comments to be italic
			keywords = "bold", -- change style of keywords to be bold
			functions = "italic,bold" -- styles can be a comma separated list
		},
		transparent = true
}
nightfox.load()

require('dapui').setup()

require('nvim-treesitter.configs').setup({
	ensure_installed = {'python', 'lua', 'rust', 'javascript', 'typescript'},
	highlight = {
		enable = true
	}
})
