local wezterm = require("wezterm")

-- auto color scheme
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		-- return "Builtin Tango Dark"
		return "Builtin Dark"
		-- return "Builtin Solarized Dark"
		-- return "nord"
		-- return "Catppuccin Mocha"
		-- return "Ubuntu"
	else
		-- return "Builtin Tango Light"
		-- return "Builtin Light"
		-- return "Builtin Solarized Light"
		-- return "nord-light"
		-- return "nord"
		-- return "Catppuccin Latte"
		return "Ubuntu"
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

return {
    automatically_reload_config = true,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    window_background_opacity = 0.88,
    macos_window_background_blur = 10,
    -- native_macos_fullscreen_mode = true,

    use_fancy_tab_bar = true,
    -- hide_tab_bar_if_only_one_tab = true,

    font = wezterm.font_with_fallback({
        { family = "Hack Nerd Font Mono", weight = "Bold" },
    }),
    font_size = 16.0,

    default_cursor_style = "BlinkingUnderline",
    cursor_thickness = "2pt",
    -- cursor_blink_ease_in = "Linear",
    -- cursor_blink_ease_out = "Linear",

    -- color_scheme = "ToyChest",
    -- color_scheme = "Solarized (dark) (terminal.sexy)",
    -- color_scheme = "Solarized (light) (terminal.sexy)",
    -- color_scheme = "Google (dark) (terminal.sexy)",

    keys = {
    	{
    		key = "f",
    		mods = "CMD|CTRL",
    		action = wezterm.action.ToggleFullScreen,
    	},
    },

    -- default_prog = { "/bin/zsh", "-l" },
}
