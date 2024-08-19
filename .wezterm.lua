-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- my coolnight colorscheme
config.color_scheme = "Adventure"
config.font = wezterm.font("NotoMono Nerd Font")
config.font_size = 19
config.use_fancy_tab_bar = true
config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.87
config.macos_window_background_blur = 9

-- and finally, return the configuration to wezterm
return config
