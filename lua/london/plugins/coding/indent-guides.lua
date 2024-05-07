return {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    local guide = '▏'

    require('ibl').setup { indent = { char = guide } }
  end,
}
