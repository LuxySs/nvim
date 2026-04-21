return {
	"todo-comments.nvim",
	auto_enable = true,
	event = "DeferredUIEnter",
	after = function(_)
		require("todo-comments").setup({ signs = false })
	end,
}
