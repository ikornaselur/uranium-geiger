lint:
	# Assumes lua-fmt installed
	# yarn global add lua-fmt
	find . -iname "*.lua" | xargs -n1 luafmt -w replace
