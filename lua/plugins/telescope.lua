return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local builtin = require("telescope.builtin")
	telescope.setup({
	    defaults = {
		path_display = {"smart"}, -- Shortens displayed file paths when safe
		mappings = {
		    i = { -- Use insert vim motions to scroll files
			["<C-k>"] = actions.move_selection_previous, 
			["<C-j>"] = actions.move_selection_next,
		    },
		}
	    }
	})
	-- Keybinds
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  vim.keymap.set('n', '<leader>fr', require('telescope.builtin').lsp_references, {})
    end,
}
