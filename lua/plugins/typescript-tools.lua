return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    -- TypeScript server settings
    settings = {
      -- Specify TSServer settings here
      tsserver_file_preferences = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
      tsserver_format_options = {
        allowIncompleteCompletions = false,
        allowRenameOfImportPath = false,
      },
      -- Disable formatting if using Biome
      complete_function_calls = true,
      include_completions_with_insert_text = true,
      disable_member_code_lens = true,
    },
    -- Flags for the LSP client
    flags = {
      debounce_text_changes = 150,
    },
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
    -- Keymaps
    handlers = {
      ['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = '●' },
        severity_sort = true,
      }),
    },
  },
  -- config = function(_, opts)
  --   require('typescript-tools').setup(opts)
  --
  --   -- Set up keybindings
  --   local bufmap = function(bufnr, mode, lhs, rhs, desc)
  --     vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  --   end
  --
  --   -- Add custom keybindings when the server attaches
  --   vim.api.nvim_create_autocmd('LspAttach', {
  --     callback = function(args)
  --       local client = vim.lsp.get_client_by_id(args.data.client_id)
  --       if client and client.name == 'typescript-tools' then
  --         local bufnr = args.buf
  --
  --         -- Code actions and refactoring
  --         bufmap(bufnr, 'n', '<leader>co', ':TSToolsOrganizeImports<CR>', 'Organize Imports')
  --         bufmap(bufnr, 'n', '<leader>cs', ':TSToolsSortImports<CR>', 'Sort Imports')
  --         bufmap(bufnr, 'n', '<leader>cu', ':TSToolsRemoveUnused<CR>', 'Remove Unused')
  --         bufmap(bufnr, 'n', '<leader>cR', ':TSToolsRenameFile<CR>', 'Rename File')
  --         bufmap(bufnr, 'n', '<leader>cf', ':TSToolsFixAll<CR>', 'Fix All')
  --         bufmap(bufnr, 'n', '<leader>cA', ':TSToolsAddMissingImports<CR>', 'Add Missing Imports')
  --
  --         -- Go to
  --         bufmap(bufnr, 'n', 'gd', ':TSToolsGoToSourceDefinition<CR>', 'Go to Definition')
  --         bufmap(bufnr, 'n', 'gr', ':TSToolsFileReferences<CR>', 'File References')
  --       end
  --     end,
  --   })
  -- end,
}
