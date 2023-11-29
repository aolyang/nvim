local merge_tb = vim.tbl_deep_extend

return function(section, mapping_opt)
    vim.schedule(function()
        local function set_section_map(section_values)
            if section_values.plugin then
                return
            end

            section_values.plugin = nil

            for mode, mode_values in pairs(section_values) do
                local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
                for keybind, mapping_info in pairs(mode_values) do
                    -- merge default + user opts
                    local opts = merge_tb("force", default_opts, mapping_info.opts or {})

                    mapping_info.opts, opts.mode = nil, nil
                    opts.desc = mapping_info[2]

                    print("set mappings", keybind, mapping_info[1])
                    vim.keymap.set(mode, keybind, mapping_info[1], opts)
                end
            end
        end

        local mappings = require("core.utils").load_config().mappings
        if type(section) == "string" then
            if mappings[section] then
                mappings[section]["plugin"] = nil
            end
            mappings = { mappings[section] }
        end

        for _, sect in pairs(mappings) do
            set_section_map(sect)
        end
    end)
end
