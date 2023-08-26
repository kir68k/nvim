require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "json",
        "lua",
        --"latex",
        "markdown",
        "markdown_inline",
        "rust",
        "vim",
        "yaml",
        "haskell",
    },
})
