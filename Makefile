# Allow installing into user space by overriding PREFIX
PREFIX ?= $(HOME)/.local

install:
	mkdir -p $(PREFIX)/bin
	install -m 755 git-multi-remote-setup $(PREFIX)/bin

