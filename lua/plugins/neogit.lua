return {
  {
    'plenary.nvim',
    dep_of = { 'neogit' },
  },
  {
    'diffview.nvim',
    auto_enable = true,
    dep_of = { 'neogit' },
    event = 'DeferredUIEnter',
  },
  {
    'neogit',
    auto_enable = true,
    cmd = 'Neogit',
    keys = {
      { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Show Neogit UI' },
    },
  },
}
