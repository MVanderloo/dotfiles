vim.pack.add({
  'gh:lukas-reineke/indent-blankline.nvim',
  'gh:nmac427/guess-indent.nvim',
  'gh:nvim-mini/mini.align',
  'gh:nvim-mini/mini.operators',
  'gh:nvim-mini/mini.pairs',
  'gh:nvim-mini/mini.surround',
  'gh:bullets-vim/bullets.vim',
}, { confirm = false })

require('ibl').setup()
require('guess-indent').setup()
require('mini.align').setup()
require('mini.operators').setup()
require('mini.surround').setup()

require('mini.pairs').setup {
  mappings = {
    [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
    [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
    ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
    ['['] = {
      action = 'open',
      pair = '[]',
      neigh_pattern = '.[%s%z%)}%]]',
      register = { cr = true },
    },
    ['{'] = {
      action = 'open',
      pair = '{}',
      -- neigh_pattern = ".[%s%z%)}]",
      neigh_pattern = '.[%s%z%)}%]]',
      register = { cr = true },
    },
    ['('] = {
      action = 'open',
      pair = '()',
      -- neigh_pattern = ".[%s%z]",
      neigh_pattern = '.[%s%z%)]',
      register = { cr = true },
    },
    -- Single quote: Prevent pairing if either side is a letter
    ['"'] = {
      action = 'closeopen',
      pair = '""',
      neigh_pattern = '[^%w\\][^%w]',
      register = { cr = false },
    },
    -- Single quote: Prevent pairing if either side is a letter
    ["'"] = {
      action = 'closeopen',
      pair = "''",
      neigh_pattern = '[^%w\\][^%w]',
      register = { cr = false },
    },
    -- Backtick: Prevent pairing if either side is a letter
    ['`'] = {
      action = 'closeopen',
      pair = '``',
      neigh_pattern = '[^%w\\][^%w]',
      register = { cr = false },
    },
  },
}
