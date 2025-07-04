require("lilafdots.settings")

local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("rose-pine/neovim")

Plug("nvim-lualine/lualine.nvim")

Plug("nvim-treesitter/nvim-treesitter")

Plug("nvim-neo-tree/neo-tree.nvim")
Plug("nvim-lua/plenary.nvim")
Plug("nvim-tree/nvim-web-devicons")
Plug("MunifTanjim/nui.nvim")

Plug("nvim-telescope/telescope.nvim")

Plug("bassamsdata/namu.nvim")

Plug("andweeb/presence.nvim")

Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
Plug("ray-x/lsp_signature.nvim")

Plug("vijaymarupudi/nvim-fzf")

vim.call("plug#end")

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        
        require("rose-pine").setup({
            variant = "auto", -- auto, main, moon, or dawn
            dark_variant = "main", -- main, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            enable = {
                terminal = true,
                legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                migrations = true, -- Handle deprecated options automatically
            },

            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },

            groups = {
                border = "muted",
                link = "iris",
                panel = "surface",

                error = "love",
                hint = "iris",
                info = "foam",
                note = "pine",
                todo = "rose",
                warn = "gold",
                git_add = "foam",
                git_change = "rose",
                git_delete = "love",
                git_dirty = "rose",
                git_ignore = "muted",
                git_merge = "iris",
                git_rename = "pine",
                git_stage = "iris",
                git_text = "rose",
                git_untracked = "subtle",

                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",               
                h5 = "pine",
                h6 = "foam",
            },
        })


        require("lsp_signature").setup({})
        local on_attach = function(client, bufnr)
            require("lsp_signature").on_attach({
                bind = true,
                floating_window = true,
                handler_opts = { border = "single" }
            }, bufnr)
        end
        local lspconfig = require("lspconfig")
        lspconfig.clangd.setup({ 
            on_attach = on_attach,
            filetypes = { "c", "cpp" }
        })
        lspconfig.pyright.setup({
            on_attach = on_attach,
            filetypes = { "python" }
        })
        lspconfig.ts_ls.setup({
            on_attach = on_attach,
            filetypes = { "javascript" }
        })

        vim.api.nvim_create_autocmd("CursorHold", {
            callback = function()
                vim.diagnostic.open_float(nil, {
                    focus = false,
                    border = "single"
                })
            end
        })

        require("lualine").setup()

        vim.keymap.set("n", ",", ":Namu symbols<cr>", {
            desc = "Jump to symbol",
            silent = true
        })

        local telescopecmd = require("telescope.builtin")
        vim.keymap.set("n", "ff", telescopecmd.find_files, { desc = "Find files" })
        vim.keymap.set("n", "fg", telescopecmd.live_grep, { desc = "Find text" })

    	vim.cmd("colorscheme rose-pine")
        vim.cmd("Neotree reveal left")
        vim.cmd("wincmd l")

        vim.api.nvim_exec_autocmds("FileType", {})
    end
})
