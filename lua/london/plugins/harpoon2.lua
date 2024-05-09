return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    }
    local map = vim.keymap.set
    map('n', '<leader>a', function()
      harpoon:list():add()
    end)
    map('n', '<leader>h', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    map('n', '<leader>1', function()
      harpoon:list():select(1)
    end)
    map('n', '<leader>2', function()
      harpoon:list():select(2)
    end)
    map('n', '<leader>3', function()
      harpoon:list():select(3)
    end)
    map('n', '<leader>4', function()
      harpoon:list():select(4)
    end)
    map('n', '<leader>5', function()
      harpoon:list():select(5)
    end)
    map('n', '<leader>6', function()
      harpoon:list():select(6)
    end)
    map('n', '<leader>7', function()
      harpoon:list():select(7)
    end)
    map('n', '<leader>8', function()
      harpoon:list():select(8)
    end)
    -- Toggle previous & next buffers stored within Harpoon list
    map('n', '<S-h>', function()
      harpoon:list():prev()
    end)
    map('n', '<S-l>', function()
      harpoon:list():next()
    end)
  end,
}
