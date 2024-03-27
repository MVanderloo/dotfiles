local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- color scheme
-- config.color_scheme = "Dark+" -- OneDark
-- config.color_scheme = "Dark Pastel" -- Clean ANSI dark
config.color_scheme = "Tokyo Night"
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Eldritch"

-- font settings
config.font = wezterm.font_with_fallback({ "CommitMono" })
config.font_size = 12

-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
-- config.show_close_tab_button_in_tabs = false -- only in nightly

-- window settings
-- config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.swallow_mouse_click_on_window_focus = false
config.adjust_window_size_when_changing_font_size = false

-- performance
config.max_fps = 240
config.animation_fps = 60

-- misc
config.audible_bell = "Disabled" -- stfu
config.use_dead_keys = false -- apparently helpful for vim
config.scrollback_lines = 1000000
config.automatically_reload_config = true

-- keybindings
-- config.keys = {
-- 	{ key = "l", mods = "CMD", action = wezterm.action.ShowDebugOverlay },
-- 	{ key = "p", mods = "CMD", action = wezterm.action.ActivateCommandPalette },
-- 	{ key = "f", mods = "CTRL|CMD", action = wezterm.action.ToggleFullScreen },
-- 	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
-- }

return config
