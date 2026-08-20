vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight NormalNC guibg=none
  highlight SignColumn guibg=none
  highlight EndOfBuffer guibg=none
]])
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.number = true
vim.opt.signcolumn = "number"
vim.opt.swapfile = false
vim.opt.shortmess:append("cIFs")
vim.opt.wrap = false
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.cmd("syntax on")


