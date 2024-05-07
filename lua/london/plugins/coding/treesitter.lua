return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'c',
          'c_sharp',
          'cpp',
          'css',
          'dockerfile',
          'go',
          'html',
          'java',
          'javascript',
          'json',
          'jsonc',
          'julia',
          'lua',
          'markdown_inline',
          'php',
          'python',
          'rust',
          'ruby',
          'sql',
          'svelte',
          'tsx',
          'typescript',
          'vimdoc',
        },
        sync_install = false,
        auto_install = true,
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {}
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
}
