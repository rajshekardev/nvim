vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>zr", "<cmd>restart<cr>", {desc = "Restart ykw"})

vim.keymap.set("x", "p", [["_dP]], { desc = "paste without yanking whats below it"})

vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "move lines down in visual selection"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "move lines down in visual selection"})

vim.keymap.set("v", "<", "<gv", {desc = "reverse indent"})
vim.keymap.set("v", ">", ">gv", {desc = "indent"})

vim.keymap.set("n", "J", "mzJ`z", {desc = "join bottom line to end without moving cursor"})

-- smoother page up and down scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move up in buffer"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move down in buffer"})

vim.keymap.set("n", "<n>", "nzzzv", { desc = "center cusror when search next"})
vim.keymap.set("n", "<N>", "Nzzzv", { desc = "center cusror when search previous"})

-- global replace in buffer
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "global replace word under cursor"})
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", {desc = "make files executable", silent = true })

vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
        require("undotree").open()
    end, {desc = "Toggle Builtin undotree"}
)

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = 'format local buffer' })
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Show line diagnostic' })

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })


