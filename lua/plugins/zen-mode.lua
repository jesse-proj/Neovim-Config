return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      width = 0.70,
      height = 0.95,

      backdrop = 1, 
      options = {
        winhighlight = "Normal:Normal,FloatBorder:Normal",
      }
    },

    on_open = function(win)
      _G.zen_active = true
      
      local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
      
      if normal_bg then
        vim.api.nvim_set_hl(0, "ZenBg", { bg = normal_bg })
      end
    end,

    on_close = function()
      _G.zen_active = false
    end,
  }
}
