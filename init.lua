local utils = require "utils"
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  utils.echo "  Installing lazy.nvim & plugins ..."

  utils.shell {
    "git",
    "clone",
    "https://github.com/folke/lazy.nvim.git",
    "--filter=blob:none",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require "plugins.astronvim",
  require "plugins.astronvim-communities",
}, require("lazy-nvim").options)
