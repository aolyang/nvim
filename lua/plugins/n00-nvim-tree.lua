local vim = require("vim")

local M = {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function()
        require("core.utils").load_mappings("nvimtree")
    end,
    opts = function()
        return require "plugins.configs.nvimtree"
    end,
    config = function(_, opts)
        dofile(vim.g.base46_cache .. "nvimtree")
        require("nvim-tree").setup(opts)
    end,

    -- icons
    web_dev_icons = {
        "nvim-tree/nvim-web-devicons",
        opts = function()
            return { override = require("nvchad.icons.devicons") }
        end,
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "devicons")
            require("nvim-web-devicons").setup(opts)
        end,
    }
}

return M
