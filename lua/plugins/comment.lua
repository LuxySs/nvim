return {
  'comment.nvim',
  auto_enable = true,
  event = 'DeferredUIEnter',

  after = function(_)
    require('Comment').setup()
  end,
}
