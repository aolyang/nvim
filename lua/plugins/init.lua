local table_insert = require("core.utils.table_insert")

local plugins = {
    "nvim-lua/plenary.nvim",
    require("plugins.cmp"),
    require("plugins.comment"),
    require("plugins.gitsigns"),
    require("plugins.blankline"),
    require("plugins.lsp"),
    require("plugins.mason"),
    require("plugins.nvim-tree"),
    require("plugins.nvim-tree.web-dev-icons"),
    require("plugins.t00-telescope"),
    require("plugins.t10-treesitter"),
    require("plugins.w00-which-key")
}

local nvchad_plugins = require("plugins.nvchad")

table_insert(
    plugins,
    table.unpack(nvchad_plugins)
)

require("lua.plugins.lazy-nvim").setup(plugins)
