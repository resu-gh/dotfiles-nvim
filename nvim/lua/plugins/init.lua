local p = require 'helpers.plugins'

p.packer.download()

vim.cmd [[ packadd packer.nvim ]]

local packer = require 'packer'

packer.init(p.packer.ic)

packer.startup {
    function(use)
        for _, module in pairs(p.required) do
            use(module)
        end

        if p.packer.bootstrap then
            packer.sync()
        end
    end,
}
