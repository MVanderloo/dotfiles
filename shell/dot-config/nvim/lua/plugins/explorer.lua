vim.pack.add({
  'gh:a7lavinraj/fyler.nvim',
  'gh:nvim-mini/mini.icons',
  'gh:stevearc/oil.nvim',
}, { confirm = false })

require('mini.icons').setup()

require('oil').setup {
  default_file_explorer = true,
  watch_for_changes = true,
  view_options = { show_hidden = true },
  skip_confirm_for_simple_edits = true,
  is_always_hidden = function(name, _) return name:match '^..' ~= nil end,
}

vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' })

require('fyler').setup {
  views = {
    finder = {
      close_on_select = true,
      confirm_simple = true,
      default_explorer = false,
    },
  },
  win_opts = {
    cursorline = true,
  },
}

vim.keymap.set(
  'n',
  '<leader>e',
  function() require('fyler').toggle { kind = 'split_left_most' } end,
  { desc = 'Toggle File Tree' }
)
