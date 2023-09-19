require("mason").setup({
    ui = {
        icons = {
            package_installed = "√",
            package_pending = "→",
            package_unstalled = "U+0078"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls"
    }
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"}
            }
        }
    }
})
