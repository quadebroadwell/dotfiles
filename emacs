(require 'cl)
;; I keep all my emacs-related stuff under ~/dotfiles/emacs_
(defvar emacs-root (if (or (eq system-type 'cygwin)
			 (eq system-type 'gnu/linux)
			 (eq system-type 'linux))
		 "/home/dotfiles/emacs_" 		
 		 "c:/home/dotfiles/emacs_"))

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/emacs-ipython-notebook/lisp")

;;pymacs stuff
;;(autoload 'pymacs-apply "pymacs")
;;(autoload 'pymacs-call "pymacs")
;;(autoload 'pymacs-eval "pymacs" nil t)
;;(autoload 'pymacs-exec "pymacs" nil t)
;;(autoload 'pymacs-load "pymacs" nil t)
;;(autoload 'pymacs-autoload "pymacs")

;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))

;;(load-file "~/.emacs.d/emacs_python/epy-init.el")
;;(require 'pymacs)
;;(pymacs-load "ropemacs" "rope-")

(setq org-directory "~/proj/docs")
(setq org-mobile-directory "~/proj/docs")
(setq org-agenda-files '("~/proj/docs/doc.org"))
(setq org-mobile-inbox-for-pull "~/proj/docs/from-mobile.org")
(package-initialize)
(elpy-enable)

;;org mode stuff
(require 'org-install)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . true) (python . true))
)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-src-fontify-natively t)
(setq c-default-style "linux"  c-basic-offset 4)
(setq backup-directory-alist `(("." . "~/.saves")))
(setq org-confirm-babel-evaluate nil)

(setq org-todo-keywords
       '((sequence "TODO" "STARTED" "VERIFY" "LATER" "|" "DONE" "DELEGATED")))
(setq org-todo-keyword-faces
           '(("LATER" . "white")
	     ("TODO" . (:foreground "red" :background "black" :weight bold)) 
	     ("STARTED" . "yellow")
	     ("NEXT" . "yellow")
             ("DONE" . (:foreground "green" :weight bold))))

;; BELOW is critical to remove ugly red border on toc of pdf output
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40" "146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" default)))
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/proj/docs/doc.org")))
 '(org-export-latex-default-packages-alist (quote (("AUTO" "inputenc" t) ("T1" "fontenc" t) ("" "fixltx2e" nil) ("" "graphicx" t) ("" "longtable" nil) ("" "float" nil) ("" "wrapfig" nil) ("" "soul" t) ("" "textcomp" t) ("" "marvosym" t) ("" "wasysym" t) ("" "latexsym" t) ("" "amssymb" t) ("hidelinks" "hyperref" t) "\\tolerance=1000"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(recover-session)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))


(add-hook 'dired-mode-hook 'ggtags-mode)

;;(load-file "~/.emacs.d/cedet/emacs-rc-cedet.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package: volatile-highlights          ;;
;;                                       ;;
;; GROUP: Editing -> Volatile Highlights ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'volatile-highlights)
(volatile-highlights-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package: yasnippet                 ;;
;;                                    ;;
;; GROUP: Editing -> Yasnippet        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'yasnippet)
(yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package: yasnippet                 ;;
;;                                    ;;
;; GROUP: Editing -> Yasnippet        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'yasnippet)
(yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: helm              ;;
;;                            ;;
;; GROUP: Convenience -> Helm ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm)
(require 'helm-config)
(require 'helm-eshell)
(require 'helm-files)
(require 'wgrep-helm)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(eval-after-load 'helm-grep
  '(progn
     (define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
     (define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
     (define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)))

(setq
 helm-google-suggest-use-curl-p t
 helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
 helm-quick-update t ; do not display invisible candidates
 helm-idle-delay 0.01 ; be idle for this many seconds, before updating in delayed sources.
 helm-input-idle-delay 0.01 ; be idle for this many seconds, before updating candidate buffer
 helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.

 ;; you can customize helm-do-grep to execute ack-grep
 ;; helm-grep-default-command "ack-grep -Hn --smart-case --no-group --no-color %e %p %f"
 ;; helm-grep-default-recurse-command "ack-grep -H --smart-case --no-group --no-color %e %p %f"
 helm-split-window-default-side 'other ;; open helm buffer in another window
 helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
 helm-buffers-favorite-modes (append helm-buffers-favorite-modes
                                     '(picture-mode artist-mode))
 helm-candidate-number-limit 200 ; limit the number of displayed canidates
 helm-M-x-requires-pattern 0     ; show all candidates when set to 0
 helm-boring-file-regexp-list
 '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "\\.i$") ; do not show these files in helm buffer
 helm-ff-file-name-history-use-recentf t
 helm-move-to-line-cycle-in-source t ; move to end or beginning of source
                                        ; when reaching top or bottom of source.
 ido-use-virtual-buffers t      ; Needed in helm-buffers-list
 helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non--nil
                                        ; useful in helm-mini that lists buffers
 )

(define-key helm-map (kbd "C-x 2") 'helm-select-2nd-action)
(define-key helm-map (kbd "C-x 3") 'helm-select-3rd-action)
(define-key helm-map (kbd "C-x 4") 'helm-select-4rd-action)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h m") 'helm-man-woman)
(global-set-key (kbd "C-c h g") 'helm-do-grep)
(global-set-key (kbd "C-c h f") 'helm-find)
(global-set-key (kbd "C-c h l") 'helm-locate)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-h C-f") 'helm-apropos)

;; use helm to list eshell history
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))

;;; Save current position to mark ring
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

(helm-mode)

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
