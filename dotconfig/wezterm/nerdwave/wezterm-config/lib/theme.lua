local wezterm = require('wezterm')

local function setup(opts)
  local scheme = wezterm.color.get_builtin_schemes()['Catppuccin Mocha']
  scheme.background = '#000000'
  -- better cyan
  scheme.ansi[7] = '#89dceb'
  scheme.brights[7] = '#89dceb'
  opts.color_schemes = {
    ['Catppuccin'] = scheme
  }
  opts.color_scheme = 'Catppuccin'
  return opts
end

return {
  setup = setup,
}
