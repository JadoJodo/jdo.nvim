return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  lazy = false,
  opts = function(_, opts)
    opts.options = {
      separator_style = 'slope',
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neotree',
          text_align = 'left',
          separator = true,
        },
      },
    }
  end,
}
