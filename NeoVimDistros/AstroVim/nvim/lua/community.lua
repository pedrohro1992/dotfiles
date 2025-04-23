-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- Misc
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  -- Language Packages
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.docker" },
  -- Colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },
}
