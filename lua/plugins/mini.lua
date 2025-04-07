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
    require('mini.files').setup {
      windows = {
        preview = true,
      },
      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesActionRename',
        callback = function(event)
          Snacks.rename.on_rename_file(event.data.from, event.data.to)
        end,
      }),
    }
    require('mini.animate').setup()
    require('mini.notify').setup()
  end,
}
