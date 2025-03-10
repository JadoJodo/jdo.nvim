-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
-- Keymaps
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.o.shell = '/opt/homebrew/bin/nu'
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250

vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.termguicolors = true

-- [ Basic Keymaps ]]
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
-- The following code creates a keymap to toggle inlay hints in your
-- code, if the language server you are using supports them
--
-- This may be unwanted, since they displace some of your code
if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
  vim.keymap.set('n', '<leader>th', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
  end, '[T]oggle Inlay [H]ints')
end

-- Setup lazy.nvim
require('lazy').setup {
  spec = {
    { import = 'plugins' },
  },
  install = { colorscheme = { 'habamax' } },
  checker = { enabled = true },
}
-- vim: ts=2 sts=2 sw=2 et
