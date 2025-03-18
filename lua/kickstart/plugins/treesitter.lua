local languages = {

  'html',
  'css',
  'javascript',
  'typescript',
  'tsx',
  'svelte',

  'json',
  'jsonc',

  'toml',
  'yaml',
  'dockerfile',

  'rust',
  'c',
  'zig',
  'python',
  'go',
  'java',

  'sql',
  'regex',

  'make',
  'cmake',

  'bash',
  'diff',
  'lua',
  'luadoc',

  'markdown',
  'markdown_inline',
  'latex',

  'query',

  'vim',
  'vimdoc',
}

return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    opts = {
      ensure_installed = languages,

      sync_install = true,

      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },

      indent = { enable = true, disable = { 'ruby' } },

      autotag = { enable = true }, -- Enable autotagging
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
-- vim: ts=2 sts=2 sw=2 et
