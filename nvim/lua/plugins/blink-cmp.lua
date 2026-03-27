return {
	{
		"blink.cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		after = function()
			require("blink.cmp").setup({
				cmdline = {
					enabled = true,
					keymap = {
						preset = "inherit",
						["<Tab>"] = { "show", "fallback" },
					},
					completion = { menu = { auto_show = true } },
				},
				completion = {
					menu = {
						draw = {
							columns = {
								{ "kind_icon" }, -- 圖示
								{ "label", "label_description", gap = 1 }, -- 插入內容
								{ "source_name" }, --來源 (lsp, buffer, ...)
								{ "kind" }, -- 屬性  (function, property, ...)
							},
							components = {
								kind_icon = {
									text = function(ctx)
										if ctx.source_name ~= "Path" then
											return require("lspkind").symbol_map[ctx.kind] or "" .. ctx.icon_gap
										end

										local is_unknown_type = vim.tbl_contains(
											{ "link", "socket", "fifo", "char", "block", "unknown" },
											ctx.item.data.type
										)
										local mini_icon, _ = require("mini.icons").get(
											is_unknown_type and "os" or ctx.item.data.type,
											is_unknown_type and "" or ctx.label
										)

										return (mini_icon or ctx.kind_icon) .. ctx.icon_gap
									end,

									highlight = function(ctx)
										if ctx.source_name ~= "Path" then
											return ctx.kind_hl
										end

										local is_unknown_type = vim.tbl_contains(
											{ "link", "socket", "fifo", "char", "block", "unknown" },
											ctx.item.data.type
										)
										local mini_icon, mini_hl = require("mini.icons").get(
											is_unknown_type and "os" or ctx.item.data.type,
											is_unknown_type and "" or ctx.label
										)
										return mini_icon ~= nil and mini_hl or ctx.kind_hl
									end,
								},
								label = {
									text = function(ctx)
										return require("colorful-menu").blink_components_text(ctx)
									end,
									highlight = function(ctx)
										return require("colorful-menu").blink_components_highlight(ctx)
									end,
								},
							},
						},
					},
				},
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
					per_filetype = {
						lua = { inherit_defaults = true, "lazydev" },
					},
					providers = {
						lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", fallbacks = { "lsp" } },
					},
				},
			})
		end,
	},
	{
		"lspkind.nvim",
		lazy = true,
		dep_of = "blink.cmp",
		after = function()
			require("lspkind").init()
		end,
	},
	{
		"colorful-menu.nvim",
		lazy = true,
		dep_of = "blink.cmp",
		after = function()
			require("colorful-menu").setup()
		end,
	},
	{
		"friendly-snippets",
		lazy = true,
		dep_of = "blink.cmp",
	},
}
