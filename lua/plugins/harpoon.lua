return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        -- REQUIRED

        vim.keymap.set(
            "n",
            "<leader>a",
            function() harpoon:list():add() end,
            { desc = 'Adds buffer to Harpoon menu' }
        )

        vim.keymap.set(
            "n",
            "<leader>e",
            function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = 'Opens Harpoon menu' }
        )

        -- HARPOON buffer ACCESSING

        vim.keymap.set(
            "n",
            "<leader>1",
            function() harpoon:list():select(1) end,
            { desc = 'Opens 1st Harpoon buffer' }
        )
        vim.keymap.set(
            "n",
            "<leader>2",
            function() harpoon:list():select(2) end,
            { desc = 'Opens 2nd Harpoon buffer' }
        )
        vim.keymap.set(
            "n",
            "<leader>3",
            function() harpoon:list():select(3) end,
            { desc = 'Opens 3rd Harpoon buffer' }
        )
        vim.keymap.set(
            "n",
            "<leader>4",
            function() harpoon:list():select(4) end,
            { desc = 'Opens 4th Harpoon buffer' }
        )

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set(
            "n",
            "<leader>p",
            function() harpoon:list():prev() end,
            { desc = 'Go to prev buffer in Harpoon list'}
        )
        vim.keymap.set(
            "n",
            "<leader>n",
            function() harpoon:list():next() end,
            { desc = 'Go to next buffer in Harpoon list'}
        )
    end
}
