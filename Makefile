include config.mk

srcs := $(shell find nvim -name '*.lua' -not -path 'nvim/plugin/*' -not -path 'nvim/.undodir/*')

.DEFAULT_GOAL := help

.SILENT: help
.PHONY: help # print help
help:
	grep '^.PHONY: .* #' $(firstword $(MAKEFILE_LIST)) |\
	sed 's/\.PHONY: \(.*\) # \(.*\)/\1 # \2/' |\
	awk 'BEGIN {FS = "#"}; {printf "%-30s%s\n", $$1, $$2}'

.SILENT: build
.PHONY: build # @combo [clean deps link]
build: fmt clean dirs deps link

.SILENT: deps
.PHONY: deps # install required dependencies
deps:
	$(PKGC) $(DEPS)

.PHONY: dirs # create required dirs
dirs:
	mkdir -p ${HOME}/.config
	mkdir -p ${HOME}/.local
	mkdir -p ${HOME}/.cache

.PHONY: link # link neovim
link:
	ln -sf $(CURDIR)/nvim ${HOME}/.config

.PHONY: clean # clean/unlink neovim
clean:
	rm -rf ${HOME}/.config/nvim
	rm -rf ${HOME}/.cache/nvim
	rm -rf ${HOME}/.local/share/nvim
	rm -rf $(CURDIR)/nvim/plugin

.SILENT: fmt
.PHONY: fmt # format code
fmt:
	echo $(srcs) | xargs printf -- 'formatting %s\n'
	stylua -f ./fmt/stylua.toml $(srcs)
