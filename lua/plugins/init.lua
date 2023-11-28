local table_insert = require("core.utils.table_insert")

local plugins = {
    "nvim-lua/plenary.nvim",
    require("plugins.c00-cmp"),
    require("plugins.g00-gitsigns"),
    require("plugins.i00-indent-blankline"),
    require("plugins.l00-lsp"),
    require("plugins.m00-mason"),
    require("plugins.n00-nvim-tree"),
    require("plugins.n00-nvim-tree").web_dev_icons,
    require("plugins.t00-telescope"),
    require("plugins.t10-treesitter"),
    require("plugins.w00-which-key")
}

table_insert(
    plugins,
    table.unpack(require("plugins.nvchad"))
)

require("lazy").setup(plugins)
