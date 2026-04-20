return {
	{
		"mini.ai",
		auto_enable = true,
		event = "DeferredUIEnter",
		after = function(_)
			require("mini.ai").setup({})
		end,
	},
}
