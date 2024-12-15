local opt = vim.opt
local api = vim.api
local lsp = vim.lsp

api.nvim_exec('language en_US.UTF-8', true)

-- FIX(gopher): https://github.com/neovim/neovim/issues/28058.
local make_client_capabilities = lsp.protocol.make_client_capabilities
function lsp.protocol.make_client_capabilities()
    local caps = make_client_capabilities()
    if not (caps.workspace or {}).didChangeWatchedFiles then
        vim.notify(
            'lsp capability didChangeWatchedFiles is already disabled',
            vim.log.levels.WARN
        )
    else
        caps.workspace.didChangeWatchedFiles = nil
    end
    return caps
end

opt.backup = false
opt.swapfile = false

opt.colorcolumn = "80"

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

opt.list = true
opt.listchars = {
  eol = "↲",
  tab = "  ",
  trail = " ",
}

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

api.nvim_create_autocmd("FileType", {
  pattern = "json,sql",
  callback = function()
    opt.expandtab = false
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
  end,
})

api.nvim_create_autocmd("FileType", {
  pattern = "go,gomod",
  callback = function()
    opt.expandtab = false
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4
  end,
})
