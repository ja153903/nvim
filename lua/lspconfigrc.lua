local nvim_lsp = require("lspconfig")

local util = require("lspconfig/util")

local path = util.path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({"*", ".*"}) do
    local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
    if match ~= "" then
      return path.join(path.dirname(match), "bin", "python")
    end
  end

  -- Fallback to system Python.
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Mappings.
  local opts = {noremap = true, silent = true}

  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<leader>sd", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local lsp_capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local default_lsp_config = {
  on_attach = on_attach,
  capabilities = lsp_capabilities,
  flags = {
    debounce_text_changes = 150
  }
}

nvim_lsp.tsserver.setup{
  on_attach = on_attach,
  capabilities = lsp_capabilities,
  root_dir = nvim_lsp.util.root_pattern("package.json")
}

nvim_lsp.denols.setup {
  on_attach = on_attach,
  capabilities = lsp_capabilities,
  root_dir = nvim_lsp.util.root_pattern("deno.json"),
  init_options = {
    lint = true,
  }
}

nvim_lsp.gopls.setup(default_lsp_config)

-- these paths are machine-dependent
local pyright_extra_paths = {
  "/Users/jaimeabbariao/Documents/bentobox/repos/bentobox/bentobox",
  "/Users/jaimeabbariao/Documents/bentobox/repos/bentobox/bentobox/apps"
}

nvim_lsp.pyright.setup {
  on_attach = on_attach,
  capabilities = lsp_capabilities,
  flags = {
    debounce_text_changes = 150
  },
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(config.root_dir)
  end,
  autostart = true,
  root_dir = function(fname)
    return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
      util.path.dirname(fname)
  end,
  settings = {
    python = {
      analysis = {
        extraPaths = pyright_extra_paths,
        typeCheckingMode = "off",
        useLibraryCodeForTypes = true,
      }
    }
  }
}

local rust_tools = require("rust-tools")
rust_tools.setup(
  {
    server = {
      on_attach = on_attach,
      capabilities = lsp_capabilities,
      flags = {
        debounce_text_changes = 150
      },
      root_dir = nvim_lsp.util.root_pattern(".git"),
      settings = {
        ["rust-analyzer"] = {
          assist = {
            importGranularity = "module",
            importPrefix = "by_self"
          },
          cargo = {
            loadOutDirsFromCheck = true
          },
          procMacro = {
            enable = true
          }
        }
      }
    }
  }
)

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_binary = vim.fn.exepath("lua-language-server")
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary, ":h:h:h")

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require "lspconfig".sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim"}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true)
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false
      }
    }
  }
}

--nvim_lsp.ccls.setup(default_lsp_config)
--nvim_lsp.solang.setup(default_lsp_config)

nvim_lsp.graphql.setup{}
nvim_lsp.prismals.setup{}
