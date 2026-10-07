return {
  'nvim-lint',
  auto_enable = true,
  -- cmd = { "" },
  event = 'FileType',
  -- ft = "",
  -- keys = "",
  -- colorscheme = "",
  after = function(plugin)
    local lint = require('lint')

    lint.linters_by_ft = {
      python = { 'ruff' },
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        if vim.bo.modifiable then
          require('lint').try_lint()
        end
      end,
    })
  end,
}
