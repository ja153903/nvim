return {
  {
    'Verf/deepwhite.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('deepwhite').setup {
        -- If you have some anti-blue light setting (f.lux, light bulb, or low blue light mode monitor),
        -- turn it on, this will set the background color to a cooler color to prevent the background from being too warm.
        low_blue_light = true,
      }
      vim.cmd.colorscheme 'deepwhite'
    end,
  },
}
