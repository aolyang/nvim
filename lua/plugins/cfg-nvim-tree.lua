vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup {
    view = {
        width = 35
    },
    renderer = {
        icons = {
            -- show = { folder_arrow = false },
            glyphs = {
                folder = {
                    -- empty = "+",
                    -- empty_open = "-"
                }
            }
        },
        indent_markers = {
            enable = true,
            icons = {
            }
        }
    }
}

