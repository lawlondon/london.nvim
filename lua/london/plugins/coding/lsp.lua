return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'j-hui/fidget.nvim',
    'luckasRanarison/tailwind-tools.nvim',
    'onsails/lspkind-nvim',
    'stevearc/conform.nvim',
    'zapling/mason-conform.nvim',
  },

  config = function()
    local lsp_capabilities = vim.tbl_deep_extend('force', {}, vim.lsp.protocol.make_client_capabilities(), require('cmp_nvim_lsp').default_capabilities())
    lsp_capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    local default_setup = function(server)
      require('lspconfig')[server].setup {
        capabilities = lsp_capabilities,
      }
    end

    require('fidget').setup {}
    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = {
        -- C, C++
        'clangd',
        -- C#
        'omnisharp',
        -- CSS
        'cssls',
        -- DOCKER
        'dockerls',
        -- GO
        'gopls',
        -- HTML
        'html',
        -- JSON
        'jsonls',
        -- JAVA
        'jdtls',
        -- JS/TS
        'tsserver',
        -- JULIA
        'julials',
        -- LUA
        'lua_ls',
        -- MARKDOWN
        'markdown_oxide',
        -- PHP
        'intelephense',
        -- PYTHON
        'pyright',
        -- RUBY
        'ruby_lsp',
        -- RUST
        'rust_analyzer',
        -- SQL
        'sqlls',
        -- SVELTE
        'svelte',
        -- TAILWIND
        'tailwindcss',
      },
      handlers = {
        default_setup,
        ['lua_ls'] = function()
          local lspconfig = require 'lspconfig'
          lspconfig.lua_ls.setup {
            capabilities = lsp_capabilities,
            settings = {
              Lua = {
                runtime = { version = 'Lua 5.1' },
                diagnostics = {
                  globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' },
                },
              },
            },
          }
        end,
      },
    }

    local conform = require 'conform'
    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        svelte = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        liquid = { 'prettier' },
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        c_sharp = { 'csharpier' },
        go = { 'gofmt' },
        rust = { 'rustfmt' },
        php = { 'pretty-php' },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    }

    require('mason-conform').setup()

    local cmp = require 'cmp'
    cmp.setup {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      }),
      formatting = {
        format = require('lspkind').cmp_format {
          before = require('tailwind-tools.cmp').lspkind_format,
        },
      },

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      }),

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      }),
    }

    --keymaps
    --
    local map = vim.keymap.set

    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP Actions',
      callback = function(event)
        local opts = { buffer = event.buf }

        map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        map({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
        map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      end,
    })

    local wk = require 'which-key'
    wk.register {
      g = {
        name = 'Goto',
        d = 'Definition',
        D = 'Declaration',
        i = 'Implementation',
        o = 'Type Definiton',
        r = 'Reference',
        s = 'Signature',
      },
    }
  end,
}
