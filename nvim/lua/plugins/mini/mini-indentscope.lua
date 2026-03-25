return {
    "mini.indentscope",
    event = "DeferredUIEnter",
    after = function()
        require("mini.indentscope").setup()
    end,
}
