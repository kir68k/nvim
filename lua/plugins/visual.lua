require("nvim-highlight-colors").setup {}
require("nvim-autopairs").setup {}
require("autumnull").setup {}

local c = require('autumnull.palette')
local hl = vim.api.nvim_set_hl

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local ibl_hooks = require "ibl.hooks"

ibl_hooks.register(ibl_hooks.type.HIGHLIGHT_SETUP, function()
    hl(0, "RainbowRed",     { fg = c.red    })
    hl(0, "RainbowYellow",  { fg = c.yellow })
    hl(0, "RainbowBlue",    { fg = c.blue   })
    hl(0, "RainbowOrange",  { fg = c.orange })
    hl(0, "RainbowGreen",   { fg = c.green  })
    hl(0, "RainbowViolet",  { fg = c.purple })
    hl(0, "RainbowCyan",    { fg = c.cyan   })
end)

require("ibl").setup { indent = { highlight = highlight } }

-- $ Variables
vim.cmd.colorscheme     "autumnull"         -- This must be called AFTER `setup`.
vim.cmd.termguicolors   = true              -- Enable true colros
vim.cmd.showtabline     = 2                 -- Show the tabline
vim.cmd.conceallevel    = 0                 -- Do not hide quotes in Markdown files
vim.cmd.title           = true              -- Set terminal's WM_NAME to opened file

vim.wo.number           = true              -- Show line numbers
vim.wo.relativenumber   = true              -- Line numbers are relative to the cursor's line
vim.wo.signcolumn       = 'yes'
vim.wo.cursorline       = true
