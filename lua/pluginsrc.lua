-- JavasScript Plugin
vim.g['javascript_plugin_jsdoc'] = 1

vim.cmd 'autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart'
vim.cmd 'autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear'

-- Context.vim
vim.g['context_nvim_no_redraw'] = 1
vim.g['context_enabled'] = 0

-- Jedi.vim
vim.g['jedi#completions_enabled'] = 0
vim.g['jedi#use_splits_not_buffers'] = 'right'

-- Neoformat
vim.g['neoformat_basic_format_align'] = 1
vim.g['neoformat_basic_format_retab'] = 1
vim.g['neoformat_basic_format_trim'] = 1

vim.cmd 'autocmd BufWritePre *.{js,ts,jsx,tsx} Neoformat'

-- LuaLine
require('lualine').setup{
	options = {theme = 'ayu_dark'},
	sections = { lualine_c = {{'filename', path = 2}} }
}
