local M = {}

M.echo = function(str)
    vim.cmd("redraw")
    vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

M.shell = function(args)
    local output = vim.fn.system(args)
    assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
end

M.is_windows = function()
    return vim.loop.os_uname().sysname == "Windows_NT"
end

return M
