-- A Treesitter-based plugin that automatically closes and renames HTML, JSX, Vue, and other XML-like tags.
return {
  'windwp/nvim-ts-autotag',
  event = 'InsertEnter',
  config = function()
    require('nvim-ts-autotag').setup {
      enable = true,
    }
  end,
}
