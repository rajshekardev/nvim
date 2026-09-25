vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
})

require("oil").setup({
    default_file_explorer = true,
    columns = { "icons" },
    view_options = {
        show_hidden = true
    }
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open Oil file explorer" })
