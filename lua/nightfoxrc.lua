local nightfox = require "nightfox"

nightfox.setup {
  fox = "nightfox",
  styles = {
    comments = "italic", -- change style of comments to be italic
    keywords = "bold", -- change style of keywords to be bold
    functions = "bold", -- styles can be a comma separated list
  },
  transparent = true,
}

nightfox.load()
