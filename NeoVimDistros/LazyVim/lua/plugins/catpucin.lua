return {
  {
    'catppuccin/nvim',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('catppuccin').setup {
        transparent_background = true, -- disables setting the background color.
      }

      -- vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
