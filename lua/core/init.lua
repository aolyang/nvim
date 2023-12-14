require("core.utils.pollyfills")

local g = vim.g
g.mapleader = " "

local config = require("core.utils").load_config()
-------------------------------------- globals -----------------------------------------
g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
g.transparency = config.ui.transparency

local is_windows = require("core.utils").is_windows()

config.ui.terminal = vim.tbl_deep_extend(
    "keep",
    config.ui.terminal,
    {
        terminals = {
            shell = is_windows and "pwsh" or "zsh"
        }
    }
)

require("core.options")
require("core.envs")
