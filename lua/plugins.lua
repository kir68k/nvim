-- > Definitions
local fn = vim.fn
local cmd = vim.cmd
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- > Plugin manager configuring
-- >> Bootstrap lazy.nvim, our plugin manager
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

-- > Plugin loading
require("lazy").setup({
    {
        "kir68k/autumnull",
        lazy = false,
        priority = 1000,
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme autumnull]])
        end,
    },
    -- >> LSP management with mason.nvim & nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function() require("plugins.lspconfig") end,
    },

    -- >> Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },

    -- >> Autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "kdheepak/cmp-latex-symbols",
        },
        config = function() require('plugins.cmp') end,
    },

    -- >> Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        config = function() require('plugins.treesitter') end,
        build = ':TSUpdate',
    },

    -- >> Signature help
    "ray-x/lsp_signature.nvim",

    -- >> Snippets
    {
        "L3MON4D3/LuaSnip",
        config = function() require('plugins.snippets') end,
    },
    {
        "iurimateus/luasnip-latex-snippets.nvim",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "lervag/vimtex"
        },
        config = function() require('luasnip-latex-snippets').setup({
            use_treesitter = true
        }) end,
        ft = { "tex", "markdown" },
    },

    -- >> TeX
    {
        "barreiroleo/ltex-extra.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "latex-lsp/texlab",
            "lervag/vimtex",
        },
        ft = { "tex", "markdown" },
    },
    "latex-lsp/texlab",
    {
        "frabjous/knap",
        config = function() require('plugins.latex') end,
    },
    --"xuhdev/vim-latex-live-preview",
    --{
    --    "xuhdev/vim-latex-live-preview",
    --    config = function() require('plugins.latex') end,
    --},

    -- >> Theming
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons", opt = true},
        config = function() require('plugins.lualine') end,
    },
    {
        "utilyre/barbecue.nvim",
        tag = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            {"nvim-tree/nvim-web-devicons", opt = true},
        },
        config = function() require('barbecue').setup() end,
    },
    {
        "loctvl842/breadcrumb.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
    },

    "windwp/nvim-autopairs",
    {
        "brenoprata10/nvim-highlight-colors",
        config = function() require("plugins.visual") end,
    },

    "lukas-reineke/indent-blankline.nvim",
    {
        'nvim-tree/nvim-web-devicons',
        dependencies = {
            'utilyre/barbecue.nvim',
        }
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function() require("nvim-tree").setup() end,
    },

    -- .elv support for Elven/Elvish
    "dmix/elvish.vim",
    -- .yuck support for EWW
    "elkowar/yuck.vim",
    -- Caddyfile support
    "isobit/vim-caddyfile",

    -- Markdown previews using a browser + localhost
    -- install method without the use of npm/yarn
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    }
})
