local auto_cmd = vim.api.nvim_create_autocmd

local opt = vim.opt

opt.autoread = true
opt.autowriteall = true

-- format rust files
-- auto_cmd({ "BufWritePre" }, {
--   pattern = "*.rs",
--   command = "RustFmt",
-- })
--
-- save files automatically
auto_cmd({
  'TextChanged',
  'InsertLeave',
  'InsertChange',
  'ModeChanged',

  'FocusLost',
  'BufLeave',

  'CmdlineEnter',
  'CmdWinEnter',

  'ExitPre',
  'UILeave',
  'QuitPre',
  'VimLeave',
}, {
  pattern = '*.*, ?akefile*',
  command = 'update',
})


