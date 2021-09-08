local telescope = require('telescope')

telescope.setup {
  extensions={
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case"
    },
		fzf_writer = {
			minimum_grep_characters = 3
		}
  }
}

telescope.load_extension('fzf')
telescope.load_extension('fzf_writer')
