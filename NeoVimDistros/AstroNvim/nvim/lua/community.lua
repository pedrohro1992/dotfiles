-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.rainbow-delimiter-indent-blankline" },

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  -- import/override with your plugins folder
}
