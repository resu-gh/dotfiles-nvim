_M = require 'helpers.modules'

local m = {}

m.init = function()
    _M.gitsigns = require 'gitsigns'

    _M.gitsigns.setup()
end

return m
