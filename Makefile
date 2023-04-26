.PHONY: install_deps
install_deps:
	@[ -d packages/subiquity_client/subiquity ] || git submodule update --init --recursive
	@$(MAKE) -C packages/subiquity_client/subiquity install_deps
