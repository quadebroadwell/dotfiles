
(require 'cl)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; Custom set variables 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BELOW is critical to remove ugly red border on toc of pdf output
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-auto-complete-chars (quote (32 95 40 46 36 39)))
 '(company-backends
   (quote
    (company-ropemacs company-semantic company-elisp
		      (company-semantic company-gtags company-etags company-keywords)
		      company-nxml company-css company-eclim company-semantic company-etags company-xcode company-cmake company-capf company-oddmuse company-files company-dabbrev)))
 '(company-etags-ignore-case t)
 '(company-idle-delay 0.0)
 '(company-minimum-prefix-length 3)
 '(company-tooltip-limit 1)
 '(custom-safe-themes
   (quote
    ("60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40" "146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" default)))
 '(ecb-options-version "2.40")
 '(elpy-rpc-backend "rope")
 '(elpy-rpc-python-command "python")
 '(helm-exit-idle-delay 0.1)
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/proj/docs/doc.org")))
 '(org-export-latex-default-packages-alist
   (quote
    (("AUTO" "inputenc" t)
     ("T1" "fontenc" t)
     ("" "fixltx2e" nil)
     ("" "graphicx" t)
     ("" "longtable" nil)
     ("" "float" nil)
     ("" "wrapfig" nil)
     ("" "soul" t)
     ("" "textcomp" t)
     ("" "marvosym" t)
     ("" "wasysym" t)
     ("" "latexsym" t)
     ("" "hyperref" t)
     ("" "amssymb" t)
     "\\tolerance=1000")))
 '(org-export-odt-content-template-file "~/proj/docs/OrgOdtContentTemplate.xml")
 '(org-export-odt-styles-file nil)
 '(org-export-odt-table-styles
   (quote
    (("TableWithHeaderRowAndColumn" "Custom"
      ((use-first-row-styles . t)
       (use-banding-rows-styles . t)
       (use-even-row-styles . t)
       (use-odd-row-styles . t)))
     ("TableWithFirstRowandLastRow" "Custom"
      ((use-first-row-styles . t)
       (use-last-row-styles . t))))) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-file "~/dotfiles/emacs.d/lisp/startup.el")
