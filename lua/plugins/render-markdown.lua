return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, 

    config = function()
        opts = {
            anti_conceal = {
                enabled = false
            },

            enabled = true, 
            file_types = { 'markdown', 'vimwiki', 'code' }, 

            latex = { enabled = true, converter = 'latex2text' },

            anti_conceal = {
                enabled = false
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
                highlight = {
                    'Keyword',
                    'String',
                    'Function',
                    'RenderMarkdownWarn'
                }
            },

            checkbox = {
                unchecked = { icon = '󰄱 ' },
                checked = { icon = '󰱒 ' },
                custom = {
                    warning = {
                        raw = '[-]',
                        rendered = '󰥔 ',
                        highlight = 'RenderMarkdownWarn'
                    },

                    cake = {
                        raw = '[c]',
                        rendered = '󰃫',
                        highlight = 'RenderMarkdownWarn'
                    },

                    sus = {
                        raw = '[s]',
                        rendered = 'ඞ',
                        highlight = 'RenderMarkdownWarn'
                    },
                }, 
            },
        }

        require('render-markdown').setup(opts)
    end

}
