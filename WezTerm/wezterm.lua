-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- Always start WezTerm maximized
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

local mux = wezterm.mux

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

-- Configure leader
-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

-- ###########################################
-- Aparence:

-- Window Decoration and Tabs
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
wezterm.on("update-status", function(window, pane)
	-- Workspace name
	local stat = window:active_workspace()
	local stat_color = "#f7768e"
	-- It's a little silly to have workspace name all the time
	-- Utilize this to display LDR or current key table name
	if window:active_key_table() then
		stat = window:active_key_table()
		stat_color = "#7dcfff"
	end
	if window:leader_is_active() then
		stat = "LDR"
		stat_color = "#bb9af7"
	end

	local basename = function(s)
		-- Nothing a little regex can't fix
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end

	-- Left status (left of the tab line)
	window:set_right_status(wezterm.format({
		{ Foreground = { Color = stat_color } },
		{ Text = "|  " },
		{ Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
		{ Text = " |" },
	}))

	-- Right status
end)
-- Theme
config.color_scheme = "Catppuccin Mocha (Gogh)"

-- Font Conf
config.font = wezterm.font("CaskaydiaMono Nerd Font")
config.font_size = 13

-- Desable the defaults keymaps
config.disable_default_key_bindings = true

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
		key = "y",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SwitchToWorkspace({
			name = "default",
		}),
	},
	-- Prompt for a name to use for a new workspace and switch to it.
	{
		key = "W",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						wezterm.action.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
	{
		key = "F",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
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

-- Plugins
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config)
bar.apply_to_config(config, {
	position = "top",
	modules = {
		username = {
			enabled = false,
		},
		hostname = {
			enabled = false,
		},
		clock = {
			enabled = false,
		},
		cwd = {
			enabled = false,
		},
	},
})

local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
workspace_switcher.apply_to_config(config)

-- return the config to wezterm
return config
