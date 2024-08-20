return {
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2', 
        dependencies = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
        },
        config = function()
            local harpoon = require('harpoon')

            vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)
            vim.keymap.set("n", "<leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        end

    }
}
