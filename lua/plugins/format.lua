return {
	"conform.nvim",
	auto_enable = true,
	-- cmd = { "" },
	-- event = "",
	-- ft = "",
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "[f]ormat file",
		},
	},

	after = function(plugin)
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				nix = { "nixfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				cmake = { "cmake_format" },
				python = { "ruff_format" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				java = { "spotless_maven" },
			},

			format_on_save = function(bufnr)
				-- Disable autoformat on certain languages that don't
				-- have a well standardized coding style (c, cpp, ...).
				local disable_lsp_fallback_filetypes = { c = true, cpp = true, java = true }
				if disable_lsp_fallback_filetypes[vim.bo[bufnr].filetype] then
					return
				end

				-- Disable autoformat with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end

				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end,
		})
	end,
}
