-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.background = "dark"
require("catppuccin").setup({
  transparent_background = true,
})
vim.cmd.colorscheme("catppuccin")
