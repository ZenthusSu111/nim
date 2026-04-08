return {
	"neocodeium",
	event = "DeferredUIEnter",
	after = function()
		local neocodeium = require("neocodeium")
		neocodeium.setup()
		vim.keymap.set("i", "<A-f>", neocodeium.accept)
	end,
}
