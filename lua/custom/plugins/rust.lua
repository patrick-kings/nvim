return {
  -- { 'rust-lang/rust.vim' },
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    ft = { 'rust' },
  },

  {
    -- crates
    'Saecki/crates.nvim',
    -- tag = 'stable',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'BufRead Cargo.toml' },
    config = function()
      require('crates').setup {
        popup = { border = 'rounded' },
      }

      -- Keybindings for Crates
      local crates = require 'crates'

      -- Function to set keymaps only in Cargo.toml
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'toml',
        callback = function()
          if vim.fn.expand '%:t' == 'Cargo.toml' then
            vim.keymap.set('n', '<leader>cru', crates.update_crate, { desc = 'Update crate' })
            vim.keymap.set('n', '<leader>crU', crates.upgrade_crate, { desc = 'Upgrade crate' })
            vim.keymap.set('n', '<leader>cra', crates.update_all_crates, { desc = 'Update all crates' })
            vim.keymap.set('n', '<leader>crA', crates.upgrade_all_crates, { desc = 'Upgrade all crates' })
            vim.keymap.set('n', '<leader>crv', crates.show_versions_popup, { desc = 'Show crate versions' })
            vim.keymap.set('n', '<leader>crf', crates.show_features_popup, { desc = 'Show crate features' })
            vim.keymap.set('n', '<leader>crd', crates.show_dependencies_popup, { desc = 'Show dependencies' })
          end
        end,
      })

      --
    end,
  },
}
