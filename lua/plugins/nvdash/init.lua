local M = {}
local api = vim.api

dofile(vim.g.base46_cache .. "nvdash")

M.lazy_load = function()
  local config = require("core.utils").load_config().ui

  api.nvim_create_autocmd("BufLeave", {
    callback = function()
      if vim.bo.ft == "nvdash" then
        vim.g.nvdash_displayed = false
      end
    end,
  })

  -- load nvdash only on empty file
  if config.nvdash.load_on_startup then
    vim.defer_fn(function()
      local buf_lines = vim.api.nvim_buf_get_lines(0, 0, 1, false)
      local no_buf_content = vim.api.nvim_buf_line_count(0) == 1 and buf_lines[1] == ""
      local bufname = vim.api.nvim_buf_get_name(0)

      if bufname == "" and no_buf_content then
        require("plugins.nvdash.utils").open()
      end
    end, 0)
  end
end

return M
