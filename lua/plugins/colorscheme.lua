return {
	{
		-- lze specs need a name
		"trigger_colorscheme",
		-- lazy loaded colorscheme.
		-- This means you will need to add the colorscheme you want to lze sometime before VimEnter is done
		event = "VimEnter",
		-- Also, lze can load more than just plugins.
		-- The default load field contains vim.cmd.packadd
		-- Here we override it to schedule when our colorscheme is loaded
		load = function(_name)
			vim.cmd.colorscheme(nixInfo("gruvbox", "settings", "colorscheme"))
		end,
	},
	{
		-- NOTE: view these names in the info plugin!
		-- :lua nixInfo.lze.debug.display(nixInfo.plugins)
		-- The display function is from lzextras
		"onedarkpro.nvim",
		auto_enable = true, -- <- auto enable is useful here
		colorscheme = { "onedark", "onedark_dark", "onedark_vivid", "onelight" },
		priority = 1000,
	},
	{
		"vim-moonfly-colors",
		auto_enable = true,
		colorscheme = "moonfly",
		priority = 1000,
	},
	{
		"gruvbox.nvim",
		auto_enable = true,
		colorscheme = "gruvbox",
		priority = 1000,
	},
	{
		"vague.nvim",
		auto_enable = true,
		colorscheme = "vague",
		priority = 1000,
	},
}
