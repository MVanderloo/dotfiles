local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- color scheme
-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Tokyo Night"

-- font settings
config.font_size = 12.5 -- evidently the perfect font size
-- config.font = wezterm.font("JetbrainsMono Nerd Font")
config.font = wezterm.font("FiraCode Nerd Font Ret")

-- background style
config.window_background_opacity = 0.7
config.native_macos_fullscreen_mode = false -- allows wallpaper to show through transparent background in fullscreen
config.macos_window_background_blur = 100

-- clean up title bar
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "None" -- "INTEGRATED_BUTTONS | RESIZE"
-- config.window_frame = { font = wezterm.font({ family = "Noto Sans", weight = "Regular" }) } -- tab bar font

config.keys = {
	{ key = "L", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
	{ key = "P", mods = "CTRL", action = wezterm.action.ActivateCommandPalette },
	{ key = "f", mods = "CTRL|CMD", action = wezterm.action.ToggleFullScreen }, -- wezterm fullscreen lets you see wallpaper, override default macos
}

-- misc
config.audible_bell = "Disabled" -- stfu
config.use_dead_keys = false -- apparently helpful
config.scrollback_lines = 5000
config.adjust_window_size_when_changing_font_size = false -- let yabai manage windows

return config
