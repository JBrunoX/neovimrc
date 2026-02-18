local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua", -- Lua formatter
				"prettier", -- js,ts,css,xml,json,md formatter
				"clang-format", -- C/C++ formatter
			},
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"prettier",
					"ruff",
					"clang-format",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				opts = {
					ensure_installed = {
						"lua_ls",
						"html",
						"cssls",
						"tailwindcss",
						"ts_ls", -- Html, CSS, Tailwind, JavaScript, TypeScript
						"pyright", -- Python
						"clangd", -- C/C++
						"rust_analyzer", -- Rust
						"jsonls", -- JSON
					},
					automatic_enable = {
						exclude = {
							"jdtls", -- Java
						},
					},
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "java",
				callback = function(args)
					require("plugins.jdtls.setup").setup()
				end,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("lua_ls", {})
			vim.lsp.config("ts_ls", {})
			vim.lsp.config("jdtls", {})
			vim.lsp.config("pyright", {
				settings = {
					pyright = {
						disableOrganizeImports = true, -- Leave import organizer to ruff's
					},
					python = {
						analysis = {
							ignore = { "*" }, -- Ignores all files for analysis leaving it all to ruff
						},
					},
				},
			})
			vim.lsp.config("clangd", {})
			vim.lsp.config("rust_analyzer", {})
			vim.lsp.config("jsonls", {})
			vim.lsp.config("html", {})
			vim.lsp.config("cssls", {})
			vim.lsp.config("tailwindcss", {})
			vim.lsp.config("ruff", {})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float) -- Show diagnostic under cursor
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>") -- Show code lsp_references via telescope
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action) -- Show code actions

			local severity = vim.diagnostic.severity

			vim.diagnostic.config({
				signs = {
					text = {
						[severity.ERROR] = " ",
						[severity.WARN] = " ",
						[severity.HINT] = "󰠠 ",
						[severity.INFO] = " ",
					},
				},
			})
		end,
	},
}
