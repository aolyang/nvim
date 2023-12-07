local M = {
    "neovim/nvim-lspconfig",
    init = function()
        require("core.utils").lazy_load("nvim-lspconfig")
    end,
    config = function()
        require("plugins.lsp.setup")
        require("plugins.lsp.lua_ls.setup")
    end,
}

return M
