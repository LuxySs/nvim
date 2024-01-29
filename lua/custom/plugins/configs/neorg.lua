local options = {
  load = {
    ['core.defaults'] = {},
    ['core.concealer'] = {
      config = {
        folds = true,
        icon_preset = 'varied',
      },
    },
    ['core.summary'] = {},
    ['core.dirman'] = {
      config = {
        workspaces = {},
      },
    },
  },
}

require('neorg').setup(options)
