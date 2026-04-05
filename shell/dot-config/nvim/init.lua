vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.api.nvim_set_hl(0, 'winseparator', { fg = 'white' })

require 'config.options'
require 'config.keymaps'
require 'config.auto-commands'
require 'config.filetype'
require 'config.lsp'
require 'config.ui'

require 'plugins.colors'

require 'plugins.bindings'
require 'plugins.completion'
require 'plugins.diagnostics'
require 'plugins.editor'
require 'plugins.explorer'
require 'plugins.formatter'
require 'plugins.git'
require 'plugins.picker'
require 'plugins.quickfix'
require 'plugins.rendering'
require 'plugins.statusline'
require 'plugins.treesitter'
