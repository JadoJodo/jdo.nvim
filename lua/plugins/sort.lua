return {
  'sQVe/sort.nvim',
  config = function()
    vim.keymap.set('v', '<leader>cs', '<Esc><Cmd>Sort<CR>', { desc = 'Sort highlighted lines' })
  end,
}
