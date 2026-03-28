return {
	"avante.nvim",
	event = "DeferredUIEnter",
	after = function()
		require("avante").setup({
			provider = "gemini",
			providers = {
				gemini = {
					api_key_name = "GEMINI_API_KEY",
					model = "gemini-2.5-flash",
				},
			},
		})
	end,
}
