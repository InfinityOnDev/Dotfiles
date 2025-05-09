local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font Settings
config.font_size = 15
config.font = wezterm.font("Fira Code Retina", { weight = "Regular" })
config.line_height = 1.3

-- Colors and Cursor
config.colors = {
  cursor_bg = "white",
  cursor_border = "white",
  tab_bar = {
    -- Use a fully transparent black instead of #00000000
    background = "transparent",
    active_tab = {
      bg_color = "#4e8de3",
      fg_color = "#ffffff",
      intensity = "Bold",
      italic = false,
    },
    inactive_tab = {
      bg_color = "#333333",
      fg_color = "#8a8a8a",
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
      bg_color = "#4e8de3",
      fg_color = "#ffffff",
      italic = true,
    },
  },
}

-- Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.enable_tab_bar = true
config.tab_bar_at_bottom = true -- Corrected option for bottom tab bar

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

-- Cursor
config.default_cursor_style = "SteadyBar"

-- Keybindings
config.keys = {}
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "ALT",
    action = wezterm.action.ActivateTab(i - 1),
  })
end

-- Powerline Tab Bar Formatting
local function powerline_tab_title(tab)
  local background = tab.is_active and "#4e8de3" or "#333333"
  local foreground = tab.is_active and "#ffffff" or "#8a8a8a"
  local separator = ""

  local parts = {}

  -- Left separator
  if tab.index > 0 then
    table.insert(parts, { Foreground = foreground, Background = "transparent", Text = separator })
  end

  -- Tab title
  table.insert(parts, { Background = background, Foreground = foreground, Text = " " .. tab.title .. " " })

  -- Right separator
  table.insert(parts, { Foreground = background, Background = "transparent", Text = separator })

  return parts
end

config.tab_bar_fmt = {
  {
    Text = " ",
  },
  {
    ForEachTab = function(tab_data, _, _, is_last)
      return {
        {
          Event = {
            MouseClick = { Button = "Left", Modifiers = "NONE" },
            Action = wezterm.action.ActivateTab(tab_data.tab_index),
          },
          Children = powerline_tab_title(tab_data),
        },
        {
          Text = is_last and "" or " ",
        },
      }
    end,
  },
  {
    Text = " ",
  },
}

return config

