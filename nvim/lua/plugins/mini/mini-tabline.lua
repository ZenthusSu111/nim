return {
    "mini.tabline",
    event = "BufReadPre",
    after = function()
        require("mini.tabline").setup()
    end,
}
