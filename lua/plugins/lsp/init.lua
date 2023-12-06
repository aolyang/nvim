local M = {
    "neovim/nvim-lspconfig",
    init = function()
        require("core.utils").lazy_load("nvim-lspconfig")
    end,
    config = function()
        require("plugins.lsp.config")
    end,
}

return M
