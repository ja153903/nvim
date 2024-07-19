return {
  {
    'folke/tokyonight.nvim',
    -- lazy = false,
    -- priority = 1000,
    enabled = false,
    opts = {
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = false },
        keywords = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
      },
    },
    init = function()
      -- vim.cmd.colorscheme 'tokyonight-storm'
    end,
  },
}
