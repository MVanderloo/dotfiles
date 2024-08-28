local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- color scheme
config.color_scheme = "Dark+"
-- config.color_scheme = "Dark Pastel"
-- config.color_scheme = "Tokyo Night"
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "ayu"
-- config.color_scheme = "Dracula (base16)"

-- font settings
config.font_size = 12.5 -- the perfect font size
config.font = wezterm.font("JetbrainsMono Nerd Font")

-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false

-- window settings
config.window_background_opacity = 1
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.swallow_mouse_click_on_window_focus = false
config.adjust_window_size_when_changing_font_size = false

-- misc
config.audible_bell = "Disabled" -- stfu
config.use_dead_keys = false -- apparently helpful for vim
config.scrollback_lines = 10000
config.automatically_reload_config = true

-- keybindings
config.keys = {
	{ key = "L", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
	{ key = "P", mods = "CTRL", action = wezterm.action.ActivateCommandPalette },
	{ key = "f", mods = "CTRL|CMD", action = wezterm.action.ToggleFullScreen },
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
}

return config
