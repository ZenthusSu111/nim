return {
	"fzf-lua",
	cmd = "FzfLua",
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find File",
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").files()
			end,
			desc = "live grep current project",
		},
	},
}
