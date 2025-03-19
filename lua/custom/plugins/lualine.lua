return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'gruvbox_dark', -- Change this to your preferred theme
      },
    }

    -- diagnostics on status line
    function DiagnosticsCount()
      local error_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      local warning_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

      local error_sign = '' -- Nerd Font icon (customize if needed)
      local warn_sign = ''

      return string.format(' %s %d  %s %d ', error_sign, error_count, warn_sign, warning_count)
    end
  end,
}
