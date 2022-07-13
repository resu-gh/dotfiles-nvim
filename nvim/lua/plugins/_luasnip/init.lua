_M = require 'helpers.modules'

local m = {}

m.init = function()
    _M.luasnip = require 'luasnip'

    require('luasnip.loaders.from_vscode').lazy_load()
end

return m
