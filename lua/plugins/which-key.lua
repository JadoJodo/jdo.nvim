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
      { '<leader>c', group = '[C]ode', mode = { 'n', 'x' }, icon = '' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>f', group = '[F]ile', icon = '󰈔' },
      { '<leader>g', group = '[G]oto', icon = '' },
      { '<leader>o', group = '[O]pen', icon = '' },
      { '<leader>r', group = '[R]un' },
      { '<leader>s', group = '[S]earch', icon = '󰥩' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]est' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>u', group = '[U]tilities', icon = '' },
    },
  },
}
