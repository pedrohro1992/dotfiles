-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Always start WezTerm maximized
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- This table will hold the configuration.
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- ###########################################
-- General congis:
-- Performance settings
-- Configure GPU Render
config.front_end = "OpenGL"
-- config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.max_fps = 120
config.animation_fps = 1
-- config.window_background_opacity = 0.95
config.enable_scroll_bar = false
config.use_fancy_tab_bar = true
config.term = "xterm-256color"
config.warn_about_missing_glyphs = false
config.enable_wayland = false
config.webgpu_power_preference = "HighPerformance"
config.prefer_egl = true
config.freetype_load_target = "Light"
-- config.freetype_render_target = "HorizontalLcd"

-- Configure leader
-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

-- ###########################################
-- Aparence:

-- Window Decoration and Tabs
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false

-- Theme
config.color_scheme = "Catppuccin Mocha (Gogh)"
-- Font Conf
config.font = wezterm.font("CaskaydiaMono Nerd Font")
config.font_size = 13

-- ###########################################

--KeyMaps
config.keys = {
	-- Split Panes
	{
		key = "%",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = '"',
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "z",
		mods = "LEADER|SHIFT",
		action = wezterm.action.TogglePaneZoomState,
	},

	-- Windows and Panes
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "c",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SpawnWindow,
	},

	-- Navegation Maps
	--
	-- Panes
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
	-- Tabs
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},

	-- Workspaces
	{
		key = "N",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SwitchWorkspaceRelative(1),
	},
	{
		key = "P",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SwitchWorkspaceRelative(-1),
	},

	-- Create and find Workspaces
	-- Switch to the default workspace
	{
		key = "d",
		mods = "LEADER",
		action = wezterm.action.SwitchToWorkspace({
			name = "default",
		}),
	},

	-- Leader
	{
		key = "a",
		mods = "LEADER|CTRL",
		action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
	},

	-- Editing
	{
		key = "c",
		mods = "ALT",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = "ALT",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
}

-- Desable the defaults keymaps
config.disable_default_key_bindings = false

-- ###########################################

-- Plugins:
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup()

local wpr = wezterm.plugin.require("https://github.com/vieitesss/workspacesionizer.wezterm")
wpr.apply_to_config(config, {
	paths = { "~/Workspace/github.com/*", "~/Workspace/misc.local/*" },
	git_repos = false,
	show = "full",
	binding = {
		key = "o",
		mods = "LEADER",
	},
})

return config
