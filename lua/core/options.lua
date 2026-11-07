local options = {
	number = true, -- adds line numbers
	cursorline = true, -- adds a cursor line
	relativenumber = true, -- adds relative numbers
	tabstop = 4, -- sets tab length
	shiftwidth = 4, -- sets auto tab length
	expandtab = true, -- uses spaces instead of tabs
	showmode = false, -- disables editing mode shown (lualine already does this)
	clipboard = "unnamedplus", -- syncs neovim clipboard with OS clipboard
	undofile = true,
	ignorecase = true,
	smartcase = true,
	updatetime = 250,
	timeoutlen = 500, -- controls how long to wait pressing part of mapped sequence
	confirm = true,
	-- Configure Spell Check
	spell = true, -- enables spell checking
	spelllang = "en_us", -- set spellcheck to US english
	spellfile = vim.fn.expand("~/.config/nvim/lua/spell/en.utf-8.add"), -- set path for dictionary
	-- Configure Folds
	foldenable = true,
	foldlevel = 99, -- don't fold everything by default
	foldcolumn = "1", -- set with of indent column
	foldtext = "v:lua.custom_fold_text",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.autoformat = true
vim.opt.fillchars:append({ fold = " " })

-- Custom fold visual
_G.custom_fold_text = function()
	local line = vim.fn.getline(vim.v.foldstart)
	local line_count = vim.v.foldend - vim.v.foldstart + 1
	return line .. "  ↔  (" .. line_count .. " lines folded)"
end
