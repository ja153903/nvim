return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'SmiteshP/nvim-navic' },
  event = 'VeryLazy',
  opts = function()
    local colors = require('cyberdream.colors').default
    return {
      options = {
        component_separators = { left = ' ', right = ' ' },
        section_separators = { left = ' ', right = ' ' },
        -- theme = cyberdream.get_theme,
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
            color = { fg = colors.grey, bg = colors.none },
          },
        },
        lualine_x = {
          {
            require('lazy.status').updates,
            cond = require('lazy.status').has_updates,
            color = { fg = colors.green },
          },
          {
            function()
              local icon = ' '
              local status = require('copilot.api').status.data
              return icon .. (status.message or '')
            end,
            cond = function()
              local ok, clients = pcall(vim.lsp.get_clients, { name = 'copilot', bufnr = 0 })
              return ok and #clients > 0
            end,
          },
          { 'diff' },
        },
        lualine_y = {
          {
            'progress',
          },
          {
            'location',
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
