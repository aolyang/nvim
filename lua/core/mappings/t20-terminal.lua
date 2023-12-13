local M = {
    plugin = true,

    t = {
        -- toggle in terminal mode
        ["<A-i>"] = {
            function()
                require("plugins.terminal.api").toggle "float"
            end,
            "Toggle floating term",
        },

        ["<A-h>"] = {
            function()
                require("plugins.terminal.api").toggle "horizontal"
            end,
            "Toggle horizontal term",
        },

        ["<A-v>"] = {
            function()
                require("plugins.terminal.api").toggle "vertical"
            end,
            "Toggle vertical term",
        },
    },

    n = {
        -- toggle in normal mode
        ["<A-i>"] = {
            function()
                require("plugins.terminal.api").toggle "float"
            end,
            "Toggle floating term",
        },

        ["<A-h>"] = {
            function()
                require("plugins.terminal.api").toggle "horizontal"
            end,
            "Toggle horizontal term",
        },

        ["<A-v>"] = {
            function()
                require("plugins.terminal.api").toggle "vertical"
            end,
            "Toggle vertical term",
        },

        -- new
        ["<leader>h"] = {
            function()
                require("plugins.terminal.api").new "horizontal"
            end,
            "New horizontal term",
        },

        ["<leader>v"] = {
            function()
                require("plugins.terminal.api").new "vertical"
            end,
            "New vertical term",
        },
    }
}

return M
