return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.operators').setup()
    -- require('mini.surround').setup()
    require('mini.comment').setup()
    require('mini.pairs').setup()
    require('mini.statusline').setup {
      use_icons = vim.g.have_nerd_font,
      section_location = function()
        return '%2l:%-2v'
      end,
    }
    require('mini.bufremove').setup()
    require('mini.animate').setup()
    require('mini.indentscope').setup()
    require('mini.sessions').setup()
    require('mini.notify').setup()
  end,
}
