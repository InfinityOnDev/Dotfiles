return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")
    local startify = require("alpha.themes.startify")

    -- No need to set a custom header; the default one will be used
    -- Just set up the theme as-is
    alpha.setup(startify.config)
  end,
  event = "VimEnter", -- optional, lazy-load on startup
}

