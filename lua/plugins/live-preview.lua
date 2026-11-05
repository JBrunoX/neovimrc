return {
	"brianhuster/live-preview.nvim",
	dependencies = {
		-- You can choose one of the following pickers
		"nvim-telescope/telescope.nvim",
		-- "ibhagwan/fzf-lua",
		-- "echasnovski/mini.pick",
		-- "folke/snacks.nvim",
	},
	require("livepreview.config").set({
		port = 5500,
		browser = "chromium",
		dynamic_root = false,
		sync_scroll = true,
		picker = "",
		address = "127.0.0.1",
	}),
}
