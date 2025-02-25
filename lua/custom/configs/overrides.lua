local M = {}
M.nvim_treesitter = {

  ensure_installed = {
    'rust',
    'vim',
    'lua',
    'html',
    'css',
    'javascript',
    'typescript',
    'tsx',
    'markdown',
    'tsx',
    'json',
    'jsonc',
    'java',
    'toml',
    'yaml',
    'c',
    'zig',
    'python',
    'go',
    'dockerfile',
    'svelte',
    'vimdoc',
    'sql',
    'regex',
    'make',
    'cmake',

    'bash',
    'diff',
    'lua',
    'luadoc',
    'markdown_inline',
    'query',
    'vim',
    'vimdoc',
  },

  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  },

  indent = { enable = true, disable = { 'ruby' } },
}

M.mason = {
  ensure_installed = {

    'lua-language-server',
    'stylua',

    -- web dev
    'css-lsp',
    'ts-standard',
    'html-lsp',
    'prettier',
    'tailwindcss-language-server',
    'eslint-lsp',

    -- zig
    'zls',

    -- rust
    'rust-analyzer',
    'codelldb',

    -- golang
    'gopls',
    'gofumpt',
    'goimports',
    'goimports-reviser',
    'golines',
    'gomodifytags',
    'go-debug-adapter',

    'templ',

    -- c/cpp
    'clangd',
    'cpptools',
    'clang-format',
    'cmake-language-server',
    'cmakelang',
    'cmakelint',
    'cpplint',

    'sqlfmt',

    'yaml-language-server',

    'bash-language-server',
  },
  ui = {
    icons = {
      package_pending = ' ',
      package_installed = '󰄳 ',
      package_uninstalled = ' 󰚌',
    },
  },
}

return M
