.PHONY:dist

VERSION=$(shell jq .version -r info.json)
DIST_FILE="dist/uranium_geiger_$(VERSION).zip"

lint:
	# Assumes lua-fmt installed
	# yarn global add lua-fmt
	find . -iname "*.lua" | xargs -n1 luafmt -w replace

dist:
	@echo "[+] Creating distribution for version $(VERSION)..."
	@rm -rf uranium-geiger
	@rm -rf $(DIST_FILE)
	@mkdir uranium-geiger
	@mkdir -p dist
	@cp *.lua *.json *.png LICENSE uranium-geiger
	@cp -r locale uranium-geiger
	@cp -r sounds uranium-geiger
	@echo "[+] Zipping..."
	@zip $(DIST_FILE) uranium-geiger -r
	@echo "[+] Cleaning up..."
	@rm -rf uranium-geiger
	@echo "[+] Zip ready: $(DIST_FILE)"
