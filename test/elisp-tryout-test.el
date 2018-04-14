;;; elisp-tryout-test.el --- Unit tests for elisp-tryout.el -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Christo

;; Author: Christo <christo@cryptodrunks.net>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Unit tests for elisp-tryout.el.

;;; Code:
(require 'test-helper)

(ert-deftest elisp-tryout/first-test ()
  "A simple first test."
  (should (equal (elisp-tryout-add 1 1) 2)))

(ert-deftest elisp-tryout-sandboxed-test ()
  "Run tests in a sandbox."
  (within-sandbox
   (should (equal (elisp-tryout-add 1 1) 2))))

(provide 'elisp-tryout-test)
;;; elisp-tryout-test.el ends here
