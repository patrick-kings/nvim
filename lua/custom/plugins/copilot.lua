return {
  'github/copilot.vim',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = { enabled = false },
      panel = { enabled = false },
    }

    -- Enable Copilot by default
    vim.g.copilot_enabled = true
    vim.g.copilot_no_tab_map = true -- Prevent default <Tab> mapping

    -- Custom keymaps
    vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
    vim.api.nvim_set_keymap('i', '<C-K>', 'copilot#Previous()', { expr = true, silent = true })
    vim.api.nvim_set_keymap('i', '<C-L>', 'copilot#Next()', { expr = true, silent = true })
    vim.api.nvim_set_keymap('i', '<C-H>', 'copilot#Dismiss()', { expr = true, silent = true })
  end,
}
