local k = require 'helpers.keymaps'

local m = {}

m.init = function()
    vim.g.bufferline = {
        animation = false,
        closable = false,
        icons = true,
        icon_separator_active = '',
        icon_separator_inactive = '',
        maximum_padding = 1,
        maximum_length = 30,
        no_name_title = 'empty',
    }

    k.setn('<bs>', ':BufferClose<cr>')
    k.setn('<tab>', ':BufferNext<cr>')
    k.setn('<s-tab>', ':BufferPrevious<cr>')
end

return m
