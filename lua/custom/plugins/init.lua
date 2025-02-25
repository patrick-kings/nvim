-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  -- debugging -----------------------
  -- {
  --   'rcarriga/nvim-dap-ui',
  --   dependencies = {
  --     'theHamsta/nvim-dap-virtual-text',
  --     'rcarriga/nvim-dap-ui',
  --     'mxsdev/nvim-dap-vscode-js',
  --     'mfussenegger/nvim-dap',
  --     'nvim-neotest/nvim-nio',
  --     {
  --       'folke/neodev.nvim',
  --       opts = {
  --         function()
  --           return {
  --             library = { plugins = { 'nvim-dap-ui' }, types = true },
  --           }
  --         end,
  --       },
  --       config = function(_, opts)
  --         require('neodev').setup(opts)
  --       end,
  --     },
  --   },
  --   config = function()
  --     require 'custom.configs.nvim-dap'
  --   end,
  -- },
  -- {
  --   -- go debug
  --   'leoluz/nvim-dap-go',
  --   dependencies = {
  --     'rcarriga/nvim-dap-ui',
  --   },
  --   opts = {
  --     dap_configurations = {
  --       {
  --         type = 'go',
  --         name = 'debug',
  --         request = 'launch',
  --       },
  --     },
  --     delve = {
  --       detached = false,
  --       path = 'dlv',
  --       -- initialize_timeout_sec = 20,
  --       -- port = "${port}",
  --       -- args = {},
  --       -- build_flags = "",
  --     },
  --   },
  --   config = function(_, opts)
  --     require('dap-go').setup(opts)
  --     require('dap').set_log_level 'TRACE'
  --   end,
  -- },
  -- {
  --   'theHamsta/nvim-dap-virtual-text',
  -- },
  -- {
  --   'nvim-telescope/telescope-dap.nvim',
  -- },

  -- {
  --   'LiadOz/nvim-dap-repl-highlights',
  --   config = true,
  --   dependencies = {
  --     'mfussenegger/nvim-dap',
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  --   build = function()
  --     if not require('nvim-treesitter.parsers').has_parser 'dap_repl' then
  --       vim.cmd ':TSInstall dap_repl'
  --     end
  --   end,
  -- },
  --
  {
    -- typescript
    'pmizio/typescript-tools.nvim',

    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },

  {
    -- Rust
    'rust-lang/rust.vim',
    ft = 'rust',
    init = function()
      -- format files on save
      vim.g.rustfmt_autosave = 0
    end,
  },

  {
    -- rust tools
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      {
        'rcarriga/nvim-dap-ui',
      },
      {
        'nvim-lua/plenary.nvim',
      },
    },
    opts = function()
      require 'custom.configs.rust-tools'
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end,
  },

  {
    -- cargo crates management
    'saecki/crates.nvim',
    dependencies = {
      -- required by saecki/crates.nvim
      'hrsh7th/nvim-cmp',
      opts = function()
        -- local M = require 'kickstart.plugins.cmp'
        -- table.insert(M.sources, { name = 'crates' })
        -- return M
      end,
    },

    ft = { 'rust', 'toml' },
    config = function(_, opts)
      local crates = require 'crates'
      crates.setup(opts)
      crates.show()
    end,
  },

  {
    -- icons
    'nvim-tree/nvim-web-devicons',

    opts = require 'custom.configs.nvim-web-devicons',

    config = function(_, opts)
      require('nvim-web-devicons').setup(opts)
    end,
  },

  {
    -- refactoring
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local opts = {}
      require('refactoring').setup(opts)
    end,
  },

  {
    -- markdown preview
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
  },
}
