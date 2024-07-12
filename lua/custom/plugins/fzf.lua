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
        previewers = {
          bat = {
            cmd = 'bat',
            args = '--color=always --style=numbers,changes',
            theme = 'ansi',
          },
        },
        grep = {
          prompt = 'Rg❯ ',
          input_prompt = 'Grep For❯ ',
          multiprocess = true, -- run command in a separate process
          git_icons = true, -- show git icons?
          file_icons = true, -- show file icons?
          color_icons = true, -- colorize file|git icons
          -- executed command priority is 'cmd' (if exists)
          -- otherwise auto-detect prioritizes `rg` over `grep`
          -- default options are controlled by 'rg|grep_opts'
          -- cmd            = "rg --vimgrep",
          grep_opts = '--binary-files=without-match --line-number --recursive --color=auto --perl-regexp -e',
          rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e',
          -- Uncomment to use the rg config file `$RIPGREP_CONFIG_PATH`
          -- RIPGREP_CONFIG_PATH = vim.env.RIPGREP_CONFIG_PATH
          --
          -- Set to 'true' to always parse globs in both 'grep' and 'live_grep'
          -- search strings will be split using the 'glob_separator' and translated
          -- to '--iglob=' arguments, requires 'rg'
          -- can still be used when 'false' by calling 'live_grep_glob' directly
          rg_glob = true, -- default to glob parsing?
          glob_flag = '--iglob', -- for case sensitive globs use '--glob'
          glob_separator = '%s%-%-', -- query separator pattern (lua): ' --'
          -- advanced usage: for custom argument parsing define
          -- 'rg_glob_fn' to return a pair:
          --   first returned argument is the new search query
          --   second returned argument are additional rg flags
          -- rg_glob_fn = function(query, opts)
          --   ...
          --   return new_query, flags
          -- end,
          --
          -- Enable with narrow term width, split results to multiple lines
          -- NOTE: multiline requires fzf >= v0.53 and is ignored otherwise
          -- multiline      = 1,      -- Display as: PATH:LINE:COL\nTEXT
          -- multiline      = 2,      -- Display as: PATH:LINE:COL\nTEXT\n
          no_header = false, -- hide grep|cwd header?
          no_header_i = false, -- hide interactive header?
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
