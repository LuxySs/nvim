-- [[ Install `lazy.nvim` plugin manager ]]
require("lazy-bootstrap")

-- [[ Configure plugins ]]
require("pluginslist")

-- [[ Setting options ]]
require("options")

-- [[ Basic Keymaps ]]
require("keymaps")

-- [[ Configure Telescope ]]
-- (fuzzy finder)
require("telescope-setup")

-- [[ Configure Treesitter ]]
-- (syntax parser for highlighting)
require("treesitter-setup")

-- [[ Configure LSP ]]
-- (Language Server Protocol)
require("lsp-setup")

-- [[ Configure nvim-cmp ]]
-- (completion)
require("cmp-setup")
