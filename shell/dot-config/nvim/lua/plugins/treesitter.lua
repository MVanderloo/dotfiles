vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  -- 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  -- 'https://github.com/folke/ts-comments.nvim',
  'https://github.com/wansmer/treesj',
  'https://github.com/nvim-mini/mini.ai',
}, { confirm = false })

local ts_spec = require('mini.ai').gen_spec.treesitter
require('mini.ai').setup {
  n_lines = 500,
  custom_textobjects = {
    a = ts_spec { a = '@parameter.outer', i = '@parameter.inner' },
    f = ts_spec { a = '@function.outer', i = '@function.inner' },
    c = ts_spec { a = '@class.outer', i = '@class.inner' },
    o = ts_spec {
      a = { '@block.outer', '@conditional.outer', '@loop.outer' },
      i = { '@block.inner', '@conditional.inner', '@loop.inner' },
    },
    l = ts_spec { a = '@loop.outer', i = '@loop.inner' },
  },
}

require('nvim-treesitter').setup {
  highlight = { enabled = true },
  indent = { enable = true },
}

require('nvim-treesitter').install({ 'lua', 'vim', 'vimdoc', 'bash' }):wait(300000)

require('treesj').setup {
  use_default_keymaps = true,
  check_syntax_error = true, -- try setting this false
  max_join_length = 240,
  ---Cursor behavior:
  ---hold - cursor follows the node/place on which it was called
  ---start - cursor jumps to the first symbol of the node being formatted
  ---end - cursor jumps to the last symbol of the node being formatted
  cursor_behavior = 'hold',
  notify = true,
  dot_repeat = true,
  on_error = nil,
}
