local M = {}
local fn = vim.fn
local utils = require("core.utils")

M.setup_lazy = function(install_path)
    ------------- base46 ---------------
    local lazy_path = fn.stdpath "data" .. "/lazy/base46"

    utils.echo "  Compiling base46 theme to bytecode ..."

    local base46_repo = "https://github.com/NvChad/base46"
    utils.shell_call({ "git", "clone", "--depth", "1", "-b", "v2.0", base46_repo, lazy_path })
    vim.opt.rtp:prepend(lazy_path)

    require("base46").compile()

    --------- lazy.nvim ---------------
    utils.echo "  Installing lazy.nvim & plugins ..."

    local repo = "https://github.com/folke/lazy.nvim.git"
    utils.shell_call ({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, install_path })
    vim.opt.rtp:prepend(install_path)

    M.setup_plugins()
end

M.setup_plugins = function()
    -- install plugins
    require("plugins")
    -- mason packages & show post_bootstrap screen
    require("nvchad.post_install")()
end

return M
