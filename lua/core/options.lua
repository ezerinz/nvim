local g = vim.g
local opt = vim.opt

-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

g.mapleader = " "
opt.exrc = true
opt.number = true
opt.mouse = "a"
opt.hlsearch = false
opt.smartcase = true
opt.ignorecase = true
opt.wrap = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.termguicolors = true
opt.list = true
opt.shiftround = true
opt.smartindent = true
opt.undofile = true
opt.cursorline = true
opt.fillchars = { eob = " " }
opt.wrap = false
opt.showmode = false
opt.signcolumn = "yes:1"
opt.relativenumber = true
opt.laststatus = 0
