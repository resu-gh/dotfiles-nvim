_M = require 'helpers.modules'

local m = {}

m.init = function()
    _M.galaxyline = require 'galaxyline'

    local gld = require 'galaxyline.providers.diagnostic'
    local glv = require 'galaxyline.providers.vcs'
    local glf = require 'galaxyline.providers.fileinfo'
    local glb = require 'galaxyline.providers.buffer'
    local gll = require 'galaxyline.providers.lsp'

    local cls = require('galaxyline.themes.colors').default

    _M.galaxyline.section.left[0] = {
        bn = {
            provider = function()
                return '#' .. glb.get_buffer_number()
            end,
            separator = ' ',
            highlight = { cls.orange },
        },
    }
    _M.galaxyline.section.left[1] = {
        lc = {
            provider = gll.get_lsp_client,
            separator = ' ',
            icon = _M.codicons.get('play', 'icon') .. ' ',
            highlight = { cls.orange },
        },
    }
    _M.galaxyline.section.left[2] = {
        gb = {
            provider = glv.get_git_branch,
            separator = ' ',
            icon = _M.codicons.get('git-commit', 'icon') .. ' ',
            highlight = { cls.green },
        },
    }
    _M.galaxyline.section.left[3] = {
        ga = {
            provider = glv.diff_add,
            icon = _M.codicons.get('diff-added', 'icon') .. ' ',
            highlight = { cls.green },
        },
    }
    _M.galaxyline.section.left[4] = {
        gm = {
            provider = glv.diff_modified,
            icon = _M.codicons.get('diff-modified', 'icon') .. ' ',
            highlight = { cls.green },
        },
    }
    _M.galaxyline.section.left[5] = {
        gr = {
            provider = glv.diff_remove,
            icon = _M.codicons.get('diff-removed', 'icon') .. ' ',
            highlight = { cls.green },
        },
    }
    _M.galaxyline.section.left[6] = {
        de = {
            provider = gld.get_diagnostic_error,
            icon = _M.codicons.get('error', 'icon') .. ' ',
            highlight = { cls.red },
        },
    }
    _M.galaxyline.section.left[7] = {
        dw = {
            provider = gld.get_diagnostic_warn,
            icon = _M.codicons.get('warning', 'icon') .. ' ',
            highlight = { cls.magenta },
        },
    }
    _M.galaxyline.section.left[8] = {
        dh = {
            provider = gld.get_diagnostic_hint,
            icon = _M.codicons.get('lightbulb', 'icon') .. ' ',
            highlight = { cls.yellow },
        },
    }
    _M.galaxyline.section.left[8] = {
        di = {
            provider = gld.get_diagnostic_info,
            icon = _M.codicons.get('info', 'icon') .. ' ',
        },
    }

    _M.galaxyline.section.right[0] = {
        cl = {
            provider = glf.line_column,
            highlight = { cls.blue },
        },
    }
    _M.galaxyline.section.right[1] = {
        lp = {
            provider = glf.current_line_percent,
            highlight = { cls.blue },
        },
    }
    _M.galaxyline.section.right[2] = {
        fs = {
            provider = glf.get_file_size,
            highlight = { cls.yellow },
        },
    }
    _M.galaxyline.section.right[3] = {
        fe = {
            provider = glf.get_file_encode,
            highlight = { cls.yellow },
        },
    }
    _M.galaxyline.section.right[4] = {
        ff = {
            provider = glf.get_file_format,
            separator = ' ',
            highlight = { cls.yellow },
        },
    }
    _M.galaxyline.section.right[5] = {
        bt = {
            provider = glb.get_buffer_filetype,
            separator = ' ',
            highlight = { cls.yellow },
        },
    }
end

return m
