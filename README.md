# elisp-test.el

## Synopsis

[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![Melpa Status](http://melpa.milkbox.net/packages/elisp-test-badge.svg)](http://melpa.milkbox.net/#/elisp-test) [![Melpa Stable Status](http://melpa-stable.milkbox.net/packages/mocha-badge.svg)](http://melpa-stable.milkbox.net/#/mocha) [![Build Status](https://travis-ci.org/critocrito/elisp-test.el.svg?branch=master)](https://travis-ci.org/critocrito/elisp-test.el) [![Coverage Status](https://coveralls.io/repos/github/critocrito/elisp-test.el/badge.svg)](https://coveralls.io/github/critocrito/elisp-test.el)

## Installation

## Usage

## Development

The following `make` targets are available:

- `all`: This is the default target and calls `deps` and builds the package.
- `deps`: Install all cask dependencies.
- `test`: Run the unit tests.
- `lint`: Lint the package and the tests.
- `check`: Run the tests and lint the source.
- `clean`: Remove the compiled bytecode and the distribution.
- `clean-all`: Thorough cleanup.
- `install`: Build and install the package into ~/.emacs.d/elpa and reload the
  package using `emacsclient`. If `emacsclient` is not available, print the
  reload code snippet to the shell.
- `uninstall`: Remove the package from the elpa path and unload the package
  using `emacsclient`. If `emacsclient` is not available, print the unload
  code snippet to the shell.
- `reinstall`: Remove the existing version and make a fresh install.
