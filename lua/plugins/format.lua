return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					css = { "prettier" },
					html = { "prettier" },
					python = { "ruff" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					go = { "gofmt" },
					rust = { "rustfmt" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
				},
				format_on_save = {
					lsp_format = "fallback",
					async = false,
					timeout_ms = 500,
				},
				vim.keymap.set({ "n", "v" }, "<leader>cf", function()
					require("conform").format({
						lsp_fallback = true,
						async = false,
						timeout_ms = 1000,
					})
				end, { desc = "Format file or range (in visual mode)" }),
			})
		end,
	},
}
