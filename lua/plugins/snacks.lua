return {
	{
		"folke/snacks.nvim",
		opts = {
			bigfile = { enabled = true },
			quickfile = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = true },
			scroll = { enabled = true },
			scope = { enabled = true },
			indent = {
				animate = { enabled = false }, -- turn off the scope animation
				scope = { enabled = true }, -- keep the active-scope highlight
			},
		},
	},
}
