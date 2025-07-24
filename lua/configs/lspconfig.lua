require("nvchad.configs.lspconfig").defaults()

local servers = {
    "html",
    "cssls",
    "biome",
    "jsonls",
    "postgres_lsp",
    "gopls",
    "buf_ls",
    "tailwindcss",
    "docker-compose-language-service",
    "server",
    "ts_ls",
    "bashls",
}

vim.lsp.enable(servers)
