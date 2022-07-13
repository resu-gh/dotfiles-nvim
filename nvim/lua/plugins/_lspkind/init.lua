_M = require 'helpers.modules'

local m = {}

m.init = function()
    _M.lspkind = require 'lspkind'

    _M.lspkind.init {
        preset = 'codicons',
        symbols = {
            Keyword = _M.codicons.get('key', 'icon'),
            Folder = _M.codicons.get('folder', 'icon'),
            Unit = _M.codicons.get('database', 'icon'),
            Key = _M.codicons.get('symbol-key', 'icon'),
            Text = _M.codicons.get('text-size', 'icon'),
            Package = _M.codicons.get('package', 'icon'),
            Enum = _M.codicons.get('symbol-enum', 'icon'),
            File = _M.codicons.get('symbol-file', 'icon'),
            Array = _M.codicons.get('symbol-array', 'icon'),
            Class = _M.codicons.get('symbol-class', 'icon'),
            Color = _M.codicons.get('symbol-color', 'icon'),
            Event = _M.codicons.get('symbol-event', 'icon'),
            Field = _M.codicons.get('symbol-field', 'icon'),
            Object = _M.codicons.get('symbol-misc', 'icon'),
            Null = _M.codicons.get('symbol-keyword', 'icon'),
            Method = _M.codicons.get('symbol-method', 'icon'),
            Module = _M.codicons.get('symbol-method', 'icon'),
            Reference = _M.codicons.get('references', 'icon'),
            String = _M.codicons.get('symbol-string', 'icon'),
            Value = _M.codicons.get('symbol-numeric', 'icon'),
            Number = _M.codicons.get('symbol-numeric', 'icon'),
            Boolean = _M.codicons.get('symbol-boolean', 'icon'),
            Function = _M.codicons.get('symbol-method', 'icon'),
            Snippet = _M.codicons.get('symbol-snippet', 'icon'),
            Struct = _M.codicons.get('symbol-structure', 'icon'),
            Constant = _M.codicons.get('symbol-constant', 'icon'),
            Operator = _M.codicons.get('symbol-operator', 'icon'),
            Property = _M.codicons.get('symbol-property', 'icon'),
            Variable = _M.codicons.get('symbol-variable', 'icon'),
            Constructor = _M.codicons.get('symbol-method', 'icon'),
            Interface = _M.codicons.get('symbol-interface', 'icon'),
            Namespace = _M.codicons.get('symbol-namespace', 'icon'),
            EnumMember = _M.codicons.get('symbol-enum-member', 'icon'),
            TypeParameter = _M.codicons.get('symbol-parameter', 'icon'),
        },
    }
end

return m
