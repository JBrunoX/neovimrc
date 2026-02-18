return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		{
			"<leader>z", -- Open yazi at the current file
			"<cmd>Yazi<cr>",
		},
		{
			"<leader>cw", -- Open yazi in nthe current working directory
			"<cmd>Yazi cwd<cr>",
		},
	},
	integrations = {
		grep_in_directory = function(directory) -- the default implementation uses telescope if available, otherwise nothing
		end,
	},
	opts = {
		open_for_directories = true,
	},
}
