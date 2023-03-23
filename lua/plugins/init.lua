-- require("")

if true then return {} end

return {
    
	--lsp mason
	{"williamboman/mason.nvim"},


	-- color scheme
	{ "rose-pine/neovim", name = "rose-pine" },

    {
        "LazyVim/LazyVim",
        opts = {
          colorscheme = "gruvbox",
        },
      },

	--- treesitter
	{ "nvim-treesitter/nvim-treesitter" },

	-- file explorer
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"antosha417/nvim-lsp-file-operations",
			"echasnovski/mini.base16"
		},
		config = function()
			require("nvim-tree").setup {}
		end,
	},

	-- nvim-telescope
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                              , branch = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- nvim-treesitter 
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},


	-- nvim auto pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup {}
		end,
	},

}