return {
	"Futarimiti/spooky.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	opts = {
		directory = vim.fn.stdpath("config") .. "/templates",
		case_sensitive = false,
		auto_use_only = true,
		ui = {
			select = "telescope",
		},
	},
}
