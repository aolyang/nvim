local table_insert = require("core.utils.table_insert")

local plugins = {
    "nvim-lua/plenary.nvim",
    require("plugins.nvim-tree")
}

table_insert(
    plugins,
    table.unpack(require("plugins.nvchad"))
)

require("lazy").setup(plugins)
