-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- ########################################### 
-- General congis:

-- Set the default domain to WSL Ubuntu
config.default_domain = "WSL:Ubuntu"

-- Set the GPU Driver for the terminal
config.front_end = "WebGpu"

-- ########################################### 
-- Aparence: 

-- Window Decoration and Tabs
config.window_decorations = "RESIZE | TITLE"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true


-- Theme
config.color_scheme = "Kanagawa (Gogh)"


-- Font Conf
config.font = wezterm.font("CaskaydiaMono Nerd Font")
config.font_size = 13

-- ########################################### 

--KeyMaps
config.keys = {
	{
		key = "%",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "\"",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "z",
		mods = "CTRL|SHIFT",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "k",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "l",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "h",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
}


-- return the config to wezterm
return config
