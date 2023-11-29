local M = {}

M.echo = function(str)
    vim.cmd("redraw")
    vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

M.shell_call = function(args)
    local output = fn.system(args)
    assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
end


M.load_config = function()
    return require("core.user-options")
end

M.load_mappings = require("core.utils.load_mappings")

M.lazy_load = require("core.utils.lazy_load")

return M
