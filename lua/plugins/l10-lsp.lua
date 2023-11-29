local M = {
    "neovim/nvim-lspconfig",
    init = function()
        require("core.utils").lazy_load("nvim-lspconfig")
    end,
    config = function()
        require("plugins.l11-lsp-cfg")
    end,
}

return M
