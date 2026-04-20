return {
	{
		"mini.ai",
		auto_enable = true,
    lazy = false;
		after = function(_)
			require("mini.ai").setup({})
		end,
	},

	{
		"mini.surround",
		auto_enable = true,
    lazy = false;
		after = function(_)
			require("mini.surround").setup({})
		end,
	},
}
