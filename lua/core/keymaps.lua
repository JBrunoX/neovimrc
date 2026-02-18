vim.g.mapleader = " " --Sets leader key to space bar
vim.keymap.set("n", "<leader>e", vim.cmd.Ex) -- Open file explorer

-- Vim Motions
vim.keymap.set({ "n", "v" }, "cm", "gcc", { remap = true }) -- Comment out Line
vim.keymap.set({ "n", "v" }, "00", "$", { remap = true }) -- Jump to end of current line
vim.keymap.set({ "n", "v" }, "11", "^", { remap = true }) -- Jump to start of current line

-- Window Manipulation
vim.keymap.set({ "n", "v" }, "<leader>vs", ":vsplit<CR>", { remap = true }) -- Open vertical split window
vim.keymap.set({ "n", "v" }, "<leader>hs", ":split<CR>", { remap = true }) -- Open horizontal split window
vim.keymap.set({ "n", "v" }, "<C-h>", "<C-w>h", { remap = true }) -- Move to left window
vim.keymap.set({ "n", "v" }, "<C-j>", "<C-w>j", { remap = true }) -- Move to bottom window
vim.keymap.set({ "n", "v" }, "<C-k>", "<C-w>k", { remap = true }) -- Move to top window
vim.keymap.set({ "n", "v" }, "<C-l>", "<C-w>l", { remap = true }) -- Move to bottom window
vim.keymap.set({ "n", "v" }, "<leader>q", "<cmd>close<CR>", { remap = true }) -- Close current window
vim.keymap.set({ "n", "v" }, "<C-Up>", ":resize -1<CR>", { silent = true }) -- Resize window up
vim.keymap.set({ "n", "v" }, "<C-Down>", ":resize +1<CR>", { silent = true }) -- Resize window down
vim.keymap.set({ "n", "v" }, "<C-Left>", ":vertical resize -1<CR>", { silent = true }) -- Resize window left
vim.keymap.set({ "n", "v" }, "<C-Right>", ":vertical resize +1<CR>", { silent = true }) -- Resize window right
