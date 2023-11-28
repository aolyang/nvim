local vim = require("vim")

local M = {
    "neovim/nvim-lspconfig",
    init = function()
        require("core.utils").lazy_load("nvim-lspconfig")
    end,
    config = function()
        -- TODO configs
        require("plugins.configs.lspconfig")
    end,
}

return M
