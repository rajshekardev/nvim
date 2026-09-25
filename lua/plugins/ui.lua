vim.pack.add({
    "https://github.com/rose-pine/nvim",
})

require("rose-pine").setup({
    styles = {
      italic = true,
      transparency = true,
    },
})

vim.cmd("colorscheme rose-pine")
