let b:ale_fixers = {'javascript': ['prettier', 'eslint'], 'typescript': ['prettier', 'eslint'], 'javascriptreact': ['prettier', 'eslint'], 'typescriptreact': ['prettier', 'eslint']}

let b:ale_linters = {'python': ['pyright'], 'javascript': ['eslint'], 'typescript': ['eslint'], 'javascriptreact': ['eslint'], 'typescriptreact': ['eslint']}

" VirtualTextを有効にする
let g:ale_virtualtext_cursor = 1
" prefixの文字列
let g:ale_virtualtext_prefix = " [] "

let g:ale_sign_error = ">>"
let g:ale_sign_warning = "--"

let g:ale_fix_on_save = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
