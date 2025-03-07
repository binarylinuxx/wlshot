# Define variables
SCRIPT_NAME = shot
INSTALL_DIR = /usr/bin
SCRIPT_SRC = ./$(SCRIPT_NAME)

# Install the script
install: $(SCRIPT_SRC)
		sudo cp $(SCRIPT_SRC) $(INSTALL_DIR)/$(SCRIPT_NAME)
		sudo chmod +x $(INSTALL_DIR)/$(SCRIPT_NAME)
		echo "all done! dont forget --help flag if have something you not understand"

# Uninstall the script
uninstall:
		sudo rm -f $(INSTALL_DIR)/$(SCRIPT_NAME)
		echo "good bye and thanks for using my utilit"

# Default target (install)
all: install
