--[[
local latte = require("catppuccin.palettes").get_palette "latte"
local mocha = require("catppuccin.palettes").get_palette "mocha"

require("catppuccin").setup({
    background = {
        light = "latte",
        dark = "mocha",
    },
    flavour = "mocha",
    transparent_background = false,
    term_colors = true,
    show_end_of_buffer = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
    },
})
]]

require("nvim-highlight-colors").setup {}
require("nvim-autopairs").setup {}
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}
require("monokai-pro").setup({
    terminal_colors = true,
    devicons = true,
    filter = "pro",
})


-- $ Variables
vim.cmd.colorscheme     "monokai-pro"        -- This must be called AFTER `setup`.
vim.cmd.termguicolors   = true              -- Enable true colros
vim.cmd.showtabline     = 2                 -- Show the tabline
vim.cmd.conceallevel    = 0                 -- Do not hide quotes in Markdown files
vim.cmd.title           = true              -- Set terminal's WM_NAME to opened file

vim.wo.number           = true              -- Show line numbers
vim.wo.relativenumber   = true              -- Line numbers are relative to the cursor's line
vim.wo.signcolumn       = 'yes'
vim.wo.cursorline       = true
