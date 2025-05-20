return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters_by_ft = {
      bash = { 'shfmt' },
      blade = { 'blade-formatter' },
      css = { 'biome' },
      go = { 'gofumpt', 'goimports' },
      graphql = { 'biome' },
      html = { 'biome' },
      javascript = { 'biome' },
      javascriptreact = { 'biome' },
      json = { 'biome' },
      lua = { 'stylua' },
      markdown = { 'biome' },
      md = { 'markdownlint' },
      nushell = { 'nufmt' },
      php = { 'pint' },
      svelte = { 'biome' },
      templ = { 'templ' },
      typescript = { 'biome' },
      typescriptreact = { 'biome' },
      vue = { 'volar' },
      xml = { 'xmlstarlet' },
      yaml = { 'biome' },
    },
  },
}
