INSTALL_DIR = /usr/bin

install:
	install branchf.sh $(INSTALL_DIR)/branchf

clear:
	rm $(INSTALL_DIR)/branchf
