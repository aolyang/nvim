local M = {
    "nvim-tree/nvim-web-devicons",
    opts = function()
        return { override = require("plugins.icons.file") }
    end,
    config = function(_, opts)
        dofile(vim.g.base46_cache .. "devicons")
        require("nvim-web-devicons").setup(opts)
    end,
}
return M
