local e = require 'helpers.environ'
local o = require 'helpers.options'

o.set.tabstop = 4
o.set.shiftwidth = 4
o.set.autoread = true
o.set.softtabstop = 4
o.set.textwidth = 100
o.set.undofile = true
o.set.expandtab = true
o.set.infercase = true
o.set.modeline = false
o.set.swapfile = false
o.set.autoindent = true
o.set.smartindent = true
o.set.complete = '.,w,b,u,t,k'
o.set.formatoptions = 'tcqjrnl' -- 'jcroql'

o.set.exrc = true
o.set.more = true
o.set.mouse = 'a'
o.set.magic = true
o.set.ruler = true
o.set.title = true
o.set.cmdheight = 2
o.set.hidden = true
o.set.matchtime = 2
o.set.modelines = 0
o.set.paste = false
o.set.secure = true
o.set.backup = false
o.set.history = 1000
o.set.laststatus = 2
o.set.showcmd = true
o.set.ttyfast = true
o.set.showtabline = 2
o.set.smarttab = true
o.set.wildmenu = true
o.set.hlsearch = false
o.set.incsearch = true
o.set.showmatch = true
o.set.showmode = false
o.set.smartcase = true
o.set.timeoutlen = 500
o.set.updatetime = 100
o.set.autowrite = false
o.set.ignorecase = true
o.set.lazyredraw = true
o.set.shiftround = true
o.set.splitbelow = true
o.set.splitright = true
o.set.compatible = false
o.set.encoding = 'utf-8'
o.set.errorbells = false
o.set.visualbell = false
o.set.background = 'dark'
o.set.writebackup = false
o.set.termguicolors = true
o.set.inccommand = 'nosplit'
o.set.fileencodings = 'utf-8'
o.set.fileformats = 'unix,dos'
o.set.clipboard = 'unnamedplus'
o.set.backspace = 'indent,eol,start'
o.set.wildmode = 'longest:full,full'
o.set.shortmess = 'atIc' -- 'filnxtToOF'
o.set.undodir = e.undodir

o.set.diffopt = 'internal'
o.set.diffopt:append { 'filler' }
o.set.diffopt:append { 'iwhite' }
o.set.diffopt:append { 'closeoff' }
o.set.diffopt:append { 'vertical' }
o.set.diffopt:append { 'hiddenoff' }
o.set.diffopt:append { 'algorithm:patience' }

o.set.list = false
o.set.wrap = true
o.set.number = true
o.set.scrolloff = 7
o.set.foldlevel = 99
o.set.numberwidth = 4
o.set.conceallevel = 0
o.set.foldcolumn = '1'
o.set.linebreak = true
o.set.colorcolumn = '0'
o.set.cursorline = true
o.set.foldenable = true
o.set.sidescrolloff = 5
o.set.breakindent = true
o.set.signcolumn = 'yes'
o.set.foldmethod = 'expr'
o.set.relativenumber = true
o.set.foldexpr = 'nvim_treesitter#foldexpr()'

local statusline = ' '
statusline = statusline .. '[%n]'
statusline = statusline .. '[%F]'
statusline = statusline .. '(%{get(b:, "gitsigns_head","")})'
statusline = statusline .. '(%{get(b:, "gitsigns_status","")})'
statusline = statusline .. '%='
statusline = statusline .. '%m'
statusline = statusline .. '%r'
statusline = statusline .. '%h'
statusline = statusline .. '%w'
statusline = statusline .. '[%{&fenc?&fenc:&enc}]'
statusline = statusline .. '[%{&ff}]'
statusline = statusline .. '%y'
statusline = statusline .. '[%l:%v]'
statusline = statusline .. '[%p%%]'
statusline = statusline .. ' '
o.set.statusline = statusline
