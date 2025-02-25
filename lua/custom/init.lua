require 'keymaps'

local auto_cmd = vim.api.nvim_create_autocmd

local opt = vim.opt

opt.autoread = true
opt.autowriteall = true

-- open nvim tree when vim starts
-- auto_cmd({ "VimEnter" }, {
--   pattern = "*",
--   command = "NvimTreeToggle",
-- })

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

--
-- local function clear_cmdarea()
--   vim.defer_fn(function()
--     vim.api.nvim_echo({}, false, {})
--   end, 800)
-- end
--
-- vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
--   callback = function()
--     if #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted then
--       vim.cmd "silent w"
--
--       local time = os.date "%I:%M %p"
--
--       -- print nice colored msg
--       vim.api.nvim_echo({ { "󰄳", "LazyProgressDone" }, { " file autosaved at " .. time } }, false, {})
--
--       clear_cmdarea()
--     end
--   end,
-- })
