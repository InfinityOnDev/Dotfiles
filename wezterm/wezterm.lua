local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font Settings
config.font_size = 15
config.font = wezterm.font("Fira Code Retina", { weight = "Regular" })
config.line_height = 1.1

-- Colors and Cursor
config.colors = {
  cursor_bg = "white",
  cursor_border = "white",
  tab_bar = {
    background = "#1e1e2e",
    active_tab = {
      bg_color = "#61afef",
      fg_color = "#ffffff",
      intensity = "Bold",
      italic = false,
    },
    inactive_tab = {
      bg_color = "#1e1e2e",
      fg_color = "#888888",
    },
    inactive_tab_hover = {
      bg_color = "#3b3b4d",
      fg_color = "#ffffff",
      italic = true,
    },
    new_tab = {
      bg_color = "#1e1e2e",
      fg_color = "#61afef",
    },
    new_tab_hover = {
      bg_color = "#3b3b4d",
      fg_color = "#ffffff",
      italic = true,
    },
  },
}

-- Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.enable_tab_bar = true

-- Transparency
config.window_background_opacity = 0.67
config.text_background_opacity = 1.0

-- Wayland
config.enable_wayland = true

-- Performance
config.max_fps = 120
config.animation_fps = 60
config.front_end = "OpenGL"

-- Window Padding
config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 2,
}

-- Cursor (non-blinking bar)
config.default_cursor_style = "SteadyBar"

-- Keybindings for Alt+1 through Alt+9 to switch tabs
config.keys = {}
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "ALT",
    action = wezterm.action.ActivateTab(i - 1),
  })
end

return config
