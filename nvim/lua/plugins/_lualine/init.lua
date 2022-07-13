_M = require 'helpers.modules'

local m = {}

m.init = function()
    _M.lualine = require 'lualine'

    _M.lualine.setup {
        options = {
            component_separators = '',
            section_separators = '',
        },
    }
end

return m
