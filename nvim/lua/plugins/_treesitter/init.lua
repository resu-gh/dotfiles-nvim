_M = require 'helpers.modules'

local p = require 'helpers.plugins'

local m = {}

m.init = function()
    _M.treesitter = require 'nvim-treesitter.configs'

    _M.treesitter.setup {
        ensure_installed = { p.ts.langs },
        autopairs = { enable = true },
        highlight = { enable = true },
        incremental_selection = { enable = true },
        indent = { enable = true },
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
        }, -- p00f/nvim-ts-rainbow
        playground = {
            enable = true,
        }, -- nvim-treesitter/playground
    }

    -- misc
    -- vim.cmd [[ hi TSError gui=none ]]
    vim.cmd [[ hi TSComment gui=none ]] -- gui=italic

    -- punctuation
    -- vim.cmd [[ hi TSPunctDelimiter gui=none ]]
    -- vim.cmd [[ hi TSPunctBracket gui=none ]]
    -- vim.cmd [[ hi TSPunctSpecial gui=none ]]

    -- constants
    -- vim.cmd [[ hi TSConstant gui=none ]]
    vim.cmd [[ hi TSConstBuiltin gui=none ]] -- gui=italic
    -- vim.cmd [[ hi TSConstMacro gui=none ]]

    -- literals
    -- vim.cmd [[ hi TSString gui=none ]]
    -- vim.cmd [[ hi TSStringRegex gui=none ]]
    -- vim.cmd [[ hi TSStringEscape gui=none ]]
    -- vim.cmd [[ hi TSBoolean gui=none ]]
    -- vim.cmd [[ hi TSCharacter gui=none ]]
    -- vim.cmd [[ hi TSFloat gui=none ]]
    -- vim.cmd [[ hi TSNumber gui=none ]]

    -- functions
    -- vim.cmd [[ hi TSFunction gui=none ]]
    -- vim.cmd [[ hi TSFuncMacro gui=none ]]
    vim.cmd [[ hi TSFuncBuiltin gui=none ]] -- gui=italic
    -- vim.cmd [[ hi TSParameter gui=none ]]
    -- vim.cmd [[ hi TSParameterReference gui=none ]]
    -- vim.cmd [[ hi TSMethod gui=none ]]
    -- vim.cmd [[ hi TSConstructor gui=none ]]

    -- keywords
    -- vim.cmd [[ hi TSConditional gui=none ]]
    -- vim.cmd [[ hi TSRepeat gui=none ]]
    -- vim.cmd [[ hi TSLabel gui=none ]]
    -- vim.cmd [[ hi TSKeyword gui=none ]]
    -- vim.cmd [[ hi TSKeywordFunction gui=none ]]
    -- vim.cmd [[ hi TSKeywordOperator gui=none ]]
    -- vim.cmd [[ hi TSOperator gui=none ]]
    -- vim.cmd [[ hi TSException gui=none ]]
    -- vim.cmd [[ hi TSType gui=none ]]
    vim.cmd [[ hi TSTypeBuiltin gui=none ]] -- gui=italic
    -- vim.cmd [[ hi TSInclude gui=none ]]

    -- variables
    -- vim.cmd [[ hi TSVariable gui=none ]]
    vim.cmd [[ hi TSVariableBuiltin gui=none ]] -- gui=italic

    -- text
    -- vim.cmd [[ hi TSText gui=none ]]
    -- vim.cmd [[ hi TSStrong gui=bold ]]
    vim.cmd [[ hi TSEmphasis gui=none ]] -- gui=italic
    -- vim.cmd [[ hi TSUnderline cterm=underline gui=underline ]]
    -- vim.cmd [[ hi TSTitle gui=none ]]
    -- vim.cmd [[ hi TSURI gui=underline gui=none ]]
    -- vim.cmd [[ hi TSLiteral gui=none ]]

    -- tags
    -- vim.cmd [[ hi TSTag gui=none ]]
    -- vim.cmd [[ hi TSTagDelimiter gui=none ]]

    -- ???
    -- vim.cmd [[ hi TSAnnotation gui=none ]]
    -- vim.cmd [[ hi TSAttribute gui=none ]]
    -- vim.cmd [[ hi TSNamespace gui=none ]]

    -- todo
    -- vim.cmd [[ hi TSField gui=none ]]
    -- vim.cmd [[ hi TSNone gui=none ]]
    -- vim.cmd [[ hi TSProperty gui=none ]]
    -- vim.cmd [[ hi TSSymbol gui=none ]]
    -- vim.cmd [[ hi TSStrike cterm=strikethrough gui=strikethrough ]]
    -- vim.cmd [[ hi TSDefinition gui=underline guisp=#bdae93 ]]
    -- vim.cmd [[ hi TSDefinitionUsage gui=underline guisp=#bdae93 ]]
    -- vim.cmd [[ hi TSCurrentScope gui=bold ]]

    -- linked
    -- vim.cmd [[ hi TSQueryLinterError links to Error ]]
    -- vim.cmd [[ hi TSPlaygroundFocus links to Visual ]]
    -- vim.cmd [[ hi TSPlaygroundLang links to String ]]
    -- vim.cmd [[ hi TSKeywordReturn links to TSKeyword ]]
    -- vim.cmd [[ hi TSWarning links to Todo ]]
    -- vim.cmd [[ hi TSMath links to Special ]]
    -- vim.cmd [[ hi TSTextReference links to Constant ]]
    -- vim.cmd [[ hi TSTypeQualifier links to Type ]]
    -- vim.cmd [[ hi TSDebug links to Debug ]]
    -- vim.cmd [[ hi TSStringSpecial links to SpecialChar ]]
    -- vim.cmd [[ hi TSCharacterSpecial links to SpecialChar ]]
    -- vim.cmd [[ hi TSNote links to SpecialComment ]]
    -- vim.cmd [[ hi TSDanger links to WarningMsg ]]
    -- vim.cmd [[ hi TSTypeDefinition links to Typedef ]]
    -- vim.cmd [[ hi TSStorageClass links to StorageClass ]]
    -- vim.cmd [[ hi TSEnvironment links to Macro ]]
    -- vim.cmd [[ hi TSPreProc links to PreProc ]]
    -- vim.cmd [[ hi TSTodo links to Todo ]]
    -- vim.cmd [[ hi TSTagAttribute links to TSProperty ]]
    -- vim.cmd [[ hi TSDefine links to Define ]]
    -- vim.cmd [[ hi TSEnvironmentName links to Type ]]
end

return m
