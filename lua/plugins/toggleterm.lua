return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- Set your default visual preference here
      direction = "float", -- or "float", "vertical"
    })

    local map = vim.keymap.set

    map("n", "<leader>t1", "<cmd>1ToggleTerm<CR>", { desc = "Toggle Terminal 1" })
    map("n", "<leader>t2", "<cmd>2ToggleTerm<CR>", { desc = "Toggle Terminal 2" })
    map("n", "<leader>t3", "<cmd>3ToggleTerm<CR>", { desc = "Toggle Terminal 3" })

    map("t", "<leader>tt", "<cmd>wincmd q<CR>", { desc = "Hide Terminal" })
  end
}
