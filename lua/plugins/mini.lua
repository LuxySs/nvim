return {
  {
    'mini.ai',
    auto_enable = true,
    lazy = false,
    after = function(_)
      require('mini.ai').setup({})
    end,
  },

  {
    'mini.surround',
    auto_enable = true,
    lazy = false,
    after = function(_)
      require('mini.surround').setup({})
    end,
  },

  {
    'mini.icons',
    auto_enable = true,
    dep_of = { 'oil.nvim' },
    after = function(_)
      require('mini.icons').setup({})
    end,
  },
}
