local function setup_starter(starter)
      local header_text = [[
██████╗ ███████╗███╗   ██╗██╗   ██╗██╗███╗   ███╗
██╔══██╗██╔════╝████╗  ██║██║   ██║██║████╗ ████║
██████╔╝█████╗  ██╔██╗ ██║██║   ██║██║██╔████╔██║
██╔═══╝ ██╔══╝  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║     ███████╗██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝     ╚══════╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
Fafefifofuff ~ Jesse ᓚᘏᕐᐷ]]

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniStarterOpened',
        callback = function()
          vim.wo.fillchars = 'eob: '
        end,
      })

      starter.setup({
        header = header_text,

        footer = 'Type to filter | <CR> to select',

        sections = {
          starter.sections.recent_files(5, false),
          starter.sections.builtin_actions(),
        },

        content_hooks = {
          starter.gen_hook.adding_bullet('» '),
          starter.gen_hook.aligning('center', 'center'),
        },
      })

      vim.api.nvim_set_hl(0, 'MiniStarterHeader', {link = 'Keyword'})
      vim.api.nvim_set_hl(0, 'MiniStarterItemPrefix', {link = 'Keyword'})
      vim.api.nvim_set_hl(0, 'MiniStarterQuery', {link = 'Keyword'})
      vim.api.nvim_set_hl(0, 'MiniStarterSection', {link = 'Function'})
      vim.api.nvim_set_hl(0, 'MiniStarterItemBullet', {link = 'Function'})
      vim.api.nvim_set_hl(0, 'MiniStarterFooter', {link = 'Comment'})
end

local function setup_indentscope(indentscope)
      indentscope.setup({
        draw = {
          delay = 100, 

          animation = require('mini.indentscope').gen_animation.linear({ 
            duration = 5, 
            unit = 'step' 
          }),
        },

        symbol = '│', 
        options = { try_as_border = true },
      })

      vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { link = 'Comment' })

      vim.api.nvim_create_autocmd("BufWinEnter", {
        pattern = "*",
        callback = function(args)
          -- Check if the current window is a floating window
          local is_floating = vim.api.nvim_win_get_config(0).relative ~= ""

          if is_floating then
            vim.b[args.buf].miniindentscope_disable = true
          end
        end,
      })
end

local function setup_statusline(statusline) 
      statusline.setup { use_icons = vim.g.have_nerd_font }

      statusline.section_location = function() return '%2l:%-2v' end
end

return { 
      'nvim-mini/mini.nvim',
      config = function()

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
    
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      require('mini.comment').setup()
      require('mini.splitjoin').setup() 
      require('mini.move').setup() 
      require('mini.pairs').setup()

      local starter           = require('mini.starter')
      local indentscope       = require('mini.indentscope')
      local statusline        = require('mini.statusline')

      setup_starter(starter)
      setup_indentscope(indentscope)
      setup_statusline(statusline)

    end,
}
