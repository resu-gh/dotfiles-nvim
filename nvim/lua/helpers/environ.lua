local h = {}

h.os = {}
h.os.home = os.getenv 'HOME'
h.os.name = vim.loop.os_uname().sysname
h.os.sep = h.os.name == 'Windows' and '\\' or '/'

h.nvim = {}
h.nvim.data = vim.fn.stdpath 'data'
h.nvim.cache = vim.fn.stdpath 'cache'
h.nvim.config = vim.fn.stdpath 'config'

h.undodir = h.nvim.config .. h.os.sep .. '.undodir'

return h
