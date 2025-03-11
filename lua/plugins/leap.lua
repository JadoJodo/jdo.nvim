return {
  'ggandor/leap.nvim',
  lazy = false,
  dependencies = {
    'tpope/vim-repeat',
  },
  init = function(leap)
    require('leap').create_default_mappings()
    require('leap.user').set_repeat_keys('<enter>', '<backspace>')
  end,
  opts = {
    preview_filter = function(ch0, ch1, ch2)
      return not (ch1:match '%s' or ch0:match '%w' and ch1:match '%w' and ch2:match '%w')
    end,
    equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' },
  },
}
