return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = 'BufReadPost',
    config = function()
      local opts = {
        -- suggestion = { enabled = true },
        -- panel = { enabled = false },
        suggestion = {
          enabled = not vim.g.ai_cmp,
          auto_trigger = true,
          hide_during_completion = vim.g.ai_cmp,
          keymap = {
            accept = '<C-J>', -- handled by nvim-cmp / blink.cmp
            next = '<C-L>',
            prev = '<C-K>',
            dismiss = '<C-H>',
          },
        },
        panel = { enabled = false },
        filetypes = {
          markdown = true,
          help = true,
        },
      }

      require('copilot').setup(opts)

      -- Enable Copilot by default
      vim.g.copilot_enabled = true
      vim.g.copilot_no_tab_map = true -- Prevent default <Tab> mapping

      -- Custom keymaps
      -- vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
      -- vim.api.nvim_set_keymap('i', '<C-L>', 'copilot#Next()', { expr = true, silent = true })
      -- vim.api.nvim_set_keymap('i', '<C-K>', 'copilot#Previous()', { expr = true, silent = true })
      -- vim.api.nvim_set_keymap('i', '<C-H>', 'copilot#Dismiss()', { expr = true, silent = true })
    end,
  },

  {
    'zbirenbaum/copilot-cmp',
    dependencies = {
      'zbirenbaum/copilot.lua',
    },
    config = function()
      require('copilot_cmp').setup {}
    end,
  },
}
