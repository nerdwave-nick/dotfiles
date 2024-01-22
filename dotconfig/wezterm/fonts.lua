local wezterm = require("wezterm")

local F = {}
local fonts = {
  cartograph = {
    font = {
      family = "FiraCode Nerd Font",
      harfbuzz_features = {
        "clig=1",
        "cv06=1",
        "cv14=1",
        "cv32=1",
        "ss04=1",
        "ss07=1",
        "ss09=1",
      },
    },
    size = 15,
  },
}
F.get_font = function(name)
  return {
    font = wezterm.font_with_fallback({
      fonts[name].font,
      "Noto Sans Emoji",
    }),
    size = fonts[name].size,
  }
end

return F
