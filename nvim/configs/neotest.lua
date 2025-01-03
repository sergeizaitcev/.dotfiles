local namespace = vim.api.nvim_create_namespace("neotest")

vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
      return message
    end,
  },
}, namespace)

require("neotest").setup({
  adapters = {
    require("neotest-go")({
      args = { "-v", "-race", "-tags=unit,integration", "-timeout=30s", "-count=1" },
    }),
  },
})
