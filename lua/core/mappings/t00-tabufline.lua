local M = {
    plugin = true,

    n = {
        -- cycle through buffers
        ["<tab>"] = {
            function()
                require("nvchad.tabufline").tabuflineNext()
            end,
            "Goto next buffer",
        },

        ["<S-tab>"] = {
            function()
                require("nvchad.tabufline").tabuflinePrev()
            end,
            "Goto prev buffer",
        },

        -- close buffer + hide terminal buffer
        ["<leader>x"] = {
            function()
                require("nvchad.tabufline").close_buffer()
            end,
            "Close buffer",
        },
    },
}
return M
