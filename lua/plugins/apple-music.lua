return {
  'p5quared/apple-music.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = true,
  keys = {

    {
      '<leader>sp',
      function()
        require('apple-music').select_playlist_telescope()
      end,
      desc = '[S]earch [P]laylists',
    },
    {
      '<leader>sa',
      function()
        require('apple-music').select_album_telescope()
      end,
      desc = '[S]earch [A]lbums',
    },
    {
      '<leader>st',
      function()
        require('apple-music').select_track_telescope()
      end,
      desc = '[S]earch [S]ongs',
    },
    {
      '<leader>uac',
      function()
        require('apple-music').cleanup_all()
      end,
      desc = '[U]tilities: [A]pple Music [C]leanup Temp Playlists',
    },
  },
}
