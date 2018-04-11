;;; elisp-test.el --- elisp-test.el  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Christo

;; Author: Christo <christo@cryptodrunks.net>
;; URL: http://github.com/critocrito/elisp-test.el
;; Created: 2018
;; Version: 0.1
;; Keywords:
;; Package-Requires:


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

;;

;;; Code:
(defun elisp-test/add (a b)
  "Add number A and B."
  (+ a b))

(provide 'elisp-test)
;;; elisp-test.el ends here
