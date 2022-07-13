_M = require 'helpers.modules'

local m = {}

m.init = function()
    _M.comment = require 'Comment'

    _M.comment.setup {}
end

return m
