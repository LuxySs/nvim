local programming_ft = require("programming_ft")

local plugins = {
  {
    "rafamadriz/friendly-snippets",
    ft = programming_ft,
  },

  {
    "evesdropper/luasnip-latex-snippets.nvim",
    ft = { "tex" },
  },
}

return plugins
