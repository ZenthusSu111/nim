return {

	{
		"direnv.nvim",
		after = function()
			require("direnv").setup({
				autoload_direnv = true,
				statusline = {
					enabled = true,
				},
				notifications = {
					silet_autoload = false, -- 開啟通知
				},
			})
		end,
	},
}

