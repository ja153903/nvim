local fmt = string.format
local filetype_configs = {
  {filename = "python", value = 4},
  {filename = "rust", value = 4},
  {filename = "cpp", value = 2},
  {filename = "c", value = 2},
  {filename = "html", value = 2},
  {filename = "json", value = 2},
  {filename = "yaml", value = 2},
  {filename = "vim", value = 2},
  {filename = "lua", value = 2},
  {filename = "javascript", value = 2},
  {filename = "javascriptreact", value = 2},
  {filename = "typescript", value = 2},
  {filename = "typescriptreact", value = 2}
}
local fmt_settings = {"sw", "ts", "sts"}

for _, config in ipairs(filetype_configs) do
  for _, setting in ipairs(fmt_settings) do
    vim.cmd(fmt("autocmd FileType %s set %s=%d", config.filename, setting, config.value))
  end
end
