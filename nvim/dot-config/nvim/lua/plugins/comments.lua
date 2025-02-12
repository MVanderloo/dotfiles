return {
  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'VeryLazy',
  },
  {
    'danymat/neogen',
    config = true,
    keys = {
      {
        '<leader>N',
        function ()
          require('neogen').generate()
        end
      },
    },
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  -- {
  --   'numToStr/Comment.nvim',
  --   config = function() end,
  -- },
  -- {
  --   'folke/todo-comments.nvim',
  --   event = 'VimEnter',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  --   opts = { signs = false },
  -- },
}
