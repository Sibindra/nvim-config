local lspconfig = require "nvchad.configs.lspconfig"
local on_attach = lspconfig.on_attach
local capabilities = lspconfig.capabilities

local servers = {
    "html",
    "cssls",
    "biome",
    "jsonls",
    "postgres_lsp",
    "gopls",
    "tailwindcss",
    "docker_compose_language_service",
    "ts_ls",
    "bashls",
    "typos_lsp",
}

for _, lsp in ipairs(servers) do
    local config = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    if lsp == "gopls" then
        config.settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                    shadow = true,
                },
                staticcheck = true,
                hints = {
                    parameterNames = true,
                    assignVariableTypes = true,
                },
            },
        }
    end

    if lsp == "ts_ls" then
        config.settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayFunctionLikeReturnTypeHints = true,
                },
            },
        }
    end

    require("lspconfig")[lsp].setup(config)
end
