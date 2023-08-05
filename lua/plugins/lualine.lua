require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "monokai-pro",
        section_separators = '',
        component_separators = '',
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"filename"},
        lualine_c = {"branch", "diff", "diagnostics"},
        
        lualine_x = {"filetype", "fileformat", "encoding"},
        lualine_y = {"progress"},
        lualine_z = {"location"},
    }
}
