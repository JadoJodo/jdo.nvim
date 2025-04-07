return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    delay = 0,
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },

    -- Document existing key chains
    spec = {
      { '<leader>b', group = '[b]uffer', mode = { 'n' } },
      { '<leader>c', group = '[c]ode', mode = { 'n', 'x' }, icon = '' },
      { '<leader>d', group = '[d]ocument' },
      { '<leader>f', group = '[f]ile', icon = '󰈔' },
      { '<leader>g', group = '[g]oto', icon = '' },
      { '<leader>o', group = '[o]pen', icon = '' },
      { '<leader>r', group = '[r]un' },
      { '<leader>t', group = '[t]oggle', mode = { 'n' }, {
        '<leader>tn',
        group = '[n]eotest',
      } },
      { '<leader>s', group = '[s]earch', icon = '󰥩' },
      { '<leader>w', group = '[w]orkspace' },
      { '<leader>r', group = '[r]un' },
      { '<leader>h', group = 'git [h]unk', mode = { 'n', 'v' } },
      { '<leader>u', group = '[u]tilities', icon = '' },
    },
  },
}
