return {
    {
	'ojroques/vim-oscyank', -- Allows copying to clipboard in ssh tunnels
    },
    { 
	'brenoprata10/nvim-highlight-colors', -- Displays colors in .css files
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },
}

