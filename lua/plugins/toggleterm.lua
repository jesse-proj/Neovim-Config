return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- Set your default visual preference here
      direction = "float", -- or "float", "vertical"

      float_opts = {
        title_pos = 'left'
      }
    })

    local map = vim.keymap.set

    map("n", "<leader>t1", "<cmd>1ToggleTerm name=Term_1<CR>", { desc = "Toggle Terminal 1" })
    map("n", "<leader>t2", "<cmd>2ToggleTerm name=Term_2<CR>", { desc = "Toggle Terminal 2" })
    map("n", "<leader>t3", "<cmd>3ToggleTerm name=Term_3<CR>", { desc = "Toggle Terminal 3" })
    map("n", "<leader>t4", "<cmd>4ToggleTerm name=Term_4<CR>", { desc = "Toggle Terminal 4" })
    map("n", "<leader>t5", "<cmd>5ToggleTerm name=Term_5<CR>", { desc = "Toggle Terminal 5" })

    map("t", "<leader>tt", "<cmd>wincmd q<CR>", { desc = "Hide Terminal" })
  end
}
