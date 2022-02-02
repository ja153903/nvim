local ts_and_js_formatter_config = {
  function()
    return {
      exe = "prettier",
      args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
      stdin = true,
    }
  end,
}

local c_family_formatter_config = {
  function()
    return {
      exe = "clang-format",
      stdin = true,
    }
  end,
}

-- formatter.nvim
require("formatter").setup {
  filetype = {
    python = {
      function()
        return {
          exe = "black",
          stdin = false,
        }
      end,
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = { "--emit=stdout" },
          stdin = true,
        }
      end,
    },
    lua = {
      -- luafmt
      function()
        return {
          exe = "luafmt",
          args = { "--indent-count", 2, "--stdin" },
          stdin = true,
        }
      end,
    },
    cpp = c_family_formatter_config,
    c = c_family_formatter_config,
    javascript = ts_and_js_formatter_config,
    typescript = ts_and_js_formatter_config,
    javascriptreact = ts_and_js_formatter_config,
    typescriptreact = ts_and_js_formatter_config,
    json = ts_and_js_formatter_config,
    css = ts_and_js_formatter_config,
    html = ts_and_js_formatter_config
  },
}
