-- A sidebar with a tree-like outline of symbols from your code, powered by LSP.
return {
  'hedyhli/outline.nvim',
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set('n', '<leader>co', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })

    vim.keymap.set('n', '<leader>o', '<cmd>OutlineFocus<CR>', { desc = 'Focus Outline' })

    require('outline').setup {
      -- Your setup opts here (leave empty to use defaults)
      outline_window = { width = 20, wrap = true },
    }
  end,
}
