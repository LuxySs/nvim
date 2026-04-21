return {
  'vimtex',
  auto_enable = true,
  lazy = false, -- we don't want to lazy load VimTeX
  after = function()
    vim.g.vimtex_mappings_disable = { ['n'] = { 'K' } } -- disable `K` as it conflicts with LSP hover
    vim.g.vimtex_view_method = nixInfo('zathura', 'info', 'pdfViewer')
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_latexmk = {
      out_dir = 'build',
    }
  end,
}
