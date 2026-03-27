local vim = vim
local o = vim.opt
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("shaunsingh/nord.nvim")

Plug("nvim-treesitter/nvim-treesitter")

Plug("nvim-neo-tree/neo-tree.nvim")
Plug("MunifTanjim/nui.nvim")
Plug("nvim-lua/plenary.nvim")
Plug("nvim-tree/nvim-web-devicons")

Plug("akinsho/bufferline.nvim")

Plug("nvim-lualine/lualine.nvim")

vim.call("plug#end")

vim.cmd[[silent! colorscheme nord]]

o.termguicolors = true
require("bufferline").setup()

require("lualine").setup()

vim.keymap.set("n", "t", ":Neotree toggle float<cr>", {
    	desc = "Open file explorer",
    	silent = true
})

vim.keymap.set("n", "<Tab>", ":bnext<cr>", {
	desc = "Go to the next buffer",
	silent = true
})

vim.keymap.set("n", "<S-Tab>", ":bprev<cr>", {
	desc = "Go to the last buffer",
	silent = true
})

vim.keymap.set("n", "<C-d>", ":bdelete<cr>", {
	desc = "Delete the current buffer",
	silent = true
})

o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.syntax = "on"
o.autoindent = true
o.cursorline = true
o.expandtab = true
o.shiftwidth = 8
o.tabstop = 8
o.encoding = "UTF-8"
o.ruler = true
o.title = true
o.hidden = true
o.ttimeoutlen = 0
o.wildmenu = true
o.showcmd = true
o.inccommand = "split"
o.splitright = true
o.splitbelow = true
o.updatetime = 500
o.winborder = "bold"

vim.cmd[[silent! cnoreabbrev W w]]
