return {
  'markview.nvim',
  auto_enable = true,
  lazy = false,
  after = function(_)
    require('markview').setup({
      preview = {
        icon_provider = 'devicons', -- "internal", mini" or "devicons"
      },
    })
  end,
}
