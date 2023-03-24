-- @format
vim.g.mapleader = " "
vim.opt.relativenumber = true
vim.opt.number = true

-- Nvim-tree is a file explorer

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
			renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})
-- nvim-tree toggle keymap
vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle <CR>", { noremap = true })

--focus on explorer keymap
vim.api.nvim_set_keymap("n", "<Leader>ef", ":NvimTreeFocus <CR>", { noremap = true })

-- nvim-tree conf ends here

-- Lazy key map
vim.api.nvim_set_keymap("n", "<Leader>lazy", ":Lazy<CR>", { noremap = true })

-- Mason Key map
vim.api.nvim_set_keymap("n", "<Leader>lsp", ":Mason<CR>", { noremap = true })

-- leader n for absolute numbers
vim.api.nvim_set_keymap("n", "<Leader>n", ":set number!<CR>", { noremap = true })
-- Mason Key map

-- leader n for absolute numbers
vim.api.nvim_set_keymap("n", "<Leader>n", ":set number!<CR>", { noremap = true })

-- leader rn for relativenumbers
vim.api.nvim_set_keymap("n", "<Leader>rn", ":set relativenumber!<CR>", { noremap = true })

-- leader ev to open config: 
vim.api.nvim_set_keymap("n", "<Leader>ev", ":e $MYVIMRC<CR>", { noremap = true })

-- leade f to format code with Presttier & leadper P to manualyy format
vim.api.nvim_set_keymap("n", "<Leader>f", ":Prettier", { noremap = true})

-- telescope - is a fuzzy finder for neovim 
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--Lua:
vim.api.nvim_set_keymap('n', '<leader>mm', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], { noremap = true, silent = true })

