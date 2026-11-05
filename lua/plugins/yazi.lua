return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		{
			"<leader>e", -- Open yazi at the current file
			"<cmd>Yazi<cr>",
            desc = "Open Yazi at current file"
		},
		{
			"<leader>cw", -- Open yazi in the current working directory
			"<cmd>Yazi cwd<cr>",
            desc = "Open Yazi at current working directory"
		},
	},
	integrations = {
		grep_in_directory = function(directory) -- the default implementation uses telescope if available, otherwise nothing
		end,
	},
	opts = {
		open_for_directories = true, -- replaces netrw with yazi
	},
    init = function()
        vim.g.loaded_netrwPlugin = 1 -- marks netrw as already loaded
    end,
}
