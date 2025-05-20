return {
  'kepano/flexoki-neovim',
  lazy = false,
  priority = 1000,
  name = 'flexoki',
  config = function()
    vim.cmd.colorscheme 'flexoki-dark'
  end,
}
