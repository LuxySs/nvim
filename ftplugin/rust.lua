-- LspAttach autocommand for setting up LSP keymaps and usercommands.
vim.api.nvim_create_autocmd('LspAttach', {
  callback = require('LSPs.on_attach'),
})
