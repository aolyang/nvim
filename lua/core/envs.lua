-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
    vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.opt_local.buflisted = false
    end,
})

-- reload some chadrc options on-save
autocmd("BufWritePost", {
    pattern = vim.tbl_map(
        function(path)
            return vim.fs.normalize(vim.loop.fs_realpath(path))
        end,
        vim.fn.glob(
            vim.fn.stdpath "config" .. "/lua/**/*.lua", -- TODO this HMR is not tested
            true,
            true,
            true
        )
    ),
    group = vim.api.nvim_create_augroup("ReloadNvChad", {}),

    callback = function(opts)
        local buf_name = vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf))
        local fp = vim.fn.fnamemodify(buf_name, ":r") --[[@as string]]

        local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
        local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")

        require("plenary.reload").reload_module("base46")
        require("plenary.reload").reload_module(module)

        local config = require("core.utils").load_config()

        vim.g.nvchad_theme = config.ui.theme
        vim.g.transparency = config.ui.transparency

        -- statusline
        require("plenary.reload").reload_module("plugins.statusline." .. config.ui.statusline.theme)
        vim.opt.statusline = "%!v:lua.require('plugins.statusline." .. config.ui.statusline.theme .. "').run()"

        -- tabufline
        if config.ui.tabufline.enabled then
            require("plenary.reload").reload_module("plugins.tabufline.modules")
            vim.opt.tabline = "%!v:lua.require('plugins.tabufline.modules').run()"
        end

        require("base46").load_all_highlights()
        -- vim.cmd("redraw!")
    end,
})
