require("nvim-highlight-colors").setup {}
require("nvim-autopairs").setup {}
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}
--[[
require("monokai-pro").setup({
    terminal_colors = true,
    devicons = true,
    filter = "pro",
})
]]
require("autumnull").setup {}


-- $ Variables
vim.cmd.colorscheme     "autumnull"
--vim.cmd.colorscheme     "monokai-pro"        -- This must be called AFTER `setup`.
vim.cmd.termguicolors   = true              -- Enable true colros
vim.cmd.showtabline     = 2                 -- Show the tabline
vim.cmd.conceallevel    = 0                 -- Do not hide quotes in Markdown files
vim.cmd.title           = true              -- Set terminal's WM_NAME to opened file

vim.wo.number           = true              -- Show line numbers
vim.wo.relativenumber   = true              -- Line numbers are relative to the cursor's line
vim.wo.signcolumn       = 'yes'
vim.wo.cursorline       = true
