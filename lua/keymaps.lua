vim.g.mapleader = " "
local keymap = vim.keymap

-- Insert Mode
keymap.set("i", "jk", "<ESC>")

-- V Mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
keymap.set("v", "K", ":m '>-2<CR>gv=gv'")

-- Normal Mode
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平分割
keymap.set("n", "<leader>sh", "<C-w>s") -- 水平分割

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 插件
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- 切换buffer
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

