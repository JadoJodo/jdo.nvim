return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = {
    options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp' },
    dir = vim.fn.stdpath 'state' .. '/sessions/',
    need = 1,
    branch = true,
  },
}
