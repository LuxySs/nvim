return {
	"nvim-highlight-colors",
	auto_enable = true,
	event = "DeferredUIEnter",
	after = function(_)
		require("nvim-highlight-colors").setup({})
	end,
}
