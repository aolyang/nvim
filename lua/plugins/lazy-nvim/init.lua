local M = {
    setup = function(plugins)
        local configs = require("plugins.lazy-nvim.config")
        require("lazy").setup(plugins, configs)
    end
}

return M
