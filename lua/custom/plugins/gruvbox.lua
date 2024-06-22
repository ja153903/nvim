return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = true,
    opts = {
      transparent_mode = true,
      contrast = '',
    },
    init = function()
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
}
