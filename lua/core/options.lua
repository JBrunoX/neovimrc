local options = {
	number = true, -- Adds line numbers
	cursorline = true, -- Adds a cursor line
	relativenumber = true, -- Adds relative numbers
	tabstop = 4, -- Sets tab length
	shiftwidth = 4, -- Sets auto tab length
	expandtab = true, -- Uses spaces instead of tabs
	showmode = false, -- Disables editing mode shown (lualine already does this)
	clipboard = "unnamedplus", -- Syncs neovim clipbard with OS clipboard
	undofile = true,
	ignorecase = true,
	smartcase = true,
	updatetime = 250,
	timeoutlen = 300,
	confirm = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
