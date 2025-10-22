local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

return {
    {
	"thesimonho/kanagawa-paper.nvim",
	lazy = false,
	priority = 1000,
	init = function()
	    vim.cmd.colorscheme("kanagawa-paper")
	    enable_transparency()
	end,
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = "kanagawa-paper",
	}
    },    
}
