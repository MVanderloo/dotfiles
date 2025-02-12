-- disable builtin color schemes
vim.opt.wildignore:append {
  'blue.vim',
  'darkblue.vim',
  'delek.vim',
  'desert.vim',
  'elflord.vim',
  'evening.vim',
  'industry.vim',
  'habamax.vim',
  'koehler.vim',
  'lunaperche.vim',
  'morning.vim',
  'murphy.vim',
  'pablo.vim',
  'peachpuff.vim',
  'quiet.vim',
  'ron.vim',
  'shine.vim',
  'slate.vim',
  'sorbet.vim',
  'retrobox.vim',
  'torte.vim',
  'wildcharm.vim',
  'zaibatsu.vim',
  'zellner.vim',
}

return {
  -- {
  --   'xiyaowong/nvim-transparent',
  --   priority = 1001,
  --   lazy = false,
  --   config = function()
  --     vim.cmd 'TransparentEnable'
  --   end,
  -- },
  {
    'olimorris/onedarkpro.nvim',
    -- priority = 1000,
    lazy = false,
    config = function()
      -- vim.cmd 'colorscheme onedark_dark'
      -- return {
      --   options = {
      --     -- transparency = true,
      --   },
      -- }
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    -- config = function()
    --   vim.cmd 'colorscheme catppuccin-mocha'
    -- end,
  },
  { '0xstepit/flow.nvim', lazy = false },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    config = function()
      vim.cmd 'colorscheme tokyonight'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    -- config = function()
    --   vim.cmd 'colorscheme kanagawa-wave'
    -- end,
  },
  { 'rose-pine/neovim', name = 'rose-pine', lazy = true },
  { 'projekt0n/github-nvim-theme', name = 'github-theme', lazy = false },
}
