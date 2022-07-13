_M = require 'helpers.modules'

local k = require 'helpers.keymaps'

local m = {}

m.init = function()
    _M.formatter = require 'formatter'

    _M.formatter.setup {
        filetype = {
            lua = { require('formatter.filetypes.lua').stylua },
            c = { require('formatter.filetypes.c').clangformat },
            cpp = { require('formatter.filetypes.cpp').clangformat },
            python = { require('formatter.filetypes.python').black },
            go = { require('formatter.filetypes.go').gofmt },
            html = { require('formatter.filetypes.html').prettier },
            css = { require('formatter.filetypes.css').prettier },
            javascript = { require('formatter.filetypes.javascript').prettier },
            json = { require('formatter.filetypes.json').prettier },
            svelte = { require('formatter.filetypes.svelte').prettier },
            typescript = { require('formatter.filetypes.typescript').prettier },
            yaml = { require('formatter.filetypes.yaml').prettier },
            rust = { require('formatter.filetypes.rust').rustfmt },
        },
    }

    k.setn('<leader>f', ':Format<cr>')
end

return m
