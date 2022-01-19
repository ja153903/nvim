vim.cmd "autocmd BufEnter * :syntax sync fromstart"
vim.cmd "autocmd BufEnter * :syntax sync clear"

require("dapui").setup()

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

-- toggleterm
require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = "<number>", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = "float",
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = "curved",
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new { cmd = "lazygit", hidden = true }

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

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
