local set = vim.keymap.set

-- Remove any delay for space as leader key
set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remove the default s binding in favor of surround mappings (sa, sr, sd)
set({ 'n', 'x' }, 's', '<Nop>', { silent = true })

-- j and k will move to the character visually below the cursor, to deal with line wrap
-- don't use this behavior if there is a count so that relative line numbering is true
set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
set({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
set({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- Have Esc clear highlighted search
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- toggle folds with tab
set('n', '<Tab>', 'za', { silent = true, noremap = true })
-- Ctrl-i is the same thing as tab - use ctrl-shift-o to jump forwards
set('n', '<C-S-o>', '<C-i>', { silent = true, noremap = true })
-- alternatively mini.bracketed binds [j and ]j but it's less spammable
-- if i can get used to using enter to toggle tab, I won't need the above workaround

-- Keep highlight when indenting block
set('v', '<', '<gv', { silent = true, noremap = true })
set('v', '>', '>gv', { silent = true, noremap = true })

-- move between panes
set('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
set('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
set('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
set('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- Resize window using <ctrl> arrow keys
set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Make n always search forward, N always search backward
-- zz will center the cursor
set({ 'n', 'x', 'o' }, 'n', "v:searchforward ? 'nzz' : 'Nzz'", { expr = true, desc = 'Next Search Result' })
set({ 'n', 'x', 'o' }, 'N', "v:searchforward ? 'Nzz' : 'nzz'", { expr = true, desc = 'Prev Search Result' })

-- Add diagnostics to the quickfix list
set('n', '<leader>qd', vim.diagnostic.setloclist, { desc = '[D]iagnostic' })

-- Oil.nvim
set({ 'n', 'x' }, '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Lazy.nvim
set({ 'n', 'x' }, '<leader>L', '<CMD>Lazy<CR>', { desc = 'Open Lazy' })

-- persistence.nvim
-- load the session for the current directory
set('n', '<leader>pl', function()
  require('persistence').load()
end)

-- select a session to load
set('n', '<leader>ps', function()
  require('persistence').select()
end)

-- load the last session
set('n', '<leader>pL', function()
  require('persistence').load { last = true }
end)

--  session won't be saved on exit
set('n', '<leader>pd', function()
  require('persistence').stop()
end)

-- read scrolloff value from input
vim.keymap.set('n', '<leader>ts', function()
  local input = tonumber(vim.fn.input 'Scrolloff: ')
  vim.opt.scrolloff = input
end, { noremap = true, silent = true, desc = 'Set scrolloff value' })

-- Oil.nvim
set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- persistence.nvim
set('n', '<leader>ps', function()
  require('persistence').load()
end) -- load the session for the current directory
set('n', '<leader>pS', function()
  require('persistence').select()
end) -- select a session to load
set('n', '<leader>pl', function()
  require('persistence').load { last = true }
end) -- load the last session
set('n', '<leader>pd', function()
  require('persistence').stop()
end) --  session won't be saved on exit

-- dial.vim
-- vim.keymap.set('n', '<C-a>', function()
--   require('dial.map').manipulate('increment', 'normal')
-- end)
-- vim.keymap.set('n', '<C-x>', function()
--   require('dial.map').manipulate('decrement', 'normal')
-- end)

-- read scrolloff value from input
-- set('n', '<leader>ts', function()
--   local input = tonumber(vim.fn.input 'Scrolloff: ')
--   vim.opt.scrolloff = input
-- end, { noremap = true, silent = true, desc = 'Set scrolloff value' })

set('n', '<leader>la', function()
  vim.lsp.buf.code_action { apply = true }
end)

set('n', '<leader>lr', function()
  -- vim.lsp.buf.rename()
  vim.lsp.buf.rename()
end)

vim.keymap.set("n", "<leader>th", function()
  local enabled = vim.lsp.inlay_hint.is_enabled { bufnr = 0 }
  vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
end, { desc = "Toggle LSP inlay hints" })

