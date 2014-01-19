COMPOSER = php composer.phar
VENDOR_DIR = vendor
BIN_DIR = bin
PHPUNIT = $(BIN_DIR)/phpunit
# PHPCS = $(BIN_DIR)/phpcs
# PHPCS_STANDARD = PSR2

.check-composer:
	@echo "Checking if Composer is installed..."
	@test -f composer.phar || curl -s http://getcomposer.org/installer | php;

.check-installation: .check-composer
	@echo "Checking for vendor directory..."
	@test -d $(VENDOR_DIR) || make install
	@echo "Checking for bin directory..."
	@test -d $(BIN_DIR) || make install

clean:
	@echo "Removing Composer..."
	rm -f composer.phar
	rm -f composer.lock
	rm -rf $(VENDOR_DIR)
	rm -rf $(BIN_DIR)

test: .check-installation
	$(PHPUNIT) -v -c phpunit.xml
	
tap: .check-installation
	$(PHPUNIT) --tap -v -c phpunit.xml
	
testdox: .check-installation
	$(PHPUNIT) --testdox -v -c phpunit.xml
	
coverage: .check-installation
	$(PHPUNIT) -v -c phpunit.xml.dist

install: clean .check-composer
	@echo "Executing a composer installation of development dependencies.."
	$(COMPOSER) install

update: .check-installation
	@echo "Executing a composer update of development dependencies.."
	$(COMPOSER) update
	
install-dev: clean .check-composer
	@echo "Executing a composer installation of development dependencies.."
	$(COMPOSER) install --dev

update-dev: .check-installation
	@echo "Executing a composer update of development dependencies.."
	$(COMPOSER) update --dev

# code-sniffer: .check-installation
# 	$(PHPCS) --standard=$(PHPCS_STANDARD) src/

# code-sniffer-report: .check-installation
# 	$(PHPCS) --report-summary --report-source --report-gitblame --standard=$(PHPCS_STANDARD) src

.PHONY: test tap clean testdox coverage install update code-sniffer code-sniffer-report
