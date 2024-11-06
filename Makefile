.PHONY:dist

VERSION=$(shell jq .version -r src/info.json)
DIST_FILE="$(shell pwd)/dist/uranium_geiger_$(VERSION).zip"

MODS_FOLDER=$(shell realpath ~/Library/Application\ Support/factorio/mods)

lint:
	# Assumes lua-fmt installed
	# yarn global add lua-fmt
	find . -iname "src/*.lua" | xargs -n1 luafmt -w replace

prep:
	@echo "[+] Creating distribution for version $(VERSION)..."
	@rm -rf $(DIST_FILE) tmp
	@mkdir -p tmp/uranium-geiger dist
	@cp -r src/* tmp/uranium-geiger

zip:
	@echo "[+] Zipping..."
	@cd tmp; zip $(DIST_FILE) uranium-geiger -r

clean:
	@echo "[+] Cleaning up..."
	@rm -rf tmp

dist: prep zip clean
	@echo "[+] Zip ready: $(DIST_FILE)"

symlink:
	@echo "[-] Removing any installs of Uranium Geiger from mods folder"
	@rm -f "$(MODS_FOLDER)/uranium_geiger_*.*.*.zip"
	@echo "[+] Creating symlink"
	@ln -s "$(shell pwd)/src" "$(MODS_FOLDER)/uranium_geiger"
