return {
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- calling `setup` is optional for customization
      require('fzf-lua').setup {
        'max-perf',
        keymap = {
          fzf = {
            ['ctrl-q'] = 'select-all+accept',
          },
        },
        winopts = {
          fullscreen = true,
          preview = {
            horizontal = 'right:40%',
          },
        },
      }
    end,
    keys = {
      {
        '<leader>,',
        function()
          require('fzf-lua').buffers { fzf_opts = { ['--header-lines'] = 1 } }
        end,
        desc = 'Switch Buffer',
      },
      { '<leader>sg', '<cmd>FzfLua live_grep<CR>', desc = 'Live Grep' },
      { '<leader>:', '<cmd>FzfLua command_history<CR>', desc = 'Command History' },
      { '<leader>ff', '<cmd>FzfLua git_files<CR>', desc = 'Git files' },
      { '<leader><space>', '<cmd>FzfLua files<CR>', desc = 'find or fd on a path' },
      { '<leader>fr', '<cmd>FzfLua oldfiles<CR>', desc = 'Recent' },
      { '<leader>sh', '<cmd>FzfLua live_grep_resume<CR>', desc = 'Previous search' },
      { '<leader>t', '<cmd>FzfLua<CR>', desc = 'FzfLua' },
    },
  },
}
