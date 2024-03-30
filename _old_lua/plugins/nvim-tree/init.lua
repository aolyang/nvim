local M = {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function()
        require("core.utils").load_mappings("nvimtree")
    end,
    opts = function()
        return require("plugins.nvim-tree.config")
    end,
    config = function(_, opts)
        dofile(vim.g.base46_cache .. "nvimtree")
        require("nvim-tree").setup(opts)
    end
}

return M
