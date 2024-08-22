-- buffers
vim.api.nvim_set_keymap("n", "<leader>b$", ":blast<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "<leader>b0", ":bfirst<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "<leader>bp", ":bprev<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<enter>", {noremap=false})

-- files
vim.api.nvim_set_keymap("n", "TT", ":TransparentToggle<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "QQ", ":q!<enter>", {noremap=false})
-- vim.api.nvim_set_keymap("n", "WW", ":w!<enter>", {noremap=false})
-- vim.api.nvim_set_keymap("n", "E", "$", {noremap=false})
-- vim.api.nvim_set_keymap("n", "B", "^", {noremap=false})
-- vim.api.nvim_set_keymap("n", "ss", ":noh<CR>", {noremap=true})

-- splits
-- vim.api.nvim_set_keymap("n", "<C-W>,", ":vertical resize -10<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "<C-W>.", ":vertical resize +10<CR>", {noremap=true})
-- vim.keymap.set('n', '<space><space>', "<cmd>set nohlsearch<CR>")
-- -- Quicker close split
-- vim.keymap.set("n", "<leader>qq", ":q<CR>",
--   {silent = true, noremap = true}
-- )

-- Keymaps for better default experience
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- Indent block and keep highlight
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })
