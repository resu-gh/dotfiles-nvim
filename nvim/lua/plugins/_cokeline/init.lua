_M = require 'helpers.modules'

local k = require 'helpers.keymaps'

local m = {}

m.init = function()
    _M.cokeline = require 'cokeline'

    _M.cokeline.setup {}

    -- k.setn('<bs>', ':bd<cr>') -- TODO
    k.setn('<tab>', '<plug>(cokeline-focus-next)')
    k.setn('<s-tab>', '<plug>(cokeline-focus-prev)')
end

return m
