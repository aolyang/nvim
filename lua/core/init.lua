require("core.utils.pollyfills")

local g = vim.g
g.mapleader = " "

local config = require("core.utils").load_config()
-------------------------------------- globals -----------------------------------------
g.nvchad_theme = config.ui.theme
g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
g.toggle_theme_icon = "   "
g.transparency = config.ui.transparency

require("core.options")
require("core.envs")
