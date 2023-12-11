local table_insert = require("core.utils.table_insert")

local plugins = {
    "nvim-lua/plenary.nvim",
    require("plugins.cmp"),
    require("plugins.comment"),
    require("plugins.flash"),
    require("plugins.gitsigns"),
    require("plugins.indent-blankline"),
    require("plugins.lsp"),
    require("plugins.mason"),
    require("plugins.nvim-tree"),
    require("plugins.icons"),
    require("plugins.telescope"),
    require("plugins.treesitter"),
    require("plugins.which-key")
}

local nvchad_plugins = require("plugins.nvchad")

table_insert(
    plugins,
    table.unpack(nvchad_plugins)
)

require("plugins.nvdash").lazy_load()
require("plugins.tabufline").lazy_load()

require("plugins.lazy-nvim").setup(plugins)

local new_cmd = vim.api.nvim_create_user_command
local config = require("core.utils").load_config().ui

-- cmds
new_cmd("Nvdash", function()
    if vim.g.nvdash_displayed then
        require("plugins.tabufline.utils").close_buffer()
    else
        require("plugins.nvdash.utils").open()
    end
end, {})

-- command to toggle cheatsheet
new_cmd("NvCheatsheet", function()
    if vim.g.nvcheatsheet_displayed then
      require("plugins.tabufline.utils").close_buffer()
    else
      require("plugins.cheatsheet." .. config.cheatsheet.theme)()
    end
  end, {})