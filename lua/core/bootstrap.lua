local M = {}
local fn = vim.fn
local utils = require("core.utils")


M.prepare_base46 = function()
    local cache_path = fn.stdpath("data") .. "/lazy/base46"

    if not vim.loop.fs_stat(cache_path) then
        utils.echo("  Compiling base46 theme to bytecode ...")

        local repo = "https://github.com/NvChad/base46"
        utils.shell_call { "git", "clone", "--depth", "1", "-b", "v2.0", repo, cache_path }
        vim.opt.rtp:prepend(cache_path)

        require("base46").compile()
        dofile(vim.g.base46_cache .. "defaults")
    end
end

M.setup_lazy = function()
    local cache_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(cache_path) then
        utils.echo("  Installing lazy.nvim & plugins ...")

        local repo = "https://github.com/folke/lazy.nvim.git"
        utils.shell_call({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, cache_path })
        vim.opt.rtp:prepend(cache_path)
        M.setup_plugins()
    end
end

M.setup_plugins = function()
    -- install plugins
    require("plugins")
    -- mason packages & show post_bootstrap screen
    require("nvchad.post_install")()
end

return M
