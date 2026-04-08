return { -- Collection of various small independent plugins/modules
    'nvim-mini/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
      require('mini.comment').setup()

      require('mini.pairs').setup({
        ['('] = { action = 'open', pair = '()', neigh_pattern = '^[^\\]' },
        ['['] = { action = 'open', pair = '[]', neigh_pattern = '^[^\\]' },
        ['{'] = { action = 'open', pair = '{}', neigh_pattern = '^[^\\]' },

        [')'] = { action = 'close', pair = '()', neigh_pattern = '^[^\\]' },
        [']'] = { action = 'close', pair = '[]', neigh_pattern = '^[^\\]' },
        ['}'] = { action = 'close', pair = '{}', neigh_pattern = '^[^\\]' },

        ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '^[^\\]',   register = { cr = false } },
        ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '^[^%a\\]', register = { cr = false } },
        ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '^[^\\]',   register = { cr = false } },
      })

      require('mini.sessions').setup()

      require('mini.indentscope').setup({
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


      vim.keymap.set('n', '<leader>wsl', function()
        MiniSessions.write('Session.vim')
      end, { desc = '[W]orkspace [S]ave [L]ocal'}) 

      vim.keymap.set('n', '<leader>wsg', function()
        MiniSessions.write('LastSession.vim')
      end, { desc = '[W]orkspace [S]ave [G]lobal'}) 

      -- Option A: Link to an existing Oxocarbon highlight group
      vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { link = 'Comment' })

      vim.keymap.set('n', '<leader>wo', MiniSessions.select, { desc = '[W]orkspace [O]pen'})
    
      vim.keymap.set('n', '<leader>wk', function()
        local name = vim.fn.input('Delete session: ')
        if name ~= '' then MiniSessions.delete(name) end
      end, { desc = '[W]orkspace [K]ill' })

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function() return '%2l:%-2v' end

      -- ... and there is more!
      --  Check out: https://github.com/nvim-mini/mini.nvim
    end,
}
