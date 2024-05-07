return {
  'dmmulroy/tsc.nvim',
  'dmmulroy/ts-error-translator.nvim',
  config = function()
    require('tsc').setup()
    require('ts-error-translator').setup()
  end,
}
