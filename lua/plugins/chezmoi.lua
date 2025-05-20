return {
  'xvzc/chezmoi.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = function(plugin, opts)
    -- Function to set up an autocommand for chezmoi files
    local function setup_chezmoi_autocmd()
      local chezmoi_path = os.getenv 'HOME' .. '/.local/share/chezmoi/*'

      -- Set up the autocommand
      vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
        pattern = { chezmoi_path }, -- Ensure this is a single pattern
        callback = function(ev)
          local bufnr = ev.buf
          vim.schedule(function()
            require('chezmoi.commands.__edit').watch(bufnr)
          end)
        end,
      })
    end

    -- Command to trigger fzf for chezmoi
    vim.api.nvim_command 'command! ChezmoiFzf lua require("fzf-lua").fzf_exec(require("chezmoi.commands").list(), { actions = { ["default"] = function(selected, opts) require("chezmoi.commands").edit { targets = { "~/" .. selected[1] }, args = { "--watch" } } end } }) end'

    -- Initialize the autocommand
    setup_chezmoi_autocmd()
  end,
}
