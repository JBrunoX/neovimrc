return {
	{
		"kndndrj/nvim-dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup({
				default_connection = nil,
				sources = {
					require("dbee.sources").EnvSource:new("DBE_CONNECTIONS"),
					require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
				},
				mappings = {
					-- Run Full Query
					{ key = "run", mode = "n", action = "run_file", desc = "Run full query" },
					-- Run Selected Line In Query
					{ key = "run", mode = "v", action = "run_file", desc = "Run selection of query" },
				},
			})
		end,
	},
}
