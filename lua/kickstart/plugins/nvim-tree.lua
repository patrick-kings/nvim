return {
  'nvim-tree/nvim-tree.lua',
  cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
  opts = function()
    return require 'custom.configs.nvim-tree'
  end,
  config = function(_, opts)
    require('nvim-tree').setup(opts)
  end,
}
