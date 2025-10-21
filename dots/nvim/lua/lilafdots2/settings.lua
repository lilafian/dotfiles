local o = vim.opt

o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.syntax = "on"
o.autoindent = true
o.cursorline = true
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.encoding = "UTF-8"
o.ruler = true
o.mouse = ""
o.title = true
o.hidden = true
o.ttimeoutlen = 0
o.wildmenu = true
o.showcmd = true
o.inccommand = "split"
o.splitright = true
o.splitbelow = true
o.termguicolors = true
o.updatetime = 500
o.winborder = "bold"

vim.cmd [[
    highlight Normal guibg=none
    highlight NonText guibg=none        
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
]]
