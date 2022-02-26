local telescope = require "telescope"
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/", "target/" },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "ignore_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    file_browser = {
      theme = "ivy",
      disable_devicons = false,
      mappings = {
        ["i"] = {
          ["<C-i>"] = fb_actions.create,
          ["<C-r>"] = fb_actions.rename,
          ["<C-d>"] = fb_actions.remove,
          ["<C-o>"] = fb_actions.move,
        },
      },
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
      disable_devicons = false,
    },
    git_files = {
      theme = "ivy",
      disable_devicons = false,
    },
    grep_string = {
      theme = "ivy",
      disable_devicons = false,
    },
    live_grep = {
      theme = "ivy",
      disable_devicons = false,
    },
    file_browser = {
      theme = "ivy",
      disable_devicons = false,
    },
  },
}

telescope.load_extension "fzf"
telescope.load_extension "file_browser"
