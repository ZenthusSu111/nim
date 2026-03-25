return {
    "mini.cursorword",
    event = "DeferredUIEnter",
    after = function()
        require("mini.cursorword").setup()
    end,
}
