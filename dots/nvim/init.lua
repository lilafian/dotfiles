require("lilafdots2.settings")

local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("ellisonleao/gruvbox.nvim")

Plug("nvim-lualine/lualine.nvim")
Plug("nvim-tree/nvim-web-devicons")

Plug("nvim-treesitter/nvim-treesitter")

Plug("nvim-neo-tree/neo-tree.nvim")
Plug("MunifTanjim/nui.nvim")
Plug("nvim-lua/plenary.nvim")

Plug("ray-x/lsp_signature.nvim")

Plug("ms-jpq/coq_nvim")

Plug("bassamsdata/namu.nvim")

Plug("nvim-telescope/telescope.nvim", { tag = "0.1.8" })

vim.call("plug#end")


require("gruvbox").setup({
    transparent_mode = true
})
vim.cmd([[colorscheme gruvbox]])

require("lualine").setup({
    options = {
        icons_enabled = true,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "" , right = "" }
    }
})

require("neo-tree").setup({
    popup_border_style = ""
})


local coq = require("coq");

vim.lsp.config("*", {
    root_markers = { ".git", "GNUmakefile", "Makefile" }
})

vim.lsp.config("clangd", coq.lsp_ensure_capabilities({
    cmd = { "clangd" },
    filetypes = { "c", "cpp" }
}))

vim.lsp.enable("clangd");

require("lsp_signature").setup({
    handler_opts = {
        border = "single"
    }
});

vim.g.coq_settings = {
    ["display.pum.fast_close"] = false,
    ["completion.always"] = false
}

vim.cmd([[COQnow -s]])

vim.keymap.set("n", "t", ":Neotree toggle float<cr>", {
    desc = "Open file explorer",
    silent = true
})

vim.keymap.set("n", ",", ":Namu symbols<cr>", {
    desc = "Jump to symbol",
    silent = true
})

local tbi = require("telescope.builtin")

vim.keymap.set("n", "M", tbi.find_files, {
    desc = "Find file by name",
    silent = true
})

vim.keymap.set("n", "m", tbi.live_grep, {
    desc = "Find file by contents",
    silent = true
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
    }
)

vim.cmd([[autocmd CursorHold * lua vim.diagnostic.show()]])
