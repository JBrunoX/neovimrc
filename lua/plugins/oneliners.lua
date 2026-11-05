return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
	{
		"antosha417/nvim-lsp-file-operations",
	},
	{
		"norcalli/nvim-colorizer.lua", -- displays colors in all file types
		config = function()
			require("colorizer").setup()
		end,
	},
}
