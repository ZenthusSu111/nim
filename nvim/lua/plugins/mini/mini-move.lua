return {
    "mini.move",
    keys = {
        {
            "<M-h>",
            mode = { "n", "v" },
        },
        {
            "<M-l>",
            mode = { "n", "v" },
        },
        {
            "<M-j>",
            mode = { "n", "v" },
        },
        {
            "<M-k>",
            mode = { "n", "v" },
        },
    },
    after = function()
        require("mini.move").setup({
            mappings = {
                left = "<M-h>",
                right = "<M-l>",
                down = "<M-j>",
                up = "<M-k>",

                -- Move current line in Normal mode
                line_left = "<M-h>",
                line_right = "<M-l>",
                line_down = "<M-j>",
                line_up = "<M-k>",
            }
        })
    end,
}
