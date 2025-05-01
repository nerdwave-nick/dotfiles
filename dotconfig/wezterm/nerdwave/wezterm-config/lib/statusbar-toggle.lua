local wezterm = require('wezterm')

return {
  toggleTabBar = function(window)
    local overrides = window:get_config_overrides() or {}
    if overrides.enable_tab_bar == true then
      wezterm.log_info('tab bar hidden')
      overrides.enable_tab_bar = false
    else
      wezterm.log_info('tab bar shown')
      overrides.enable_tab_bar = true
    end
    window:set_config_overrides(overrides)
  end,
}
