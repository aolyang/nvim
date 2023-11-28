local vim = require("vim")

local M = {
    "lukas-reineke/indent-blankline.nvim",
    version = "2.20.7",
    init = function()
        require("core.utils").lazy_load("indent-blankline.nvim")
    end,
    opts = function()
        -- TODO configs
        return require("plugins.configs.others").blankline
    end,
    config = function(_, opts)
        require("core.utils").load_mappings("blankline")
        dofile(vim.g.base46_cache .. "blankline")
        require("indent_blankline").setup(opts)
    end,
}

return M