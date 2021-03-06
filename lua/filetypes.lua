local fmt = string.format
local filetype_configs = {
  { filename = "kotlin", value = 4 },
  { filename = "python", value = 4 },
  { filename = "rust", value = 4 },
  { filename = "toml", value = 4 },
  { filename = "java", value = 4 },
  { filename = "cpp", value = 2 },
  { filename = "c", value = 2 },
  { filename = "solidity", value = 2 },
  { filename = "html", value = 2 },
  { filename = "htmldjango", value = 2 },
  { filename = "css", value = 2 },
  { filename = "json", value = 2 },
  { filename = "yaml", value = 2 },
  { filename = "vim", value = 2 },
  { filename = "lua", value = 2 },
  { filename = "javascript", value = 2 },
  { filename = "javascriptreact", value = 2 },
  { filename = "typescript", value = 2 },
  { filename = "typescriptreact", value = 2 },
  { filename = "markdown", value = 4 },
  { filename = "elixir", value = 2 },
  { filename = "ocaml", value = 2 },
  { filename = "fish", value = 4 },
}
local fmt_settings = { "shiftwidth", "tabstop", "softtabstop" }

for _, config in ipairs(filetype_configs) do
  for _, setting in ipairs(fmt_settings) do
    vim.cmd(fmt("autocmd FileType %s set %s=%d", config.filename, setting, config.value))
  end
end

vim.cmd "au BufNewFile,BufRead *.mdx setfiletype markdown"
