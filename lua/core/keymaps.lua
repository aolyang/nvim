local vim = require("vim")

vim.g.mapleader = " "
local keymap = vim.keymap

-- Insert Mode
keymap.set("i", "jk", "<ESC>")

-- V Mode

-- Normal Mode
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平分割
keymap.set("n", "<leader>sh", "<C-w>s") -- 水平分割
keymap.set("n", "qq", "<C-w>q")         -- 关闭窗口
-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 插件
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>fo", ":NvimTreeFindFile<CR>")

-- 切换buffer
keymap.set("n", "H", ":BufferLineCyclePrev<CR>")
keymap.set("n", "L", ":BufferLineCycleNext<CR>")
