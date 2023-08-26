require("mason").setup()
require("lsp_signature").setup()

local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
-- local common_on_attach = require("lsp.utils").common_on_attach
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {
    "bashls",
    --"clangd",
    --"hls",
    "jsonls",
    "lua_ls",
    "marksman",
    "rescriptls",
    "rust_analyzer",
    --"nil_ls",
    "ltex",
    "texlab",
}

mason_lspconfig.setup({
    ensure_installed = servers,
})

mason_lspconfig.setup_handlers({
    function (server_name)
        lspconfig[server_name].setup {
            -- on_attach = common_on_attach,
            capabilities = capabilities,
        }
    end
})
