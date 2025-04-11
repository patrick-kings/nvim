return {
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
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy

    config = function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.keymap.set('n', '<leader>rsa', function()
        vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
      end, { silent = true, buffer = bufnr })
      vim.keymap.set(
        'n',
        '<leader>rsh', -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
        function()
          vim.cmd.RustLsp { 'hover', 'actions' }
        end,
        { silent = true, buffer = bufnr }
      )
    end,
  },

  -- {
  --   'mrcjkb/rustaceanvim',
  --   -- version = vim.fn.has 'nvim-0.10.0' == 0 and '^5' or false,
  --   ft = { 'rust' },
  --   opts = {
  --     server = {
  --       on_attach = function(_, bufnr)
  --         vim.keymap.set('n', '<leader>cR', function()
  --           vim.cmd.RustLsp 'codeAction'
  --         end, { desc = 'Code Action', buffer = bufnr })
  --         vim.keymap.set('n', '<leader>dr', function()
  --           vim.cmd.RustLsp 'debuggables'
  --         end, { desc = 'Rust Debuggables', buffer = bufnr })
  --       end,
  --       default_settings = {
  --         -- rust-analyzer language server configuration
  --         ['rust-analyzer'] = {
  --           cargo = {
  --             allFeatures = true,
  --             loadOutDirsFromCheck = true,
  --             buildScripts = {
  --               enable = true,
  --             },
  --           },
  --           -- Add clippy lints for Rust if using rust-analyzer
  --           checkOnSave = diagnostics == 'rust-analyzer',
  --           -- Enable diagnostics if using rust-analyzer
  --           diagnostics = {
  --             enable = diagnostics == 'rust-analyzer',
  --           },
  --           procMacro = {
  --             enable = true,
  --             ignored = {
  --               ['async-trait'] = { 'async_trait' },
  --               ['napi-derive'] = { 'napi' },
  --               ['async-recursion'] = { 'async_recursion' },
  --             },
  --           },
  --           files = {
  --             excludeDirs = {
  --               '.direnv',
  --               '.git',
  --               '.github',
  --               '.gitlab',
  --               'bin',
  --               'node_modules',
  --               'target',
  --               'venv',
  --               '.venv',
  --             },
  --           },
  --         },
  --       },
  --     },
  --   },
  --   config = function(_, opts)
  --     if LazyVim.has 'mason.nvim' then
  --       local package_path = require('mason-registry').get_package('codelldb'):get_install_path()
  --       local codelldb = package_path .. '/extension/adapter/codelldb'
  --       local library_path = package_path .. '/extension/lldb/lib/liblldb.dylib'
  --       local uname = io.popen('uname'):read '*l'
  --       if uname == 'Linux' then
  --         library_path = package_path .. '/extension/lldb/lib/liblldb.so'
  --       end
  --       opts.dap = {
  --         adapter = require('rustaceanvim.config').get_codelldb_adapter(codelldb, library_path),
  --       }
  --     end
  --     vim.g.rustaceanvim = vim.tbl_deep_extend('keep', vim.g.rustaceanvim or {}, opts or {})
  --     if vim.fn.executable 'rust-analyzer' == 0 then
  --       LazyVim.error('**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/', { title = 'rustaceanvim' })
  --     end
  --   end,
  -- },
}
