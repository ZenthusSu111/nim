return {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less", "html", "json", "jsonc" },
	init_options = {
		provideFormatter = true,
		embeddedLanguages = { css = true, javascript = true },
		configurationSection = { "html", "css", "javascript" },
	}, -- needed to enable formatting capabilities
	root_markers = { "package.json", ".git" },
	---@type lspconfig.settings.cssls
	settings = {
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true },
	},
}
