return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-tree').setup {
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = { enable = true, update_root = true },
      git = { enable = true, ignore = false, timeout = 500 },
      filters = {
        dotfiles = false,
        custom = { '.git', 'node_modules', '__pycache__' }, -- Ignore these directories
      },
      view = {
        width = 35,
        side = 'left',
        preserve_window_proportions = true,
      },
      renderer = {
        highlight_git = true,
        highlight_opened_files = 'icon',
        root_folder_label = ':t',
        indent_markers = { enable = true },
        icons = {
          git_placement = 'after',
          show = { file = true, folder = true, git = true },
          glyphs = {
            default = '',
            symlink = '',
            folder = { default = '', open = '', empty = '', empty_open = '' },
            git = { unstaged = '', staged = '', unmerged = '', renamed = '➜', untracked = '★' },
          },
        },
      },
      actions = {
        open_file = {
          resize_window = true,
          quit_on_open = false, -- Keep tree open after selecting a file
        },
      },
    }

    -- Custom Keybindings
    local keymap = vim.keymap.set
    keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = 'Toggle NvimTree' })
    keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = true, desc = 'Refresh NvimTree' })
    keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', { noremap = true, silent = true, desc = 'Find Current File in Tree' })
  end,
}
