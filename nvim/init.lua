-- Basic settings
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.mouse = 'v'
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildmode = { 'longest', 'list' }

-- Filetype settings
vim.cmd [[filetype plugin indent on]]
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.cmd [[filetype plugin on]]

-- Visual settings
vim.opt.cursorline = true
vim.opt.ttyfast = true

-- Highlight settings
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none', ctermbg = 'none' })
vim.api.nvim_set_hl(0, 'NonText', { bg = 'none', ctermbg = 'none' })

-- lazy.nvim
require("config.lazy")

