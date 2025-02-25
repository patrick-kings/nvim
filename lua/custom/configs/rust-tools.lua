local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
}

return options
