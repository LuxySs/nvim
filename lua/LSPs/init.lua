return {
  {
    'nvim-lspconfig',
    auto_enable = true,
    -- NOTE: define a function for lsp,
    -- and it will run for all specs with type(plugin.lsp) == table
    -- when their filetype trigger loads them
    lsp = function(plugin)
      vim.lsp.config(plugin.name, plugin.lsp or {})
      vim.lsp.enable(plugin.name)
    end,
    -- set up our on_attach function once before the spec loads
    before = function(_)
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = require('LSPs.on_attach'),
      })
    end,
  },
  {
    'nixd',
    enabled = nixInfo.isNix,
    for_cat = 'nix',
    lsp = {
      filetypes = { 'nix' },
      settings = {
        nixd = {
          nixpkgs = {
            expr = [[import <nixpkgs> {}]],
          },
          options = {},
          formatting = {
            command = { 'nixfmt' },
          },
          diagnostic = {
            suppress = {
              'sema-escaping-with',
            },
          },
        },
      },
    },
  },
  {
    'clangd',
    for_cat = { 'C' },
    lsp = {},
  },
  {
    'neocmake',
    for_cat = { 'C' },
    lsp = {},
  },
  {
    'texlab',
    for_cat = { 'latex' },
    lsp = {},
  },
  {
    'bashls',
    for_cat = { 'bash' },
    lsp = {},
  },
  {
    'lua_ls',
    for_cat = 'lua',
    lsp = {
      settings = {
        Lua = {
          signatureHelp = { enabled = true },
          diagnostics = {
            globals = { 'nixInfo', 'vim' },
            disable = { 'missing-fields' },
          },
        },
      },
    },
  },
  {
    'marksman',
    for_cat = 'markdown',
    lsp = {},
  },
  {
    'tinymist',
    for_cat = 'typst',
    lsp = {},
  },
  {
    'jdtls',
    for_cat = 'java',
    lsp = {},
  },
  {
    'ocamllsp',
    for_cat = 'ocaml',
    lsp = {},
  },
  {
    'pyright',
    for_cat = 'python',
    lsp = {},
  },
  {
    'qmlls',
    for_cat = 'qml',
    lsp = {},
  },
}
