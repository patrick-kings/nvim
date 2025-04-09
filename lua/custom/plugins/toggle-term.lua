return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = function(term)
        if term.direction == 'horizontal' then
          return 12
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-\>]], -- Default toggle keybinding
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = false,
      direction = 'horizontal', -- Can be 'horizontal', 'vertical', 'tab', 'float'
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'rounded',
        winblend = 10,
        highlights = { border = 'Normal', background = 'Normal' },
      },
    }
    -- Terminal keybindings
    local Terminal = require('toggleterm.terminal').Terminal

    -- Floating terminal
    local float_term = Terminal:new { direction = 'float' }
    vim.keymap.set('n', '<leader>tmf', function()
      float_term:toggle()
    end, { desc = 'Toggle floating terminal' })

    -- Horizontal terminal
    local horiz_term = Terminal:new { direction = 'horizontal' }
    vim.keymap.set('n', '<leader>tmh', function()
      horiz_term:toggle()
    end, { desc = 'Toggle horizontal terminal' })

    -- Vertical terminal
    local vert_term = Terminal:new { direction = 'vertical' }
    vim.keymap.set('n', '<leader>tmv', function()
      vert_term:toggle()
    end, { desc = 'Toggle vertical terminal' })

    -- Tab terminal
    local tab_term = Terminal:new { direction = 'tab' }
    vim.keymap.set('n', '<leader>tmb', function()
      tab_term:toggle()
    end, { desc = 'Toggle tab terminal' })

    vim.keymap.set('v', '<leader>tmv', '<cmd>ToggleTermSendVisualSelection<CR>', { silent = true, desc = 'Send the visually selected text to terminal' })

    vim.keymap.set('n', '<leader>tml', '<cmd>ToggleTermSendCurrentLine<CR>', { silent = true, desc = 'Send the whole line to terminal' })

    --
  end,
}
