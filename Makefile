SUBIQUITY_DIR = vendor/ubuntu-desktop-provision/packages/subiquity_client/subiquity

$(SUBIQUITY_DIR):
	[ -d $(SUBIQUITY_DIR) ] || git submodule update --init --recursive

.PHONY: aptdeps
aptdeps: $(SUBIQUITY_DIR)
	$(MAKE) -C $(SUBIQUITY_DIR) aptdeps

.PHONY: gitdeps
gitdeps: $(SUBIQUITY_DIR)
	$(MAKE) -C $(SUBIQUITY_DIR) gitdeps

.PHONY: install_deps
install_deps: $(SUBIQUITY_DIR)
	$(MAKE) -C $(SUBIQUITY_DIR) install_deps
