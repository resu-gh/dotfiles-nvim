local k = require 'helpers.keymaps'

k.seti('!', '!<c-g>u')
k.seti('(', '(<c-g>u')
k.seti(',', ',<c-g>u')
k.seti('.', '.<c-g>u')
k.seti('<', '<<c-g>u')
k.seti('?', '?<c-g>u')
k.seti('[', '[<c-g>u')
k.seti('{', '{<c-g>u')

k.setn('H', '^')
k.setn('L', 'g_')
k.setn('Q', '@q')
k.setn('Y', 'y$')
k.setn('J', 'mzJ`z')
k.setn('n', 'nzzzv')
k.setn('N', 'Nzzzv')
k.setn('p', 'mpp`p')
k.setn('<c-h>', '<c-w>W')
k.setn('<c-l>', '<c-w>w')
k.setn('<leader>q', ':q<cr>')
k.setn('<leader>w', ':w<cr>')
k.setn('yp', 'yymap`aj:delmarks a<cr>')
k.setn('yP', 'yymaP`ak:delmarks a<cr>')
k.setn('j', "v:count == 0 ? 'gj' : 'j'", k.nsx)
k.setn('k', "v:count == 0 ? 'gk' : 'k'", k.nsx)
k.setn('<cr>', ":let @/='\\<'.expand('<cword>').'\\>'<cr>cgn")

k.setv('H', '^')
k.setv('L', 'g_')
k.setv('<', '<gv')
k.setv('>', '>gv')
k.setv('J', ":m '>+1<cr>gv=gv")
k.setv('K', ":m '<-2<cr>gv=gv")
k.setv('j', "v:count == 0 ? 'gj' : 'j'", k.nsx)
k.setv('k', "v:count == 0 ? 'gk' : 'k'", k.nsx)

k.setx('<cr>', '"sy:let @/=@s<cr>cgn')

k.setn('\\', ':term make<cr>')

-- k.setn('gh', 'i<c-g>c', {}) -- vim-capslock
-- k.setn('gl', 'a<c-g>c', {}) -- vim-capslock
