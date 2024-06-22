return {
  {
    'NTBBloodbath/doom-one.nvim',
    -- lazy = false,
    -- priority = 1000,
    enabled = false,
    config = function()
      -- Add color to cursor
      vim.g.doom_one_cursor_coloring = false
      -- Set :terminal colors
      vim.g.doom_one_terminal_colors = true
      -- Enable TS support
      vim.g.doom_one_enable_treesitter = true
      -- Color whole diagnostic text or only underline
      vim.g.doom_one_diagnostics_text_color = false

      -- Plugins integration
      vim.g.doom_one_plugin_telescope = false
      vim.g.doom_one_plugin_startify = true
      vim.g.doom_one_plugin_whichkey = true
      vim.g.doom_one_plugin_indent_blankline = true
      vim.g.doom_one_plugin_vim_illuminate = true

      vim.cmd.colorscheme 'doom-one'
    end,
  },
}
