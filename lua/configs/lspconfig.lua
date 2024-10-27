-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { 
  "html", 
  "cssls", 
  "dockerls", 
  "jsonls",
  -- "golangci_lint_ls",
  "gopls"
}
local nvlsp = require "nvchad.configs.lspconfig"

-- language servers
-- require'lspconfig'.golangci_lint_ls.setup{}

require'lspconfig'.gopls.setup{}


-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
