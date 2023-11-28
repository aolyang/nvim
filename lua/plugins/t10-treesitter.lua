local vim = require("vim")

local M = {
    "nvim-treesitter/nvim-treesitter",
    init = function()
        require("core.utils").lazy_load("nvim-treesitter")
    end,
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
        -- TODO: configs treesitter
        return require("plugins.configs.treesitter")
    end,
    config = function(_, opts)
        dofile(vim.g.base46_cache .. "syntax")
        require("nvim-treesitter.configs").setup(opts)
    end,
}

return M
