local palette = require('catppuccin.palettes').get_palette 'mocha'
local lualine_color_theme = require 'catppuccin.utils.lualine'()

for _, mode in ipairs {
  'normal',
  'insert',
  'terminal',
  'command',
  'visual',
  'replace',
  'inactive',
} do
  lualine_color_theme[mode].a.bg = palette.mantle
  lualine_color_theme[mode].b.bg = palette.mantle
  if lualine_color_theme[mode].c then
    lualine_color_theme[mode].c.bg = palette.mantle
  end
end

local sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

function fg_color_mode()
  local mode = vim.fn.mode()
  local colors_mode = {
    ['n'] = palette.blue,
    ['v'] = palette.mauve,
    ['V'] = palette.mauve,
    ['\22'] = palette.mauve,
    ['i'] = palette.peach,
    ['c'] = palette.green,
    ['R'] = palette.red,
  }

  return { fg = colors_mode[mode] or palette.text }
end

table.insert(sections.lualine_a, {
  function()
    return '▊'
  end,
  color = fg_color_mode,
  padding = { left = 0, right = 0 },
})

table.insert(sections.lualine_a, {
  'mode',
  color = fg_color_mode,
})

table.insert(sections.lualine_b, {
  'branch',
  color = fg_color_mode,
  icon = '',
})

table.insert(sections.lualine_b, { 'diff' })

table.insert(sections.lualine_b, {
  'diagnostics',
  padding = { left = 1, right = 2 },
  symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' },
})

table.insert(sections.lualine_c, { 'filename' })
table.insert(sections.lualine_x, { 'filetype' })

table.insert(sections.lualine_y, {
  'progress',
  color = fg_color_mode,
  padding = { left = 2, right = 1 },
})

table.insert(sections.lualine_z, {
  'location',
  color = fg_color_mode,
})

table.insert(sections.lualine_z, {
  function()
    return '▊'
  end,
  color = fg_color_mode,
  padding = { left = 0, right = 0 },
})

require('lualine').setup {
  options = {
    theme = lualine_color_theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'neo-tree' },
  },
  sections = sections,
}
