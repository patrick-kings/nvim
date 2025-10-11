-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set('n', '<C-i>', '<cmd>bprevious<CR>', { desc = 'Move to Previous buffer' })
vim.keymap.set('n', '<C-o>', '<cmd>bnext<CR>', { desc = 'Move to Next buffer' })
vim.keymap.set('t', '<C-d>', '<cmd>bdelete!<CR>', { desc = 'Delete terminal buffer' })
vim.keymap.set('n', '<leader>xa', '<cmd>BufferLineCloseOthers<CR>', { desc = 'Close all other buffers except the current' })
vim.keymap.set('n', '<leader>xc', '<cmd>update<CR><cmd>bprevious<CR><cmd>bdelete #<CR>', { desc = 'Save and Close the current buffer', silent = true })
vim.keymap.set('n', '<C-d>', '<cmd>update<CR><cmd>bprevious<CR><cmd>bdelete #<CR>', { desc = 'Save and Close the current buffer', silent = true })
--

--
vim.keymap.set('t', '<A-h>', '<C-\\><C-N><C-w>h', { noremap = true, desc = 'Leave terminal mode and move to left window' })
vim.keymap.set('t', '<A-l>', '<C-\\><C-N><C-w>l', { noremap = true, desc = 'Leave terminal mode and move to right window' })
vim.keymap.set('t', '<A-k>', '<C-\\><C-N><C-w>k', { noremap = true, desc = 'Leave terminal mode and move to top window' })
vim.keymap.set('t', '<A-j>', '<C-\\><C-N><C-w>j', { noremap = true, desc = 'Leave terminal mode and move to bottom window' })
--

---
-- vim: ts=2 sts=2 sw=2 et
