return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  opts = {
    ensure_installed = {
      -- LSP
      'bashls',
      'biome',
      'cssls',
      'gopls',
      'html',
      'intelephense',
      'lua_ls',
      'templ',
    },
    automatic_installation = true,
    handlers = {
      function(server_name)
        local servers = {
          bashls = {},
          cssls = {},
          gopls = {
            settings = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { '-.git', '-.vscode', '-.idea', '-.vscode-test', '-node_modules' },
              semanticTokens = true,
            },
          },
          html = {},
          intelephense = {
            init_options = {
              licenceKey = (function()
                local path = vim.fn.expand '~/intelephense/license.txt'
                local file = io.open(path, 'r')
                if file then
                  local key = file:read '*a'
                  file:close()
                  return vim.trim(key or '')
                end
                vim.notify('Could not read Intelephense license key from: ' .. path, vim.log.levels.WARN)
                return nil
              end)(),
            },
          },
          lua_ls = {
            on_init = function(client)
              if client.workspace_folders then
                local path = client.workspace_folders[1].name
                if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
                  return
                end
              end

              client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                  version = 'LuaJIT',
                },
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME,
                  },
                },
              })
            end,
            settings = {
              Lua = {},
            },
          },
          nushell = {},
          templ = {},
        }
        local server = servers[server_name] or {}
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        require('lspconfig')[server_name].setup(server)
      end,
    },
  },
}
