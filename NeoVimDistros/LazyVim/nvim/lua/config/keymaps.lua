--Misc keymap
vim.keymap.set("n", "<leader>w", "<cmd> w! <cr>", { desc = "Safe file in the current buffer" })

vim.keymap.set("n", "<leader>q", "<cmd> q <cr>", { desc = "Close current buffer" })

vim.keymap.set("n", "<leader>qb", "<cmd> BufferClose <cr>", { desc = "Close current buffer" })

vim.keymap.set("n", "<leader>qa", "<cmd> qa! <cr>", { desc = "Close all buffers and exit" })

vim.keymap.set("n", "<leader>wq", "<cmd> x <cr>", { desc = "Save and exit file" })

vim.keymap.set("n", "<leader>vs", "<cmd> vsplit <cr>", { desc = "Split window on vertical" })

-- Custom Plugins Keymaps
vim.keymap.set("n", "<leader>e", "<cmd> Neotree <cr>", { desc = "Open NeoTree" })

vim.keymap.set("n", "<leader>gg", "<cmd> LazyGit <cr>", { desc = "Open LazyGit" })

vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight <cr>", { desc = "Jump to Right Split" })

vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft <cr>", { desc = "Jump to Left Split" })

vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown <cr>", { desc = "Jump to Left Split" })

--Back to normal mode using j j
vim.keymap.set("i", "jk", "<esc>")

-- Move cut to the _ register
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("v", "x", '"_x')

--Select All

vim.keymap.set("n", "<tab>", "<cmd> bnext <cr>", { desc = "Move to Next Tab" })

vim.keymap.set("n", "<space><tab>", "<cmd> bprevious <cr>", { desc = "Move to Previous Tab" })
