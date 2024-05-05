return {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    config = function()
	    require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
} end,
     

    dependencies = { 'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      config = function()
      require('telescope').load_extension('fzf')
      end,},
      
    }
