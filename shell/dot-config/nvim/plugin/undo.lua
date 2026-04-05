-- enable undotree UI
vim.cmd 'packadd nvim.undotree'

local function undotree()
  local close = require('undotree').open {
    title = 'undotree',
    command = 'topleft 30vnew',
  }
  if not close then vim.bo.filetype = 'undotree' end
end

vim.keymap.set('n', '<leader>u', undotree)
