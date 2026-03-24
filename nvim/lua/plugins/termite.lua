return {
  "termite.nvim",
  after = function()
    require("termite").setup({
	position = "bottom",
	shell = "bash --login",
    })
  end
}
