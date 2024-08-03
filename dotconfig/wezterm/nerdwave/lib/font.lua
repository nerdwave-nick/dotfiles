local wezterm = require('wezterm')

return {
  --@param fontOpts FontConfig
  setup = function(opts, fontOpts)
    opts.font = wezterm.font_with_fallback({
      fontOpts.family,
      'Noto Sans Emoji',
    })
    opts.font_size = fontOpts.size
    opts.harfbuzz_features = fontOpts.harfbuzz_features
    return opts
  end,
}
