return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, 
    opts = {
        latex = {
            enabled = true,
            converter = 'latex2text',
        },
        
        heading = {
            icons = { '󰲠  ', '󰲢  ', '󰲤  ', '󰲦  ', '󰲨  ', '󰲪  ' },
            sign = false,
            backgrounds = {},
        },

        code = {
            sign = false,
            width = 'block', 
            right_pad = 1,
            border = 'thick',
        },

        bullet = {
            icons = { '●', '', '◆', '◇' },
            right_pad = 1,
        },
        checkbox = {
            unchecked = { icon = '󰄱 ' },
            checked = { icon = '󰱒 ' },
            custom = {
                warning = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownWarn' },
                cake = { raw = '[c]', rendered = '󰃫', highlight = 'RenderMarkdownWarn' },
            },
        },
    }
}


