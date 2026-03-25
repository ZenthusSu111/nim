return {
    "mini.hipatterns",
    event = "DeferredUIEnter",
    after = function()
        require("mini.hipatterns").setup()
    end,
}
