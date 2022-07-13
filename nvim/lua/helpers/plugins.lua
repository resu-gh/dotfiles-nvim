local e = require 'helpers.environ'

local h = {}

h.packer = {}

h.packer.ipath = e.nvim.data
    .. e.os.sep
    .. 'site'
    .. e.os.sep
    .. 'pack'
    .. e.os.sep
    .. 'packer'
    .. e.os.sep
    .. 'start'
    .. e.os.sep
    .. 'packer.nvim'

h.packer.repo = 'https://github.com/wbthomason/packer.nvim'

h.packer.bootstrap = nil

h.packer.download = function()
    if vim.fn.empty(vim.fn.glob(h.packer.ipath)) > 0 then
        h.packer.bootstrap = vim.fn.system {
            'git',
            'clone',
            '--depth',
            '1',
            h.packer.repo,
            h.packer.ipath,
        }
    end
end

h.packer.ic = {
    display = {
        open_fn = function()
            return require('packer.util').float {
                border = 'none',
            }
        end,
    },
    profile = {
        enable = true,
        threshold = 0,
    },
}

h.hook = function(m)
    return string.format('require("plugins._%s").init()', m)
end

h.required = {}

-- packer
h.required.packer = {
    'wbthomason/packer.nvim',
}

-- prelude
h.required.plenary = {
    'nvim-lua/plenary.nvim',
    as = 'plenary',
}
h.required.devicons = {
    'kyazdani42/nvim-web-devicons',
    as = 'devicons',
}
h.required.nui = {
    'muniftanjim/nui.nvim',
    as = 'nui',
}

-- base16
h.required.base16 = {
    'rrethy/nvim-base16',
    config = h.hook 'base16',
    as = 'base16',
}

-- treesitter group
h.required.treesitter_rainbow = {
    'p00f/nvim-ts-rainbow',
    after = { 'treesitter' },
    as = 'tsrainbow',
}
h.required.treesitter_playground = {
    'nvim-treesitter/playground',
    after = { 'treesitter' },
    as = 'tsplayground',
}
h.required.treesitter = {
    'nvim-treesitter/nvim-treesitter',
    config = h.hook 'treesitter',
    as = 'treesitter',
}

-- telescope group
h.required.telescope_fzf_native = {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    as = 'tlfzf',
}
h.required.telescope = {
    'nvim-telescope/telescope.nvim',
    after = { 'plenary', 'tlfzf' },
    config = h.hook 'telescope',
    as = 'telescope',
}

-- lsp icons
h.required.codicons = {
    'mortepau/codicons.nvim',
    config = h.hook 'codicons',
    as = 'codicons',
}
h.required.lspkind = {
    'onsails/lspkind-nvim',
    after = { 'codicons' },
    config = h.hook 'lspkind',
    as = 'lspkind',
}

-- lsp signature
h.required.lspsignature = {
    'ray-x/lsp_signature.nvim',
    config = h.hook 'lspsignature',
    as = 'lspsignature',
}

-- lsp config
h.required.lspconfig = {
    'neovim/nvim-lspconfig',
    after = { 'lspkind', 'lspsignature' },
    config = h.hook 'lspconfig',
    as = 'lspconfig',
}

-- lsp completion
h.required.luasnip = {
    'l3mon4d3/luasnip',
    requires = {
        { 'saadparwaiz1/cmp_luasnip' },
        { 'rafamadriz/friendly-snippets' },
    },
    config = h.hook 'luasnip',
    as = 'luasnip',
}
h.required.cmp = {
    'hrsh7th/nvim-cmp',
    requires = {
        { 'hrsh7th/cmp-calc' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-cmdline' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'hrsh7th/cmp-latex-symbols' },
    },
    after = { 'luasnip', 'lspkind', 'lspconfig' },
    config = h.hook 'cmp',
    as = 'cmp',
}
h.required.autopairs = {
    'windwp/nvim-autopairs',
    after = { 'cmp' },
    config = h.hook 'autopairs',
    as = 'autopairs',
}

-- lsp install
h.required.fidget = {
    'j-hui/fidget.nvim',
    config = h.hook 'fidget',
    as = 'fidget',
}
h.required.lspinstaller = {
    'williamboman/nvim-lsp-installer',
    after = { 'cmp' },
    config = h.hook 'lspinstaller',
    as = 'lspinstaller',
}

-- -- git
h.required.gitsigns = {
    'lewis6991/gitsigns.nvim',
    config = h.hook 'gitsigns',
    as = 'gitsigns',
}

-- -- comment
h.required.comment = {
    'numtostr/comment.nvim',
    config = h.hook 'comment',
    as = 'comment',
}

h.required.lualine = {
    'nvim-lualine/lualine.nvim',
    after = { 'devicons' },
    config = h.hook 'lualine',
    as = 'lualine',
}

-- -- format
h.required.formatter = {
    'mhartington/formatter.nvim',
    config = h.hook 'formatter',
    as = 'formatter',
}

-- filetree
h.required.neotree = {
    'nvim-neo-tree/neo-tree.nvim',
    after = { 'plenary', 'devicons', 'nui' },
    config = h.hook 'neotree',
    as = 'neotree',
}

h.required.cokeline = {
    'noib3/nvim-cokeline',
    after = { 'devicons' },
    config = h.hook 'cokeline',
    as = 'cokeline',
}

-- statusline
-- h.required.galaxyline = {
--     'ntbbloodbath/galaxyline.nvim',
--     after = { 'codicons' },
--     config = h.hook 'galaxyline',
--     as = 'galaxyline',
-- }

-- bufferline
-- h.required.barbar = {
--     'romgrk/barbar.nvim',
--     after = { 'devicons' },
--     config = h.hook 'barbar',
--     as = 'barbar',
-- }

h.lsp = {}

h.lsp.ipath = e.nvim.data
h.lsp.ipath = h.lsp.ipath .. e.os.sep .. 'lsp_servers'

h.ts = {}

h.ts.langs = {
    -- 'astro',
    'bash',
    'bibtex',
    'c',
    -- 'c_sharp',
    -- 'clojure',
    'cmake',
    'comment',
    -- 'commonlisp',
    'cpp',
    'css',
    -- 'cuda',
    -- 'd',
    -- 'dart',
    'dockerfile',
    -- 'dot',
    -- 'elixir',
    -- 'elm',
    -- 'elvish',
    -- 'erlang',
    -- 'fennel',
    -- 'fish',
    -- 'fortran',
    'glsl',
    'go',
    'gomod',
    'gowork',
    -- 'haskell',
    'html',
    -- 'java',
    'javascript',
    'json',
    -- 'julia',
    -- 'kotlin',
    'latex',
    'lua',
    'make',
    'markdown',
    'ninja',
    'nix',
    -- 'ocaml',
    -- 'org',
    -- 'pascal',
    -- 'perl',
    -- 'php',
    'python',
    -- 'r',
    'regex',
    -- 'ruby',
    'rust',
    -- 'scala',
    -- 'scheme',
    'svelte',
    -- 'swift',
    'toml',
    'typescript',
    -- 'v',
    -- 'vala',
    -- 'verilog',
    'vim',
    'yaml',
    'zig',
}

return h
