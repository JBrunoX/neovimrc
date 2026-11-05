local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return {
	{
		"mason-org/mason.nvim", -- Core mason package manager
		opts = {
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
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Auto installs any mason package (will reserve for non-lsp)
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua", -- Lua fomatter
					"biome", -- JS, TS, CSS, JSON formatter & linter
					"prettierd", -- html, json, md, yaml formatter
					"djlint", -- Jinja linter
					"ruff", -- Python formatter & linter
					"clang-format", -- C/CPP formatter
					"sqlfluff", -- SQL formatter & linter
					"jinja_lsp", -- Jinja
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim", -- Auto installs LSP servers via mason & connects them to lspconfig
		opts = {
			ensure_installed = {
				"lua_ls", -- Lua
				"html", -- HTMl
				"cssls", -- CSS
				"tailwindcss", -- Tailwind CSS
				"ts_ls", -- JavaScript, TypeScript
				"ty", -- Python
				"clangd", -- C/C++
				"rust_analyzer", -- Rust
				"jsonls", -- JSON
				"jinja_lsp", -- Jinja
				"qmlls", -- QML
				"arduino_language_server", -- Arduino
				"sqls", -- SQL
			},
			automatic_enable = {
				exclude = {
					"jdtls", -- Java
				},
			},
		},
	},
	{
		"mfussenegger/nvim-jdtls", -- Java-specific LSP plugin
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
		"neovim/nvim-lspconfig", -- Core LSP client configuration
		config = function()
			vim.lsp.config("*", {
				capabilities = capabilities,
			})
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						workspace = {
							library = {
								"usr/share/hypr/stubs", -- Hyprland
							},
						},
						diagnostics = {
							globals = { "hl" }, -- Prevents "undefined global hl"
						},
					},
				},
			})
			vim.lsp.config("ts_ls", {})
			vim.lsp.config("jdtls", {})

			vim.lsp.config("ruff", {
				init_options = {
					settings = {
						configuration = {
							lint = {
								unfixable = { "F401" },
								fixable = { "I001" },
							},
						},
					},
				},
			})
			vim.lsp.config("ty", {})
			vim.lsp.config("clangd", {})
			vim.lsp.config("rust_analyzer", {})
			vim.lsp.config("jsonls", {})
			vim.lsp.config("html", {})
			vim.lsp.config("cssls", {})
			vim.lsp.config("tailwindcss", {})
			vim.lsp.config("jinja-lsp", {})
			vim.lsp.config("qmlls", {
				cmd = { "qmlls6" },
			})
			vim.lsp.config("arduino_language_server", {})
			vim.lsp.config("sqls", {
				on_init = function(client)
					client.server.capabilities.documentFormattingProvider = false
					client.server.capabilities.documentRangeFormattingProvider = false
				end,
			})

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
