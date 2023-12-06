local M = {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    init = function()
        print("loading mappings whichkey")
        require("core.utils").load_mappings("whichkey")
    end,
    cmd = "WhichKey",
    config = function(_, opts)
        dofile(vim.g.base46_cache .. "whichkey")
        require("which-key").setup(opts)
    end,
}

return M
