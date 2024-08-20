return {
    {
       'folke/trouble.nvim',
       dependencies = { 'nvim-tree/nvim-web-devicons' },
       config = function()
            vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
            vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})
            vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
            vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true})
            vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true})
            vim.keymap.set("n", "<leader>xR", "<cmd>TroubleToggle lsp_references<cr>", {silent = true, noremap = true})

            vim.keymap.set("n", "[d", function() require("trouble").next({ skip_groups = true, jump = true }) end)
            vim.keymap.set("n", "]d", function() require("trouble").previous({ skip_groups = true, jump = true }) end)


            local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
            end
        end
    }
}
