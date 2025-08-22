-- [[ Basic Keymaps ]]
vim.keymap.set('n', '<leader>w', '<cmd>:w!<CR>', { desc = 'Save current file' })
vim.keymap.set('n', '<leader>qa', '<cmd>:qa!<CR>', { desc = 'Exit Vim' })

-- [[ Back to Normal Mode from Insert Mode with jk ]]
vim.keymap.set('i', 'jk', '<esc>')

-- [[ Clear All search highlights ]]
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- [[ Change buffers with <tab> ]]
vim.keymap.set('n', '<tab>', '<cmd>BufferLineCycleNext<cr>')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
