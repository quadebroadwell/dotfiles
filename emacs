(require 'cl)
;; I keep all my emacs-related stuff under ~/dotfiles/emacs_
(defvar emacs-root (if (or (eq system-type 'cygwin)
			 (eq system-type 'gnu/linux)
			 (eq system-type 'linux))
		 "/home/dotfiles/emacs_" 		
 		 "c:/home/dotfiles/emacs_"))

(shell)
(require 'package)
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("marmelade" . "http://marmalade-repo.org/packages/"))