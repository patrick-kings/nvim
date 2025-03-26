return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'gruvbox_dark', -- Change this to your preferred theme
      },

      extensions = { 'nvim-dap-ui' },
    }
  end,
}
