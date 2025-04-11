return {
  'folke/noice.nvim',
  optional = true,
  opts = function(_, opts)
    vim.list_extend(opts.routes, {
      {
        filter = {
          event = 'msg_show',
          any = {
            { find = 'Starting Supermaven' },
            { find = 'Supermaven Free Tier' },
          },
        },
        skip = true,
      },
    })
  end,
}
