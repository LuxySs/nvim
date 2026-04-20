return {
	"nvim-lint",
	auto_enable = true,
	-- cmd = { "" },
	event = "FileType",
	-- ft = "",
	-- keys = "",
	-- colorscheme = "",
	after = function(plugin)
		local lint = require("lint")

		lint.linters.checkstyle.args = { "-f", "sarif", "-c", vim.fn.getcwd() .. "/checkstyle.xml" }

		lint.linters_by_ft = {
			markdown = { "markdownlint" },
			python = { "ruff" },
			java = { "checkstyle" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				if vim.bo.modifiable then
					require("lint").try_lint()
				end
			end,
		})
	end,
}
