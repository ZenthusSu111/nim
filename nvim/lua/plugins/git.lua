return {
	{
		"neogit",
		lazy = true,
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
		},
	},
	{
		"codediff.nvim",
		dep_of = { "neogit" },
		cmd = "CodeDiff",
		after = function()
			require("codediff").setup()
		end,
	},
}
