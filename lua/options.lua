vim.api.nvim_command('filetype plugin indent on')

local fn = vim.fn
local config_dir = vim.env.XDG_CONFIG_HOME or "~/.config/nvim/" -- .. '/nvim/'

-- > Keyboard
vim.opt.tabstop         = 4
vim.opt.shiftwidth      = 4
vim.opt.expandtab       = true
vim.bo.softtabstop      = 4

-- >> General [visual] behavior
vim.o.hlsearch          = false     -- Disable last search results
vim.o.ignorecase        = true      -- Case insensitive search
vim.o.smartcase         = true      -- Enable case sensitivity when a match has capital letters
vim.o.smarttab          = true
vim.o.smartindent       = true
vim.o.splitbelow        = true
vim.o.splitright        = true
vim.o.scrolloff         = 12
vim.o.sidescrolloff     = 8
vim.o.mouse             = 'a'
vim.opt.rtp:append("/usr/share/vim/vimfiles")   -- This is for app-vim/gentoo-syntax, not sure about other distros or BSD.

-- > Vim specific
vim.o.hidden            = true
vim.o.fileencoding      = "utf-8"   -- This is probably the default anyway
vim.o.spell             = false
vim.o.spelllang         = "en_us"
vim.o.completeopt       = "menuone,noinsert,noselect"
vim.o.wildmode          = "longest,full"
vim.o.updatetime        = 300
vim.g.do_file_type_lua  = 1

-- >> Disable unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- >> Disable inline error messages
vim.diagnostic.config {
    virtual_text = false,
    underline = false,
    signs = true,
}
