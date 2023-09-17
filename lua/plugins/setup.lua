local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  --- 插件
  -- gruvbox 主题
  use {
    "ellisonleao/gruvbox.nvim",
    requires = { "rktjmp/lush.nvim" }
  }
  
  -- 状态栏
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons" } -- 图标
  }
  
  -- 侧边树
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" }
  }
  
  -- 终端拆分导航，base tmux
  -- Ctrl-h ⬅️     Ctrl-j ⬇️    Ctrl-k ⬆️   Ctrl-l ➡️    Ctrl-\ 回到上一个
  use "christoomey/vim-tmux-navigator"

  -- 语法高亮
  use "nvim-treesitter/nvim-treesitter" -- syntax
  use "p00f/nvim-ts-rainbow" -- 括号

  -- LSP服务
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }
  -- 自动补全
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  -- 注释和括号补全
  use "numToStr/Comment.nvim" -- gcc和gc注释
  use "windwp/nvim-autopairs" -- 自动补全括号

  use "akinsho/bufferline.nvim" -- buffer分割线
  use "lewis6991/gitsigns.nvim" -- 左则git提示

  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.1",  -- 文件检索
    requires = {
        "nvim-lua/plenary.nvim"
    }
  }
  ---
  if packer_bootstrap then
    require('packer').sync()
  end
end)
