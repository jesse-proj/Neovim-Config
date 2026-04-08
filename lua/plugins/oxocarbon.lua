return {
    'nyoom-engineering/oxocarbon.nvim',
    priority = 1000,
    config = function()
      vim.opt.background = 'dark'
      vim.cmd.colorscheme 'oxocarbon'

      -- 1. Fix Comments (No Italics)
      local comment_hl = vim.api.nvim_get_hl(0, { name = 'Comment', link = false })
      comment_hl.italic = false
      vim.api.nvim_set_hl(0, 'Comment', comment_hl)

      local ts_comment_hl = vim.api.nvim_get_hl(0, { name = '@comment', link = false })
      ts_comment_hl.italic = false
      vim.api.nvim_set_hl(0, '@comment', ts_comment_hl)

      -- 2. Style Telescope (Black Backgrounds, Gray Borders)
      vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#000000' })
      vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = '#000000' })
      vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = '#000000' })
      vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = '#000000' })

      vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = '#525252', bg = '#000000' })
      vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = '#525252', bg = '#000000' })
      vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = '#525252', bg = '#000000' })
      vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = '#525252', bg = '#000000' })

      -- Gray Prompt & Results, Purple Preview
      vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = '#000000', bg = '#525252', bold = true })
      vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = '#000000', bg = '#525252', bold = true })
      vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = '#000000', bg = '#be95ff', bold = true })

      local telescope_match_hl = vim.api.nvim_get_hl(0, { name = 'TelescopeMatching', link = false })
      telescope_match_hl.italic = false
      vim.api.nvim_set_hl(0, 'TelescopeMatching', telescope_match_hl)

      -- 3. Custom Dark Gray Background (#0C0C0C)
      vim.api.nvim_set_hl(0, 'Normal', { bg = '#0C0C0C' })
      vim.api.nvim_set_hl(0, 'NormalNC', { bg = '#0C0C0C' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#0C0C0C' })
      vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = '#0C0C0C' })

      -- 4. Purple Caret (Cursor)
      vim.api.nvim_set_hl(0, 'Cursor', { bg = '#be95ff', fg = '#0C0C0C' })
      vim.api.nvim_set_hl(0, 'TermCursor', { bg = '#be95ff', fg = '#0C0C0C' })

      -- 5. Match Line Numbers & Sign Column to New Background
      vim.api.nvim_set_hl(0, 'LineNr', { fg = '#525252', bg = '#0C0C0C' })
      vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#f2f4f8', bg = '#0C0C0C', bold = true })
      vim.api.nvim_set_hl(0, 'SignColumn', { bg = '#0C0C0C' })

      -- 6. Style Native Vim Tabs (:tabnew)
      vim.api.nvim_set_hl(0, 'TabLineFill', { bg = '#0C0C0C' })
      vim.api.nvim_set_hl(0, 'TabLine', { fg = '#525252', bg = '#0C0C0C' })
      vim.api.nvim_set_hl(0, 'TabLineSel', { fg = '#be95ff', bg = '#0C0C0C', bold = true })
    end,
}
