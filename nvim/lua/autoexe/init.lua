vim.cmd [[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank { timeout = 400 }
    augroup END
]]

vim.cmd [[ autocmd TermOpen * startinsert ]]
