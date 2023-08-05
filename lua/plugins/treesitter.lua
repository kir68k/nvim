require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
    },
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "json",
        "lua",
        "latex",
        "markdown",
        "vim",
        "yaml",
        "haskell",
    },
})
