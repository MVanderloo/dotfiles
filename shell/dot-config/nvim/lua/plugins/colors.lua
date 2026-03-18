vim.pack.add({
  -- 'https://github.com/gbprod/nord.nvim',
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
  -- 'https://github.com/folke/tokyonight.nvim',
  -- 'https://github.com/navarasu/onedark.nvim',
  -- { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
}, { confirm = false })

-- require('onedark').setup {
--   style = 'darker',
--   transparent = true,
-- }

-- Make window background transparent
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

vim.cmd 'colorscheme catppuccin-mocha'
