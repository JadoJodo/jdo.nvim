return {
  'folke/edgy.nvim',
  event = 'VeryLazy',
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = 'screen'
  end,
  opts = {
    bottom = {
      {
        ft = 'toggleterm',
        size = { height = 0.4 },
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ''
        end,
      },
      {
        ft = 'noice',
        size = { height = 0.4 },
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ''
        end,
      },
    },
    -- left = {
    --   {
    --     title = 'Oil',
    --     ft = 'oil',
    --     filter = function(buf)
    --       return vim.bo[buf].filetype == 'oil'
    --     end,
    --     size = { height = 0.5 },
    --     open = 'Oil .',
    --     pinned = true,
    --     collapsed = false,
    --   },
    --   {
    --     title = function()
    --       local buf_name = vim.api.nvim_buf_get_name(0) or '[No Name]'
    --       return vim.fn.fnamemodify(buf_name, ':t')
    --     end,
    --     ft = 'Outline',
    --     pinned = true,
    --     open = 'SymbolsOutlineOpen',
    --   },
    -- },
    right = {
      {
        ft = 'snacks_terminal',
        size = { width = 0.4 },
        title = 'Aider',
        filter = function(buf, win)
          -- Check if it's a snacks_terminal AND specifically for Aider
          return vim.w[win].snacks_win and vim.bo[buf].filetype == 'snacks_terminal' and (vim.b[buf].term_title and vim.b[buf].term_title:match 'aider')
        end,
      },
      -- Regular Snacks Terminal (positioned second to appear below)
      {
        ft = 'snacks_terminal',
        size = { width = 0.4 },
        title = '%{b:snacks_terminal.id}: %{b:term_title}',
        filter = function(buf, win)
          -- Check if it's a snacks_terminal but NOT for Aider
          return vim.w[win].snacks_win
            and vim.bo[buf].filetype == 'snacks_terminal'
            and vim.w[win].snacks_win.position == 'bottom'
            and vim.w[win].snacks_win.relative == 'editor'
            and not vim.w[win].trouble_preview
            and not (vim.b[buf].term_title and vim.b[buf].term_title:match 'aider')
        end,
      },
    },
  },
}
