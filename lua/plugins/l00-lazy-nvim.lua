local M = {
    setup = function(plugins)
        local configs = require("plugins.l01-lazy-nvim-cfg")
        require("lazy").setup(plugins, configs)
    end
}

return M
