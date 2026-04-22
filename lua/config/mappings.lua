-- Remaps normal mode key 
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Markdown-specific settings (Because zen-mode is naive, it takes two :q to quit)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true 
        vim.opt_local.smoothscroll = true 
        
        local opts = { buffer = true, silent = true }
        vim.keymap.set('n', 'j', 'gj', opts)
        vim.keymap.set('n', 'k', 'gk', opts)

        vim.keymap.set('v', 'j', 'gj', opts)
        vim.keymap.set('v', 'k', 'gk', opts)

        if _G.zen_active then return end
        vim.schedule(function()
            pcall(function() require("zen-mode").open() end)
        end)
    end,
})

vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*.md", 
    callback = function()
        if _G.zen_active then
            pcall(function() require("zen-mode").close() end)
        end
    end,
})
