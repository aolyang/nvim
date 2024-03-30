
local M = {
    setup = function(config)
        require("core.utils").load_mappings("terminal")

        local defaults = require("plugins.terminal.config")
        config = config and vim.tbl_deep_extend("force", defaults, config) or defaults

        local behavior = config.behavior
        if behavior.autoclose_on_quit.enabled then
            local function force_exit()
                require("plugins.terminal.api").close_all_terms()
                vim.api.nvim_command "qa"
            end
            vim.api.nvim_create_autocmd({ "WinClosed" }, {
                callback = vim.schedule_wrap(function()
                    local open_terms = require("plugins.terminal.api").list_active_terms "win"

                    local non_terms = vim.tbl_filter(function(win)
                        return not vim.tbl_contains(open_terms, win)
                    end, vim.api.nvim_list_wins())

                    if not vim.tbl_isempty(non_terms) then
                        return
                    end

                    if not behavior.autoclose_on_quit.confirm then
                        return force_exit()
                    end

                    vim.ui.input({ prompt = "Close all terms and quit? (Y/N): " }, function(input)
                        if not input or not string.lower(input) == "y" then
                            return
                        end
                        force_exit()
                    end)
                end),
            })
        end
        if behavior.close_on_exit then
            vim.api.nvim_create_autocmd({ "TermClose" }, {
                callback = function()
                    vim.schedule_wrap(vim.api.nvim_input "<CR>")
                end,
            })
        end

        if behavior.auto_insert then
            vim.api.nvim_create_autocmd({ "BufEnter" }, {
                callback = function()
                    vim.cmd "startinsert"
                end,
                pattern = "term://*",
            })

            vim.api.nvim_create_autocmd({ "BufLeave" }, {
                callback = function()
                    vim.cmd "stopinsert"
                end,
                pattern = "term://*",
            })
        end
        require("plugins.terminal.api").init(config.terminals)
    end
}
return M
