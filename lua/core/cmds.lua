-- Spellcheck in md
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal spell wrap",
})

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- Shorthand to simulate depreciated LspInfo
vim.api.nvim_create_user_command("Lsp", function()
	vim.cmd("checkhealth vim.lsp")
end, {})

-- Shorthand to start a new notebook
vim.api.nvim_create_user_command("NewNotebook", function()
	vim.cmd("JupynvimOpen notebook.ipynb")
end, {})

-- Shorthand for live-preview
vim.api.nvim_create_user_command("Lp", function(opts)
	vim.cmd("LivePreview " .. opts.args)
end, { nargs = "*" })

-- Detach Lsp from current buffer
vim.api.nvim_create_user_command("LspDetach", function()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		vim.notify("No active LSP clients attached to this buffer.")
		return
	end
	for _, client in ipairs(clients) do
		vim.lsp.buf_detach_client(0, client.id)
	end
	vim.notify("Detached all LSP clients from the current buffer.")
end, {})

-- Automatically chooses between treesitter or native config to handle folds
local fold_group = vim.api.nvim_create_augroup("TSFoldingFallback", { clear = true })

vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
	group = fold_group,
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
		local has_parser = lang and vim.treesitter.parsers.has_parser(lang)

		if has_parser then
			-- Use semantic Tree-sitter folding (collapses by bracket/blocks)
			vim.wo.foldmethod = "expr"
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		else
			-- Fall back to standard horizontal indent folding
			vim.wo.foldmethod = "indent"
		end

		-- Enforce window-local level overrides so newly loaded buffers stay open
		vim.wo.foldlevel = 99
		vim.wo.foldenable = true
	end,
})
