vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local keymap = vim.keymap

function Close_buffer_or_exit()
  local countBufs = #vim.fn.getbufinfo({ buflisted = 1})
  local currentBufferUnsaved = vim.api.nvim_get_option_value(
    'modified', { buf = vim.fn.bufnr() }
  )
  if currentBufferUnsaved then
    print('Save or restore the file!!!')
  elseif countBufs > 1 then
    vim.api.nvim_command('bd')
  else
    vim.api.nvim_command('q')
  end
end

keymap.set('n', '<leader>w', '<cmd>w<CR>')
keymap.set('n', '<leader>q', '<cmd>q<CR>')

keymap.set('n', '<S-l>', '<cmd>bnext<CR>')
keymap.set('n', '<S-h>', '<cmd>bprev<CR>')
keymap.set('n', '<S-x>', Close_buffer_or_exit)

keymap.set('n', '<leader>l', '<cmd>Lazy<CR>')

keymap.set('n', '<leader>e', ':Neotree . toggle<CR>')