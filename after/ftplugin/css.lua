vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.expandtab = true

-- CSS Boilerplate
vim.keymap.set({ "n", "v" }, "<leader>bp", function()
	if vim.bo.filetype == "css" then
		vim.cmd("0r ~/.config/nvim/lua/utils/skeleton.css")
	end
end, { desc = "Insert CSS Template" })
