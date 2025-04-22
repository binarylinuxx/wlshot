# Define variables
SCRIPT_NAME = wlshot
INSTALL_DIR = /usr/bin
SCRIPT_SRC = ./$(SCRIPT_NAME)

# Install the script
install: $(SCRIPT_SRC)
		sudo cp $(SCRIPT_SRC) $(INSTALL_DIR)/$(SCRIPT_NAME)
		sudo chmod +x $(INSTALL_DIR)/$(SCRIPT_NAME)

# Uninstall the script
uninstall:
		sudo rm -f $(INSTALL_DIR)/$(SCRIPT_NAME)

# Default target (install)
all: install
