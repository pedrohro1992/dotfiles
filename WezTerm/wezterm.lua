-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

--Enumerate gpus
local gpus = wezterm.gui.enumerate_gpus()

config.webgpu_preferred_adapter = gpus[1]
config.front_end = "WebGpu"

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end
-- Configure Leader 
-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

--KeyMaps
config.keys = {
-- Better Experience with split panels
  {
    key = '%',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '"',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'z',
    mods = 'LEADER',
    action = wezterm.action.TogglePaneZoomState ,
  },

-- Navigation maps
  {
    key = 'k',
    mods = 'CTRL',
 	action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CTRL',
 	action = wezterm.action.ActivatePaneDirection 'Down',
  },
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
  },
}

-- Set the default domain to WSL Ubuntu
config.default_domain = "WSL:Ubuntu"
-- Apperance
-- Window Decoration and Tabs
config.window_decorations = "TITLE | RESIZE"
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- theme
config.color_scheme = "Catppuccin Mocha (Gogh)"

-- Font Conf
config.font = wezterm.font("CaskaydiaMono Nerd Font")
config.font_size = 12
config.front_end = "WebGpu"
-- return the config to wezterm
return config
