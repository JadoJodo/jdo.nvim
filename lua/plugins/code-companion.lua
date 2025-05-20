return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    strategies = {
      chat = {
        adapter = 'openrouter',
      },
      inline = {
        adapter = 'openrouter',
      },
    },
    adapters = {
      openrouter_claude = function()
        return require('codecompanion.adapters').extend('openai_compatible', {
          env = {
            url = 'https://openrouter.ai/api',
            api_key = os.getenv 'OPENROUTER_API_KEY',
            chat_url = '/v1/chat/completions',
          },
          schema = {
            model = {
              default = 'anthropic/claude-3.7-sonnet',
            },
          },
        })
      end,
    },
  },
}
