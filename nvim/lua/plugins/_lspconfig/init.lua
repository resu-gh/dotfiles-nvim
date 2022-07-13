_M = require 'helpers.modules'

local o = require 'helpers.options'
local k = require 'helpers.keymaps'

local m = {}

m.init = function()
    _M.lspconfig = require 'lspconfig'

    local sE = 'DiagnosticSignError'
    local sW = 'DiagnosticSignWarn'
    local sH = 'DiagnosticSignHint'
    local sI = 'DiagnosticSignInfo'

    vim.fn.sign_define(sE, {
        text = _M.codicons.get('error', 'icon'),
        texthl = sE,
        numhl = sE,
    })
    vim.fn.sign_define(sW, {
        text = _M.codicons.get('warning', 'icon'),
        texthl = sW,
        numhl = sW,
    })
    vim.fn.sign_define(sH, {
        text = _M.codicons.get('lightbulb', 'icon'),
        texthl = sH,
        numhl = sH,
    })
    vim.fn.sign_define(sI, {
        text = _M.codicons.get('info', 'icon'),
        texthl = sI,
        numhl = sI,
    })
end

m.on_attach = function(client, bufnr)
    o.bufset(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    k.bufsetn(bufnr, 'gD', ':lua vim.lsp.buf.declaration()<cr>')
    k.bufsetn(bufnr, 'gd', ':lua vim.lsp.buf.definition()<cr>')
    k.bufsetn(bufnr, 'gt', ':lua vim.lsp.buf.type_definition()<cr>')
    k.bufsetn(bufnr, 'gi', ':lua vim.lsp.buf.implementation()<cr>')
    k.bufsetn(bufnr, 'gr', ':lua vim.lsp.buf.references()<cr>')
    k.bufsetn(bufnr, 'K', ':lua vim.lsp.buf.hover()<cr>')
    k.bufsetn(bufnr, '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
    k.bufsetn(bufnr, '<F2>', ':lua vim.lsp.buf.rename()<cr>')
    k.bufsetn(bufnr, '<F3>', ':lua vim.lsp.buf.code_action()<cr>')
    k.bufsetn(bufnr, '<leader>e', ':lua vim.diagnostic.open_float()<cr>')
    k.bufsetn(bufnr, '<c-p>', ':lua vim.diagnostic.goto_prev()<cr>')
    k.bufsetn(bufnr, '<c-n>', ':lua vim.diagnostic.goto_next()<cr>')

    client.resolved_capabilities.document_formatting = false

    if client.resolved_capabilities.document_highlight then
        vim.cmd [[
            hi! LspReferenceRead guibg=#332900 gui=none
            hi! LspReferenceText guibg=#332900 gui=none
            hi! LspReferenceWrite guibg=#332900 gui=none
            augroup LspHighlight
                autocmd! * <buffer>
                autocmd! CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd! CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]]
    end
end

return m
