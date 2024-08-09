return {
    'lewis6991/gitsigns.nvim',
    {
        'NeogitOrg/neogit',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            local neogit = require('neogit')
            vim.keymap.set('n', '<leader>Gs', neogit.open,                   {silent = true, noremap = true})
            vim.keymap.set('n', '<leader>Gc', ':Neogit commit<CR>',          {silent = true, noremap = true})
            vim.keymap.set('n', '<leader>Gp', ':Neogit pull<CR>',            {silent = true, noremap = true})
            vim.keymap.set('n', '<leader>GP', ':Neogit push<CR>',            {silent = true, noremap = true})
            vim.keymap.set('n', '<leader>Gb', ':Telescope git_branches<CR>', {silent = true, noremap = true})
            vim.keymap.set('n', '<leader>GB', ':G blame<CR>',                {silent = true, noremap = true})
        end
    },
    {
        'polarmutex/git-worktree.nvim',
        version = '^2',
        dependencies = { 
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        },
        -- config = function()
        --     require('telescope').load_extension('git_worktree')
        --     vim.keymap.set('n', '<leader>Gw', ':
        -- end
    }
}




-- require('gitsigns').setup {
--   signs = {
--     add = { text = '+' },
--     change = { text = '~' },
--     delete = { text = '_' },
--     topdelete = { text = '‾' },
--     changedelete = { text = '~' },
--   },
--   current_line_blame = false,
--   on_attach = function(bufnr)
--     local gs = package.loaded.gitsigns
--
--     local function map(mode, l, r, opts)
--       opts = opts or {}
--       opts.buffer = bufnr
--       vim.keymap.set(mode, l, r, opts)
--     end
--
--     -- Navigation
--     map('n', ']c', function()
--       if vim.wo.diff then return ']c' end
--       vim.schedule(function() gs.next_hunk() end)
--       return '<Ignore>'
--     end, {expr=true})
--
--     map('n', '[c', function()
--       if vim.wo.diff then return '[c' end
--       vim.schedule(function() gs.prev_hunk() end)
--       return '<Ignore>'
--     end, {expr=true})
--
--     -- Actions
--     map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
--     map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
--     map('n', '<leader>hS', gs.stage_buffer)
--     map('n', '<leader>ha', gs.stage_hunk)
--     map('n', '<leader>hu', gs.undo_stage_hunk)
--     map('n', '<leader>hR', gs.reset_buffer)
--     map('n', '<leader>hp', gs.preview_hunk)
--     map('n', '<leader>hb', function() gs.blame_line{full=true} end)
--     map('n', '<leader>tB', gs.toggle_current_line_blame)
--     map('n', '<leader>hd', gs.diffthis)
--     map('n', '<leader>hD', function() gs.diffthis('~') end)
--
--     -- Text object
--     map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
--   end
-- }
