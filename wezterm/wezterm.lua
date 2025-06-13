local home = os.getenv("HOME")

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = false

config.default_cursor_style = "BlinkingUnderline"
config.cursor_thickness = "2pt"
-- config.cursor_blink_ease_in = "Linear"
-- config.cursor_blink_ease_out = "Linear"

config.font_rules = {
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font_with_fallback({
			family = "Hack Nerd Font Mono",
			weight = "Bold",
			italic = true,
		}),
	},
}
config.font_size = 20.0

config.window_background_opacity = 0.70
config.macos_window_background_blur = 50

-- config.background = {
-- 	{
-- 		source = {
-- 			File = home.."/.config/wezterm/board.jpg"
-- 		},
-- 		hsb = {
-- 			hue = 1.0,
-- 			saturation = 1.0,
-- 			brightness = 1.0,
-- 		},
-- 		width = '100%',
-- 		height = '100%',
-- 		opacity = 0.10
-- 	},
-- 	{
-- 		source = {
-- 			Color = '#FFFFFF',
-- 		},
-- 		width = '100%',
-- 		height = '100%',
-- 		opacity = 0.75
-- 	}
-- }

-- config.color_scheme = "ToyChest"
-- config.color_scheme = "Solarized (dark) (terminal.sexy)"
-- config.color_scheme = "Solarized (light) (terminal.sexy)"
-- config.color_scheme = "Google (dark) (terminal.sexy)"

-- auto color scheme
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		-- return "Builtin Tango Dark"
		-- return "Builtin Dark"
		-- return "Builtin Solarized Dark"
		return "nord"
	else
		-- return "Builtin Tango Light"
		-- return "Builtin Light"
		-- return "Builtin Solarized Light"
		-- return "nord-light"
		return "nord"
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

config.native_macos_fullscreen_mode = true
config.keys = {
	{
		key = "f",
		mods = "CMD|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- and finally, return the configuration to wezterm
return config
