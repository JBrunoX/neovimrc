vim.g.mapleader = " " --Sets leader key to space bar
vim.keymap.set("n", "<leader>e", vim.cmd.Ex) -- Open file explorer

-- Vim Motions
vim.keymap.set({ "n", "v" }, "cm", "gcc", { remap = true, desc = "Comment out line" }) -- Comment out Line
vim.keymap.set("n", "<leader>za", "zg", { remap = true, desc = "Add word under cursor to dictionary" })
vim.keymap.set("n", "<leader>zw", "zw", { desc = "Mark word under cursor as 'wrong'" })
vim.keymap.set("n", "<leader>zua", "zug", { desc = "Remove 'good' status from word under cursor" })
vim.keymap.set("n", "<leader>zuw", "zw", { desc = "Remove 'wrong' status from word under cursor" })

-- Window Manipulation
vim.keymap.set({ "n", "v" }, "<leader>vs", "<cmd>vsplit<CR>", { remap = true, desc = "Open vertical split window" }) -- Open vertical split window
vim.keymap.set({ "n", "v" }, "<leader>hs", "<cmd>split<CR>", { remap = true, desc = "Open horizontal split window" }) -- Open horizontal split window
vim.keymap.set({ "n", "v" }, "<C-h>", "<C-w>h", { remap = true, desc = "Navigate to left window" }) -- Navigate to left window
vim.keymap.set({ "n", "v" }, "<C-j>", "<C-w>j", { remap = true, desc = "Navigate to bottom window" }) -- Navigate to bottom window
vim.keymap.set({ "n", "v" }, "<C-k>", "<C-w>k", { remap = true, desc = "Navigate to top window" }) -- Navigate to top window
vim.keymap.set({ "n", "v" }, "<C-l>", "<C-w>l", { remap = true, desc = "Navigate to right window" }) -- Navigate to right window
vim.keymap.set({ "n", "v" }, "<leader>q", "<cmd>close<CR>", { remap = true, desc = "Close current window" }) -- Close current window
vim.keymap.set({ "n", "v" }, "<C-Up>", "<cmd>resize -1<CR>", { silent = true, desc = "Resize window up" }) -- Resize window up
vim.keymap.set({ "n", "v" }, "<C-Down>", "<cmd>resize +1<CR>", { silent = true, desc = "Resize window down" }) -- Resize window down
vim.keymap.set({ "n", "v" }, "<C-Left>", "<cmd>vertical resize -1<CR>", { silent = true, desc = "Resize window left" }) -- Resize window left
vim.keymap.set(
	{ "n", "v" },
	"<C-Right>",
	"<cmd>vertical resize +1<CR>",
	{ silent = true, desc = "Resize window right" }
) -- Resize window right

-- Open nvim-dbee
vim.keymap.set({ "n", "v" }, "<leader>db", "<cmd>Dbee open<CR>", { desc = "Open Dbee" })
