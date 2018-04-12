;;; test-helper.el --- Test helpers for elisp-tryout-test.el.  -*- lexical-binding: t; -*-

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

;; Helper code for unit tests.

;;; Code:
(declare-function undercover "undercover")

(require 'f)

(defvar cpt-path
  (f-parent (f-this-file)))

(defvar elisp-tryout-test-path
  (f-dirname (f-this-file)))

(defvar elisp-tryout-root-path
  (f-parent elisp-tryout-test-path))

(defvar elisp-tryout-sandbox-path
  (f-expand "sandbox" elisp-tryout-test-path))

(when (f-exists? elisp-tryout-sandbox-path)
  (error "Something is already in %s. Check and destroy it yourself" elisp-tryout-sandbox-path))

(defmacro within-sandbox (&rest body)
  "Evaluate BODY in an empty sandbox directory."
  `(let ((default-directory elisp-tryout-sandbox-path))
     (when (f-exists? elisp-tryout-sandbox-path)
       (f-delete default-directory :force))
     (f-mkdir elisp-tryout-sandbox-path)
     ,@body
     (f-delete default-directory :force)))

(when (require 'undercover nil t)
  (undercover "*.el"))

(require 'ert)
(require 'el-mock)
(eval-when-compile
  (require 'cl))

(require 'elisp-tryout)

(message "Running tests on Emacs %s" emacs-version)

(provide 'test-helper)
;;; test-helper.el ends here
