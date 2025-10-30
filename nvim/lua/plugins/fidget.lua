return {
  'j-hui/fidget.nvim',
  event = "LspAttach",
  opts = {
    progress = {
      display = {
        render_limit = 16,
        done_ttl = 3,
        done_icon = "✔",
        done_style = "Constant",
        progress_ttl = 99999,
        progress_icon = { pattern = "dots", period = 1 },
      },
    },
    notification = {
      window = {
        winblend = 0,
        border = "none",
      },
    },
  },
}
