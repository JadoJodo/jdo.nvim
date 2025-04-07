return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'V13Axel/neotest-pest',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-pest' {
            sail_enabled = true,
            parallel = function()
              return #vim.loop.cpu_info()
            end,
          },
        },
      }
    end,
  },
}
