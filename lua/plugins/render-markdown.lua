return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
            heading = {
                -- Passing an empty table removes all heading background colors
                backgrounds = {}, 
            },
        },

    config = function()
        vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { bg = 'NONE' })
        require('render-markdown').setup({
            latex = {
                enabled = false, 
            },

            heading = {
                -- Force empty backgrounds for headings
                backgrounds = {}, 
            },

            code = {
                style = 'language',
                highlight = '', -- This kills the background highlight group for the header
                highlight_inline = '', 
            },

            quote = {
                -- Blockquotes (>) often have a grey background by default
                icon = '▋',
                repeat_linebreak = false,
            },

            sign = {
                -- Turns off background colors in the left-hand sign column
                enabled = false, 
            }
        })
    end
}
