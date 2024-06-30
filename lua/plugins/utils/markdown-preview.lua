-- install without yarn or npm
return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },

	-- I dont use this because I installed the package with nix and nix-ld
	-- build = function()
	-- 	vim.fn["mkdp#util#install"]()
	-- end,
}

-- -- install with yarn or npm
-- return {
-- 	"iamcco/markdown-preview.nvim",
-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
-- 	build = "cd app && yarn install",
-- 	init = function()
-- 		vim.g.mkdp_filetypes = { "markdown" }
-- 	end,
-- 	ft = { "markdown" },
-- }
