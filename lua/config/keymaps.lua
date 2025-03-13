vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<left>', function()
  require 'notify' 'Use h to move'
end)
vim.keymap.set('n', '<right>', function()
  require 'notify' 'Use l to move'
end)
vim.keymap.set('n', '<up>', function()
  require 'notify' 'Use k to move'
end)
vim.keymap.set('n', '<down>', function()
  require 'notify' 'Use j to move'
end)

vim.keymap.set('n', '<leader>cr', ':IncRename ')
vim.keymap.set('n', '<leader>cr', function()
  return ':IncRename ' .. vim.fn.expand '<cword>'
end, { expr = true })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
  vim.keymap.set('n', '<leader>ch', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
  end, 'Toggle [C]ode [H]ints')
end
vim.keymap.set('n', '<leader>cr', '<cmd>Telescope lsp_definitions<cr>', { desc = 'Show [C]ode [R]eferences' })
vim.keymap.set('n', '<leader>bd', function()
  require('mini.bufremove').delete()
end, { desc = '[b]uffer [d]elete' })
vim.keymap.set('n', '<leader>l', '<cmd>:Lazy<cr>', { desc = 'Open [l]azy' })
