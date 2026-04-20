return {
  {
    "clangd",
    for_cat = { "C" },
    lsp = {}
  },
  {
    -- name of the lsp
    "lua_ls",
    for_cat = "lua",
    -- provide a table containing filetypes,
    -- and then whatever your functions defined in the function type specs expect.
    -- in our case, it just expects the normal lspconfig setup options,
    -- but with a default on_attach and capabilities
    lsp = {
      -- if you provide the filetypes it doesn't ask lspconfig for the filetypes
      -- (meaning it doesn't call the callback function we defined in the main init.lua)
      filetypes = { 'lua' },
      settings = {
        Lua = {
          signatureHelp = { enabled = true },
          diagnostics = {
            globals = { "nixInfo", "vim", },
            disable = { 'missing-fields' },
          },
        },
      },
    },
    -- also these are regular specs and you can use before and after and all the other normal fields
  },
  {
    "nixd",
    enabled = nixInfo.isNix,
    for_cat = "nix",
    lsp = {
      filetypes = { "nix" },
      settings = {
        nixd = {
          nixpkgs = {
            expr = [[import <nixpkgs> {}]],
          },
          options = {
          },
          formatting = {
            command = { "nixfmt" }
          },
          diagnostic = {
            suppress = {
              "sema-escaping-with"
            }
          }
        }
      },
    },
  },

  { import = "plugins.snacks", },
  { import = "plugins.whichkey", },
  { import = "plugins.lsp-config", },
  { import = "plugins.lazydev", },
  { import = "plugins.treesitter", },
  { import = "plugins.lint", },
  { import = "plugins.completion", },
  { import = "plugins.surround", },
  { import = "plugins.format", },
  { import = "plugins.gitsigns", },
  { import = "plugins.lualine", },
  { import = "plugins.fidget", },
}
