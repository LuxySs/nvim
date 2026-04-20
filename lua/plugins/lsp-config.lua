return {
	"nvim-lspconfig",
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
		vim.lsp.config("*", {
			on_attach = function(_, bufnr)
				-- Create a command `:Format` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
					vim.lsp.buf.format()
				end, { desc = "Format current buffer with LSP" })
			end,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client:supports_method("textDocument/inlayHint", event.buf) then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})
	end,
}
