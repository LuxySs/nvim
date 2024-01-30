local programming_ft = require("programming_ft")

local plugins = {
	require("custom.plugins.snippets"),

	-- colorschemes plugin
	{ "RRethy/nvim-base16" },

	{ -- transparency plugin
		"xiyaowong/transparent.nvim",
		event = "VeryLazy",
	},

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
		opts = function()
			return require("custom.plugins.configs.nvim-tree")
		end,
		config = function(_, opts)
			require("nvim-tree").setup(opts)
		end,
	},

	{ -- notes taking / scientific report
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
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
	-- 	"tpope/vim-sleuth",
	-- },

	-- Other plugins
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
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		ft = { "tex", "markdown", unpack(programming_ft) },
		config = function()
			require("custom.plugins.configs.ufo")
		end,
	},

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

	{
		"NvChad/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = function()
			require("colorizer").setup()
		end,
	},

	{ -- multi-line editing
		"mg979/vim-visual-multi",
		event = "VeryLazy",
	},
}

return plugins
