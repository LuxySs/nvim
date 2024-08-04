--[[ Note: if this plugin ain't working, check that you've installed
     the treesitter grammar for the language ]]

return {
	"jmbuhr/otter.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
	},
	ft = { "nix", "markdown" },
	config = function()
		local otter = require("otter")
		otter.activate({ "bash", "c", "cpp", "javascript", "lua", "python", "rust" }, true, true, nil)
	end,
}
