return function(event)
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
end
