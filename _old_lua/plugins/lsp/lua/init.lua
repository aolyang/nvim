local M = {
    setup = function ()
        local lsp = require("plugins.lsp.module")

        require("lspconfig").lua_ls.setup({
            on_attach = lsp.on_attach,
            capabilities = lsp.capabilities,

            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                            [vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types"] = true,
                            [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
                        },
                        maxPreload = 100000,
                        ereloadFileSize = 10000,
                    },
                    format = {
                        enable = true,
                    }
                },
            },
        })
    end
}
return M
