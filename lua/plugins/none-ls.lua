return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- lua
        null_ls.builtins.formatting.stylua,
        -- python
        null_ls.builtins.formatting.ruff_format,
        null_ls.builtins.diagnostics.ruff,
        -- c++
        null_ls.builtins.formatting.clang_format,
        -- mardkown
        null_ls.builtins.formatting.prettierd,
        --latex
        null_ls.builtins.formatting.latexindent,
        null_ls.builtins.diagnostics.chktex,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
