return {
	{
		"lazydev.nvim",
		ft = "lua",
		dep_of = { "blink.cmp" },
		after = function()
			require("lazydev").setup({
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			})
		end,
	},
	{
		"rustaceanvim",
		lazy = false,
	},
}
