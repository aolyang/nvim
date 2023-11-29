local M = {}

M.load_config = function()
    return require("core.user-options")
end

M.load_mappings = require("core.utils.load_mappings")

M.lazy_load = require("core.utils.lazy_load")

return M
