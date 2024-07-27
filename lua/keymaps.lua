-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

local map = vim.keymap.set

-- works weirdly (not basic hjkl resizing)
map("n", "<M-h>", "<c-w>5<")
map("n", "<M-l>", "<c-w>5>")
map("n", "<M-k>", "<c-w>+")
map("n", "<M-j>", "<c-w>-")

-- File browser & tree (oil & Neotree)
map("n", "-", ":Oil<CR>")
map("n", "=", ":NvimTreeToggle<CR>")

-- compile latex / markdown
map("n", "<leader>ll", function()
	-- Get the current filetype
	local filetype = vim.bo.filetype
	if filetype == "tex" then
		vim.cmd("VimtexCompile")
	elseif filetype == "markdown" then
		vim.cmd("MarkdownPreviewToggle")
	else
		vim.cmd("echo 'File not compilable'")
	end
end)
