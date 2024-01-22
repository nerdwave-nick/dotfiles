local wezterm = require("wezterm")

local F = {}

F.scheme_for_appearance = function(appearance, theme)
  if appearance:find("Dark") then
    return theme.dark
  else
    return theme.light
  end
end

F.custom_colorscheme = function()
  local americano = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]

  return {
    ["Catppuccin Americano"] = americano
  }
end

return F
