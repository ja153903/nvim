vim.cmd "autocmd BufEnter * :syntax sync fromstart"
vim.cmd "autocmd BufEnter * :syntax sync clear"
require("nvim-treesitter.configs").setup {
  context_commentstring = { enable = true },
  ensure_installed = {
    "python",
    "javascript",
    "rust",
    "lua",
    "html",
    "css",
    "typescript",
    "tsx",
    "html",
    "json",
    "css",
    "scss",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = false },
}

-- nvim-treesitter-context
require("treesitter-context").setup {
  enable = false, -- Enable this plugin (Can be enabled/disabled later via commands)
  throttle = true, -- Throttles plugin updates (may improve performance)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  patterns = {
    -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    -- For all filetypes
    -- Note that setting an entry here replaces all other patterns for this entry.
    -- By setting the 'default' entry below, you can control which nodes you want to
    -- appear in the context window.
    default = {
      "class",
      "function",
      "method",
      -- 'for', -- These won't appear in the context
      -- 'while',
      -- 'if',
      -- 'switch',
      -- 'case',
    },
    -- Example for a specific filetype.
    -- If a pattern is missing, *open a PR* so everyone can benefit.
    --   rust = {
    --       'impl_item',
    --   },
  },
}

require("headlines").setup {
  markdown = {
    source_pattern_start = "^```",
    source_pattern_end = "^```$",
    dash_pattern = "^---+$",
    headline_pattern = "^#+",
    headline_signs = { "Headline" },
    codeblock_sign = "CodeBlock",
    dash_highlight = "Dash",
  },
  rmd = {
    source_pattern_start = "^```",
    source_pattern_end = "^```$",
    dash_pattern = "^---+$",
    headline_pattern = "^#+",
    headline_signs = { "Headline" },
    codeblock_sign = "CodeBlock",
    dash_highlight = "Dash",
  },
  vimwiki = {
    source_pattern_start = "^{{{%a+",
    source_pattern_end = "^}}}$",
    dash_pattern = "^---+$",
    headline_pattern = "^=+",
    headline_signs = { "Headline" },
    codeblock_sign = "CodeBlock",
    dash_highlight = "Dash",
  },
  org = {
    source_pattern_start = "#%+[bB][eE][gG][iI][nN]_[sS][rR][cC]",
    source_pattern_end = "#%+[eE][nN][dD]_[sS][rR][cC]",
    dash_pattern = "^-----+$",
    headline_pattern = "^%*+",
    headline_signs = { "Headline" },
    codeblock_sign = "CodeBlock",
    dash_highlight = "Dash",
  },
}

local lsp_installer = require "nvim-lsp-installer"

lsp_installer.settings {
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
}

lsp_installer.on_server_ready(function(server)
  local opts = {}

  -- (optional) Customize the options passed to the server
  -- if server.name == "tsserver" then
  --     opts.root_dir = function() ... end
  -- end

  -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)

-- glow
vim.g.glow_binary_path = vim.env.HOME .. "/bin"


-- dashboard-nvim
vim.g.dashboard_default_executive = "telescope"
vim.cmd [[
  let g:dashboard_custom_shortcut = {
  \ "last_session"        : "SPC f s",
  \ "find_history"        : "SPC f h",
  \ "find_file"           : "SPC f i",
  \ "new_file"            : "SPC f n",
  \ "change_colorscheme"  : "SPC t c",
  \ "find_word"           : "SPC r g",
  \ "book_marks"          : "SPC b m",
  \ }
]]
vim.cmd [[
let g:dashboard_custom_header = [
\'',
\'⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⡿⠿⢿⣿⣿⣿⣿⣿⣿',
\'⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠛⠉⠉⠉⠙⠻⣅⠀⠈⢧⠀⠈⠛⠉⠉⢻⣿⣿',
\'⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⣤⡶⠟⠀⠀⣈⠓⢤⣶⡶⠿⠛⠻⣿',
\'⣿⣿⣿⣿⣿⢣⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣀⣴⠶⠿⠿⢷⡄⠀⠀⢀⣤⣾⣿',
\'⣿⣿⣿⣿⣡⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣦⣤⣤⡀⠀⢷⡀⠀⠀⣻⣿⣿',
\'⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡈⠛⠶⠛⠃⠈⠈⢿⣿⣿',
\'⣿⣿⠟⠘⠀⠀⠀⠀⠀⠀⠀⠀⢀⡆⠀⠀⠀⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀⠈⣿⣿',
\'⣿⠏⠀⠁⠀⠀⠀⠀⠀⠀⠀⢀⣶⡄⠀⠀⠀⠀⠀⠀⣡⣄⣿⡆⠀⠀⠀⠀⣿⣿',
\'⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⠛⠛⢛⣲⣶⣿⣷⣉⠉⢉⣥⡄⠀⠀⠀⠨⣿⣿',
\'⡇⢠⡆⠀⠀⢰⠀⠀⠀⠀⢸⣿⣧⣠⣿⣿⣿⣿⣿⣿⣷⣾⣿⡅⠀⠀⡄⠠⢸⣿',
\'⣧⠸⣇⠀⠀⠘⣤⡀⠀⠀⠘⣿⣿⣿⣿⣿⠟⠛⠻⣿⣿⣿⡿⢁⠀⠀⢰⠀⢸⣿',
\'⣿⣷⣽⣦⠀⠀⠙⢷⡀⠀⠀⠙⠻⠿⢿⣷⣾⣿⣶⠾⢟⣥⣾⣿⣧⠀⠂⢀⣿⣿',
\'⣿⣿⣿⣿⣷⣆⣠⣤⣤⣤⣀⣀⡀⠀⠒⢻⣶⣾⣿⣿⣿⣿⣿⣿⣿⢀⣀⣾⣿⣿',
\'',
\]
]]

require("nvim-autopairs").setup {}

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  filetype_exclude = { "dashboard" },
}

require("todo-comments").setup {}

require("nvim-tree").setup {}

vim.cmd [[
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
]]
