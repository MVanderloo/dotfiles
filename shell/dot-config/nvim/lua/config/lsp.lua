vim.pack.add({ 'gh:b0o/SchemaStore.nvim' }, { confirm = false })
vim.pack.add({ 'gh:neovim/nvim-lspconfig' }, { confirm = false })

vim.lsp.enable {
  'ansiblels',
  'awk_ls',
  'bashls',
  'cssls',
  'docker_compose_language_service',
  'docker_language_server',
  'emmylua_ls',
  'fish_lsp',
  'gh_actions_ls',
  'gopls',
  'html_ls',
  'jqls',
  'jsonls',
  'just',
  'postgres_lsp',
  'ruff',
  'systemd_ls',
  'taplo',
  'tinymist',
  'yamlls',
  'zls',
}

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Configure LSP keymaps',
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method 'textDocument/definition' then
      vim.keymap.set({ 'n' }, 'gd', function() vim.lsp.buf.definition() end)
    end

    if client:supports_method 'textDocument/references' then
      vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end)
    end

    if client:supports_method 'textDocument/typeDefinition' then
      vim.keymap.set({ 'n' }, 'gy', function() vim.lsp.buf.type_definition() end)
    end

    if client:supports_method 'textDocument/implementation' then
      vim.keymap.set({ 'n' }, 'gli', function() vim.lsp.buf.implementation() end)
    end

    if client:supports_method 'textDocument/codeAction' then
      vim.keymap.set({ 'n' }, 'gla', function() vim.lsp.buf.code_action() end)
    end

    if client:supports_method 'textDocument/rename' then
      vim.keymap.set('n', 'glr', function() vim.lsp.buf.rename() end)
    end

    if client:supports_method 'textDocument/hover' then
      vim.keymap.set({ 'n', 'x' }, 'K', function() vim.lsp.buf.hover() end)
    end

    if client:supports_method 'textDocument/documentColor' then vim.lsp.document_color.enable(true, args.buf) end

    -- if client:supports_method 'textDocument/signatureHelp' then
    --   vim.keymap.set({ 'i' }, '<C-s>', function() vim.lsp.buf.signature_help() end, {})
    -- end

    -- if client:supports_method(methods.textDocument_documentHighlight) then
    --   vim.api.nvim_create_autocmd({ 'CursorHold', 'InsertLeave' }, {
    --     desc = 'Highlight references under the cursor',
    --     buffer = bufnr,
    --     callback = vim.lsp.buf.document_highlight,
    --   })
    --   vim.api.nvim_create_autocmd({ 'CursorMoved', 'InsertEnter', 'BufLeave' }, {
    --     desc = 'Clear highlight references',
    --     buffer = bufnr,
    --     callback = vim.lsp.buf.clear_references,
    --   })
    -- end

    -- if client:supports_method(methods.textDocument_inlayHint) and vim.g.inlay_hints then
    --   -- Initial inlay hint display.
    --   vim.defer_fn(function()
    --     local mode = vim.api.nvim_get_mode().mode
    --     vim.lsp.inlay_hint.enable(mode == 'n' or mode == 'v', { bufnr = bufnr })
    --   end, 500)
    --
    --   vim.api.nvim_create_autocmd('InsertEnter', {
    --     desc = 'Enable inlay hints',
    --     buffer = bufnr,
    --     callback = function()
    --       if vim.g.inlay_hints then vim.lsp.inlay_hint.enable(false, { bufnr = bufnr }) end
    --     end,
    --   })
    --
    --   vim.api.nvim_create_autocmd('InsertLeave', {
    --     desc = 'Disable inlay hints',
    --     buffer = bufnr,
    --     callback = function()
    --       if vim.g.inlay_hints then vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end
    --     end,
    --   })
    -- end
  end,
})
