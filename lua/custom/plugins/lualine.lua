return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'SmiteshP/nvim-navic' },
  event = 'VeryLazy',
  opts = function()
    return {
      options = {
        theme = 'solarized_dark',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
        disabled_filetypes = { statusline = { 'dashboard', 'alpha' } },
      },
      sections = {
        lualine_a = { { 'mode', icon = '' } },
        lualine_b = { { 'branch', icon = '' } },
        lualine_c = {
          {
            'diagnostics',
            symbols = {
              error = ' ',
              warn = ' ',
              info = ' ',
              hint = '󰝶 ',
            },
          },
          { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
          {
            'filename',
            symbols = { modified = '  ', readonly = '', unnamed = '' },
          },
          {
            function()
              return require('nvim-navic').get_location()
            end,
            cond = function()
              return package.loaded['nvim-navic'] and require('nvim-navic').is_available()
            end,
          },
        },
        lualine_x = {
          {
            require('lazy.status').updates,
            cond = require('lazy.status').has_updates,
          },
          { 'diff' },
        },
        lualine_y = {
          {
            'progress',
          },
        },
        lualine_z = {
          function()
            return '  ' .. os.date '%X' .. ' 🚀 '
          end,
        },
      },

      extensions = { 'lazy', 'toggleterm', 'mason', 'neo-tree', 'trouble' },
    }
  end,
}
