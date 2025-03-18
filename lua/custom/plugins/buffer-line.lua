return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',

  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- Can be "tabs" for tab management
        numbers = 'ordinal', -- Show buffer numbers
        diagnostics = 'nvim_lsp', -- LSP diagnostics
        diagnostics_indicator = function(count, level, _, _)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
        separator_style = 'slant', -- Options: "slant", "padded_slant", "thick", "thin"
        offsets = {
          {
            filetype = 'neo-tree', -- eg NvimTree, neo-tree
            text = 'file system',
            text_align = 'center',
            highlight = 'Directory',
            separator = false, -- Adds a thin separator
          },
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
        show_buffer_close_icons = false, -- Hide close icons
        show_close_icon = false,
        show_tab_indicators = true,
        always_show_bufferline = true,
        highlights = {
          buffer_selected = {
            fg = '#ffffff',
            bold = false,
            italic = true,
          },
          separator_selected = {
            fg = '#61afef',
            bold = false,
          },
        },
      },
    }
  end,
}
