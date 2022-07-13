local h = {}

h.info = function(o)
    local i = vim.api.nvim_get_all_options_info()[o]
    if not i then
        return nil
    else
        return vim.inspect(i)
    end
end

h.bufset = function(bufnr, lhs, rhs)
    vim.api.nvim_buf_set_option(bufnr, lhs, rhs)
end

h.set = vim.opt

h.wo = vim.wo
h.bo = vim.bo
h.go = vim.go

return h
