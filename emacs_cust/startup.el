(load-file "~/dotfiles/emacs_cust/orgsetup.el")
;Dont forget to install ob-ipython!!
; Dont forget to start ipython notebook session

(require 'ob-ipython)
(global-visual-line-mode)

;;("hidelinks" "hyperref" f)

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

