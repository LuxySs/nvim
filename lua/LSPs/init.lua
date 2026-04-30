return {
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
}
