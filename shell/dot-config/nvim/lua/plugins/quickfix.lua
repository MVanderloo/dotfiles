vim.pack.add({ 'https://github.com/stevearc/quicker.nvim' }, { confirm = false })

local quicker = require 'quicker'

quicker.setup {
  keys = {
    {
      '>',
      function() quicker.expand { before = 2, after = 2, add_to_existing = true } end,
      desc = 'Expand quickfix context',
    },
    {
      '<',
      function() quicker.collapse() end,
      desc = 'Collapse quickfix context',
    },
  },
}

-- open quickfix and close loclist
vim.keymap.set('n', '<leader>q', function()
  quicker.toggle()
  quicker.close { loclist = true }
end, { desc = 'Toggle quickfix' })

-- open loclist and close quickfix if successful
vim.keymap.set('n', '<leader>l', function()
  quicker.toggle { loclist = true }
  if quicker.is_open(0) then quicker.close() end
end, { desc = 'Toggle loclist' })

-- populate and open quickfix, close loclist
vim.keymap.set('n', '<C-q>', function()
  vim.diagnostic.setqflist()
  quicker.close { loclist = true }
  quicker.open()
end)

-- populate and open loclist, close quickfix
vim.keymap.set('n', '<C-l>', function()
  vim.diagnostic.setloclist {}
  quicker.close()
  quicker.open { loclist = true }
end)
