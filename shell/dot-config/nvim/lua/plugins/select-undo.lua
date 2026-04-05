vim.pack.add({
  'https://github.com/sunnytamang/select-undo.nvim',
}, { confirm = false })

require('select-undo').setup {
  persistent_undo = false,
  mapping = false,
  line_mapping = 'gu',
}
