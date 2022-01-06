local telescope = require "telescope"

telescope.setup {
  disable_devicons = false,
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/", "target/" }
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
      theme = "dropdown"
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown"
    },
    git_files = {
      theme = "dropdown"
    },
    grep_string = {
      theme = "dropdown"
    },
    live_grep = {
      theme = "dropdown"
    },
    file_browser = {
      theme = "dropdown"
    }
  }
}

telescope.load_extension "fzf"
telescope.load_extension "file_browser"
