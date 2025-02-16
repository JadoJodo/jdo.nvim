return {
  {
    'chrishrb/gx.nvim',
    keys = { { 'gx', '<cmd>Browse<cr>', mode = { 'n', 'x' } } },
    cmd = { 'Browse' },
    init = function()
      vim.g.netrw_nogx = 1
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      require('gx').setup {
        open_browser_app = 'os_specific',
        open_browser_args = {
          handlers = {
            plugin = true,
            github = true,
            brewfile = true,
            package_json = true,
            search = true,
            go = true,
          },
          handler_options = {
            search_engine = 'https://kagi.com/search?q=',
            select_for_search = false,
            git_remote_push = false,
          },
        },
      }
    end,
  },
}
