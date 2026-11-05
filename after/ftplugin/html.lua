vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.expandtab = true

-- HTML Boilerplate
vim.keymap.set({ "n", "v" }, "<leader>bp", function()
	if vim.bo.filetype == "html" then
		vim.cmd("0r ~/.config/nvim/lua/utils/skeleton.html")
	end
end, { desc = "Insert HTML Template" })
