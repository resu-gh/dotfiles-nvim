_M = require 'helpers.modules'

local m = {}

m.init = function()
    _M.lspsignature = require 'lsp_signature'

    _M.lspsignature.setup {
        doc_lines = 0,
        floating_window_off_x = 0,
        floating_window_off_y = 0,
        fix_pos = true,
        handler_opts = { border = 'none' },
        hint_enable = false,
        hint_prefix = '',
        max_width = 120,
    }
end

return m
