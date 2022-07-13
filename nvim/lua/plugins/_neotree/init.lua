_M = require 'helpers.modules'

local k = require 'helpers.keymaps'

local m = {}

m.init = function()
    _M.neotree = require 'neo-tree'

    _M.neotree.setup {
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
            },
        },
    }

    -- <F1> cleanup
    k.seti('<F1>', '<nop>')
    k.setn('<F1>', '<nop>')
    k.setn('<F1>', ':NeoTreeFocusToggle<cr>')
end

return m
