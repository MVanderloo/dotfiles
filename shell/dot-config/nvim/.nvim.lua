vim.g.autoformat = true

vim.lsp.enable 'emmylua_ls'

-- this would be cool
-- vim.g.formatters = { lua = 'stylua' }
require('conform').formatters_by_ft.lua = { 'stylua' }
