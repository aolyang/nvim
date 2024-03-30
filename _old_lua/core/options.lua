local opt = vim.opt

-------------------------------------- vim options ------------------------------------------
-- global statusline
opt.laststatus = 3
opt.showmode = false

-- center startify
-- vim.g.startify_centered_header = 1
-- vim.g.startify_centered_footer = 1
-- vim.g.startify_centered = 1

-- 行号
opt.relativenumber = true
opt.number = true
opt.numberwidth = 2
opt.ruler = true

-- 缩进
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.autoindent = true
opt.smartindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")
opt.cursorline = true


-- 搜索
-- opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- disable nvim intro
-- opt.shortmess:append "sI"

opt.timeoutlen = 400
opt.undofile = true
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"
