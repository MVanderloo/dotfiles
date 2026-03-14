vim.pack.add({
  'gh:oxy2dev/markview.nvim',
  'gh:oxy2dev/helpview.nvim',
  'gh:hat0uma/csvview.nvim',
  -- 'gh:owen-dechow/videre.nvim',
  -- 'gh:owen-dechow/nvim_json_graph_view',
  -- 'gh:owen-dechow/graph_view_yaml_parser',
  -- 'gh:owen-dechow/graph_view_toml_parser',
}, { confirm = false })

require('csvview').setup {
  view = {
    min_column_width = 1,
    spacing = 1,
    display_mode = 'border',
  },
  delimiter = {
    default = ',',
    ft = { tsv = '\t' },
  },
  parser = { comments = { '#', '//' } },
  keymaps = {
    textobject_field_inner = { 'if', mode = { 'o', 'x' } },
    textobject_field_outer = { 'af', mode = { 'o', 'x' } },
    jump_next_field_end = { '<tab>', mode = { 'n', 'v' }, noremap = true },
    jump_prev_field_end = { '<s-tab>', mode = { 'n', 'v' }, noremap = true },
    -- jump_next_row = { '<Enter>', mode = { 'n', 'v' } },
    -- jump_prev_row = { '<S-Enter>', mode = { 'n', 'v' } },
  },
}

-- require('videre').setup {
--   round_units = false,
--   keymap_desc_deliminator = '->',
--   link_backward = 'H',
-- }
