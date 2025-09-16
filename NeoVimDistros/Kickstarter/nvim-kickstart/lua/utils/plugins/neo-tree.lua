return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    'antosha417/nvim-lsp-file-operations',
  },
  lazy = false,
  keys = {
    { '<leader>e', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>E', ':Neotree close<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    sources = { 'filesystem', 'git_status' },
    default_component_configs = {

      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = '',
        expander_expanded = '',

        expander_highlight = 'NeoTreeExpander',
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      window = {
        width = 30,
        mappings = {
          ['<leader>E'] = 'close_window',
        },
      },
    },
  },
}
