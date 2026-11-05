return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				-- install_dir = vim.fn.stdpath("data") .. "/site",  -- default
			})

			local ensure_installed = {
				"lua",
				"html",
				"css",
				"javascript",
				"vim",
				"typescript",
				"tsx",
				"python",
				"java",
				"cpp",
				"rust",
				"go",
				"yaml",
				"bash",
				"dockerfile",
				"markdown",
				"http",
			}
			require("nvim-treesitter").install(ensure_installed)
		end,
	},
}
