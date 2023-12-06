local table_insert = require("core.utils.table_insert")

local plugins = {
    "nvim-lua/plenary.nvim",
    require("plugins.cmp"),
    require("plugins.comment"),
    require("plugins.g00-gitsigns"),
    require("plugins.i00-indent-blankline"),
    require("plugins.l10-lsp"),
    require("plugins.m00-mason"),
    require("plugins.n00-nvim-tree"),
    require("plugins.n00-nvim-tree").web_dev_icons,
    require("plugins.t00-telescope"),
    require("plugins.t10-treesitter"),
    require("plugins.w00-which-key")
}

local nvchad_plugins = require("plugins.nvchad")

table_insert(
    plugins,
    table.unpack(nvchad_plugins)
)

require("plugins.l00-lazy-nvim").setup(plugins)
