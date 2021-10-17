vim.cmd "autocmd BufEnter * :syntax sync fromstart"
vim.cmd "autocmd BufEnter * :syntax sync clear"

-- formatter.nvim
require("formatter").setup(
  {
    filetype = {
      rust = {
        -- Rustfmt
        function()
          return {
            exe = "rustfmt",
            args = {"--emit=stdout"},
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      cpp = {
        function()
          return {
            exe = "clang-format",
            stdin = true
          }
        end
      },
      c = {
        function()
          return {
            exe = "clang-format",
            stdin = true
          }
        end
      }
    }
  }
)

-- LuaLine
require("lualine").setup {
  --options = {theme = "nightfox"},
  options = { theme = "gruvbox"},
  sections = {lualine_c = {{"filename", path = 2}}}
}

-- nvim-transparent
require("transparent").setup {
  enable = false
}

require("bufferline").setup {
  options = {
    numbers = "both",
    diagnostics = "nvim_lsp",
    separator_style = "thick"
  }
}

--local nightfox = require("nightfox")
--nightfox.setup {
  --fox = "palefox", -- change the colorscheme to use nordfox
  --styles = {
    --comments = "italic", -- change style of comments to be italic
    --keywords = "bold", -- change style of keywords to be bold
    --functions = "italic,bold" -- styles can be a comma separated list
  --},
  --transparent = true
--}
--nightfox.load()

require("dapui").setup()

require("nvim-treesitter.configs").setup(
  {
    ensure_installed = {"python", "lua", "rust", "javascript", "typescript", "cpp", "c"},
    highlight = {
      enable = true
    }
  }
)

require("gitsigns").setup {
  signs = {
    add = {hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn"},
    change = {hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"},
    delete = {hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"},
    topdelete = {hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"},
    changedelete = {hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"}
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  keymaps = {
    -- Default keymap options
    noremap = true,
    ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns.actions".next_hunk()<CR>\''},
    ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns.actions".prev_hunk()<CR>\''},
    ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ["v <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ["v <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    ["n <leader>hS"] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
    ["n <leader>hU"] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',
    -- Text objects
    ["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000
  },
  current_line_blame_formatter_opts = {
    relative_time = false
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  }
}

-- nvim-treesitter-context
require "treesitter-context".setup {
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
      "method"
      -- 'for', -- These won't appear in the context
      -- 'while',
      -- 'if',
      -- 'switch',
      -- 'case',
    }
    -- Example for a specific filetype.
    -- If a pattern is missing, *open a PR* so everyone can benefit.
    --   rust = {
    --       'impl_item',
    --   },
  }
}

-- orgmode.nvim
require("orgmode").setup(
  {
    org_agenda_files = {"~/Documents/personal_projects/org/*"},
    org_default_notes_file = "~/Documents/personal_projects/org/refile.org"
  }
)

require("headlines").setup {
  markdown = {
    source_pattern_start = "^```",
    source_pattern_end = "^```$",
    dash_pattern = "^---+$",
    headline_pattern = "^#+",
    headline_signs = {"Headline"},
    codeblock_sign = "CodeBlock",
    dash_highlight = "Dash"
  },
  rmd = {
    source_pattern_start = "^```",
    source_pattern_end = "^```$",
    dash_pattern = "^---+$",
    headline_pattern = "^#+",
    headline_signs = {"Headline"},
    codeblock_sign = "CodeBlock",
    dash_highlight = "Dash"
  },
  vimwiki = {
    source_pattern_start = "^{{{%a+",
    source_pattern_end = "^}}}$",
    dash_pattern = "^---+$",
    headline_pattern = "^=+",
    headline_signs = {"Headline"},
    codeblock_sign = "CodeBlock",
    dash_highlight = "Dash"
  },
  org = {
    source_pattern_start = "#%+[bB][eE][gG][iI][nN]_[sS][rR][cC]",
    source_pattern_end = "#%+[eE][nN][dD]_[sS][rR][cC]",
    dash_pattern = "^-----+$",
    headline_pattern = "^%*+",
    headline_signs = {"Headline"},
    codeblock_sign = "CodeBlock",
    dash_highlight = "Dash"
  }
}
