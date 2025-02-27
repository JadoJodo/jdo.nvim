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
    keys = {
      {
        '<leader>tn',
        function()
          require('neotest').run.run()
        end,
        desc = '[T]est: [N]earest',
      },
      {
        '<leader>tf',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = '[T]est: Current [F]ile',
      },
      {
        '<leader>ta',
        function()
          require('neotest').run.run { suite = true }
        end,
        desc = '[T]est: [A]ll',
      },
      {
        '<leader>ts',
        function()
          require('neotest').summary.toggle()
        end,
        desc = '[T]est: Toggle [S]ummary',
      },
      {
        '<leader>to',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = '[T]est: Toggle [O]utput Panel',
      },
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
