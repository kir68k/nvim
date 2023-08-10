-- > Definitions
local fn = vim.fn
local cmd = vim.cmd

-- > Plugin manager configuring
-- >> Bootstrap packer.nvim, our plugin manager
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- >> Load packer.nvim
cmd([[packadd packer.nvim]])

-- >> Regenerate loader file every time `plugins.lua` is updated
cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

-- > Plugin loading
return require('packer').startup(function(use)
    -- $ packer.nvim self-updating
    use({'wbthomason/packer.nvim', opt = true})

    -- >> LSP management with mason.nvim & nvim-lspconfig
    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate",
    }
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"

    -- require("plugins.lspconfig")

    -- >> Autocompletion
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function() require('plugins.cmp') end,
    })

    -- >> Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        config = function() require('plugins.treesitter') end,
        run = ':TSUpdate',
    })

    -- >> Signature help
    use "ray-x/lsp_signature.nvim"

    -- Snippets
    use {
        "L3MON4D3/LuaSnip",
        config = function() require('plugins.snippets') end,
    }
    use {
        "iurimateus/luasnip-latex-snippets.nvim",
        requires = {
            "L3M0N4D3/LuaSnip",
            "lervag/vimtex"
        },
        config = function() require('luasnip-latex-snippets').setup({
            use_treesitter = true
        }) end,
        ft = { "tex", "markdown" },
    }

    -- Theming
    use({
        "nvim-lualine/lualine.nvim",
        requires = {"nvim-tree/nvim-web-devicons", opt = true},
        config = function() require('plugins.lualine') end,
    })
    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            {"nvim-tree/nvim-web-devicons", opt = true},
        },
        after = "nvim-web-devicons",
        config = function() require('barbecue').setup() end,
    })
    use({
        "loctvl842/breadcrumb.nvim",
        requires = {"nvim-tree/nvim-web-devicons"},
    })

    use "windwp/nvim-autopairs"
    use "brenoprata10/nvim-highlight-colors"
    use "lukas-reineke/indent-blankline.nvim"
    use "kir68k/autumnull"
    require("plugins.visual")

    use {
        "nvim-tree/nvim-tree.lua",
        requires = {"nvim-tree/nvim-web-devicons"},
        config = function() require("nvim-tree").setup() end,
    }

    -- .elv support for Elven/Elvish
    use "dmix/elvish.vim"
    -- .yuck support for EWW
    use "elkowar/yuck.vim"
    -- Caddyfile support
    use "isobit/vim-caddyfile"

    -- Markdown previews using a browser + localhost
    -- install method without the use of npm/yarn
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
end)
