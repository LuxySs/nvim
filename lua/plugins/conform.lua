local formatters = {
	lua = { "stylua" },
	python = { "isort", "ruff_format" },
	c = { "clang_format" },
	markdown = { "prettierd" },
	latex = { "latexindent" },
}

return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = formatters,
		},
	},
}
