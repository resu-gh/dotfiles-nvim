_M = require 'helpers.modules'

local m = {}

m.init = function()
    _M.autopairs = require 'nvim-autopairs'

    _M.autopairs.setup()

    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    _M.cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
end

return m
