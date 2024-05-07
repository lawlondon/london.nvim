return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown {},
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      },
    }

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help Tags' })

    local wk = require 'which-key'
    wk.register({
      f = {
        name = 'file',
      },
    }, { prefix = '<leader>' })
  end,

  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').load_extension 'ui-select'
      require('telescope').load_extension 'fzf'
    end,
  },
}
