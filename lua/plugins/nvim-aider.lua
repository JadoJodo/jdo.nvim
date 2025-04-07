return {
  'GeorgesAlkhouri/nvim-aider',
  cmd = {
    'AiderTerminalToggle',
    'AiderHealth',
  },
  opts = {
    win = {
      position = 'right',
    },
  },
  dependencies = {
    'folke/snacks.nvim',
    'catppuccin/nvim',
  },
  config = true,
}
