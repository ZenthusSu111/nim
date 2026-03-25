return {
    "mini.surround",
    event = "DeferredUIEnter",
    after = function()
        require("mini.surround").setup()
    end,
}
