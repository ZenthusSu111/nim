return {
    {
        "blink.cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        after = function()
            require("blink.cmp").setup({
                cmdline = {
                    enabled = true,
                    keymap = {
                        preset = "inherit",
                        ["<Tab>"] = { "show", "fallback" },
                    },
                    completion = { menu = { auto_show = true } },
                },
                completion = {
                    menu = {
                        draw = {
                            columns = {
                                { "kind_icon", },                               -- sign
                                { "label",      "label_description", gap = 1 }, -- suggestion
                                { "source_name" },
                                { "kind", }                                     --attribute
                            },
                            components = {
                                kind_icon = {
                                    text = function(ctx)
                                        local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                        return kind_icon
                                    end,
                                    -- (optional) use highlights from mini.icons
                                    highlight = function(ctx)
                                        local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                        return hl
                                    end,
                                },
                                kind = {
                                    -- (optional) use highlights from mini.icons
                                    highlight = function(ctx)
                                        local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                        return hl
                                    end,
                                },
                            },
                        },
                    },
                },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                    per_filetype = {
                        lua = { inherit_defaults = true, "lazydev", },
                    },
                    providers = {
                        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", fallbacks = { "lsp" } },
                    },
                },
            })
        end,
    },
    {
        "lspkind.nvim",
        lazy = true,
        dep_of = "blink.cmp",
        after = function()
            require("lspkind").init()
        end,
    },
    {
        "colorful-menu.nvim",
        lazy = true,
        dep_of = "blink.cmp",
        after = function()
            require("colorful-menu").setup()
        end,
    },
    {
        "friendly-snippets",
        lazy = true,
        dep_of = "blink.cmp"
    }
}
