local programming_ft = { "python", "c", "cpp", "rust", "lua" }

local plugins = {
	require("custom.plugins.colorschemes"),

	{
		"numToStr/Comment.nvim",
		ft = programming_ft,
		opts = require("custom.plugins.configs.comment"),
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- don't remove this otherwise it won't work
	},

	{ -- indentation guide
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		-- opts = require("custom.plugins.configs.indent-blankline"),
	},

	{ -- terminal
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm" },
		opts = {}, -- don't remove this otherwise it won't work
	},

	{ -- Menu / Greeter
		"goolord/alpha-nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("custom.plugins.configs.alpha")
		end,
	},

	{ -- File browser
		"stevearc/oil.nvim",
		event = "VeryLazy",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("custom.plugins.configs.oil")
		end,
	},

	{ -- file managing , picker etc
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local opts = require("custom.plugins.configs.nvim-tree")
			require("nvim-tree").setup(opts)
		end,
	},

	{ -- notes taking / scientific report
		{
			"iamcco/markdown-preview.nvim",
			ft = { "markdown" },
			build = function()
				vim.fn["mkdp#util#install"]()
			end,
		},

		{
			"nvim-neorg/neorg",
			ft = { "norg" },
			run = ":Neorg sync-parsers", -- This is the important bit!
			config = function()
				require("custom.plugins.configs.neorg")
			end,
		},

		{ -- latex
			{
				"lervag/vimtex",
				ft = { "tex" },
				init = function() end,
			},
			{
				"evesdropper/luasnip-latex-snippets.nvim",
				ft = { "tex" },
			},
		},
	},

	-- { -- Detect tabstop and shiftwidth automatically
	--	"tpope/vim-sleuth",
	-- },

	-- Other plugins
	{
		"max397574/better-escape.nvim", -- escape insert mod with jj without having delay
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"hedyhli/outline.nvim",
		ft = programming_ft,
		cmd = { "Outline", "OutlineOpen" },
		opts = {}, -- don't remove this otherwise it doesn't work
	},

	{ -- Better looking interface to type commands
		"folke/noice.nvim",
		-- this line might look stupid but error occurs if you remove it
		enabled = true,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("noice").setup()
		end,
	},

	{
		"NvChad/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = function()
			require("colorizer").setup()
		end,
	},
}

return plugins
