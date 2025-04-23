return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        -- normal mode bindings
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          -- tables with just a `desc` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          -- Open Neotree
          ["<Leader>e"] = { "<cmd>Neotree <cr>", desc = "Neotree" },
          ["<Leader>vs"] = { "<cmd>vsplit<cr>", desc = "V Split" },
          ["<tab>"] = { "<cmd>bnext<cr>", desc = "Next Tab" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
