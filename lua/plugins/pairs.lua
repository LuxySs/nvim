return {
	"blink.pairs",
	auto_enable = true,
	event = "DeferredUIEnter",
	after = function(_)
		require("blink.pairs").setup({})
	end,
}
