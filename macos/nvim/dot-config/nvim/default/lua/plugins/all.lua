vim.o.termguicolors = true

return {
    {
        'jinh0/eyeliner.nvim',
        opts = {
            highlight_on_key = true, -- show highlights only after keypress
            dim = false,             
            max_length = 9999,
            default_keymaps = true,
        }
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
            enabled = false,
        }
    },
    'nvim-lualine/lualine.nvim', 
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "Mofiqul/vscode.nvim", priority = 1000 },
    { "0xstepit/flow.nvim", priority = 1000 },
    { "folke/tokyonight.nvim", priority = 1000 },
    { "rebelot/kanagawa.nvim", priority = 1000 },
    { "rose-pine/neovim", name = "rose-pine", priority = 1000 },
    {
        'zaldih/themery.nvim',
        opts = {
            themes = {"catppuccin", "vscode", "flow", "tokyonight", "kanagawa", "rose-pine",  },
            livePreview = true,
        }
    },
}

-- -- Fixes Notify opacity issues
--
-- require('lazy').setup({
    -- 	--  'onsails/lspkind.nvim',
    -- 	--  {
        -- 	--    'rmagatti/goto-preview',
        -- 	--    config = function()
            -- 	--      require('goto-preview').setup {
                -- 	--        width = 120; -- Width of the floating window
                -- 	--        height = 15; -- Height of the floating window
                -- 	--        border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- Border characters of the floating window
                -- 	--        default_mappings = true;
                -- 	--        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
                -- 	--        resizing_mappings = false; -- Binds arrow keys to resizing the floating window.
                -- 	--        references = { -- Configure the telescope UI for slowing the references cycling window.
                    -- 	--          telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
                    -- 	--        };
                    -- 	--        -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
                    -- 	--        focus_on_open = true; -- Focus the floating window when opening it.
                    -- 	--        dismiss_on_move = false; -- Dismiss the floating window when moving the cursor.
                    -- 	--        force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
                    -- 	--        bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
                    -- 	--        stack_floating_preview_windows = true, -- Whether to nest floating windows
                    -- 	--        preview_window_title = { enable = true, position = "left" }, -- Whether 
                    -- 	--      }
                    -- 	--    end
                    -- 	--  },
                    -- 	--
                    -- 	--
                    -- 	--
                    -- 	--  {
                        -- 	--    "folke/noice.nvim",
                        -- 	--    config = function()
                            -- 	--      require("noice").setup({
                                -- 	--        -- add any options here
                                -- 	--        routes = {
                                    -- 	--          {
                                        -- 	--            filter = {
                                            -- 	--              event = 'msg_show',
                                            -- 	--              any = {
                                                -- 	--                { find = '%d+L, %d+B' },
                                                -- 	--                { find = '; after #%d+' },
                                                -- 	--                { find = '; before #%d+' },
                                                -- 	--                { find = '%d fewer lines' },
                                                -- 	--                { find = '%d more lines' },
                                                -- 	--              },
                                                -- 	--            },
                                                -- 	--            opts = { skip = true },
                                                -- 	--          }
                                                -- 	--        },
                                                -- 	--      })
                                                -- 	--    end,
                                                -- 	--    dependencies = {
                                                    -- 	--      "MunifTanjim/nui.nvim",
                                                    -- 	--      -- OPTIONAL:
                                                    -- 	--      --   `nvim-notify` is only needed, if you want to use the notification view.
                                                    -- 	--      --   If not available, we use `mini` as the fallback
                                                    -- 	--      "rcarriga/nvim-notify",
                                                    -- 	--    }
                                                    -- 	--  },
                                                    -- 	--
                                                    -- 	--  'ray-x/guihua.lua',
                                                    -- 	--
                                                    -- 	--  { -- LSP Configuration & Plugins
                                                        -- 	--    'neovim/nvim-lspconfig',
                                                        -- 	--    dependencies = {
                                                            -- 	--      'williamboman/mason.nvim',
                                                            -- 	--      'williamboman/mason-lspconfig.nvim',
                                                            -- 	--      'j-hui/fidget.nvim',
                                                            -- 	--    }
                                                            -- 	--  },
                                                            -- 	--
                                                            -- 	--  { -- Autocompletion
                                                                -- 	--    'hrsh7th/nvim-cmp',
                                                                -- 	--    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
                                                                -- 	--  },
                                                                -- 	--
                                                                -- 	--  { -- Highlight, edit, and navigate code
                                                                    -- 	--    'nvim-treesitter/nvim-treesitter',
                                                                    -- 	--    build = function()
                                                                        -- 	--      pcall(require('nvim-treesitter.install').update { with_sync = true })
                                                                        -- 	--    end,
                                                                        -- 	--    dependencies = {
                                                                            -- 	--      'nvim-treesitter/nvim-treesitter-textobjects',
                                                                            -- 	--    }
                                                                            -- 	--  },
                                                                            -- 	--
                                                                            -- 	--  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
                                                                            -- 	--  'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines 
                                                                            -- 	--  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
                                                                            -- 	--
                                                                            -- 	--  -- Fuzzy Finder (files, lsp, etc)
                                                                            -- 	--  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
                                                                            -- 	--  'nvim-telescope/telescope-symbols.nvim',
                                                                            -- 	--  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
                                                                            -- 	--  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
                                                                            -- 	--
                                                                            -- 	--  {
                                                                                -- 	--    "debugloop/telescope-undo.nvim",
                                                                                -- 	--    dependencies = {
                                                                                    -- 	--      {
                                                                                        -- 	--        "nvim-telescope/telescope.nvim",
                                                                                        -- 	--        dependencies = { "nvim-lua/plenary.nvim" },
                                                                                        -- 	--      },
                                                                                        -- 	--    },
                                                                                        -- 	--    keys = {
                                                                                            -- 	--      { "<leader>u", "<cmd>Telescope undo<cr>", desc = "undo history", },
                                                                                            -- 	--    },
                                                                                            -- 	--    opts = {
                                                                                                -- 	--      extensions = {
                                                                                                    -- 	--        undo = { use_delta = true },
                                                                                                    -- 	--      },
                                                                                                    -- 	--    },
                                                                                                    -- 	--    config = function(_, opts)
                                                                                                        -- 	--      require("telescope").setup(opts)
                                                                                                        -- 	--      require("telescope").load_extension("undo")
                                                                                                        -- 	--    end,
                                                                                                        -- 	--  },
                                                                                                        -- 	--  {
                                                                                                            -- 	--    "folke/which-key.nvim",
                                                                                                            -- 	--    event = "VeryLazy",
                                                                                                            -- 	--    init = function()
                                                                                                                -- 	-- vim.o.timeout = true
                                                                                                                -- 	-- vim.o.timeoutlen = 500
                                                                                                                -- 	--    end,
                                                                                                                -- 	--    opts = {}
                                                                                                                -- 	--  },
                                                                                                                -- })
