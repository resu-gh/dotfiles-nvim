_M = require 'helpers.modules'

local p = require 'helpers.plugins'
local e = require 'helpers.environ'

local m = {}

m.init = function()
    vim.cmd [[
        autocmd FileType lsp-installer lua vim.api.nvim_win_set_config(0, { border = 'none' })
    ]]

    _M.lspinstaller = require 'nvim-lsp-installer'

    _M.lspinstaller.setup {
        automatic_installation = true,
        install_root_dir = p.lsp.ipath,
    }

    _M.lspconfig.sumneko_lua.setup {
        cmd = {
            p.lsp.ipath
                .. e.os.sep
                .. 'sumneko_lua'
                .. e.os.sep
                .. 'extension'
                .. e.os.sep
                .. 'server'
                .. e.os.sep
                .. 'bin'
                .. e.os.sep
                .. 'lua-language-server',
            '-E',
            p.lsp.ipath
                .. e.os.sep
                .. 'sumneko_lua'
                .. e.os.sep
                .. 'extension'
                .. e.os.sep
                .. 'server'
                .. e.os.sep
                .. 'main.lua',
        },
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            diagnostics = {
                globals = { 'vim' },
            },
            telemetry = {
                enable = false,
            },
        },
        on_attach = require('plugins._lspconfig').on_attach,
        capabilities = require('plugins._cmp').capabilities,
        flags = {
            debounce_text_changes = 150,
        },
    }
    _M.lspconfig.clangd.setup {
        on_attach = require('plugins._lspconfig').on_attach,
        capabilities = require('plugins._cmp').capabilities,
        flags = {
            debounce_text_changes = 150,
        },
    }
    _M.lspconfig.gopls.setup {
        on_attach = require('plugins._lspconfig').on_attach,
        capabilities = require('plugins._cmp').capabilities,
        flags = {
            debounce_text_changes = 150,
        },
    }
    _M.lspconfig.rust_analyzer.setup {
        on_attach = require('plugins._lspconfig').on_attach,
        capabilities = require('plugins._cmp').capabilities,
        flags = {
            debounce_text_changes = 150,
        },
    }
    _M.lspconfig.pyright.setup {
        cmd = {
            p.lsp.ipath
                .. e.os.sep
                .. 'pyright'
                .. e.os.sep
                .. 'node_modules'
                .. e.os.sep
                .. '.bin'
                .. e.os.sep
                .. 'pyright-langserver',
            '--stdio',
        },
        on_attach = require('plugins._lspconfig').on_attach,
        capabilities = require('plugins._cmp').capabilities,
        flags = {
            debounce_text_changes = 150,
        },
    }
    _M.lspconfig.tsserver.setup {
        on_attach = require('plugins._lspconfig').on_attach,
        capabilities = require('plugins._cmp').capabilities,
        flags = {
            debounce_text_changes = 150,
        },
    }
end

return m
