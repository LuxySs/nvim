return {
  'which-key.nvim',
  auto_enable = true,
  -- cmd = { "" },
  event = 'DeferredUIEnter',
  -- ft = "",
  -- keys = "",
  -- colorscheme = "",
  after = function(plugin)
    require('which-key').setup({})
  end,
}
