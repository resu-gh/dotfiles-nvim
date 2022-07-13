_M = require 'helpers.modules'

local m = {}

m.init = function()
    _M.codicons = require 'codicons'

    _M.codicons.setup {}
end

return m
