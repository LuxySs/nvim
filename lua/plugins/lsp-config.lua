return {
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
      callback = function(event)
        local bufnr = event.buf

        local map = function(keys, func, desc, mode)
          if desc then
            desc = 'LSP: ' .. desc
          end
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
        end

        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client and client:supports_method('textDocument/inlayHint') then
          map('<leader>th', function()
            local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
            vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })
  end,
}
