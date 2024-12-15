local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lsp = require("lspconfig")
local lspconfigs = require("lspconfig/configs")
local lsputil = require("lspconfig/util")

lsp.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  cmd_env = {
    GOFLAGS = "-tags=unit,integration",
  },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lsputil.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        composites = false,
      },
      gofumpt = true,
    },
  },
})

if not lspconfigs.golangcilsp then
  lspconfigs.golangcilsp = {
    default_config = {
      cmd = { "golangci-lint-langserver" },
      root_dir = lsputil.root_pattern("go.work", "go.mod", ".git"),
      init_options = {
        command = {
          "golangci-lint",
          "run",
          "--fast",
          "--out-format", "json",
          "--issues-exit-code=1",
        },
      },
    },
  }
end

lsp.golangci_lint_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "go", "gomod" },
})

lsp.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})
