return {
  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'nvimtools/none-ls.nvim',
    },
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup()
      -- require 'your.null-ls.config' -- require your null-ls config here (example below)
    end,
  },
}
