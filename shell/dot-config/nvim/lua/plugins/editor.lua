vim.pack.add({
  'https://github.com/lukas-reineke/indent-blankline.nvim',
  'https://github.com/nmac427/guess-indent.nvim',
  'https://github.com/nvim-mini/mini.align',
  'https://github.com/nvim-mini/mini.operators',
  'https://github.com/nvim-mini/mini.pairs',
  'https://github.com/nvim-mini/mini.surround',
  'https://github.com/bullets-vim/bullets.vim',
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
