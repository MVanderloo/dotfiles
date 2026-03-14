-- enable undotree UI
vim.cmd 'packadd nvim.undotree'

local function undotree()
  local close = require('undotree').open {
    title = 'undotree',
    command = 'topleft 30vnew',
  }
  if not close then vim.bo.filetype = 'undotree' end
end

vim.keymap.set('n', '<leader>U', undotree)

vim.pack.add({
  'gh:sunnytamang/select-undo.nvim',
}, { confirm = false })

require('select-undo').setup {
  persistent_undo = false,
  mapping = false,
  line_mapping = 'gu',
}
