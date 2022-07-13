local h = {}

h.leader = function(l)
    vim.g.mapleader = l
    vim.g.maplocalleader = l
end

h.set = function(p)
    vim.g['loaded_' .. p] = 0
end

h.unset = function(p)
    vim.g['loaded_' .. p] = 1
end

return h
