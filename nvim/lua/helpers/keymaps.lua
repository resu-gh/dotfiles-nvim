local h = {}

h.n = { noremap = true, silent = false, expr = false }
h.ns = { noremap = true, silent = true, expr = false }
h.nsx = { noremap = true, silent = true, expr = true }

local _bufset = function(bufnr, mode, lhs, rhs, opts)
    opts = opts or h.ns
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
end

h.bufset_ = function(bufnr, lhs, rhs, opts)
    _bufset(bufnr, '', lhs, rhs, opts)
end

h.bufsetn = function(bufnr, lhs, rhs, opts)
    _bufset(bufnr, 'n', lhs, rhs, opts)
end

h.bufseti = function(bufnr, lhs, rhs, opts)
    _bufset(bufnr, 'i', lhs, rhs, opts)
end

h.bufsetv = function(bufnr, lhs, rhs, opts)
    _bufset(bufnr, 'v', lhs, rhs, opts)
end

h.bufsetx = function(bufnr, lhs, rhs, opts)
    _bufset(bufnr, 'x', lhs, rhs, opts)
end

local _set = function(mode, lhs, rhs, opts)
    opts = opts or h.ns
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

h.set_ = function(lhs, rhs, opts)
    _set('', lhs, rhs, opts)
end

h.setn = function(lhs, rhs, opts)
    _set('n', lhs, rhs, opts)
end

h.seti = function(lhs, rhs, opts)
    _set('i', lhs, rhs, opts)
end

h.setv = function(lhs, rhs, opts)
    _set('v', lhs, rhs, opts)
end

h.setx = function(lhs, rhs, opts)
    _set('x', lhs, rhs, opts)
end

return h
