local M = {
  "AstroNvim/AstroNvim",
  branch = "v4", -- TODO: change `branch="v4"` to `version="^4"` on release
  import = "astronvim.plugins",
  opts = { -- AstroNvim options must be set here with the `import` key
    mapleader = " ", -- This ensures the leader key must be configured before Lazy is set up
    maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up
    icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
    pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
  },
}
return M
