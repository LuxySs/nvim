return {
  'nvim-web-devicons',
  auto_enable = true,
  dep_of = { 'oil.nvim' },
  after = function(_)
    require('nvim-web-devicons').setup({})
  end,
}
