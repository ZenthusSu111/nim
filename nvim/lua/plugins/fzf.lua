return {
    "fzf-lua",
    cmd = "FzfLua",
    keys = {
        {
            "<leader>ff",
            function()
                require("fzf-lua").files()
            end,
            desc = "Find File"
        },
    },
}
