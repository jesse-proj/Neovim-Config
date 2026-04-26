return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  keys = {
    { "<leader>z", "<cmd>NoNeckPain<cr>", desc = "Toggle NoNeckPain (Zen)" }
  },
  opts = {
    width = 80,
    
    buffers = {
      wo = {
        fillchars = "eob: ",
      },
    },
    
    autocmds = {
      reloadOnColorSchemeChange = true,
      skipEnteringNoNeckPainBuffer = true,
    },
  }
}
