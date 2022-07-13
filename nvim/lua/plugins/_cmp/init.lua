_M = require 'helpers.modules'

local m = {}

m.init = function()
    _M.cmp = require 'cmp'

    local has_words_before = function()
        local lin, col = table.unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, lin - 1, lin, true)[1]:sub(col, col):match '%s' == nil
    end

    _M.cmp.setup {
        snippet = {
            expand = function(args)
                _M.luasnip.lsp_expand(args.body)
            end,
        },
        window = {
            completion = {
                border = { '', '', '', '', '', '', '', '' },
                winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
            },
            documentation = {
                border = { '', '', '', ' ', '', '', '', ' ' },
                winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
            },
        },
        mapping = {
            ['<c-d>'] = _M.cmp.mapping(_M.cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<c-f>'] = _M.cmp.mapping(_M.cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            ['<c-space>'] = _M.cmp.mapping(_M.cmp.mapping.complete(), { 'i', 'c' }),
            ['<c-y>'] = _M.cmp.config.disable,
            ['<c-e>'] = _M.cmp.mapping {
                i = _M.cmp.mapping.abort(),
                c = _M.cmp.mapping.close(),
            },
            ['<cr>'] = _M.cmp.mapping.confirm { select = true },
            ['<tab>'] = _M.cmp.mapping(function(fallback)
                if _M.cmp.visible() then
                    _M.cmp.select_next_item()
                elseif _M.luasnip.expand_or_jumpable() then
                    _M.luasnip.expand_or_jump()
                elseif has_words_before() then
                    _M.cmp.complete()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<s-tab>'] = _M.cmp.mapping(function(fallback)
                if _M.cmp.visible() then
                    _M.cmp.select_prev_item()
                elseif _M.luasnip.jumpable(-1) then
                    _M.luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        },
        formatting = {
            format = function(_, vim_item)
                vim_item.kind = string.format('%s  %s', _M.lspkind.symbol_map[vim_item.kind], vim_item.kind)
                return vim_item
            end,
        },
        sources = {
            { name = 'calc' },
            { name = 'path' },
            { name = 'buffer' },
            { name = 'cmdline' },
            { name = 'luasnip' },
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'latex_symbols' },
        },
    }

    vim.cmd [[ hi! CmpItemKindText guibg=none guifg=#9cdcfe ]]
    vim.cmd [[ hi! CmpItemKindUnit guibg=none guifg=#d4d4d4 ]]
    vim.cmd [[ hi! CmpItemAbbrMatch guibg=none guifg=#569cd6 ]]
    vim.cmd [[ hi! CmpItemKindMethod guibg=none guifg=#c586c0 ]]
    vim.cmd [[ hi! CmpItemKindKeyword guibg=none guifg=#d4d4d4 ]]
    vim.cmd [[ hi! CmpItemKindFunction guibg=none guifg=#c586c0 ]]
    vim.cmd [[ hi! CmpItemKindProperty guibg=none guifg=#d4d4d4 ]]
    vim.cmd [[ hi! CmpItemKindVariable guibg=none guifg=#9cdcfe ]]
    vim.cmd [[ hi! CmpItemKindInterface guibg=none guifg=#9cdcfe ]]
    vim.cmd [[ hi! CmpItemAbbrMatchFuzzy guibg=none guifg=#569cd6 ]]
    vim.cmd [[ hi! CmpItemAbbrDeprecated guibg=none gui=strikethrough guifg=#808080 ]]

    vim.cmd [[ hi! link NormalFloat Pmenu ]]
end

m.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

return m
