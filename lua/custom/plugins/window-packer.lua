return {
  's1n7ax/nvim-window-picker',
  name = 'window-picker',
  event = 'VeryLazy',
  config = function()
    require('window-picker').setup {
      hint = 'floating-big-letter', -- 'statusline-winbar' | 'floating-big-letter' | 'floating-letter'
    }
  end,
}
