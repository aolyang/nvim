local M = {
    plugin = true,

    n = {
        -- cycle through buffers
        ["<tab>"] = {
            function()
                require("plugins.tabufline.utils").tabuflineNext()
            end,
            "Goto next buffer",
        },

        ["<S-tab>"] = {
            function()
                require("plugins.tabufline.utils").tabuflinePrev()
            end,
            "Goto prev buffer",
        },

        -- close buffer + hide terminal buffer
        ["<leader>x"] = {
            function()
                require("plugins.tabufline.utils").close_buffer()
            end,
            "Close buffer",
        },
    },
}
return M
