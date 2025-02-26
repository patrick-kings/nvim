local auto_cmd = vim.api.nvim_create_autocmd

local opt = vim.opt

opt.autoread = true
opt.autowriteall = true

-- save files automatically
auto_cmd({
  'TextChanged',
  'InsertLeave',
  'InsertChange',
  'ModeChanged',

  'FocusLost',
  'BufLeave',
  'BufDelete',

  'CmdlineEnter',
  'CmdWinEnter',

  'ExitPre',
  'UILeave',
  'QuitPre',
  'VimLeave',
}, {
  pattern = '*.*, Makefile, Dockerfile',
  command = 'update',
})
-- format rust files
-- auto_cmd({ "BufWritePre" }, {
--   pattern = "*.rs",
--   command = "RustFmt",
-- })
--

-- diagnostics on status line
function DiagnosticsCount()
  local error_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warning_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

  local error_sign = '' -- Nerd Font icon (customize if needed)
  local warn_sign = ''

  return string.format(' %s %d  %s %d ', error_sign, error_count, warn_sign, warning_count)
end

-- Append diagnostics info to the existing statusline
-- vim.o.statusline = vim.o.statusline .. ' %= %{v:lua.DiagnosticsCount()} %l:%c %p%%'

-- Auto-refresh statusline when diagnostics change
vim.api.nvim_create_autocmd({ 'DiagnosticChanged', 'BufEnter' }, {
  callback = function()
    vim.cmd 'redrawstatus'
  end,
})
