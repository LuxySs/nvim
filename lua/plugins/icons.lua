return {
  'nvim-web-devicons',
  auto_enable = true,
  dep_of = { 'oil.nvim', 'lualine.nvim', 'markview.nvim', 'snacks.nvim', 'which-key.nvim' },
  after = function(_)
    require('nvim-web-devicons').setup({})
  end,
}
