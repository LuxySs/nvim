return {
  'oil.nvim',
  auto_enable = true,
  lazy = false,

  after = function()
    vim.keymap.set('n', '-', '<cmd>Oil<CR>', { noremap = true, desc = 'Open Parent Directory' })
    vim.keymap.set('n', '<leader>-', '<cmd>Oil .<CR>', { noremap = true, desc = 'Open nvim root directory' })

    require('oil').setup({})
  end,
}
