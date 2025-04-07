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

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window', silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to below window', silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to above window', silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window', silent = true })
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { desc = 'Move to left window from terminal', silent = true })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { desc = 'Move to below window from terminal', silent = true })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { desc = 'Move to above window from terminal', silent = true })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { desc = 'Move to right window from terminal', silent = true })

if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
  vim.keymap.set('n', '<leader>ch', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
  end, 'Toggle [c]ode [h]ints')
end
vim.keymap.set('n', '<leader>cr', '<cmd>Telescope lsp_definitions<cr>', { desc = 'Show [C]ode [R]eferences' })
vim.keymap.set('n', '<leader>bd', '<cmd>:lua Snacks.bufdelete()<cr>', { desc = '[b]uffer [d]elete' })

vim.keymap.set('n', '<leader>tl', '<cmd>:Lazy<cr>', { desc = '[l]azy' })
vim.keymap.set('n', '<leader>of', '<cmd>:lua MiniFiles.open()<cr>', { desc = '[o]pen [f]iles' })

-- fzf_lua
vim.keymap.set('n', '<leader><leader>', '<cmd>FzfLua buffers<cr>', { desc = 'search open buffers' })
vim.keymap.set('n', '<leader>/', '<cmd>FzfLua blines<cr>', { desc = 'search current buffer' })
vim.keymap.set('n', '<leader>ca', '<cmd>FzfLua lsp_code_actions<cr>', { desc = 'LSP: [c]ode [a]ctions' })
vim.keymap.set('n', '<leader>gd', '<cmd>FzfLua lsp_definitions<cr>', { desc = 'LSP: [g]oto [d]efinition' })
vim.keymap.set('n', '<leader>gD', '<cmd>FzfLua lsp_declarations<cr>', { desc = 'LSP: [g]oto [D]eclaration' })
vim.keymap.set('n', '<leader>gt', '<cmd>FzfLua lsp_typedefs<cr>', { desc = 'LSP: [g]oto [t]ype definition' })
vim.keymap.set('n', '<leader>gI', '<cmd>FzfLua lsp_implementations<cr>', { desc = 'LSP: [g]oto [I]mplementation' })
vim.keymap.set('n', '<leader>gr', '<cmd>FzfLua lsp_references<cr>', { desc = 'LSP: [g]oto [r]eferences' })
vim.keymap.set('n', '<leader>ds', '<cmd>FzfLua lsp_document_symbols<cr>', { desc = 'LSP: [d]ocument [s]ymbols' })
vim.keymap.set('n', '<leader>s/', '<cmd>FzfLua lines<cr>', { desc = '[s]earch open buffers' })
vim.keymap.set('n', '<leader>sb', '<cmd>FzfLua builtin<cr>', { desc = '[s]earch [b]uilt-in' })
vim.keymap.set('n', '<leader>sd', '<cmd>FzfLua diagnostics_document <cr>', { desc = '[s]earch [d]ocument diagnostics' })
vim.keymap.set('n', '<leader>sf', '<cmd>FzfLua files <cr>', { desc = '[s]earch project [f]iles' })
vim.keymap.set('n', '<leader>Sf', '<cmd>FzfLua files no_ignore=true<cr>', { desc = '[S]earch all project [f]iles (no ignore)' })
vim.keymap.set('n', '<leader>sg', '<cmd>FzfLua grep<cr>', { desc = '[s]earch [g]rep' })
vim.keymap.set('n', '<leader>sG', '<cmd>FzfLua live_grep<cr>', { desc = 'live [G]rep' })
vim.keymap.set('n', '<leader>si', '<cmd>FzfLua grep<cr>', { desc = 'grep [i]gnored' })
vim.keymap.set('n', '<leader>sI', '<cmd>FzfLua live_grep no_ignore=true<cr>', { desc = 'live grep [I]gnored' })
vim.keymap.set('n', '<leader>sh', '<cmd>FzfLua help_tags<cr>', { desc = '[s]earch [h]elp docs' })
vim.keymap.set('n', '<leader>sc', '<cmd>FzfLua files cwd=~/.config/<cr>', { desc = '.[c]onfig' })
vim.keymap.set('n', '<leader>sk', '<cmd>FzfLua keymaps<cr>', { desc = '[s]earch [k]eymaps' })
vim.keymap.set('n', '<leader>sn', '<cmd>FzfLua files cwd=~/.config/nvim/<cr>', { desc = '[s]earch [n]eovim files' })
vim.keymap.set('n', '<leader>sr', '<cmd>FzfLua live_resume<cr>', { desc = '[s]earch [r]esume' })
vim.keymap.set('n', '<leader>sw', '<cmd>FzfLua grep_cword<cr>', { desc = '[s]earch current [w]ord' })
vim.keymap.set('n', '<leader>s.', '<cmd>FzfLua oldfiles<cr>', { desc = '[s]earch recent files' })
vim.keymap.set('n', '<leader>ws', '<cmd>FzfLua lsp_workspace_symbols<cr>', { desc = 'LSP: [w]orkspace [s]ymbols' })

-- Snacks
vim.keymap.set('n', '<leader>ot', '<cmd>:lua Snacks.terminal.open()<cr>', { desc = '[t]erminal' })
vim.keymap.set('n', '<leader>tt', '<cmd>:lua Snacks.terminal.toggle()<cr>', { desc = '[t]erminal' })
-- vim.keymap.set('n', '<leader>t', function()
--   ---@type fun(... :snacks.toggle.Opts): snacks.toggle.Class
--   require('snacks').toggle()
-- end, { desc = '[t]oggle' })
-- Neotest
vim.keymap.set('n', '<leader>rtn', function()
  require('neotest').run.run()
end, { desc = '[t]est ([n]earest)' })
vim.keymap.set('n', '<leader>rtf', function()
  require('neotest').run.run(vim.fn.expand '%')
end, { desc = '[t]est (current [f]ile)' })
vim.keymap.set('n', '<leader>rta', function()
  require('neotest').run.run { suite = true }
end, { desc = '[t]est ([a]ll)' })
vim.keymap.set('n', '<leader>tns', function()
  require('neotest').summary.toggle()
end, { desc = '[s]ummary' })
vim.keymap.set('n', '<leader>tno', function()
  require('neotest').output_panel.toggle()
end, { desc = '[o]utput panel' })

-- Aider
vim.keymap.set('n', '<leader>ta', '<cmd>AiderTerminalToggle<cr>', { desc = '[a]ider' })
vim.keymap.set({ 'n', 'v' }, '<leader>as', '<cmd>AiderTerminalSend<cr>', { desc = 'Send to Aider' })
vim.keymap.set('n', '<leader>ac', '<cmd>AiderQuickSendCommand<cr>', { desc = 'Send Command To Aider' })
vim.keymap.set('n', '<leader>ab', '<cmd>AiderQuickSendBuffer<cr>', { desc = 'Send Buffer To Aider' })
vim.keymap.set('n', '<leader>a+', '<cmd>AiderQuickAddFile<cr>', { desc = 'Add File to Aider' })
vim.keymap.set('n', '<leader>a-', '<cmd>AiderQuickDropFile<cr>', { desc = 'Drop File from Aider' })
vim.keymap.set('n', '<leader>ar', '<cmd>AiderQuickReadOnlyFile<cr>', { desc = 'Add File as Read-Only' })

-- LazyGit
vim.keymap.set('n', '<leader>tg', '<cmd>LazyGit<cr>', { desc = '[g]it' })

-- persistence
vim.keymap.set('n', '<leader>os', function()
  require('persistence').load()
end, { desc = '[s]ession (current directory)' })

vim.keymap.set('n', '<leader>oS', function()
  require('persistence').select()
end, { desc = '[S]ession' })

vim.keymap.set('n', '<leader>ol', function()
  require('persistence').load { last = true }
end, { desc = '[l]ast session' })

vim.keymap.set('n', '<leader>tp', function()
  require('persistence').stop()
end, { desc = '[p]ersistence' })

-- Twilight
vim.keymap.set('n', '<leader>tw', '<cmd>Twilight<cr>', { desc = 't[w]ilight' })

-- Zen Mode
vim.keymap.set('n', '<leader>tz', function()
  require('zen-mode').toggle {
    window = {
      width = 0.85, -- width will be 85% of the editor width
    },
  }
end, { desc = '[z]en mode' })

-- Flash
vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
  require('flash').jump()
end, { desc = 'Flash' })
vim.keymap.set({ 'n', 'x', 'o' }, 'S', function()
  require('flash').treesitter()
end, { desc = 'Flash Treesitter' })
vim.keymap.set({ 'o' }, 'r', function()
  require('flash').remote()
end, { desc = 'Remote Flash' })
vim.keymap.set({ 'o', 'x' }, 'R', function()
  require('flash').treesitter_search()
end, { desc = 'Treesitter Search' })
vim.keymap.set({ 'c' }, '<c-s>', function()
  require('flash').toggle()
end, { desc = 'Toggle Flash Search' })

-- Mason
vim.keymap.set('n', '<leader>tm', '<cmd>Mason<cr>', { desc = '[m]ason' })
