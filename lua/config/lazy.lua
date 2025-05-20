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
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.g.have_nerd_font = true
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
vim.o.shell = '/opt/homebrew/bin/nu'
vim.o.autoread = true
vim.opt.breakindent = true
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.list = true
vim.opt.listchars = { tab = '→ ', trail = '·', nbsp = '␣', extends = '»', precedes = '«' }
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.rtp:prepend(lazypath)
vim.opt.scrolloff = 10
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.laststatus = 3
vim.g.markdown_fenced_languages = {
  'ts=typescript',
}
-- Change diagnostic symbols in the sign column
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Format the diagnostic message
vim.diagnostic.config {
  float = {
    source = true, -- Show source of diagnostic
    border = 'rounded', -- Add border to floating window
    header = '', -- No header in floating window
    prefix = '', -- No prefix for each diagnostic line
  },
  virtual_text = {
    prefix = '●', -- Use dot as prefix for virtual text
    spacing = 4, -- Spaces between end of line and virtual text
  },
  signs = true, -- Show diagnostic symbols in the sign column:q
  underline = true, -- Underline text with issues
  update_in_insert = false, -- Don't update diagnostics while typing
  severity_sort = true, -- Sort diagnostics by severity
}

require 'config.keymaps'

-- Setup lazy.nvim
require('lazy').setup {
  spec = {
    {
      { import = 'plugins' },
      { import = 'themes.tokyonight' },
    },
  },
  checker = { enabled = true },
}

-- vim: ts=2 sts=2 sw=2 et
