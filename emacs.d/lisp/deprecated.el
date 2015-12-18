
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;Everything below here used to be used, but no longer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; I am not sure why i would want the crap below here, commenting out for now
;; I keep all my emacs-related stuff under ~/dotfiles/emacs_
;;(defvar emacs-root (if (or (eq system-type 'cygwin)
;;			 (eq system-type 'gnu/linux)
;;			 (eq system-type 'linux))
;;		 "/home/dotfiles/emacs_" 		
 ;;		 "c:/home/dotfiles/emacs_"))

;;(add-to-list 'load-path "~/.emacs.d/emacs-ipython-notebook/lisp")


; Removes CEDET from path incase I want a custom build 
(setq load-path (remove-if (lambda (x) (string-match-p "cedet" x)) load-path))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; CEDET Stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(load-file "~/.emacs.d/cedet/cedet-devel-load.el")
;(global-ede-mode 1)                      ; Enable the Project management system
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;(global-srecode-minor-mode 1)            ; Enable template insertion menu

;(ede-cpp-root-project "Test"
;                :name "Test Project"
;                :file "~/proj/fw_laptop/BuildNotes.txt"
;                :include-path '("/"
;                                "/app/inc"
;                                "/msg/inc"
;				"/hw/antares/inc"
;				"/hw/antares/inc_gen"
;				"/hw/antares/specs_get"
;				)
;)

;;; activate ecb
;(require 'ecb)
;(require 'ecb-autoloads)
;(setq ecb-show-sources-in-directories-buffer 'always)
;(setq ecb-compile-window-height 6)


;;(add-hook 'c-mode-common-hook
;;          (lambda ()
;;            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
;;              (ggtags-mode 1))))
