return {
  -- markdown preview
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = 'cd app && npm i',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,

  keys = {
    { '<leader>mdp', ':MarkdownPreviewToggle<CR>', desc = 'Markdown Preview Toggle', silent = true },
  },
}
