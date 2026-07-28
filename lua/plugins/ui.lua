return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'echasnovski/mini.icons',
    event = 'VeryLazy',
    config = function()
      require('plugins.config.lualine')
    end
  },
  {
    'ibhagwan/fzf-lua',
    dependencies = 'echasnovski/mini.icons',
    keys = {
      { '<leader>ff', '<cmd>FzfLua files<CR>', 'Find files' },
      { '<leader>fb', '<cmd>FzfLua buffers<CR>', 'Find buffers' },
      { '<leader>fg', '<cmd>FzfLua live_grep<CR>', 'Livre grep' },
      -- git
      { '<leader>gs', '<cmd>FzfLua git_status<CR>', 'Git status' },
      { '<leader>gd', '<cmd>FzfLua git_diff<CR>', 'Git diff' },
      { '<leader>gc', '<cmd>FzfLua git_commits<CR>', 'Git commits' },
      { '<leader>gx', '<cmd>FzfLua git_bcommits<CR>', 'Git buffer commits' },
      { '<leader>gt', '<cmd>FzfLua git_tags<CR>', 'Git tags' },
      { '<leader>gb', '<cmd>FzfLua git_branches<CR>', 'Git branches' }
    }
  },
  {
    'folke/which-key.nvim',
    version = 'v3.*',
    event = 'VeryLazy',
    opts = {
      preset = 'helix',
      icons = {
        mappings = false
      },
      spec = {
        {
          mode = { 'n' },
          { '<leader>w', desc = 'Write' },
          { '<leader>q', desc = 'Quit'},
          -- fzf-lua
          { '<leader>f', group = 'Find/files' },
          { '<leader>ff', desc = 'Find files' },
          { '<leader>fg', desc = 'Live grep' },
          { '<leader>fb', desc = 'List buffers' },
          -- fzf-lua (git)
          { '<leader>g', group = 'Git' },
          { '<leader>gs', desc = 'Git status' },
          { '<leader>gd', desc = 'Git diff' },
          { '<leader>gc', desc = 'Git commits' },
          { '<leader>gx', desc = 'Git buffer commits' },
          { '<leader>gt', desc = 'Git tags' },
          { '<leader>gb', desc = 'Git branches' },
          -- oil files
          { '<leader>e', desc = 'File explorer' },
          -- trouble
          { '<leader>t', group = 'Lsp'},
          { '<leader>tx', desc = 'Project diagnostics'},
          { '<leader>tX', desc = 'Buffer diagnostics'},
          -- others
          { '<leader>l', desc = 'Lazy' },
        },
      }
    }
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      require('neo-tree').setup({
        default_component_configs = {
          indent = {
            with_expanders = true,
            expander_collapsed = '',
            expander_expanded = '',
          },
          icon = {
            folder_closed = '󰉋',
            folder_open = '',
            folder_empty = '',
            default = '',
          },
          name = {
            use_git_status_colors = true,
          },
          git_status = {
            symbols = {
              deleted = '',
              renamed = '➜',
              untracked = '',
              unstaged = '',
              staged = '',
              ignored = '◌',
              conflict = '',
            },
          },
        },
        window = {
          width = 30,
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              '.git',
            },
          },
        },
        event_handlers = {
          {
            event = 'file_opened',
            handler = function()
              vim.cmd('Neotree close')
            end,
          },
        },
      })
    end
  },
  {
    'echasnovski/mini.icons',
    version = 'v0.16.*',
    lazy = true,
    config = function()
      require('mini.icons').setup()
      require('mini.icons').mock_nvim_web_devicons()
    end
  },
  { 'christoomey/vim-tmux-navigator', event = 'VeryLazy' },
}