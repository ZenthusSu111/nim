return {
	"mini.jump2d",
	keys = {
		{
			"<M-m>",
			function()
				require("mini.jump2d").start()
			end,
		},
	},
	after = function()
		require("mini.jump2d").setup({
			mappings = {
				start_jumping = "",
			},
		})
	end,
}
