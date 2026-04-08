-- 避免nvim 退出aalcritty cursor回退到Beam外觀
vim.api.nvim_create_autocmd("ExitPre", {
	group = vim.api.nvim_create_augroup("Exit", { clear = true }),
	command = "set guicursor=a:ver90",
	desc = "Set cursor back to beam when leaving Neovim.",
})

-- 0.12 treesitter api
-- vim.api.nvim_create_autocmd("FileType", {
-- 	callback = function()
-- 		-- 檢查是否有對應的 parser 存在
-- 		if pcall(vim.treesitter.start) then
-- 			-- 成功啟動內建高亮
-- 		end
-- 	end,
-- })
