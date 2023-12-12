local M = {
    plugin = true,

    t = {
        -- toggle in terminal mode
        ["<A-i>"] = {
            function()
                require("plugins.nvterm-p.terminal").toggle "float"
            end,
            "Toggle floating term",
        },

        ["<A-h>"] = {
            function()
                require("plugins.nvterm-p.terminal").toggle "horizontal"
            end,
            "Toggle horizontal term",
        },

        ["<A-v>"] = {
            function()
                require("plugins.nvterm-p.terminal").toggle "vertical"
            end,
            "Toggle vertical term",
        },
    },

    n = {
        -- toggle in normal mode
        ["<A-i>"] = {
            function()
                require("plugins.nvterm-p.terminal").toggle "float"
            end,
            "Toggle floating term",
        },

        ["<A-h>"] = {
            function()
                require("plugins.nvterm-p.terminal").toggle "horizontal"
            end,
            "Toggle horizontal term",
        },

        ["<A-v>"] = {
            function()
                require("plugins.nvterm-p.terminal").toggle "vertical"
            end,
            "Toggle vertical term",
        },

        -- new
        ["<leader>h"] = {
            function()
                require("plugins.nvterm-p.terminal").new "horizontal"
            end,
            "New horizontal term",
        },

        ["<leader>v"] = {
            function()
                require("plugins.nvterm-p.terminal").new "vertical"
            end,
            "New vertical term",
        },
    }
}

return M
