local servers = require('plugins.config.lsp.servers')

vim.lsp.enable(servers)

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true
})
