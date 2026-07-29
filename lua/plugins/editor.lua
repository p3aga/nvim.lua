return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = 'HiPhish/rainbow-delimiters.nvim',
    lazy = false,
    build = ':TSUpdate',
    config = function ()
      local nvim_treesitter = require('nvim-treesitter')
      nvim_treesitter.setup({
        install_dir = vim.fn.stdpath('data') .. '/site'
      })
      nvim_treesitter.install({
        'python',
        'vue',
        'html',
        'bash',
        'javascript',
        'json',
        'lua',
        'dockerfile',
        'yaml',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'gitcommit',
        'gitignore',
      })
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy',
    config = function ()
      require('ibl').setup({ scope = { enabled = false }})
    end
  },
  {
    'numToStr/Comment.nvim',
    version = 'v0.8.*',
    event = 'VeryLazy'
  },
  {
    'windwp/nvim-autopairs',
    event = 'VeryLazy',
    opts = {
      check_ts = true,
      ts_config = {
        lua = { 'string' },
        javascript = { 'template_string' },
        java = false,
      },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    version = 'v1.*',
    event = 'VeryLazy',
    config = function()
      require('gitsigns').setup()
    end
  }
}