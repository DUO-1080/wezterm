local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- key binding
config.keys = {
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "Enter",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SendString("\x1b[13;6u"),
	},
	{
		key = "Enter",
		mods = "CTRL",
		action = wezterm.action.SendString("\x1b[13;5u"),
	},
	{
		key = "Enter",
		mods = "SHIFT",
		action = wezterm.action.SendString("\x1b[13;2u"),
	},
	{
		key = "q",
		mods = "CTRL",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "Space",
		mods = "WIN",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

-- color scheme
local elighties_theme = wezterm.color.get_builtin_schemes()["Eighties (dark) (terminal.sexy)"]
local ever_forest_theme = wezterm.color.get_builtin_schemes()["Everforest Dark (Gogh)"]

ever_forest_theme.cursor_bg = elighties_theme.cursor_bg
ever_forest_theme.cursor_fg = elighties_theme.cursor_fg

config.color_schemes = {
	["ever_forest"] = ever_forest_theme,
}

config.color_scheme = "ever_forest"

-- font
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 18
config.line_height = 1.2

-- window
config.window_decorations = "NONE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- tab bar
config.enable_tab_bar = false

-- launch prog
config.default_prog = { "/bin/zsh", "-l", "-c", "~/.config/wezterm/start-tmux.sh" }

-- event
wezterm.on("gui-startup", function()
	local _, _, window = wezterm.mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
