(with-eval-after-load 'org
  ;; here goes your Org config :)
  ;; ....

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; Org Mode Stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-ditaa-jar-path "/usr/bin/ditaa")
(setq org-directory "~/Dropbox/proj/org")
(setq org-mobile-directory "~/Dropbox/proj/org")
(setq org-agenda-files '("~/Dropbox/proj/org/doc.org"))
(setq org-mobile-inbox-for-pull "~/Dropbox/proj/docs/from-mobile.org")
(require 'ob-ipython)
;(require 'org-install)

;(global-set-key "\C-cl" 'org-store-link)
;(global-set-key "\C-cc" 'org-capture)
;(global-set-key "\C-ca" 'org-agenda)
;(global-set-key "\C-cb" 'org-iswitchb)
;(setq org-src-fontify-natively t)
(setq c-default-style "linux"  c-basic-offset 4)
;(setq backup-directory-alist `(("." . "~/.saves")))
(setq org-confirm-babel-evaluate nil)
;(setq org-todo-keywords
;       '((sequence "TODO" "STARTED" "VERIFY" "LATER" "|" "DONE" "DELEGATED")))
;(setq org-todo-keyword-faces
;           '(("LATER" . "white")
;	     ("TODO" . (:foreground "red" :background "black" :weight bold)) 
;	     ("STARTED" . "yellow")
;	     ("NEXT" . "yellow")
 ;            ("DONE" . (:foreground "green" :weight bold))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;ORG ODT STUFF FOR TABLES AND WHATNOT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-export-odt-table-styles
                 '(("TableWithHeaderRowAndColumn" "Custom"
                     ((use-first-row-styles . t)
		      (use-even-row-styles . t)
		      (use-odd-row-styles . t)))
                     ("TableWithFirstRowandLastRow" "Custom"
                      ((use-first-row-styles . t)
                      (use-last-row-styles . t)))))

					;ORG BABEL SHIT

;(setq org-ditaa-jar-path "~/git/org-mode/contrib/scripts/ditaa.jar")
(setq org-plantuml-jar-path "~/dotfiles/plantuml.jar")

(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)

; Make babel results blocks lowercase
(setq org-babel-results-keyword "results")

(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
         (ditaa . t)
         (python . t)
         (C  . t)
         (sh . t)
         (matlab . t)
         (org . t)
	 (plantuml .  t)
	 (latex . t))))

; Do not prompt to confirm evaluation
; This may be dangerous - make sure you understand the consequences
; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

; Use fundamental mode when editing plantuml blocks with C-c '
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))


(setq org-directory "~/Dropbox/proj/org/")
(setq org-default-notes-file "~/Dropbox/proj/org/doc.org")
;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Dropbox/proj/org/doc.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file "~/Dropbox/proj/org/doc.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/Dropbox/proj/org/doc.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree+prompt "~/Dropbox/proj/org/j.org")
               "* %?\n%U\n" )
              ("w" "org-protocol" entry (file "~/Dropbox/proj/org/doc.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/Dropbox/proj/org/doc.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file "~/Dropbox/proj/org/doc.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/Dropbox/proj/org/doc.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))
;(org-indent-mode)
(org-toggle-inline-images) 
;(org-toggle-pretty-entities)

)
