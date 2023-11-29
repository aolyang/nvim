local M = {}
local fn = vim.fn

local function shell_call(args)
    local output = fn.system(args)
    assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
end

M.echo = function(str)
    vim.cmd("redraw")
    vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

M.prepare_base46 = function()
    local cache_path = fn.stdpath("data") .. "/lazy/base46"

    if not vim.loop.fs_stat(cache_path) then
        M.echo("  Compiling base46 theme to bytecode ...")

        local repo = "https://github.com/NvChad/base46"
        shell_call { "git", "clone", "--depth", "1", "-b", "v2.0", repo, cache_path }
    end
    vim.opt.rtp:prepend(cache_path)

    require("base46").compile()

    dofile(vim.g.base46_cache .. "defaults")
end

M.prepare_lazy = function()
    local cache_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(cache_path) then
        M.echo("  Installing lazy.nvim & plugins ...")

        local repo = "https://github.com/folke/lazy.nvim.git"
        shell_call({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, cache_path })
    end

    vim.opt.rtp:prepend(cache_path)
end

M.setup = function()
    -- install plugins
    require("plugins")
    -- mason packages & show post_bootstrap screen
    require("nvchad.post_install")()
end

return M
