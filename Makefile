CASK ?= cask
EMACS ?= emacs
DIST ?= dist

PKG_NAME = elisp-tryout

EMACSFLAGS = --batch -Q
EMACSBATCH = $(EMACS) $(EMACSFLAGS)

VERSION := $(shell EMACS=$(EMACS) $(CASK) version)
PKG_DIR := $(shell EMACS=$(EMACS) $(CASK) package-directory)
PROJ_ROOT := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

EMACS_D = ~/.emacs.d
USER_ELPA_D = $(EMACS_D)/elpa

SRCS = $(filter-out %-pkg.el, $(wildcard *.el))
TESTS = $(filter-out %test-helper.el, $(wildcard test/*.el))
TEST_HELPER = test/test-helper.el
BUNDLE = $(DIST)/$(PKG_NAME)-$(VERSION).el
PKG_LOAD_PATH = $(USER_ELPA_D)/$(PKG_NAME)-$(VERSION)/$(PKG_NAME).el

all : deps $(BUNDLE)

deps :
	${CASK} install --debug

clean-elc :
	rm -f *.elc test/*.elc

clean : clean-elc
	rm -rf $(DIST)
	rm -f *-pkg.el

clean-all : clean
	rm -rf $(PKG_DIR)

$(DIST) :
	mkdir $(DIST)

$(BUNDLE) : $(DIST) $(SRCS)
	cp $(PKG_NAME).el $(BUNDLE)
	# The following command throws an Wrong number of arguments error
	# $(CASK) package $(DIST)

test : $(PKG_DIR) clean-elc
	${CASK} exec ert-runner -L . --reporter ert+duration

lint : $(SRCS) clean-elc
	# Byte compile all and stop on any warning or error
	${CASK} emacs $(EMACSFLAGS) \
	--eval "(setq byte-compile-error-on-warn t)" \
	-L . \
	-L test \
	-f batch-byte-compile ${SRCS} ${TEST_HELPER} ${TESTS}

	# Run package-lint to check for packaging mistakes
	${CASK} emacs $(EMACSFLAGS) \
	--eval "(require 'package)" \
	--eval "(push '(\"melpa\" . \"http://melpa.org/packages/\") package-archives)" \
	--eval "(package-initialize)" \
	--eval "(package-refresh-contents)" \
	-l package-lint.el \
	-f package-lint-batch-and-exit $(PKG_NAME).el

check : test lint

install : $(BUNDLE)
	$(EMACSBATCH) -l package -f package-initialize \
	--eval '(package-install-file "$(PROJ_ROOT)/$(BUNDLE)")'
	# (progn (when (featurep '$(PKG_NAME)) (unload-feature '$(PKG_NAME))) (load "$(PKG_LOAD_PATH)"))

uninstall :
	rm -rf $(USER_ELPA_D)/$(PKG_NAME)-*

reinstall : clean uninstall install

.PHONY: all check test lint deps install uninstall reinstall clean-all clean clean-elc
