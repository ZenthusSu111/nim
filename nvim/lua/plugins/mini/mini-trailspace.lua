return {
    "mini.trailspace",
    event = "QuitPre",
    after = function()
        require("mini.tabline").setup()
    end,
}
