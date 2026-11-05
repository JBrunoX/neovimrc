return {
	{
		"sheng-tse/jupynvim",
		build = function(plugin)
			local install = loadfile(plugin.dir .. "/lua/jupynvim/install.lua")()
			install.run(plugin)
		end,
		config = function()
			require("jupynvim").setup({
				log_level = "info",
				image_renderer = "kitty",
				auto_venv = true,
				keymaps = {
					-- Cell execution
					run_advance = "<S-CR",
					run_stay = "<C-CR>",
					clear_output = "<leader>C",

					-- Cell editing
					add_above = "<leader><up>",
					add_below = "<leader><down>",
					delete_cell = "<leader>dc",
					next_cell = "<leader>j",
					prev_cell = "<leader>k",
					to_markdown = "<leader>m",
					-- to_code = "<leader>c",

					-- Kernel control
					pick_kernel = "<leader>pk",
					start_kernel = "<leader>st",
					stop_kernel = "<leader>sp",
				},
			})
		end,
	},
}
