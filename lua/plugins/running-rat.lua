return {
    'jesse-proj/running-rat.nvim',

    config = function()
        vim.keymap.set(
            'n',
            '<leader>dr',
            function() 
                require('running-rat').hatch('ᓚᘏᕐᐷ')
            end,
            { desc = '[D]raws a [R]at' }
        )
        
        vim.keymap.set(
            'n',
            '<leader>di',
            function() 
                for i = 0, 50 do 
                    require('running-rat').hatch('ᓚᘏᕐᐷ')
                end
            end,
            { desc = '[D]raws an [I]nfestation' }
        )

        vim.keymap.set(
            '',
            '<leader>dk',
            function() require("running-rat").cook_all() end,
            { desc = '[D]rawings [K]ill'}
        )
    end
}
