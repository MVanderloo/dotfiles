vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require 'options'
require 'keymaps'
require 'auto-commands'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = {
    {
      'SunnyTamang/select-undo.nvim',
      opts = {
        persistent_undo = true,
        mapping = true,
        line_mapping = 'gu',
        partial_mapping = 'gU',
      },
    },
    {
      'folke/snacks.nvim',
      priority = 1000,
      lazy = false,
      opts = {
        bigfile = { enabled = true },
        quickfile = { enabled = true },
        -- scroll = { enabled = true },
        -- mini cursorword a bit nicer defaults
        -- words = { enabled = true },
      },
    },
    {
      'echasnovski/mini.nvim',
      version = false,
      config = function()
        require('mini.extra').setup()
        require('mini.ai').setup {
          -- custom_textobjects = {
          --   B = MiniExtra.gen_ai_spec.buffer(),
          --   -- D = MiniExtra.gen_ai_spec.diagnostic(),
          --   -- i = MiniExtra.gen_ai_spec.indent(),
          --   l = MiniExtra.gen_ai_spec.line(),
          --   N = MiniExtra.gen_ai_spec.number(),
          -- },
          -- search_method = 'cover',
          silent = true,
        }
        -- require("mini.align").setup()
        require('mini.bracketed').setup()
        require('mini.clue').setup {
          clues = {
            -- Enhance this by adding descriptions for <Leader> mapping groups
            require('mini.clue').gen_clues.builtin_completion(),
            require('mini.clue').gen_clues.g(),
            require('mini.clue').gen_clues.marks(),
            require('mini.clue').gen_clues.registers(),
            require('mini.clue').gen_clues.windows(),
            require('mini.clue').gen_clues.z(),
          },
          window = {
            delay = 0,
            scroll_down = '<C-d>',
            scroll_up = '<C-u>',
          },
          triggers = {
            -- Leader triggers
            { mode = 'n', keys = '<leader>' },
            { mode = 'x', keys = '<leader>' },

            -- LocalLeader triggers
            { mode = 'n', keys = '<localleader>' },
            { mode = 'x', keys = '<localleader>' },

            -- Built-in completion
            { mode = 'i', keys = '<C-x>' },

            -- `g` key
            { mode = 'n', keys = 'g' },
            { mode = 'x', keys = 'g' },

            -- Marks
            { mode = 'n', keys = "'" },
            { mode = 'n', keys = '`' },
            { mode = 'x', keys = "'" },
            { mode = 'x', keys = '`' },

            -- Registers
            { mode = 'n', keys = '"' },
            { mode = 'x', keys = '"' },
            { mode = 'i', keys = '<C-r>' },
            { mode = 'c', keys = '<C-r>' },
            -- Window commands

            { mode = 'n', keys = '<C-w>' },

            -- `z` key
            { mode = 'n', keys = 'z' },
            { mode = 'x', keys = 'z' },

            { mode = 'n', keys = '[' },
            { mode = 'x', keys = '[' },
            { mode = 'n', keys = ']' },
            { mode = 'x', keys = ']' },
          },
        }
        require('mini.comment').setup()
        require('mini.cursorword').setup { delay = 0 }
        require('mini.diff').setup {
          view = {
            style = 'sign',
            signs = {
              add = '+',
              change = '~',
              delete = '-',
            },
          },
        }
        -- require("mini.extra").setup()
        -- require("mini.files").setup()
        -- require("mini.fuzzy").setup()
        -- require("mini.git").setup()
        require('mini.hipatterns').setup {
          highlighters = {
            fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
            hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
            todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
            note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

            -- Highlight hex color strings (`#rrggbb`) using that color
            hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
          },
          delay = {
            text_change = 0,
            scroll = 0,
          },
        }

        -- require('mini.indentscope').setup {
        --   symbol = '│',
        --   draw = {
        --     delay = 0,
        --     animation = require('mini.indentscope').gen_animation.none(),
        --   },
        --   mappings = {
        --     object_scope = 'ii',
        --     object_scope_with_border = 'ai',
        --     goto_top = '[i',
        --     goto_bottom = ']i',
        --   },
        -- }
        -- require("mini.jump").setup()
        -- require("mini.jump2d").setup()
        require('mini.misc').setup()
        MiniMisc.setup_auto_root()
        MiniMisc.setup_restore_cursor()

        require('mini.move').setup()
        -- require('mini.notify').setup()
        -- require('mini.operators').setup()
        require('mini.pairs').setup {
          modes = { insert = true, command = false, terminal = false },
        }
        -- require('mini.pick').setup()
        -- require('mini.splitjoin').setup()
        require('mini.statusline').setup()
        require('mini.surround').setup()
        -- require('mini.tabline').setup()
        -- require("mini.test").setup()
        require('mini.trailspace').setup()
        -- require("mini.visits").setup()
      end,
    },
    require 'plugins.ui',
    require 'plugins.colors',
    require 'plugins.treesitter',
    require 'plugins.picker',
    require 'plugins.completion',
    require 'plugins.lang',
    require 'plugins.session',
    require 'plugins.diagnostics',
    require 'plugins.comments',
    require 'plugins.git',
  },
  -- defaults = { lazy = true },
  checker = { enabled = true },
  -- install = { colorscheme = { 'onedark_vivid' } },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}
