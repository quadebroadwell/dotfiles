(add-to-list 'load-path "~/.emacs.d/lisp/")

(load-file "~/dotfiles/emacs.d/lisp/packagesetup.el")
(load-file "~/dotfiles/emacs.d/lisp/orgsetup.el")

(global-visual-line-mode)

;;("hidelinks" "hyperref" f)

(load-theme 'monokai)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; STOP PROMPTING FOR FILE CHANGE ON DISK ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun ask-user-about-supersession-threat (fn)
  "blatantly ignore files that changed on disk"
  )
(defun ask-user-about-lock (file opponent)
  "always grab lock"
   t)
(global-auto-revert-mode) 
(global-set-key (kbd "C-x C-b") 'ibuffer)
;(require 'auto-complete-clang)
;(require 'auto-complete-c-headers)
;(add-to-list 'ac-sources 'ac-source-c-headers)
(recover-session)

