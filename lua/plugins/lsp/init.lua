local M = {
    "neovim/nvim-lspconfig",
    init = function()
        require("core.utils").lazy_load("nvim-lspconfig")
    end,
    config = function()
        local LspM = require("plugins.lsp.module")

        require("plugins.lsp.setup")
        require("plugins.lsp.setup-lua")

        -- remmember mason ensure installed
        local languages = {
            -- frontend
            "html",
            "cssls",
            "tsserver",
            "angularls",
            "tailwindcss",

            -- rust & c/c++
            "rust_analyzer",
            "clangd",
        }
        for _, lsp in ipairs(languages) do
            require("lspconfig")[lsp].setup({
                on_attach = LspM.on_attach,
                capabilities = LspM.capabilities,
            })
        end
    end,
}

return M
