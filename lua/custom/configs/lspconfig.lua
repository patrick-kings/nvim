local lspconfig = require "lspconfig"

local util = require "lspconfig/util"

local lsp_c = require "plugins.configs.lspconfig"

local on_attach = lsp_c.on_attach

local capabilities = lsp_c.capabilities

local servers = {
  "html",
  "cssls",

  "clangd",
  "cmake",

  "zls",

  "ts_ls",
  "tailwindcss",

  "templ",

  "postgres_lsp",

  "bashls",
  "docker_compose_language_service",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    "rustup",
    "run",
    "stable",
    "rust-analyzer",
  },
  filetypes = { "rust" },
  root_dir = util.root_pattern "Cargo.toml",

  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}

lspconfig.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
