-- Pull in the wezterm API
local wt = require "wezterm"

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wt.config_builder then
  config = wt.config_builder()
end

-- This is where you actually apply your config choices

-- COLORS
config.color_scheme = "carbonfox"

-- FONT
config.font = wt.font({
	family = "JetBrainsMono Nerd Font",
	harfbuzz_features = { 'liga=1' },
})

config.font_size = 12.5

-- and finally, return the configuration to wezterm
return config
