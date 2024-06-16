return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = function()
      local colors = require('cyberdream.colors').default
      local cyberdream = require 'lualine.themes.cyberdream'
      local copilot_colors = {
        [''] = { fg = colors.grey, bg = colors.none },
        ['Normal'] = { fg = colors.grey, bg = colors.none },
        ['Warning'] = { fg = colors.red, bg = colors.none },
        ['InProgress'] = { fg = colors.yellow, bg = colors.none },
      }
      return {
        options = {
          component_separators = { left = ' ', right = ' ' },
          section_separators = { left = ' ', right = ' ' },
          theme = cyberdream.get_theme,
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
              color = function()
                if not package.loaded['copilot'] then
                  return
                end
                local status = require('copilot.api').status.data
                return copilot_colors[status.status] or copilot_colors['']
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
              color = { fg = colors.cyan, bg = colors.none },
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
  },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('cyberdream').setup {
        -- Enable transparent background
        transparent = true,
        -- Enable italics comments
        italic_comments = false,
        -- Replace all fillchars with ' ' for the ultimate clean look
        hide_fillchars = false,
        -- Modern borderless telescope theme
        borderless_telescope = true,
        -- Set terminal colors used in `:terminal`
        terminal_colors = true,
        theme = {
          variant = 'default', -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
          highlights = {
            -- Highlight groups to override, adding new groups is also possible
            -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values
            -- Example:
            Comment = { fg = '#696969', bg = 'NONE', italic = true },
            -- Complete list can be found in `lua/cyberdream/theme.lua`
          },
          -- Override a color entirely
          colors = {
            -- For a list of colors see `lua/cyberdream/colours.lua`
            -- Example:
            bg = '#00141A',
            -- green = '#00ff00',
            -- magenta = '#ff00ff',
          },
        },
      }
      vim.cmd.colorscheme 'cyberdream'
    end,
  },
}
