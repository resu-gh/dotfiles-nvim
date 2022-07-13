_M = require 'helpers.modules'

local k = require 'helpers.keymaps'

local m = {}

m.init = function()
    _M.telescope = require 'telescope'

    _M.telescope.setup {
        defaults = {
            -- results_title = false,
            borderchars = {
                prompt = { '', '', '', '', '', '', '', '' },
                results = { '', '', '', '', '', '', '', '' },
                preview = { '', '', '', '', '', '', '', '' },
            },
        },
        pickers = {
            find_files = {
                hidden = true,
                -- prompt_title = false,
                -- preview_title = false,
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = 'smart_case',
            },
        },
    }

    _M.telescope.load_extension 'fzf'

    k.setn('<leader>sf', ':Telescope find_files<cr>')
    k.setn('<leader>sb', ':Telescope current_buffer_fuzzy_find<cr>')
    k.setn('<leader>sg', ':Telescope grep_string<cr>')
    k.setn('<leader>sv', ':Telescope commands<cr>')

    vim.cmd [[ hi! clear TelescopeBorder ]]
    vim.cmd [[ hi! link TelescopeBorder Pmenu ]]
    vim.cmd [[ hi! clear TelescopeNormal ]]
    vim.cmd [[ hi! link TelescopeNormal Pmenu ]]
    vim.cmd [[ hi! clear TelescopeResultsTitle ]]
    vim.cmd [[ hi! link TelescopeResultsTitle PmenuSel ]]
end

return m
