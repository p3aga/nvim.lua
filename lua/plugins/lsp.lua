return {
  {
    'neovim/nvim-lspconfig',
    version = 'v2.*',
    dependencies = {
      'saghen/blink.cmp',
      'mason-org/mason.nvim'
    },
    event = 'VeryLazy',
    config = function()
      require('config.lsp')
    end
  },
  {
    'saghen/blink.cmp',
    version = 'v1.*',
    dependencies = 'L3MON4D3/LuaSnip',
    lazy = true,
    opts = {
      snippets = { preset = 'luasnip' },
      completion = {
        menu = {
          auto_show = true,
          draw = {
            columns = {
              { 'label', 'label_description', gap = 1 },
              { 'kind_icon', 'kind', gap = 1 }
            }
          }
        },
        documentation = {
          auto_show = true,
        },
      },
      keymap = {
        preset = 'none',
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<C-\\>'] = { 'show' },
        ['<C-e>'] = { 'hide' },
        ['<CR>'] = { 'accept', 'fallback' },
      }
    }
  },
  {
    'mason-org/mason.nvim',
    version = 'v2.*',
    dependencies = 'mason-org/mason-lspconfig.nvim',
    keys = {
      {'<leader>m', '<cmd>Mason<CR>', 'Mason Menu'},
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'ansiblels',
          'astro',
          'bashls',
          'cssls',
          'docker_language_server',
          'docker_compose_language_service',
          'gopls',
          'html',
          'jsonls',
          'lua_ls',
          'pyright',
          'ts_ls',
          'vue_ls',
          'yamlls'
        },
      })
    end
  },
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    dependencies = 'rafamadriz/friendly-snippets',
    lazy = true,
    config = function ()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  {
    'folke/trouble.nvim',
    version = 'v3.*',
    keys = {
      { '<leader>tx', '<cmd>Trouble diagnostics toggle<CR>', 'Diagnostics' },
      { '<leader>tX', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', 'Buffer Diagnostics' },
      { 'td', '<cmd>Trouble lsp_definitions toggle<CR>', 'Diagnostics' },
    },
    opts = {
      focus = true,
      modes = {
        lsp_definitions = {
          win = {
            position = 'right',
            size = 80
          },
        },
      }
    },
    config = function(_, opts)
      local has_ts, trouble_ts = pcall(require, 'trouble.view.treesitter')
      if has_ts then
        trouble_ts.setup = function() end
      end
      require('trouble').setup(opts)
    end
  }
}