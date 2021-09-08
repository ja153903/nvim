"Sometimes syntax highlighting can get out of sync
"We can do this to help with this
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let g:javascript_plugin_jsdoc = 1
