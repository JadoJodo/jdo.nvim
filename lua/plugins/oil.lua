return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  keymaps = {
    ['gd'] = {
      desc = 'Toggle file detail view',
      callback = function()
        detail = not detail
        if detail then
          require('oil').set_columns { 'icon', 'permissions', 'size', 'mtime' }
        else
          require('oil').set_columns { 'icon' }
        end
      end,
    },
  },
}
