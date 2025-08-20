-- Leader key
vim.g.mapleader = " "

-- Plugin manager bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup("plugins")

-- Core settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.colorcolumn = "80"
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Set specific settings for C files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Set specific settings for Go and Rust files (use tabs)
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"go", "rust"},
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Auto-format C files on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.c",
  callback = function()
    vim.cmd([[normal! gg=G]])
  end,
})

-- Auto-format Go and Rust files on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.go", "*.rs"},
  callback = function()
    vim.cmd([[normal! gg=G]])
  end,
})

vim.cmd([[colorscheme nord]])
vim.cmd([[hi CodeCompanionGhostText guifg=#888888 gui=italic]])
