local programming_ft = require("programming_ft")

return {
	"hedyhli/outline.nvim",
	ft = { "tex", "md", unpack(programming_ft) },
	cmd = { "Outline", "OutlineOpen" },
	opts = {}, -- don't remove this otherwise it doesn't work
}
