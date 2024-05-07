return {
  'dstein64/nvim-scrollview',
  config = function()
    require('scrollview').setup {
      scrollview_signs_on_startup = { 'all' },
    }
  end,
}
