local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local options = {
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
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
}

return options
