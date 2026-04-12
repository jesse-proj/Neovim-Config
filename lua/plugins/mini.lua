local function setup_starter(starter)
      local header_text = [[
       ____         __     ___         
      |  _ \ ___ _ _\ \   / (_)_ __ ___ 
      | |_) / _ \ '_ \ \ / /| | '_ ` _ \
      |  __/  __/ | | \ V / | | | | | | |
      |_|   \___|_| |_|\_/  |_|_| |_| |_| <3

      ]]

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniStarterOpened',
        callback = function()
          vim.wo.fillchars = 'eob: '
        end,
      })

      starter.setup({
        header = header_text,

        footer = 'Type to filter  |  <CR> to select',

        sections = {
          starter.sections.recent_files(5, false),
          starter.sections.sessions(5, true),
          starter.sections.builtin_actions(),
        },

        content_hooks = {
          starter.gen_hook.adding_bullet('» '),
          starter.gen_hook.aligning('center', 'center'),
        },
      })

      vim.api.nvim_set_hl(0, 'MiniStarterHeader', {fg = '#5cf2a7'})

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

local function setup_sessions() 
      vim.keymap.set('n', '<leader>wsl', function()
        MiniSessions.write('Session.vim')
      end, { desc = '[W]orkspace [S]ave [L]ocal'}) 

      vim.keymap.set('n', '<leader>wsg', function()
        MiniSessions.write('LastSession.vim')
      end, { desc = '[W]orkspace [S]ave [G]lobal'}) 

      vim.keymap.set('n', '<leader>wo', MiniSessions.select, { desc = '[W]orkspace [O]pen'})
    
      vim.keymap.set('n', '<leader>wk', function()
        local name = vim.fn.input('Delete session: ')
        if name ~= '' then MiniSessions.delete(name) end
      end, { desc = '[W]orkspace [K]ill' })
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

        symbol = '│', -- Symbol character
        options = { try_as_border = true },
      })

      vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { link = 'Comment' })
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
      require('mini.splitjoin').setup() -- gS to toggle!
      require('mini.move').setup() 
      require('mini.pairs').setup()
      require('mini.sessions').setup()

      local starter           = require('mini.starter')
      local indentscope       = require('mini.indentscope')
      local statusline        = require('mini.statusline')

      setup_sessions()
      setup_starter(starter)
      setup_indentscope(indentscope)
      setup_statusline(statusline)

    end,
}
