-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.window_background_opacity = 0.4
config.macos_window_background_blur = 50
config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = false
-- config.color_scheme = "Solarized Dark - Patched"
-- config.color_scheme = "Solarized (dark) (terminal.sexy)"
config.color_scheme = "Solarized Dark (Gogh)"
-- config.color_scheme = "Solarized Dark Higher Contrast"
config.font_rules = {
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font_with_fallback({
			family = "Hack Nerd Font Mono",
			italic = true,
		}),
	},
}
config.font_size = 16.0

-- and finally, return the configuration to wezterm
return config
