return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "biome" },
					typescript = { "biome" },
					css = { "biome" },
					html = { "djlint", "prettierd" },
					json = { "biome" },
					jsonc = { "biome" },
					jinja = { "djlint" },
					python = { "ruff_organize_imports", "ruff_format" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					rust = { "rustfmt" },
					go = { "gofmt" },
					sql = { "sqlfluff" },
					yaml = { "prettierd" },
					markdown = { "prettierd" },
				},
				formatters = {
					sqlfluff = { require_cwd = false },
				},
				format_on_save = {
					lsp_format = "fallback",
					async = false,
					timeout_ms = 500,
				},
			})
		end,
	},
}
