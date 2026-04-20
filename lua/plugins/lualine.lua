return {
	"lualine.nvim",
	auto_enable = true,
	-- cmd = { "" },
	event = "DeferredUIEnter",
	-- ft = "",
	-- keys = "",
	-- colorscheme = "",
	after = function(plugin)
		require("lualine").setup({})
	end,
}
