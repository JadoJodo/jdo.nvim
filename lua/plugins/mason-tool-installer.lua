return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  opts = {
    ensure_installed = {
      -- Formatters
      'stylua',
      'gofumpt',
      'goimports',
      'shfmt',
      'pint',
    },
    auto_update = true,
    run_on_start = true,
  },
}
