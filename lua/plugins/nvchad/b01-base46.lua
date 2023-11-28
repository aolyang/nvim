local M = {
    "NvChad/base46",
    branch = "v2.0",
    build = function()
        require("base46").load_all_highlights()
    end
}

return M
