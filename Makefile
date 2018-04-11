CASK ?= cask
EMACS ?= emacs

all: test

test:
	${CASK} exec ert-runner -L . --reporter ert+duration

install:
	${CASK} install

.PHONY:	all test install
