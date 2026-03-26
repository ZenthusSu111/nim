return {
	"termite.nvim",
	event = "DeferredUIEnter",
	after = function()
		require("termite").setup({
			position = "bottom",
			shell = "zsh --login",
		})
	end,
}
