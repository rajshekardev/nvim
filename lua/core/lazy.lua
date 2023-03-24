local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	},
	{ "prettier/vim-prettier" },
	-- color scheme
	{"navarasu/onedark.nvim"},
	
	{"marko-cerovac/material.nvim"},

	{ "rose-pine/neovim", name = "rose-pine" },

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "rose-pine",
		},
	},

	-- file explorer
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"antosha417/nvim-lsp-file-operations",
			"echasnovski/mini.base16",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},

	-- nvim-telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                              , branch = '0.1.1',
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},

	-- nvim-treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- nvim auto pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	},
})


-- Set color scheme
--vim.cmd.colorscheme("rose-pine")

-- Lua onedark

--require('onedark').setup {
--    style = 'darker'
--}
--require('onedark').load()

--material theme with high contrast
require('lualine').setup {
  options = {
	  theme = 'material-nvim',
	  icons_enabled = true,
  }
}
vim.g.material_style = "deep ocean"

-- lsp zero defaults
local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
})
lsp.format_on_save({
  servers = {
    ['lua_ls'] = {'lua'},
    ['rust_analyzer'] = {'rust'},
  }
})
-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

require("nvim-tree.api").tree.open()
