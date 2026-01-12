return {
  'sphamba/smear-cursor.nvim',
  config = function()
    require('smear_cursor').setup({
      legacy_computing_symbols_support = true,
      stiffness = 0.8,
      trailing_stiffness = 0.4,
      distance_stop_animating = 0.5,
      min_horizontal_distance_smear = 2,
      min_vertical_distance_smear = 2,
      smear_insert_mode = false,
      smear_replace_mode = false,
      vertical_bar_cursor_insert_mode = false,
      horizontal_bar_cursor_replace_mode = false,
      matrix_pixel_threshold = 1,
      minimum_volume_factor = 0,
      gamma = 1,
      color_levels = 32,
    })
    require('smear_cursor').toggle()
  end,
}
