-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.window_background_opacity = 0.50
config.macos_window_background_blur = 20
config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = false
-- config.color_scheme = "ToyChest"
-- config.color_scheme = "Solarized (dark) (terminal.sexy)"
-- config.color_scheme = "Solarized (light) (terminal.sexy)"
-- config.color_scheme = "Google (dark) (terminal.sexy)"
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
config.font_size = 14.0
-- config.cursor_blink_ease_in = "Linear"
-- config.cursor_blink_ease_out = "Linear"

-- auto color scheme
function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Builtin Tango Dark"
	else
		return "Builtin Tango Light"
	end
end

wezterm.on("window-config-reloaded", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = scheme_for_appearance(appearance)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)

-- and finally, return the configuration to wezterm
return config
