local wezterm = require("wezterm")
require("events")

-- local colors = require('lua/rose-pine').colors()
-- local window_frame = require('lua/rose-pine').window_frame()

return {
  -- colors = colors,
  -- window_frame = window_frame,
  colors = require('kanagawa-lotus'),
  -- colors = {
  --   foreground = "#edeff0",
  --   background = "#0c0e0f",
  --   cursor_bg = "#edeff0",
  --   cursor_fg = "#edeff0",
  --   cursor_border = "#232526",
  --   selection_fg = "#0c0e0f",
  --   selection_bg = "#edeff0",
  --   scrollbar_thumb = "#edeff0",
  --   split = "#090909",
  --   ansi = { "#232526", "#df5b61", "#78b892", "#de8f78", "#6791c9", "#bc83e3", "#67afc1", "#e4e6e7" },
  --   brights = { "#2c2e2f", "#e8646a", "#81c19b", "#e79881", "#709ad2", "#c58cec", "#70b8ca", "#f2f4f5" },
  --   indexed = { [136] = "#edeff0" },
  --   tab_bar = {
  --     active_tab = {
  --       bg_color = "#0c0e0f",
  --       fg_color = "#edeff0",
  --       italic = true,
  --     },
  --     inactive_tab = { bg_color = "#090909", fg_color = "#0c0e0f" },
  --     inactive_tab_hover = { bg_color = "#151515", fg_color = "#090909" },
  --     new_tab = { bg_color = "#151515", fg_color = "#090909" },
  --     new_tab_hover = { bg_color = "#6791c9", fg_color = "#090909" },
  --   },
  -- },
  -- color_scheme = 'kanagawabones',
  -- color_scheme = 'tokyonight_night',
  -- color_scheme = 'Catppuccin Mocha',

  enable_tab_bar = false,
  window_frame = {
    active_titlebar_bg = "#333333",
    inactive_titlebar_bg = "#333333",
  },
  use_fancy_tab_bar = true,
  -- font = wezterm.font 'JetBrainsMono Nerd Font',
  -- font_size = 13,
  -- font = wezterm.font 'ComicShannsMono Nerd Font',
  -- font = wezterm.font ('IosevkaTerm Nerd Font', {italic = true}),
  -- font = wezterm.font("IosevkaTerm Nerd Font"),
  font = wezterm.font("Maple Mono NF"),
  -- font = wezterm.font("ComicMono Nerd Font"),
  -- font = wezterm.font("ZedMono Nerd Font"),
  -- font = wezterm.font("Monaspace Radon"),
  font_size = 13,
  default_cursor_style = "BlinkingBar",

  -- default_prog = { 'zsh' },
  window_close_confirmation = "NeverPrompt",
  hide_tab_bar_if_only_one_tab = true,

  enable_scroll_bar = false,
  window_padding = {
    top = "0.5cell",
    right = "0.5cell",
    bottom = "0cell",
    left = "1cell",
  },

  warn_about_missing_glyphs = false,
  -- Spawn a fish shell in login mode
  default_prog = { "/usr/bin/fish", "-l" },
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
  },

  -- window_background_opacity = 1.0,
  window_background_opacity = 0.85,
  text_background_opacity = 1.0,
  enable_wayland = false,

  keys = require("keys"),
}
