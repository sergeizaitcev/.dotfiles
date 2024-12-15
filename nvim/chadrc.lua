---@type ChadrcConfig 
local M = {}

M.ui = {
  theme = "catppuccin",
  cheatsheet = { theme = "grid" },
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
