-- [[ Normal Mode ]]
vim.keymap.set("n", "<leader>w", "<cmd>:w!<CR>", { desc = "Save current file" })
vim.keymap.set("n", "<leader>qa", "<cmd>:qa!<CR>", { desc = "Exit Vim" })
vim.keymap.set("n", "<leader>qq", "<cmd>:q<CR>", { desc = "Exit Vim/Close current pane" })
vim.keymap.set("n", "<leader>vs", "<cmd>:vsplit<CR>", { desc = "Vertical Split" })
vim.keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Circle tabs with tab" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear All search highlights" })
vim.keymap.set("n", "<leader>e", "<CMD>Neotree float<CR>", { desc = "Open parent directory" })
-- [[ Insert Mode ]]
vim.keymap.set("i", "jk", "<esc>", { desc = "Back to Normal Mode from Insert Mode with jk" })
