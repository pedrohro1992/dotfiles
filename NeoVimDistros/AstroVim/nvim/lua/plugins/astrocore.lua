-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    autocmds = {
      -- autocommands are organized into augroups for easy management
      autohidetabline = {
        -- each augroup contains a list of auto commands
        {
          -- create a new autocmd on the "User" event
          event = "User",
          -- the pattern is the name of our User autocommand event
          pattern = "AstroBufsUpdated", -- triggered when vim.t.bufs is updated
          -- nice description
          desc = "Hide tabline when only one buffer and one tab",
          -- add the autocmd to the newly created augroup
          group = "autohidetabline",
          callback = function()
            -- if there is more than one buffer in the tab, show the tabline
            -- if there are 0 or 1 buffers in the tab, only show the tabline if there is more than one vim tab
            local new_showtabline = #vim.t.bufs > 1 and 2 or 1
            -- check if the new value is the same as the current value
            if new_showtabline ~= vim.opt.showtabline:get() then
              -- if it is different, then set the new `showtabline` value
              vim.opt.showtabline = new_showtabline
            end
          end,
        },
      },
      neotreeopen = {
        -- each augroup contains a list of auto commands
        {
          -- create a new autocmd on the "User" event
          event = "User",
          -- the pattern is the name of our User autocommand event
          pattern = "AstroBufsUpdated", -- triggered when vim.t.bufs is updated
          -- nice description
          desc = "Hide tabline when only one buffer and one tab",
          -- add the autocmd to the newly created augroup
          group = "autohidetabline",
          callback = function()
            -- se funcionar atualizar comentario
            -- TODO: VERIFICAR COMO FAZER ESSA LOGICA
            local wins = vim.api.nvim_tabpage_list_wins(0)
            if #wins <= 1 then
              -- if it is different, then set the new `showtabline` value
              vim.cmd "Neotree show"
            end
          end,
        },
      },
    },
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bc"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
