local defaults = {
    terminals = {
        -- shell = "pwsh",
        list = {},
        type_opts = {
            float = {
                relative = "editor",
                row = 0.15,
                col = 0.2,
                width = 0.5,
                height = 0.6,
                border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.3 },
            vertical = { location = "rightbelow", split_ratio = 0.5 },
        },
    },
    behavior = {
        autoclose_on_quit = {
            enabled = false,
            confirm = true,
        },
        close_on_exit = true,
        auto_insert = true,
    },
}

return defaults
