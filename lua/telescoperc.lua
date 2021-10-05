local telescope = require("telescope")

telescope.setup {
  disable_devicons = false,
  defaults = {
    file_ignore_patterns = {"node_modules", ".git/"}
  }
}
