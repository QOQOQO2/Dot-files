return {
  "sphamba/smear-cursor.nvim",
  opts = {
    -- Smear cursor when switching buffers or windows.
    smear_between_buffers = true,

    -- Smear cursor when moving within line or to neighbor lines.
    -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
    smear_between_neighbor_lines = true,

    -- Draw the smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = true,

    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    -- Smears and particles will look a lot less blocky.
    legacy_computing_symbols_support = true,

    -- distance stop animating
    distance_stop_animating = 0.1,
    distance_stop_animating_vertical_bar = 0.1,

    -- Smear cursor in insert mode.
    -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
    smear_insert_mode = true,

    -- Smear cursor color. Defaults to Cursor GUI color if not set.
    -- Set to "none" to match the text color at the target cursor position.
    -- Can be a hex color code, or a highlight group name.
    cursor_color = "none",

    -- cmd line smear is kinda broken
    smear_to_cmd = false,

    -- Smear configuration ---------------------------------------------------------

    -- How fast the smear's head moves towards the target.
    -- 0: no movement, 1: instantaneous
    stiffness = 0.6,

    -- How fast the smear's tail moves towards the target.
    -- 0: no movement, 1: instantaneous
    trailing_stiffness = 0.45,

    -- Initial velocity factor in the direction opposite to the target
    anticipation = 0.2,

    -- Velocity reduction over time. O: no reduction, 1: full reduction
    damping = 0.85,
  },
}
