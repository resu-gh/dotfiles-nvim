_M = require 'helpers.modules'

local m = {}

m.init = function()
    _M.fidget = require 'fidget'

    _M.fidget.setup()
end

return m
