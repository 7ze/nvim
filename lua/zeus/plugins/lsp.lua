return { -- LSP & related plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    require 'zeus.lsp.setup'

    local Remap = require 'zeus.remap'
    local nnoremap = Remap.nnoremap
    local builtin = require 'telescope.builtin'

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          nnoremap(keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- LSP Keybindings
        map('gD', vim.lsp.buf.declaration, 'Go to declaration')
        map('gd', builtin.lsp_definitions, 'Go to definition')
        map('gr', builtin.lsp_references, 'Go to references')
        map('gI', builtin.lsp_implementations, 'Go to implementations')
        map('<leader>D', builtin.lsp_type_definitions, 'Go to type definitions')
        map('<leader>ds', builtin.lsp_document_symbols, 'Document symbols')
        map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, 'Workspace symbols')
        map('<leader>rn', vim.lsp.buf.rename, 'Rename')
        map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('<leader>lf', require('conform').format, 'Format')
        map('<leader>li', '<cmd>LspInfo<cr>', 'Information about lsp servers attached to the client')

        -- The following two autocommands are used to highlight references of the
        -- word under the cursor when the cursor is held for a short period of time.
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })
  end,
}
