return {
  'folke/edgy.nvim',
  event = 'VeryLazy',
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = 'screen'
  end,
  opts = {
    right = {
      -- Aider terminal (positioned first to appear above)
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
