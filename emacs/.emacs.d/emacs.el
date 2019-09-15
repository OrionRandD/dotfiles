;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Emacspeak][Emacspeak:1]]

;; Emacspeak:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Bind%20M-(Alt)-x%20to%20"C-x%20C-m"][Bind M-(Alt)-x to "C-x C-m":1]]
;; Bind M-(Alt)-x to "C-x C-m" 

;; (global-set-key "\C-x\C-m" 'execute-extended-command) (global-set-key "\C-c\C-m" 'execute-extended-command)
;; Bind M-(Alt)-x to "C-x C-m":1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Package][Package:1]]
;;(require 'package)
;;(package-initialize)
;; Package:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Use-package][Use-package:1]]
(use-package use-package-ensure-system-package :ensure t)
;; (setq use-package-always-ensure t)
;; Use-package:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Speed%20up%20Emacs][Speed up Emacs:1]]
(setq gc-cons-threshold (* 100 1024 1024))
;; Speed up Emacs:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Buffer][Buffer:1]]
(setq frame-title-format (list (format "%s %%S: %%j " (system-name)) '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
;; Buffer:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Auto-complete%20-%20global][Auto-complete - global:1]]
;;(require 'auto-complete)
;;(global-auto-complete-mode t) 
  (ac-config-default)
  (defun auto-complete-mode-maybe ()
   "No maybe for you. Only AC!"
   (auto-complete-mode 1))

  (ac-set-trigger-key "RET")

  (with-eval-after-load 'auto-complete
    (ac-flyspell-workaround))
;; Auto-complete - global:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Company-mode][Company-mode:1]]
;;   (require 'company)

;;   (add-hook 'after-init-hook 'global-company-mode)

;;   (setq company-minimum-prefix-length 3)
;;   (setq company-idle-delay 0.1)


;;    (defun company-ac-setup ()
;;      "Sets up `company-mode' to behave similarly to `auto-complete-mode'."
;;      (setq company-require-match nil)
;;      (setq company-auto-complete #'my-company-visible-and-explicit-action-p)
;;      (setq company-frontends '(company-echo-metadata-frontend
;;       			 company-pseudo-tooltip-unless-just-one-frontend-with-delay
;;       			 company-preview-frontend))
;;      (define-key company-active-map [tab]
;;        'company-select-next-if-tooltip-visible-or-complete-selection)
;;      (define-key company-active-map (kbd "TAB")
;;        'company-select-next-if-tooltip-visible-or-complete-selection))


;; (eval-after-load 'company
;;      '(progn
;;       	(define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
;;       	(define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))

;;        (eval-after-load 'company
;;    '(progn
;;       (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
;;       (define-key company-active-map (kbd "<backtab>") 'company-select-previous)))

;;        (setq company-frontends
;;      '(company-pseudo-tooltip-unless-just-one-frontend
;;        company-preview-frontend
;;        company-echo-metadata-frontend))

;;        (setq company-require-match 'never)

;;        (defun my-company-visible-and-explicit-action-p ()
;;       (and (company-tooltip-visible-p)
;;       (company-explicit-action-p)))

;;        (company-ac-setup)

;;        (eval-after-load 'company
;;     (lambda ()
;;       (set-face-attribute
;;        'company-preview
;;       	nil
;;       	:background (face-attribute 'company-preview-common :background))))

;;        (custom-set-faces
;;      '(company-preview
;;        ((t (:foreground "darkgray" :underline t))))
;;      '(company-preview-common
;;        ((t (:inherit company-preview))))
;;      '(company-tooltip
;;        ((t (:background "lightgray" :foreground "black"))))
;;      '(company-tooltip-selection
;;        ((t (:background "steelblue" :foreground "white"))))
;;      '(company-tooltip-common
;;        ((((type x)) (:inherit company-tooltip :weight bold))
;;       	(t (:inherit company-tooltip))))
;;      '(company-tooltip-common-selection
;;        ((((type x)) (:inherit company-tooltip-selection :weight bold))
;;       	(t (:inherit company-tooltip-selection)))))

;; ;; If you use Company, uncomment the upper bit OR the down bit 

;;     (add-hook 'after-init-hook 'global-company-mode)

;;       (use-package company
;;       :ensure t
;;       :config
;;       (setq company-idle-delay 0)
;;       (setq company-minimum-prefix-length 3))
;;       (with-eval-after-load 'company
;;       (add-hook 'c-mode-hook 'company-mode)
;;       (add-hook 'c++-mode-hook 'company-mode))

;;       (use-package irony
;;       :ensure t
;;       :config
;;       (add-hook 'c-mode-hook 'irony-mode)
;;       (add-hook 'c++-mode-hook 'irony-mode)
;;       (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

;;       (use-package company-irony
;;       :ensure t
;;       :config
;;       (require 'company)
;;       (add-to-list 'company-backends 'company-irony))
;; Company-mode:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org-mode][Org-mode:1]]
(require 'org)
(require 'org-ac)
(require 'org-tempo)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;; Org-mode:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*TAB%20completion%20on%20emacs%20console][TAB completion on emacs console:1]]
(setq evil-want-C-i-jump nil)
;; TAB completion on emacs console:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Evil%20collection][Evil collection:1]]
;; (use-package evil-collection
;;  :after evil
;;  :config
;;  (evil-collection-init))

   (setq evil-want-keybinding nil)
      (use-package evil-collection
       :custom (evil-collection-setup-minibuffer t)
       :init (evil-collection-init))
;; Evil collection:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Evil%20mode][Evil mode:1]]
;; for using TAB with emacs -nw in terminal 
  ;; you have to load it before calling evil-mode

    (unless (display-graphic-p) (setq evil-want-C-i-jump nil))
    (use-package evil
      :config (require 'evil)
      (progn (evil-mode 1)))

     ;; evil-leader 
	(global-evil-leader-mode)
	(evil-leader/set-key
	  "e" 'find-file
	  "b" 'switch-to-buffer
	  "k" 'kill-buffer)

     ;;    ;; http://nathantypanski.com/blog/2014-08-03-a-vim-like-emacs-config.html
     ;;    ;; http://wikemacs.org/wiki/Evil

(use-package evil-surround
  :after evil
  :hook (evil-mode . global-evil-surround-mode))

(use-package evil-numbers
  :after evil
  :bind (
         :map evil-normal-state-map
         ("C-c +" . evil-numbers/inc-at-pt)
         ("C-c -" . evil-numbers/dec-at-pt)))

(with-eval-after-load 'evil-vars
  (setq evil-want-C-w-in-emacs-state t))

(use-package evil-nerd-commenter
  :ensure t
  :config
  (evilnc-default-hotkeys))

     ;;    (require 'evil-mark-replace)

     ;;    (require 'evil-matchit)
     ;;    (global-evil-matchit-mode 1)
     ;;    (require 'evil-exchange)

     ;;  ;; change default key bindings (if you want) HERE
     ;;    (setq evil-exchange-key (kbd "zx"))
     ;;    (evil-exchange-install)

     ;;  ;; change default key bindings (if you want) HERE
     ;;    (setq evil-extra-operator-eval-key (kbd "ge"))
     ;;    (require 'evil-extra-operator)
     ;;    (global-evil-extra-operator-mode 1)
     ;;    (require 'evil-visualstar)
     ;;    (global-evil-visualstar-mode 1)

         (require 'evil-org)

     ;;  ;; evil-minibuffer
     ;;  ;; https://gist.github.com/ccdunder/5816865

     ;;  ;; option for enabling vi keys in the minibuffer
     ;;  ;; Addresses evil-core.el:163 TODO

     ;;   (mapcar (lambda (keymap)
     ;;     	 (evil-define-key 'insert (eval keymap) [escape] 'abort-recursive-edit)
     ;;     	 (evil-define-key 'normal (eval keymap) [escape] 'abort-recursive-edit)
     ;;     	 (evil-define-key 'insert (eval keymap) [return] 'exit-minibuffer)
     ;;     	 (evil-define-key 'normal (eval keymap) [return] 'exit-minibuffer)
     ;;     	 (evil-define-key 'insert (eval keymap) "\C-t" 'evil-normal-state))

     ;; ;; https://www.gnu.org/software/emacs/manual/html_node/elisp/
     ;; ;; Text-from-Minibuffer.html#Definition of minibuffer-local-map

     ;;     '(minibuffer-local-map
     ;;     	 minibuffer-local-ns-map
     ;;     	 minibuffer-local-completion-map
     ;;     	 minibuffer-local-must-match-map
     ;;     	 minibuffer-local-isearch-map))

     ;;    (add-hook 'minibuffer-setup-hook 
     ;;     	      '(lambda () 
     ;;     		 (set (make-local-variable 'evil-echo-state) nil)

     ;;    ;; (evil-set-initial-state 'mode 'insert) is the evil-proper
     ;;    ;; way to do this, but the minibuffer doesn't have a mode.
     ;;    ;; The alternative is to create a minibuffer mode (here), but
     ;;    ;; then it may conflict with other packages' if they do the same.

     ;;     	    (evil-insert 1)))
;; Evil mode:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Eyebrowse][Eyebrowse:1]]
(use-package eyebrowse 
  :ensure t
  :config 
   (eyebrowse-setup-opinionated-keys)
    (add-to-list 'window-persistent-parameters '(window-side . writable))
    (add-to-list 'window-persistent-parameters '(window-slot . writable)))
;; Eyebrowse:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Yasnippets][Yasnippets:1]]
;; yasnippet code 'optional', before auto-complete

(require 'yasnippet)
(yas-global-mode 1)
;; Yasnippets:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Counsel%20Ivy%20and%20Swiper][Counsel Ivy and Swiper:1]]
(use-package counsel
 :ensure t
 :bind
 (("M-y" . counsel-yank-pop)
 :map ivy-minibuffer-map
 ("M-y" . ivy-next-line)))

(use-package ivy
:ensure t
:diminish (ivy-mode)
:bind (("C-x b" . ivy-switch-buffer))
:config
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "%d/%d ")
(setq ivy-display-style 'fancy))

(use-package swiper
:ensure t
:bind (("C-s" . swiper)
       ("C-r" . swiper)
       ("C-c C-r" . ivy-resume)
       ("M-x" . counsel-M-x)
       ("C-x C-f" . counsel-find-file))
:config
(progn
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  ))
;; Counsel Ivy and Swiper:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*El-get][El-get:1]]
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
   (require 'el-get)

;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
;; (add-to-list 'el-get-recipe-path "~/.emacs.d/elpa/el-get-20181006.225/recipes")
;; El-get:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Auto-package-update][Auto-package-update:1]]
;; (require 'auto-package-update)  
;; (setq auto-package-update-prompt-before-update t)
;; (setq auto-package-update-delete-old-versions t)
;; Auto-package-update:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Abbreviations][Abbreviations:1]]
(setq-default abbrev-mode t)
     (read-abbrev-file "~/.emacs.d/abbrev_defs")
     (setq save-abbrevs t)
     (setq save-abbrevs 'silently)

   (define-key ctl-x-map "\C-i"
  #'endless/ispell-word-then-abbrev)

    ;; "it remaps to 'C-x TAB'"
    ;; Because "C-i" is the Stumpwm TM prefix-key

(defun endless/simple-get-word ()
  (car-safe (save-excursion (ispell-get-word nil))))

(defun endless/ispell-word-then-abbrev (p)
  "Call `ispell-word', then create an abbrev for it.
With prefix P, create local abbrev. Otherwise it will
be global.
If there's nothing wrong with the word at point, keep
looking for a typo until the beginning of buffer. You can
skip typos you don't want to fix with `SPC', and you can
abort completely with `C-g'. You can edit the abbreviation
file with `edit-abbrevs`"
  (interactive "P")
  (let (bef aft)
    (save-excursion
      (while (if (setq bef (endless/simple-get-word))
		 ;; Word was corrected or used quit.
		 (if (ispell-word nil 'quiet)
		     nil ; End the loop.
		   ;; Also end if we reach `bob'.
		   (not (bobp)))
	       ;; If there's no word at point, keep looking
	       ;; until `bob'.
	       (not (bobp)))
	(backward-word)
	(backward-char))
      (setq aft (endless/simple-get-word)))
    (if (and aft bef (not (equal aft bef)))
	(let ((aft (downcase aft))
	      (bef (downcase bef)))
	  (define-abbrev
	    (if p local-abbrev-table global-abbrev-table)
	    bef aft)
	  (message "\"%s\" now expands to \"%s\" %sally"
		   bef aft (if p "loc" "glob")))
      (user-error "No typo at or before point"))))
;; Abbreviations:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*All-the-icons][All-the-icons:1]]
(use-package all-the-icons
 :ensure t)

(defun org-brain-insert-resource-icon (link)
  "Insert an icon, based on content of org-mode LINK."
  (insert (format "%s "
		  (cond ((string-prefix-p "http" link)
			 (cond ((string-match "wikipedia\\.org" link)
				(all-the-icons-faicon "wikipedia-w"))
			       ((string-match "github\\.com" link)
				(all-the-icons-octicon "mark-github"))
			       ((string-match "vimeo\\.com" link)
				(all-the-icons-faicon "vimeo"))
			       ((string-match "youtube\\.com" link)
				(all-the-icons-faicon "youtube"))
			       (t
				(all-the-icons-faicon "globe"))))
			((string-prefix-p "brain:" link)
			 (all-the-icons-fileicon "brain"))
			(t
			 (all-the-icons-icon-for-file link))))))

(add-hook 'org-brain-after-resource-button-functions #'org-brain-insert-resource-icon)
;; All-the-icons:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Bug-hunter][Bug-hunter:1]]
(use-package bug-hunter
 :ensure t)
;; Bug-hunter:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Eshell][Eshell:1]]
(use-package eshell
  :commands eshell
  :init
  (setq
   eshell-cmpl-ignore-case t
   eshell-cmpl-cycle-completions nil
   eshell-history-size 10000
   eshell-hist-ignoredups t
   eshell-error-if-no-glob t
   eshell-glob-case-insensitive t
   eshell-scroll-to-bottom-on-input 'all)
  :config
  (defun jcf-eshell-here ()
    (interactive)
    (eshell "here"))

  (defun pcomplete/sudo ()
    (let ((prec (pcomplete-arg 'last -1)))
      (cond ((string= "sudo" prec)
             (while (pcomplete-here*
                     (funcall pcomplete-command-completion-function)
                     (pcomplete-arg 'last) t))))))

  (add-hook 'eshell-mode-hook
            (lambda ()
              (define-key eshell-mode-map
                [remap eshell-pcomplete]
                'helm-esh-pcomplete)
              (define-key eshell-mode-map
                (kbd "M-p")
                'helm-eshell-history)
              (eshell/export "NODE_NO_READLINE=1"))))
;; Eshell:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Helm][Helm:1]]
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/elpa/helm-3.0/")
  ;; (require 'helm-config)

     (helm-mode 1)

  ;; (global-set-key (kbd "C-x C-m") 'helm-M-x)
  ;; (global-set-key (kbd "C-x C-f") 'helm-find-files)

  ;; s is super or win
  ;; (global-set-key (kbd "s-x") 'helm-M-x)
   (global-set-key (kbd "M-x") 'helm-M-x)
   (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
  ;; (global-set-key (kbd "s-f") 'helm-find-files)
   (global-set-key (kbd "C-x C-f") 'helm-find-files)

;;(global-set-key (kbd "Ctrl-x Ctrl-m") 'helm-M-x)
;;(global-set-key (kbd "C-x C-f") 'helm-find-files)
;; Helm:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Helm-org-rifle][Helm-org-rifle:1]]
(defun helm-org-rifle-brain ()
"Rifle files in `org-brain-path'."
(interactive)
(helm-org-rifle-directories (list org-brain-path)))
;; Helm-org-rifle:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Beacon][Beacon:1]]
(use-package beacon
 :config
 (beacon-mode 1))
;; Beacon:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Bidi%20-%20bidirectional%20text][Bidi - bidirectional text:1]]
(setq-default bidi-display-reordering nil)

 (defun bidi-reordering-toggle ()
 "Toggle bidirectional display reordering."
 (interactive)
 (setq bidi-display-reordering (not bidi-display-reordering))
 (message "bidi reordering is %s" bidi-display-reordering))

 (defun bidi-display-reordering-on ()
 "Sets bidi-display-reordering-on"
 (setq-local bidi-display-reordering t))

 (add-hook 'text-mode-hook 'bidi-display-reordering-on)

 (setq-default bidi-paragraph-direction 'left-to-right)

 (defun bidi-direction-toggle ()
 "Will switch the explicit direction of text for current
 buffer. This will set BIDI-DISPLAY-REORDERING to T"
 (interactive "")
 (setq bidi-display-reordering t)
 (if (equal bidi-paragraph-direction 'right-to-left)
 (setq bidi-paragraph-direction 'left-to-right)
 (setq bidi-paragraph-direction 'right-to-left))
 (message "%s" bidi-paragraph-direction))
;; Bidi - bidirectional text:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Byte-compiling][Byte-compiling:1]]
(setq byte-compile-warnings '(not nresolved
				 free-vars
				 callargs
				 redefine
				 obsolete
				 noruntime
				 cl-functions
				 interactive-only
				 ))
;; Byte-compiling:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Bullets][Bullets:1]]
(use-package org-bullets
 :ensure t
 :config
   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;; Bullets:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Auctex][Auctex:1]]
(setq TeX-parse-self t); Enable parse on load.
  (setq TeX-auto-save t); Enable parse on save.
  (setq-default TeX-master nil)

  (setq TeX-PDF-mode t); PDF mode (rather than DVI-mode)

  (add-hook 'TeX-mode-hook 'flyspell-mode); Enable Flyspell mode for TeX modes such as AUCTeX. Highlights all misspelled words.
  (add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode); Enable Flyspell program mode for emacs lisp mode, which highlights all misspelled words in comments and strings.
  (setq ispell-dictionary "english"); Default dictionary. To change do M-x ispell-change-dictionary RET.
  (add-hook 'TeX-mode-hook
	    (lambda () (TeX-fold-mode 1))); Automatically activate TeX-fold-mode.
  (setq LaTeX-babel-hyphen nil); Disable language-specific hyphen insertion.

  ;; " expands into csquotes macros (for this to work babel must be loaded after csquotes).
  (setq LaTeX-csquotes-close-quote "}"
	LaTeX-csquotes-open-quote "\\enquote{")

  ;; LaTeX-math-mode http://www.gnu.org/s/auctex/manual/auctex/Mathematics.html
  (add-hook 'TeX-mode-hook 'LaTeX-math-mode)

  ;; Org-ref
  ;; (setq org-ref-completion-library 'org-ref-ivy-cite)
  ;;(require 'org-ref)

  ;; Bibtex

  ;; (require 'ox-bibtex)

  ;; RefTeX
  ;; Turn on RefTeX for AUCTeX http://www.gnu.org/s/auctex/manual/reftex/reftex_5.html

   (add-hook 'TeX-mode-hook 'turn-on-reftex)

  (eval-after-load 'reftex-vars; Is this construct really needed?
    '(progn
       (setq reftex-cite-prompt-optional-args t); Prompt for empty optional arguments in cite macros.
       ;; Make RefTeX interact with AUCTeX, http://www.gnu.org/s/auctex/manual/reftex/AUCTeX_002dRefTeX-Interface.html

       (setq reftex-plug-into-AUCTeX t)
       ;; So that RefTeX also recognizes \addbibresource. Note that you
       ;; can't use $HOME in path for \addbibresource but that "~"
       ;; works.
       (setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))
;;     (setq reftex-default-bibliography '("~/latex_projects/references.bib/")); So that RefTeX in Org-mode knows bibliography
;;     (setq reftex-default-bibliography '("UNCOMMENT LINE AND INSERT PATH TO YOUR BIBLIOGRAPHY HERE")); So that RefTeX in Org-mode knows bibliography
       (setcdr (assoc 'caption reftex-default-context-regexps) "\\\\\\(rot\\|sub\\)?caption\\*?[[{]"); Recognize \subcaptions, e.g. reftex-citation
       (setq reftex-cite-format; Get ReTeX with biblatex, see https://tex.stackexchange.com/questions/31966/setting-up-reftex-with-biblatex-citation-commands/31992#31992

	     '((?t . "\\textcite[]{%l}")
	       (?a . "\\autocite[]{%l}")
	       (?c . "\\cite[]{%l}")
	       (?s . "\\smartcite[]{%l}")
	       (?f . "\\footcite[]{%l}")
	       (?n . "\\nocite{%l}")
	       (?b . "\\blockcquote[]{%l}{}")))))

;; Fontification (remove unnecessary entries as you notice them) http://lists.gnu.org/archive/html/emacs-orgmode/2009-05/msg00236.html http://www.gnu.org/software/auctex/manual/auctex/Fontification-of-macros.html

  (setq font-latex-match-reference-keywords
	'(
	  ;; biblatex
	  ("printbibliography" "[{")
	  ("addbibresource" "[{")
	  ;; Standard commands
	  ;; ("cite" "[{")
	  ("Cite" "[{")
	  ("parencite" "[{")
	  ("Parencite" "[{")
	  ("footcite" "[{")
	  ("footcitetext" "[{")
	  ;; ;; Style-specific commands
	  ("textcite" "[{")
	  ("Textcite" "[{")
	  ("smartcite" "[{")
	  ("Smartcite" "[{")
	  ("cite*" "[{")
	  ("parencite*" "[{")
	  ("supercite" "[{")
	  ; Qualified citation lists
	  ("cites" "[{")
	  ("Cites" "[{")
	  ("parencites" "[{")
	  ("Parencites" "[{")
	  ("footcites" "[{")
	  ("footcitetexts" "[{")
	  ("smartcites" "[{")
	  ("Smartcites" "[{")
	  ("textcites" "[{")
	  ("Textcites" "[{")
	  ("supercites" "[{")
	  ;; Style-independent commands
	  ("autocite" "[{")
	  ("Autocite" "[{")
	  ("autocite*" "[{")
	  ("Autocite*" "[{")
	  ("autocites" "[{")
	  ("Autocites" "[{")
	  ;; Text commands
	  ("citeauthor" "[{")
	  ("Citeauthor" "[{")
	  ("citetitle" "[{")
	  ("citetitle*" "[{")
	  ("citeyear" "[{")
	  ("citedate" "[{")
	  ("citeurl" "[{")
	  ;; Special commands
	  ("fullcite" "[{")))

  (setq font-latex-match-textual-keywords
	'(
	  ;; biblatex brackets
	  ("parentext" "{")
	  ("brackettext" "{")
	  ("hybridblockquote" "[{")
	  ;; Auxiliary Commands
	  ("textelp" "{")
	  ("textelp*" "{")
	  ("textins" "{")
	  ("textins*" "{")
	  ;; supcaption
	  ("subcaption" "[{")))

  (setq font-latex-match-variable-keywords
	'(
	  ;; amsmath
	  ("numberwithin" "{")
	  ;; enumitem
	  ("setlist" "[{")
	  ("setlist*" "[{")
	  ("newlist" "{")
	  ("renewlist" "{")
	  ("setlistdepth" "{")
	  ("restartlist" "{")))
;; Auctex:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Auto-install][Auto-install:1]]
;; If you have no internet access and emacs refuses to load properly - with "evil-mode" on,
;; comment the lines bellow 

;; (require 'auto-install)
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)
;; Auto-install:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*_.emacs%20(init.el)][_.emacs (init.el):1]]
(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file)
  (rotate-frame-clockwise))

(global-set-key (kbd "C-c I") 'find-user-init-file)
;; _.emacs (init.el):1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Avy%20navegation][Avy navegation:1]]
(use-package avy
  :ensure t
  :config
  (avy-setup-default))
;; Avy navegation:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Agressive%20indent%20mode][Agressive indent mode:1]]
(global-aggressive-indent-mode 1)
;; Agressive indent mode:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Atomic%20chrome][Atomic chrome:1]]
;;  (require 'atomic-chrome)
;;  (atomic-chrome-start-server)
;; Atomic chrome:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Babel%20languages][Babel languages:1]]
;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
(clojure .t)
(C . t)
;;(cpp . t)
;;(csharp . t)
(haskell . t)
(python . t)
(org . t)
;; (scala . t)
(scheme . t)
(perl . t)
(R . t)
(gnuplot . t)
(java . t)
(js . t)
;;(julia . t)
(lisp . t)
(latex . t)
(ruby . t)
(emacs-lisp . t)
(ditaa . t)
(sed .t)
(awk .t)
(sql .t)
(sqlite .t)
 ))
;; Babel languages:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Bind-chord][Bind-chord:1]]
;;  (require 'bind-chord)
;; Bind-chord:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Brazilian-holidays][Brazilian-holidays:1]]
(load "~/.emacs.d/elpa/emacs-brazilian-holidays/brazilian-holidays.el")
;; Brazilian-holidays:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Cedilha%20in%20emacs%20and%20xemacs][Cedilha in emacs and xemacs:1]]
(set-input-method "portuguese-prefix")

(defadvice switch-to-buffer (after activate-input-method activate)
(activate-input-method "portuguese-prefix"))

(add-hook 'text-mode-hook
  (lambda () (set-input-method "portuguese-prefix")))
;; Cedilha in emacs and xemacs:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*C++][C++:1]]
;; (use-package ggtags
;; :ensure t 
;; :config 
;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
;;               (ggtags-mode 1))))
;; )
;; C++:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Compay-emoji][Compay-emoji:1]]
;;    (require 'company-emoji)
;;    (add-to-list 'company-backends 'company-emoji)

    (defun --set-emoji-font (frame)

    "Adjust the font settings of FRAME so Emacs can display emoji properly."

  (if (eq system-type 'darwin)

      ;; For NS/Cocoa

      (set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") frame 'prepend)

    ;; For Linux

      (set-fontset-font t 'symbol (font-spec :family "Symbola") frame 'prepend)))

    ;; For when Emacs is started in GUI mode:

    (--set-emoji-font nil)

    ;; Hook for when a frame is created with emacsclient
    ;; see https://www.gnu.org/software/emacs/manual/html_node/elisp/Creating-Frames.html

    (add-hook 'after-make-frame-functions '--set-emoji-font)
;; Compay-emoji:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Centered-window][Centered-window:1]]
;; (use-package centered-window)

  ;;  (require 'centered-window)
  ;;  (centered-window-mode t)

(use-package centered-window 
  :ensure t
  :config
   (centered-window-mode))
;; Centered-window:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Csharp%20mode][Csharp mode:1]]
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
   (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;;(defun my-csharp-mode-hook ()
;; enable the stuff you want for C# here
;;  (electric-pair-mode 1))
;; (add-hook 'csharp-mode-hook 'my-csharp-mode-hook)
;; Csharp mode:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Custom%20themes][Custom themes:1]]
(use-package color-theme-modern :ensure color-theme-modern)
  (use-package doom-themes :ensure doom-themes)
  (use-package theme-looper :ensure theme-looper)
  (use-package base16-theme :ensure base16-theme)
  (use-package moe-theme :ensure moe-theme)
  (use-package alect-themes :ensure alect-themes)
  (use-package powerline
   :ensure t
   :config
   (powerline-moe-theme))

   (setq custom-safe-themes t)

   (global-set-key (kbd "<f8>") 'theme-looper-enable-random-theme)

;;(load-theme 'base16-flat t)
;;(load-theme 'monokai t)
;;(load-theme 'hydandata-light t)
;;(load-theme 'anti-zenburn t)
;; (add-hook 'after-init-hook (lambda () (load-theme 'julie)))
  (add-hook 'after-init-hook (lambda () (load-theme 'doom-vibrant)))
;;(add-hook 'after-init-hook (lambda () (load-theme 'zenburn)))
;;(add-hook 'after-init-hook (lambda () (load-theme 'anti-zenburn)))
;;(add-hook 'after-init-hook (lambda () (load-theme 'hydandata-light)))
;;(add-hook 'after-init-hook (lambda () (load-theme 'heroku-theme)))
;;(add-hook 'after-init-hook (lambda () (load-theme 'lavender-theme)))
;;(add-hook 'after-init-hook (lambda () (load-theme 'solarized-theme)))
;;(add-hook 'after-init-hook (lambda () (load-theme 'sanityinc-solarized-dark)))
;;(add-hook 'after-init-hook (lambda () (load-theme 'base16-mexico-light)))
;; (add-hook 'after-init-hook (lambda () (load-theme 'monokai)))
;; (add-hook 'after-init-hook (lambda () (load-theme 'doom-opera)))
;; (add-hook 'after-init-hook (lambda () (load-theme 'poet)))
;; Custom themes:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Custom-set-faces][Custom-set-faces:1]]

;; Custom-set-faces:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Dired][Dired:1]]
(add-to-list 'load-path "~/.emacs.d/el-get/dired+")
 (require 'dired+)

(setq dired-dwim-target t)
;; Hide details by default
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
;; Not spawn endless amount of dired buffers
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(use-package all-the-icons-dired
  :after all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))
;; Dired:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Dired-ranger][Dired-ranger:1]]
;;  (use-package dired-ranger
;;    :ensure t
;;    :bind (:map dired-mode-map
;;		("W" . dired-ranger-copy)
;;		("X" . dired-ranger-move)
;;		("Y" . dired-ranger-paste)))
;; Dired-ranger:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Ranger][Ranger:1]]
;; (use-package ranger 
;;   :ensure t 
;;   :config 
;;     (ranger-override-dired-mode nil)
;;       (setq helm-descbinds-window-style 'same-window)
;;       (setq ranger-cleanup-eagerly t)
;;       (setq ranger-show-dotfiles t)
;;       (setq ranger-modify-header t)
;;       (setq ranger-header-func 'ranger-header-line)
;;       (setq ranger-parent-header-func 'ranger-parent-header-line)
;;       (setq ranger-preview-header-func 'ranger-preview-header-line)
;;       (setq ranger-hide-cursor nil)
;;       (setq ranger-footer-delay 0.2)
;;       (setq ranger-preview-delay 0.040)
;;       (setq ranger-parent-depth 2)
;;       (setq ranger-width-parents 0.12)
;;       (setq ranger-max-parent-width 0.12)
;;       (setq ranger-preview-file t)
;;       (setq ranger-show-literal t)
;;       (setq ranger-width-preview 0.55)
;;       (setq ranger-excluded-extensions '("mkv" "iso" "mp4"))
;;       (setq ranger-max-preview-size 10)
;;       (setq ranger-dont-show-binary t))
;; Ranger:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Default%20pdf-viwer][Default pdf-viwer:1]]

;; Default pdf-viwer:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Default%20web-browser][Default web-browser:1]]
(setq browse-url-browser-function 'browse-url-generic

 ;; browse-url-generic-program "chromium-browser")
 browse-url-generic-program "firefox")
;; Default web-browser:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Dpaste][Dpaste:1]]
;; (require 'dpaste nil)  ; Not needed if you use package.el
(global-set-key (kbd "C-c y") 'dpaste-region-or-buffer)
(setq dpaste-poster "")
;; or the preferred method of adding your `user-full-name variable
(setq user-full-name "")
;; Dpaste:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Diatheke][Diatheke:1]]
(require 'diatheke)

(setq diatheke-bible "KJVA -f plain")

;; (setq diatheke-bible "ESV -f plain -o s")

;; you can set the Bible inside the buffer with
;; (diatheke-set-bible) + C-x e

;; Keybindings already automatically loaded
;; C-c C-b: select a bible translation
;; C-c C-i: insert a passage
;; C-c C-p: search for a phrase
;; C-c C-m: search for multiple words
;; C-c C-r: search by regex
;; Diatheke:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Pcre2el%20-%20fix%20regex][Pcre2el - fix regex:1]]
;;   (use-package pcre2el
;;    :ensure t
;;    :config (pcre-mode))
;; Pcre2el - fix regex:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Wgrep%20for%20fuzy%20dired][Wgrep for fuzy dired:1]]
(use-package wgrep
 :ensure t)
(setq counsel-fzf-cmd "~/.fzf/bin/fzf -f %s")
;; Wgrep for fuzy dired:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Dtk%20-%20another%20better%20diatheke][Dtk - another better diatheke:1]]
;; (add-to-list 'load-path "~/.emacs.d/elpa/dtk")
;; (require 'dtk)

   (use-package dtk
     :bind (("C-c B" . dtk-bible))
     :custom
     (dtk-default-module "KJVA")
     (dtk-default-module-category "Biblical Texts")
     (dtk-word-wrap t)
     )
;; Dtk - another better diatheke:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Disable%20Emacs-splash-screen][Disable Emacs-splash-screen:1]]
;; Disable Emacs-splash-screen

 (setq inhibit-splash-screen t)
;; Disable Emacs-splash-screen:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*edit-server][edit-server:1]]
;; (require 'edit-server) 
      ;; (edit-server-start)

      ;; Chromium/Chrome integration to edit text areas

;; (use-package edit-server
;;   :if window-system
;;   :init
;;   (add-hook 'after-init-hook 'server-start t)
;;   (add-hook 'after-init-hook 'edit-server-start t))
;; 	 (when (and (daemonp) (locate-library "edit-server"))

     ;;    (require '
     ;;      edit-server)
     ;;    (edit-server-start))

     ;;    (add-hook 'edit-server-start-hook 'markdown-mode)

      ;; Integrate with Gmail

     ;;    (autoload 'edit-server-maybe-dehtmlize-buffer "edit-server-htmlize" "edit-server-htmlize" t)
     ;;    (autoload 'edit-server-maybe-htmlize-buffer   "edit-server-htmlize" "edit-server-htmlize" t)
     ;;    (add-hook 'edit-server-start-hook 'edit-server-maybe-dehtmlize-buffer)
     ;;    (add-hook 'edit-server-done-hook  'edit-server-maybe-htmlize-buffer)
;; edit-server:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Eldoc][Eldoc:1]]

;; Eldoc:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*elfeed][elfeed:1]]
;;shortcut functions

    (defun bjm/elfeed-show-all ()
      (interactive)
      (bookmark-maybe-load-default-file)
      (bookmark-jump "elfeed-all"))
    (defun bjm/elfeed-show-emacs ()
      (interactive)
      (bookmark-maybe-load-default-file)
      (bookmark-jump "elfeed-emacs"))
    (defun bjm/elfeed-show-daily ()
      (interactive)
      (bookmark-maybe-load-default-file)
      (bookmark-jump "elfeed-daily"))

;;functions to support syncing .elfeed between machines
;;makes sure elfeed reads index from disk before launching

(defun bjm/elfeed-load-db-and-open ()
  "Wrapper to load the elfeed db from disk before opening"
  (interactive)
  (elfeed-db-load)
  (elfeed)
  (elfeed-search-update--force))

;;write to disk when quiting

(defun bjm/elfeed-save-db-and-bury ()
  "Wrapper to save the elfeed db to disk before burying buffer"
  (interactive)
  (elfeed-db-save)
  (quit-window))

  (use-package elfeed
    :ensure t
    :bind (:map elfeed-search-mode-map
		("A" . bjm/elfeed-show-all)
		("E" . bjm/elfeed-show-emacs)
		("D" . bjm/elfeed-show-daily)
		("q" . bjm/elfeed-save-db-and-bury)))
;; elfeed:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*elfeed-goodies][elfeed-goodies:1]]
(use-package elfeed-goodies
  :ensure t
  :config
  (elfeed-goodies/setup))
;; elfeed-goodies:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*elfeed-org][elfeed-org:1]]
;; use an org file to organise feeds

(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/org~/elfeed.org")))
;; elfeed-org:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Emacs%20edit%20firefox-chromium%20plugin][Emacs edit firefox-chromium plugin:1]]

;; Emacs edit firefox-chromium plugin:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Emacspeak][Emacspeak:1]]
(when (featurep 'emacspeak)
  (require 'emacspeak-aumix)
  (setq emacspeak-auditory-icon-function 'emascpeak-play-auditory-icon)
  (setq emacspeak-aumix-multichannel-capable-p t)
  (emacspeak-toggle-auditory-icons 1))
;; Emacspeak:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Engine-mode%20for%20search%20the%20internet][Engine-mode for search the internet:1]]
(use-package engine-mode
  :config (engine-mode t))

  (defengine amazon
    "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s")

  (defengine duckduckgo
    "https://duckduckgo.com/?q=%s"
    :keybinding "d")

  (defengine github
    "https://github.com/search?ref=simplesearch&q=%s")

  (defengine google
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
    :keybinding "g")

  (defengine google-images
    "http://www.google.com/images?hl=en&source=hp&biw=1440&bih=795&gbv=2&aq=f&aqi=&aql=&oq=&q=%s")

  (defengine google-maps
    "http://maps.google.com/maps?q=%s"
    :docstring "Mappin' it up.")

  (defengine project-gutenberg
    "http://www.gutenberg.org/ebooks/search/?query=%s")

  (defengine rfcs
    "http://pretty-rfc.herokuapp.com/search?q=%s")

  (defengine stack-overflow
    "https://stackoverflow.com/search?q=%s")

  (defengine twitter
    "https://twitter.com/search?q=%s")

  (defengine wikipedia
    "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
    :keybinding "w"
    :docstring "Searchin' the wikis.")

  (defengine wiktionary
    "https://www.wikipedia.org/search-redirect.php?family=wiktionary&language=en&go=Go&search=%s")

  (defengine wolfram-alpha
    "http://www.wolframalpha.com/input/?i=%s")

  (defengine youtube
    "http://www.youtube.com/results?aq=f&oq=&search_query=%s")
;; Engine-mode for search the internet:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Ensime][Ensime:1]]
;;We have "sbt" and "scala" in /usr/bin so we add this path to the PATH environment

  (setq exec-path (append exec-path '("/usr/bin")))
  (setq exec-path (append exec-path '("/usr/bin")))
  (setenv "PATH" (shell-command-to-string "/bin/bash -c 'echo -n $PATH'"))

(use-package ensime
  :ensure t)

;;  (require 'ensime)
 (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;; Ensime:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Erc%20-%20irc%20client][Erc - irc client:1]]
(require 'erc)

(defun irc-maybe ()
     "Connect to IRC."
    (interactive)
    (when (y-or-n-p "IRC? ")
      (erc :server "irc.freenode.net" :port 6667
	   :nick "" :full-name "")
      (erc :server "irc.dalnet.net" :port 6667
	   :nick "" :full-name "")
      (erc :server "irc.oftc.net" :port 6667 :nick "")))
;; Erc - irc client:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Bitlbee][Bitlbee:1]]

;; Bitlbee:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Eshell][Eshell:1]]
;; run this script in terminal
    ;; alias | sed -E "s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;" >~/.emacs.d/eshell/alias 
    ;; or better yet,
    ;; (eshell/alias "$command" "$command_instructions $1") <-> run this in your eshell session
    ;; (eshell/alias "rm" "rm -iv $1")
    ;; then it will be saved in "~/.emacs.d/eshell/alias"

(use-package eshell 
  :ensure t
  :config )
;; Eshell:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Expand%20region][Expand region:1]]
;;  (require 'expand-region)
;;  (global-set-key (kbd "C-=") 'er/expand-region)
;; Expand region:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Figwheel-clojure][Figwheel-clojure:1]]

;; Figwheel-clojure:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Flycheck][Flycheck:1]]
(use-package flycheck
 :init
 (global-flycheck-mode t))
;; Flycheck:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Flyspell][Flyspell:1]]
(defun my-turn-spell-checking-on ()
  "Turn flyspell-mode on."
  (flyspell-mode 1))

(add-hook 'text-mode-hook 'my-turn-spell-checking-on)

 ;; enable flyspell in text mode (and derived modes)
 ;; (add-hook 'text-mode-hook 'flyspell-mode)
;; Flyspell:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Fountain-mode%20-%20Screenwriting%20-%20plays,%20films,%20sop-operas,%20etc][Fountain-mode - Screenwriting - plays, films, sop-operas, etc:1]]
;; (require 'fountain-mode)

(use-package fountain-mode
 :ensure t)
;; Fountain-mode - Screenwriting - plays, films, sop-operas, etc:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Gitlab][Gitlab:1]]
(use-package gitlab
 :ensure t)
   (setq gitlab-host "https://gitlab.com"
	 gitlab-token-id "")
;; Gitlab:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*GGtags][GGtags:1]]
;; (use-package ggtags
 
;;  :config 
;;   (add-hook 'c-mode-common-hook
;;          (lambda ()
;;            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
;;              (ggtags-mode 1)))))
;; GGtags:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Google-contacts][Google-contacts:1]]
;; (use-package plstore
;;     :defer t
;;     :config (setq plstore-cache-passphrase-for-symmetric-encryption t))

;; (require 'google-contacts)
;; (require 'google-contacts-gnus)
;; (require 'google-contacts-message)

;; shortcuts

;; n or p to go the next or previous record;
;; g to refresh the result, bypassing the cache;
;; m to send an e-mail to a contact;
;; s to make a new search;
;; q to quit.
;; Google-contacts:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Ob-translate][Ob-translate:1]]
;; https://github.com/alphapapa/ob-translate  
  ;; M-x package-install RET ob-translate
  ;; enclose your code between source and call

  ;; #+BEGIN_SRC translate :dest il,el,it,fr,ru,en (etc.)
  ;; or
  ;; #+BEGIN_SRC translate :src il (or 'auto' for auto detection)
  ;; $ContentsHere
  ;; #+END_SRC
  ;; Example: 
  ;; #+BEGIN_SRC translate :src en  :dest he,el,la
  ;;   light
  ;; #+END_SRC
  ;; then you can hit "C-c C-v e" to execute the code
  ;; org-babel-execute-src-block

      (use-package ob-translate
       :ensure t)
      (define-key org-mode-map (kbd "C-c C-v e") 'org-babel-execute-src-block)

;; https://orgmode.org/manual/Evaluating-code-blocks.html#DOCF142
;; I don't want to execute code blocks with C-c C-c
(setq org-babel-no-eval-on-ctrl-c-ctrl-c t)
;; Ob-translate:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Google-translate][Google-translate:1]]
(use-package google-translate
:ensure t
:config
  (bind-keys*
  ("C-c t" . google-translate-at-point)
  ("C-c T" . google-translate-at-point-reverse)))

(defun google-translate--get-b-d1 ()
      (list 432928 274893998))
;; Google-translate:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Grasp%20-%20org-capture][Grasp - org-capture:1]]

;; Grasp - org-capture:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Hippie-expand][Hippie-expand:1]]
(fset 'my-complete-file-name
   (make-hippie-expand-function '(try-complete-file-name-partially
					try-complete-file-name)))
   (global-set-key "\M-/" 'my-complete-file-name)
   (global-set-key "\M-\\" 'comint-dynamic-complete-filename)
;; Hippie-expand:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Helm-mu][Helm-mu:1]]
(use-package helm-mu
  :ensure t)

(define-key mu4e-main-mode-map "s" 'helm-mu)
(define-key mu4e-headers-mode-map "s" 'helm-mu)
(define-key mu4e-view-mode-map "s" 'helm-mu)
;; Helm-mu:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Icicles][Icicles:1]]
(require 'icicles)
(icy-mode 1) ;; turn on Icicle mode each time you start Emacs
;; Icicles:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Image-magick][Image-magick:1]]
(autoload 'eimp-mode "eimp" "Emacs Image Manipulation Package." t)
      (add-hook 'image-mode-hook 'eimp-mode)

(defun do-org-show-all-inline-images ()
  (interactive)
  (org-display-inline-images t t))
(global-set-key (kbd "C-c C-x C v")
		'do-org-show-all-inline-images)

  ;; apt install aview
  (defun asciiview (imagefile)
    ;; use asciiview (part of aatools) to render image file as text to buffer
    (interactive "fChoose image file: ")
    (save-excursion
      (with-current-buffer (pop-to-buffer (format "*asciiview %s*" imagefile))
	(insert
	 (car (last (butlast
		 (split-string
		  (shell-command-to-string
		   (format
		    "echo q | asciiview -driver stdout -kbddriver stdin %s 2>/dev/null"
		    (shell-quote-argument imagefile)))
		  "^L")))))
	(view-mode))))

   (autoload 'thumbs "thumbs" "Preview images in a directory." t)

   ;; then M-x thumbs
;; Image-magick:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Imaxima][Imaxima:1]]
(defvar imaxima-fnt-size "Large")
(defvar imaxima-use-maxima-mode-flag t)
;; Imaxima:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Indenting%20lisp%20code%20blocks][Indenting lisp code blocks:1]]
(setq org-src-tab-acts-natively t)

  (defun my/org-cleanup ()
  (interactive)
  (org-edit-special)
  (indent-buffer)
  (org-edit-src-exit))

  (defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))
;; Indenting lisp code blocks:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Input%20method%20portuguese-prefix][Input method portuguese-prefix:1]]

;; Input method portuguese-prefix:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Iso-accents][Iso-accents:1]]
;; (load-library "iso-acc")
;; Iso-accents:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Jabber-chat-with][Jabber-chat-with:1]]
;; (require 'jabber)

(use-package jabber 
 :ensure t)
;; Jabber-chat-with:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*JavaScript][JavaScript:1]]
;; js2-mode

;;     (use-package js2-mode
;;       :interpreter (("node" . js2-mode))
;;       :bind (:map js2-mode-map ("C-c C-p" . js2-print-json-path))
;;       :mode "\\.\\(js\\|json\\)$"
;;       :config
;;       (add-hook 'js-mode-hook 'js2-minor-mode)
;;       (setq js2-basic-offset 2
;;	     js2-highlight-level 3
;;	     js2-mode-show-parse-errors nil
;;	     js2-mode-show-strict-warnings nil))

  ;; js2-refactor

;;     (use-package js2-refactor
;;       :defer t
;;       :diminish js2-refactor-mode
;;       :commands js2-refactor-mode
;;       :init
;;       (add-hook 'js2-mode-hook #'js2-refactor-mode)
;;       :config
;;       (js2r-add-keybindings-with-prefix "C-c C-m"))

  ;; auto-complete and ac-js2

;;     (use-package auto-complete
;;       :diminish auto-complete-mode
;;       :config
;;       (use-package auto-complete-config)
;;       (ac-config-default)
;;       (add-to-list 'ac-modes 'html-mode)
;;       (setq ac-use-menu-map t)
;;       (ac-set-trigger-key "TAB")
;;       (ac-set-trigger-key "<tab>"))

;;     (use-package ac-js2
;;       :defer t

;;       :init
;;       (add-hook 'js2-mode-hook 'ac-js2-mode)
;;       (setq ac-js2-evaluate-calls t))

  ;; json-snatcher

;;     (use-package json-snatcher
;;       :after js2-mode
;;       :config
;;       (bind-key "C-c C-g" 'jsons-print-path js2-mode-map))

  ;; web-beautify

  ;; also do `npm install -g js-beautify' in your shell
 ;;    (use-package web-beautify
  ;;     :after js2-mode
   ;;    :config
    ;;   (bind-key "C-c C-b" 'web-beautify-js js2-mode-map))

  ;; tern (with auto-complete)
  ;; sudo npm install -g tern

;;     (use-package tern
;;       :defer t
;;       :diminish tern-mode
;;       :init
;;       (add-hook 'js2-mode-hook 'tern-mode))

  ;; auto-completion for Tern
;;     (use-package tern-auto-complete
;;       :after tern
;;       :config
;;       (tern-ac-setup))

  ;; skewer-mode

;;     (use-package skewer-mode
;;       :bind (("C-c K" . run-skewer))
;;       :diminish skewer-mode
;;       :init
;;       (add-hook 'js2-mode-hook 'skewer-mode)
;;       (add-hook 'css-mode-hook 'skewer-css-mode)
;;       (add-hook 'html-mode-hook 'skewer-html-mode))
;; JavaScript:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Key-chord][Key-chord:1]]
;; (require 'key-chord)
;; (key-chord-mode 1)

;; (key-chord-define evil-insert-state-map "ee" 'evil-normal-state)
;; Key-chord:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Languagetool][Languagetool:1]]
;; (setq langtool-java-bin "/usr/bin/java")

;;    (require 'langtool)

;;    (setq langtool-language-tool-jar "/opt/LanguageTool-4.4/languagetool-commandline.jar")
;;    (setq langtool-default-language "en-GB")

 ;; (setq langtool-language-tool-jar "/opt//LanguageTool-4.4/languagetool-server.jar")
 ;; (setq langtool-server-user-arguments '("-p" "8082"))

 ;; keybindings

;;    (global-set-key "\C-x4w" 'langtool-check)
;;    (global-set-key "\C-x4W" 'langtool-check-done)
;;    (global-set-key "\C-x4l" 'langtool-switch-default-language)
;;    (global-set-key "\C-x44" 'langtool-show-message-at-point)
;;    (global-set-key "\C-x4c" 'langtool-correct-buffer)
;; Languagetool:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Link-hint][Link-hint:1]]

;; Link-hint:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Linum-mode][Linum-mode:1]]
;; linum-mode

;; (require 'linum)

;; (setq linum-relative-current-symbol "")

;; (linum-relative-global-mode)
;; (eval-after-load "linum"
;;   '(set-face-attribute 'linum nil :height 100))

;; (autopair-global-mode)

;; (global-undo-tree-mode)

;; (global-set-key (kbd "C-x l") 'visual-line-mode)

;; (defun linum-update-window-scale-fix (win)
;;   "fix linum for scaled text"
;;   (set-window-margins win
;; 		      (ceiling (* (if (boundp 'text-scale-mode-step)
;; 				      (expt text-scale-mode-step
;; 					    text-scale-mode-amount) 1)
;; 				  (if (car (window-margins))
;; 				      (car (window-margins)) 1)
;; 				  ))))
;; (advice-add #'linum-update-window :after #'linum-update-window-scale-fix)
;; Linum-mode:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Lyrics][Lyrics:1]]
(use-package lyrics
 :ensure t)
;; Lyrics:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Lispy][Lispy:1]]
(use-package lispy
   :ensure t)

  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

  (defun conditionally-enable-lispy ()
    (when (eq this-command 'eval-expression)
      (lispy-mode 1)))
  (add-hook 'minibuffer-setup-hook 'conditionally-enable-lispy)
;; Lispy:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*lorem%20ipsum][lorem ipsum:1]]
(use-package lorem-ipsum
    :ensure t)

;;(lorem-ipsum-use-default-bindings)

;;  (add-hook 'sgml-mode-hook (lambda ()
;;			    (setq Lorem-ipsum-paragraph-separator "<br><br>\n"
;;				  Lorem-ipsum-sentence-separator "&nbsp class="comment">;&nbsp;"
;;				  Lorem-ipsum-list-beginning "<ul>\n"
;;				  Lorem-ipsum-list-bullet "<li>"
;;				  Lorem-ipsum-list-item-end "</li>\n"
;;				  Lorem-ipsum-list-end "</ul>\n")))
;; lorem ipsum:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Magit-setup][Magit-setup:1]]
(use-package magit 
 :ensure t
 :config
(global-set-key (kbd "C-c g") 'magit-status))
;; Magit-setup:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Mplayer-mode][Mplayer-mode:1]]
(add-to-list 'load-path "~/.emacs.d/elpa/mplayer-mode/")
(require 'mplayer-mode)
;; Mplayer-mode:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Maximise%20emacs%20on%20startup][Maximise emacs on startup:1]]
(custom-set-variables

 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (brin)))
 '(custom-safe-themes
   (quote
    ("986e7e8e428decd5df9e8548a3f3b42afc8176ce6171e69658ae083f3c06211c" "f869a5d068a371532c82027cdf1feefdc5768757c78c48a7e0177e90651503ad" "cbd8e65d2452dfaed789f79c92d230aa8bdf413601b261dbb1291fb88605110c" "fec45178b55ad0258c5f68f61c9c8fd1a47d73b08fb7a51c15558d42c376083d" "250268d5c0b4877cc2b7c439687f8145a2c85a48981f7070a72c7f47a2d2dc13" "5a39d2a29906ab273f7900a2ae843e9aa29ed5d205873e1199af4c9ec921aaab" "527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "df21cdadd3f0648e3106338649d9fea510121807c907e2fd15565dde6409d6e9" "50b64810ed1c36dfb72d74a61ae08e5869edc554102f20e078b21f84209c08d1" "4bf5c18667c48f2979ead0f0bdaaa12c2b52014a6abaa38558a207a65caeb8ad" "9c4acf7b5801f25501f0db26ac3eee3dc263ed51afd01f9dcfda706a15234733" "a62f0662e6aa7b05d0b4493a8e245ab31492765561b08192df61c9d1c7e1ddee" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "8543b328ed10bc7c16a8a35c523699befac0de00753824d7e90148bca583f986" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "ffe80c88e3129b2cddadaaf78263a7f896d833a77c96349052ad5b7753c0c5a5" "93268bf5365f22c685550a3cbb8c687a1211e827edc76ce7be3c4bd764054bad" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "100eeb65d336e3d8f419c0f09170f9fd30f688849c5e60a801a1e6addd8216cb" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "3f67aee8f8d8eedad7f547a346803be4cc47c420602e19d88bdcccc66dba033b" "d9850d120be9d94dd7ae69053630e89af8767c36b131a3aa7b06f14007a24656" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "85d609b07346d3220e7da1e0b87f66d11b2eeddad945cac775e80d2c1adb0066" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "ffac21ab88a0f4603969a24b96993bd73a13fe0989db7ed76d94c305891fad64" "fc7fd2530b82a722ceb5b211f9e732d15ad41d5306c011253a0ba43aaf93dccc" "ccde32eaf485eb7579412cd756d10b0f20f89bff07696972d7ee46cb2e10b89d" "3e34e9bf818cf6301fcabae2005bba8e61b1caba97d95509c8da78cff5f2ec8e" "1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "04790c9929eacf32d508b84d34e80ad2ee233f13f17767190531b8b350b9ef22" "45a8b89e995faa5c69aa79920acff5d7cb14978fbf140cdd53621b09d782edcf" "542e6fee85eea8e47243a5647358c344111aa9c04510394720a3108803c8ddd1" "316d29f8cd6ca980bf2e3f1c44d3a64c1a20ac5f825a167f76e5c619b4e92ff4" "6fc0ae7cc2abd82d8add1140874ccf8773feaaae73a704981d52fdf357341038" "b747fb36e99bc7f497248eafd6e32b45613ee086da74d1d92a8da59d37b9a829" "7e376fb329a0e46a04e8285b0e45199a083f98c69b0e1039ec1cb1d366e66e9c" "3a69621a68c2d3550a4c777ffc000e1ea66f5bc2f61112814c591e1bda3f5704" "72c7c8b431179cbcfcea4193234be6a0e6916d04c44405fc87905ae16bed422a" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "b9b1a8d2ec1d5c17700e1a09256f33c2520b26f49980ed9e217e444c381279a9" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "39fe48be738ea23b0295cdf17c99054bb439a7d830248d7e6493c2110bfed6f8" "7beac4a68f03662b083c9c2d4f1d7f8e4be2b3d4b0d904350a9edf3cf7ce3d7f" "77c65d672b375c1e07383a9a22c9f9fc1dec34c8774fe8e5b21e76dca06d3b09" "889a93331bc657c0f05a04b8665b78b3c94a12ca76771342cee27d6605abcd0e" "5b8eccff13d79fc9b26c544ee20e1b0c499587d6c4bfc38cabe34beaf2c2fc77" "c158c2a9f1c5fcf27598d313eec9f9dceadf131ccd10abc6448004b14984767c" "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f" "47ac4658d9e085ace37e7d967ea1c7d5f3dfeb2f720e5dec420034118ba84e17" "4f2ede02b3324c2f788f4e0bad77f7ebc1874eff7971d2a2c9b9724a50fb3f65" "c5a886cc9044d8e6690a60f33db45506221aa0777a82ad1f7fe11a96d203fa44" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default)))
 '(default-input-method nil)
 '(fci-rule-color "#49483E")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#336c6c" "#205070" "#0f2050" "#806080" "#401440" "#6c1f1c" "#6b400c" "#23733c")))
 '(org-export-backends
   (quote
    (ascii beamer html icalendar latex md odt org texinfo)))
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . "google-chrome --new-tab %s")
     ("\\.pdf\\'" . "evince %s"))))
 '(org-odt-preferred-output-format "docx")
 '(package-selected-packages
   (quote
    (aggressive-indent engine-mode diatheke org-mac-link w3m poetry fountain-mode gnugol keyword-search solarized-theme ## org-ref notmuch zenburn-theme white-sand-theme w3 transpose-frame togetherly theme-changer synosaurus synonyms switch-window suscolors-theme sunny-day-theme sublime-themes ssh speechd-el soft-stone-theme soft-morning-theme smex silkworm-theme shell-here seoul256-theme rudel punpun-theme projectile professional-theme powerline popup-switcher popup-kill-ring popup-imenu popup-edit-menu popup-complete pastelmac-theme paren-completer paredit pandoc ox-textile ox-reveal ox-pandoc organic-green-theme org-ac oneonone omnisharp occidental-theme nlinum multiple-cursors moz monokai-theme minimap markdown-mode linum-relative lavender-theme latex-unicode-math-mode key-chord idomenu icicles hydandata-light-theme heroku-theme helm-swoop green-phosphor-theme gnugo evil-org evil-leader ensime dracula-theme dictionary default-text-scale company-shell column-enforce-mode clojurescript-mode clojure-snippets clojure-quick-repls clojure-mode-extra-font-locking bash-completion base16-theme autopair aumix-mode anti-zenburn-theme alpha ace-jump-mode ac-math ac-js2 ac-html-csswatcher)))
 '(pdf-view-midnight-colors (quote ("#232333" . "#c7c7c7")))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
;; Maximise emacs on startup:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Message-mode][Message-mode:1]]
;; colorizing multiply-quoted lines

(add-hook 'message-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
               '(("^[ \t]*>[ \t]*>[ \t]*>.*$"
                  (0 'message-multiply-quoted-text-face))
                 ("^[ \t]*>[ \t]*>.*$"
                  (0 'message-double-quoted-text-face))))))

 ;; email address
(setq user-mail-address "vagnerrener@gmail.com"
        user-full-name "Vagner Rener")

 ;; add Cc and Bcc headers to the message buffer
  (setq message-default-mail-headers "Cc: \nBcc: \n")

 ;; postponed message is put in the following draft file
  (setq message-auto-save-directory "~/Mail/drafts")

 ;; send the current buffer to a email list address  

(defun message-send-current-buffer (addr)
  (interactive (list (ido-completing-read "To: " known-email-addresses)))
  (let ((orig-buffer (current-buffer)))
    (message-mail addr
                  (if (equal 'eww-mode major-mode)
                      eww-current-url
                    (buffer-name orig-buffer)))
    (message-goto-body)
    (insert (save-excursion (set-buffer orig-buffer)
                            (buffer-substring (point-min) (point-max))))
    (message-send-and-exit)))

 ;; attach the content of a folder to a message

(defun message-attach-all-files-from-folder(&optional disposition dir-to-attach)
     "create the mml code to attach all files found in a given directory"
     (interactive)
  
     (if (eq disposition nil)
         (setq disposition (completing-read "Enter default disposition to use: " '(("attachment" 1) ("inline" 2)) nil t)))
  
     (if (eq dir-to-attach nil)
         (setq dir-to-attach (read-directory-name "Select a folder to attach: ")))
  
     (if (not (string-match "/$" dir-to-attach))
         (setq dir-to-attach (concat dir-to-attach "/")))
  
     (dolist (file (directory-files dir-to-attach))
       (when (and (not (string= "." file)) (not (string= ".." file)))
         (let (full-file-path mime-type)
           (setq full-file-path (concat dir-to-attach file))
           (if (file-readable-p full-file-path)
               (if (file-directory-p full-file-path)
                   (message-attach-all-files-from-folder disposition full-file-path)
  
                 (setq mime-type (substring (shell-command-to-string (concat "file --mime-type --brief " (shell-quote-argument (expand-file-name full-file-path)))) 0 -1))
                 (insert-string (concat "<#part type=\"" mime-type "\" filename=\"" full-file-path "\" disposition=" disposition ">\n")))))))) 

 ;; shortcuts

 ;; C-x m	brings a message buffer
 ;; C-h m	browse the full list
 ;; C-c C-c	send the message and exit the message buffer
 ;; C-c C-a	add an attachment
 ;; C-c C-k	cancel the message
 ;; C-c C-d	postpone the message
 ;; C-c C-s	send the message but don't exit the message buffer
 ;; C-c C-b	go to the start of the message
 ;; C-c C-z	kill text from point until end of buffer
;; Message-mode:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Mingus][Mingus:1]]
(use-package mingus
 :ensure t)
;; Mingus:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Misc-1][Misc-1:1]]
;; Tmux interaction
(use-package emamux
  :ensure t
  :defer t)

;; Debian stuff
(use-package debian-el
  :ensure t
  :defer t)

;;  (setq frame-title-format "emacs")
;;  (set-default 'cursor-type 'hbar)
;;  (ido-mode)
;;  (column-number-mode)
;;  (show-paren-mode)
;;  (global-hl-line-mode)

;;;; Uncomment up or down, but not the two parts

(defun 1on1-set-cursor-type (cursor-type)
  "Set the cursor type of the selected frame to CURSOR-TYPE.
When called interactively, prompt for the type to use.
To get the frame's current cursor type, use `frame-parameters'."
  (interactive
   (list (intern (completing-read
		   "Cursor type: "
		   (mapcar 'list '("box" "hollow" "bar" "hbar" nil))))))
  (modify-frame-parameters (selected-frame) (list (cons 'cursor-type cursor-type))))
;; Misc-1:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Misc-2][Misc-2:1]]
(global-set-key (kbd "C-c .") 'org-time-stamp)

(global-set-key (kbd "M-/") 'undo-tree-visualize)

(global-set-key (kbd "C-M-z") 'switch-window)

(global-set-key (kbd "C->") 'ace-jump-mode)

(global-set-key (kbd "C-M-)") 'transparency-increase)
(global-set-key (kbd "C-M-(") 'transparency-decrease)

(global-set-key (kbd "C-M-}") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-{") 'mc/mark-previous-like-this)
;; Misc-2:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Misc-3][Misc-3:1]]
;; Brent.Longborough's .emacs

(scroll-bar-mode -1) ; Disable hide scroll-bar
(global-visual-line-mode 1); Proper line wrapping
(if (display-graphic-p) (global-hl-line-mode t))
;; (global-hl-line-mode 1); Highlight current row
(show-paren-mode 1); Matches parentheses and such in every mode
(set-fringe-mode '(0 . 0)); Disable fringe because I use visual-line-mode
(set-face-background hl-line-face "#f2f1f0"); Same color as greyness in gtk
(setq inhibit-splash-screen t); Disable splash screen
(setq visible-bell t); Flashes on error
(setq calendar-week-start-day 1); Calender should start on Monday
(add-to-list 'default-frame-alist '(height . 59)); Default frame height.
(mapc 'global-unset-key [[up] [down] [left] [right]])
;; Misc-3:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Multiple-cursors][Multiple-cursors:1]]
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; Multiple-cursors:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*mu4e][mu4e:1]]
;;	(eval-when-compile
;;	      (add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")
;;	  (require 'use-package))

;;	  (use-package mu4e)

	     (global-set-key (kbd "C-<f10>") 'mu4e)

	     ;; install evil-mu4e
;;	      (require 'evil-mu4e)

	     ;; default
	     ;; (setq mu4e-maildir "~/Mail")
	     ;; (setq mu4e-drafts-folder "/[Gmail].Drafts")
	     ;; (setq mu4e-sent-folder   "/[Gmail].Sent Mail")
	     ;; (setq mu4e-trash-folder  "/[Gmail].Trash")

	     ;; default
		(setq mu4e-maildir "~/gmail/")
		(setq mu4e-sent-folder "/Sent")
		;; (setq mu4e-drafts-folder "/Drafts")
		(setq mu4e-trash-folder   "/Junk")
		(setq mu4e-trash-folder  "/Queue")
		(setq mu4e-inbox-folder  "/Inbox")

	     ;; don't save message to Sent Messages, Gmail/IMAP takes care of this

		(setq mu4e-sent-messages-behavior 'delete)

	     ;; setup some handy shortcuts
	     ;; you can quickly switch to your Inbox -- press ``ji''
	     ;; then, when you want archive some messages, move them to
	     ;; the 'All Mail' folder by pressing ``ma''.

	     ;; (setq mu4e-maildir-shortcuts
	     ;;   '( ("/INBOX"               . ?i)
	    ;;       ("/[Gmail].Sent Mail"   . ?s)
	    ;;       ("/[Gmail].Trash"       . ?t)
	    ;;       ("/[Gmail].All Mail"    . ?a)))

	       (setq mu4e-maildir-shortcuts
		       '( ("/Inbox"               . ?i)
		       ;; ("/Drafts"              . ?d)
			  ("/Junk"                . ?j)
			  ("/Sent"                . ?s)
			  ("/Queue"               . ?q)))

	      ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
	      (setq mu4e-sent-messages-behavior 'delete)

	    ;; allow for updating mail using 'U' in the main view:
	    ;; (setq mu4e-get-mail-command "offlineimap")
	    ;; (setq mu4e-get-mail-command "mbsync ~/gmail")

	    (setq mu4e-get-mail-command "mbsync -aV ~/gmail")

		 ;; something about ourselves

		 (setq
		  user-mail-address "vagnerrener@gmail.com"
		  user-full-name  "Vagner Rener"
		  message-signature
		  (concat
		   ;;"任文山 (Ren Wenshan)\n"
		   ;;"Email: renws1990@gmail.com\n"
		   ;;"Blog: wenshanren.org\n"
		   ;;"Douban: www.douban.com/people/renws"
		   "\n"))

		 ;; sending mail -- replace USERNAME with your gmail username
		 ;; also, make sure the gnutls command line utils are installed
		 ;; package 'gnutls-bin' in Debian/Ubuntu

		 (require 'smtpmail)
		 ;; for sending a message, just hit "C-c C-s"

		 (setq message-send-mail-function 'smtpmail-send-it
		       starttls-use-gnutls t
		       smtpmail-stream-type 'starttls
		       smtpmail-starttls-credentials
		       '(("smtp.gmail.com" 587 nil nil))
		       smtpmail-auth-credentials
		       (expand-file-name "~/.authinfo.gpg")
		       smtpmail-default-smtp-server "smtp.gmail.com"
		       smtpmail-smtp-server "smtp.gmail.com"
		       smtpmail-smtp-service 587
		       smtpmail-debug-info t)

		 ;; alternatively, for emacs-24 you can use:
		 ;;(setq message-send-mail-function 'smtpmail-send-it
		     ;;smtpmail-stream-type 'starttls
		     ;;smtpmail-default-smtp-server "smtp.gmail.com"
		     ;;smtpmail-smtp-server "smtp.gmail.com"
		     ;;smtpmail-smtp-service 587)

		 ;; don't keep message buffers around
		 (setq message-kill-buffer-on-exit t)

		     ;; https://github.com/bandresen/mu4e-send-delay

	     (add-to-list 'load-path "~/.emacs.d/elpa/mu4e-send-delay")

;;	     (require 'mu4e-send-delay)

;;		 (mu4e-send-delay-setup)

	;;	 (add-hook 'mu4e-main-mode-hook 'mu4e-send-delay-initialize-send-queue-timer) 

		 ;;    (prefer-coding-system 'utf-8) ;; uncomment this if you notice your mails arriving garbled despite looking okay in the Drafts

		 ;;    (set-language-environment "UTF-8") ;; uncomment this if you notice your mails arriving garbled despite looking okay in the Drafts

		     ;; Recommended settings

		     ;; Assigning the scheduled enabled send to C-c C-c

	     (add-hook 'mu4e-main-mode-hook (lambda ()
	      (define-key mu4e-compose-mode-map
		(kbd "C-c C-c") 'mu4e-send-delay-send-and-exit)))

	  ;;Now you can C-c C-c every mail
	  ;;Defaults

	  ;; mu4e-send-delay-default-delay is set to “3m”
	  ;; mu4e-send-delay-timer is set to every 2 minutes
	  ;; mu4e-send-delay-include-header-in-draft is true
	  ;; mu4e-send-strip-header-before-send is true

      (setq mu4e-org-contacts-file  "~/org~/contacts.org") 
      (add-to-list 'mu4e-headers-actions
      '("org-contact-add" . mu4e-action-add-org-contact) t)
      (add-to-list 'mu4e-view-actions
      '("org-contact-add" . mu4e-action-add-org-contact) t)

	 (add-hook 'mu4e-compose-mode-hook (lambda () (use-hard-newlines -1)))

	  ;; I want my format=flowed thank you very much
    ;; mu4e sets up visual-line-mode and also fill (M-q) to do the right thing
    ;; each paragraph is a single long line; at sending, emacs will add the
    ;; special line continuation characters.
    (setq mu4e-compose-format-flowed t)

    ;; every new email composition gets its own frame! (window)
    (setq mu4e-compose-in-new-frame t)

    ;; give me ISO(ish) format date-time stamps in the header list
    (setq mu4e-headers-date-format "%d-%m-%Y %H:%M")

    ;; show full addresses in view message (instead of just names)
    ;; toggle per name with M-RET
    (setq mu4e-view-show-addresses 't)
;; mu4e:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*My-save-word][My-save-word:1]]
(global-set-key (kbd "<f5>") 'my-save-word)
     (defun my-save-word ()
    (interactive)
    (let ((current-location (point))
	   (word (flyspell-get-word)))
      (when (consp word)    
	(flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))
;; My-save-word:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Oauth2][Oauth2:1]]
;;    (use-package oauth2 
    
;;	   :config
;;	(eval-when-compile
;;	     (defvar oauth--token-data ())))
;; Oauth2:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org-agenda][Org-agenda:1]]
(require 'org)
      (setq org-directory "~/~org/")
      (define-key global-map "\C-cl" 'org-store-link)
      (define-key global-map "\C-ca" 'org-agenda)
      (setq org-log-done t)

(setq org-agenda-files (list "~/org~/appointments.org"
			     "~/org~/home.org"
			     "~/org~/studies.org"
			     "~/org~/work.org"))
;; Org-agenda:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org-brain][Org-brain:1]]
;;  (use-package org-brain  
;;    :init
;;    (setq org-brain-path "~/org~/brain")
;;    ;; For Evil users
;;    (with-eval-after-load 'evil
;;      (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
;;    :config
;;    (setq org-id-track-globally t)
;;    (setq org-brain-file-entries-use-title nil)
   ;; (setq org-id-locations-file "~/org~/brain/.org-id-locations")
   ;;  (push '("b" "Brain" plain (function org-brain-goto-end)
;;	     "* %i%?" :empty-lines 1)
;;	   org-capture-templates)
;;    (setq org-brain-visualize-default-choices 'all)
;;    (setq org-brain-title-max-length 12))
;; Org-brain:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org-capture%20with%20W3m/EWW][Org-capture with W3m/EWW:1]]
;; org-eww and org-w3m should be in your org distribution, but see
;; note below on patch level of org-eww.

(require 'org-eww)
(require 'org-w3m)
(defvar org-website-page-archive-file "~/org~/capture.org")
(defun org-website-clipper ()
  "When capturing a website page, go to the right place in capture file,
   but do sneaky things. Because it's a w3m or eww page, we go
   ahead and insert the fixed-up page content, as I don't see a
   good way to do that from an org-capture template alone. Requires
   Emacs 25 and the 2017-02-12 or later patched version of org-eww.el."
 (interactive)

  ;; Check for acceptable major mode (w3m or eww) and set up a couple of
  ;; browser specific values. Error if unknown mode.

  (cond
   ((eq major-mode 'w3m-mode)
     (org-w3m-copy-for-org-mode))
   ((eq major-mode 'eww-mode)
     (org-eww-copy-for-org-mode))
   (t
     (error "Not valid -- must be in w3m or eww mode")))

  ;; Check if we have a full path to the archive file. 
  ;; Create any missing directories.

  (unless (file-exists-p org-website-page-archive-file)
    (let ((dir (file-name-directory org-website-page-archive-file)))
      (unless (file-exists-p dir)
	(make-directory dir))))

  ;; Open the archive file and yank in the content.
  ;; Headers are fixed up later by org-capture.

  (find-file org-website-page-archive-file)
  (goto-char (point-max))
  ;; Leave a blank line for org-capture to fill in
  ;; with a timestamp, URL, etc.
  (insert "\n\n")
  ;; Insert the web content but keep our place.
  (save-excursion (yank))
  ;; Don't keep the page info on the kill ring.
  ;; Also fix the yank pointer.
  (setq kill-ring (cdr kill-ring))
  (setq kill-ring-yank-pointer kill-ring)
  ;; Final repositioning.
  (forward-line -1))
;; Org-capture with W3m/EWW:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org-cliplink][Org-cliplink:1]]
(use-package org-cliplink
 :ensure t)

(defun org-brain-cliplink-resource ()
  "Add a URL from the clipboard as an org-brain resource.
Suggest the URL title as a description for resource."
  (interactive)
  (let ((url (org-cliplink-clipboard-content)))
    (org-brain-add-resource
     url
     (org-cliplink-retrieve-title-synchronously url)
     t)))

;; (define-key org-brain-visualize-mode-map (kbd "L") #'org-brain-cliplink-resource)
;; Org-cliplink:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Origami%20folding][Origami folding:1]]
;; (use-package origami
;; :ensure t)
;; Origami folding:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Ascii-art-to-unicode][Ascii-art-to-unicode:1]]
(defface aa2u-face '((t . nil))
  "Face for aa2u box drawing characters")
(advice-add #'aa2u-1c :filter-return
            (lambda (str) (propertize str 'face 'aa2u-face)))
(defun aa2u-org-brain-buffer ()
  (let ((inhibit-read-only t))
    (make-local-variable 'face-remapping-alist)
    (add-to-list 'face-remapping-alist
                 '(aa2u-face . org-brain-wires))
    (ignore-errors (aa2u (point-min) (point-max)))))
(with-eval-after-load 'org-brain
  (add-hook 'org-brain-after-visualize-hook #'aa2u-org-brain-buffer))
;; Ascii-art-to-unicode:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org-journal][Org-journal:1]]
;; https://github.com/bastibe/org-journal

    (customize-set-variable 'org-journal-dir "~/org~/journal/")
    (customize-set-variable 'org-journal-date-format "%A, %d %B %Y")

    ;; (require 'org-journal)

    (customize-set-variable  'org-journal-enable-agenda-integration t)
    (customize-set-variable 'org-journal-carryover-items nil)
    (customize-set-variable 'org-journal-enable-agenda-integration t)

(setq org-journal-enable-agenda-integration t
      org-icalendar-store-UID t
      org-icalendar-include-todo "all"
      org-icalendar-combined-agenda-file "~/org~/org-journal.ics")

(global-set-key (kbd "C-c C-v") 'org-journal-search)
(global-set-key (kbd "C-c C-g") 'org-journal-open-next-entry)
(global-set-key (kbd "C-c C-h") 'org-journal-open-previous-entry)
(global-set-key (kbd "C-c j") 'org-journal-new-entry)
;; Org-journal:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org-mac-link][Org-mac-link:1]]
(add-hook 'org-mode-hook (lambda () 
  (define-key org-mode-map (kbd "C-c g") 'omlg-grab-link)))
;; Org-mac-link:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org-protocol][Org-protocol:1]]
(require 'org-protocol)
;; Org-protocol:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Orca][Orca:1]]
;;    (require 'orca)

    (setq orca-handler-list
      '((orca-handler-match-url
	 "https://www.reddit.com/emacs/"
	 "~/Dropbox/org/wiki/emacs.org"
	 "Reddit")
	(orca-handler-match-url
	 "https://emacs.stackexchange.com/"
	 "~/Dropbox/org/wiki/emacs.org"
	 "\\* Questions")
	(orca-handler-current-buffer
	 "\\* Tasks")
	(orca-handler-file
	 "~/Dropbox/org/ent.org"
	 "\\* Articles")))

    (defcustom orca-handler-list
  ;; ...
  :type '(repeat
          (choice
           (list
            :tag "Current buffer"
            (const orca-handler-current-buffer)
            (string :tag "Heading"))
           (list
            :tag "URL matching regex"
            (const orca-handler-match-url)
            (string :tag "URL")
            (string :tag "File")
            (string :tag "Heading"))
           (list
            :tag "Default"
            (const orca-handler-file)
            (string :tag "File")
            (string :tag "Heading")))))
;; Orca:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org-present][Org-present:1]]
(use-package org-present
 :ensure t
 :config
  (setq org-present-text-scale 15)
  (add-hook 'org-present-mode-hook
  (defun org-present/start ()
  (org-present-big)
  (org-present-read-only)))
  (add-hook 'org-present-mode-quit-hook
  (defun org-present/start ()
  (org-present-small)
  (org-present-read-write))))
;; Org-present:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org-present-remote][Org-present-remote:1]]
(use-package org-present-remote
 :ensure t)
;; Org-present-remote:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org%20reveal][Org reveal:1]]
(require 'org)
;; (require 'ox-reveal)

;; (use-package ox-reveal
;; :ensure ox-reveal)

;; (use-package htmlize
 ;; )

;; if it does not load, do:
;; Alt-x load-library RET ox-reveal

  (setq org-reveal-root "file:~/reveal-slides/reveal.js")

 ;; (setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")

 (setq org-reveal-mathjax t)

    ;; To load Org-reveal, type “Alt-x load-library”, then type “ox-reveal”.

    ;; ~/reveal-slides/reveal.js$ npm start - you have to start the server

    ;; for viewing your slides and using the remote control

    ;; Now you can export this manual into Reveal.js presentation by typing “C-c C-e R R”.

    ;; Open the generated “Readme.html” in your browser and enjoy the cool slides.
;; Org reveal:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org-tree-slide][Org-tree-slide:1]]
(use-package org-tree-slide
     :ensure t
     :config
     (add-hook 'org-tree-slide-mode-hook
	       (lambda ()
		 (if org-tree-slide-mode
		     ;; When mode is enabled
		     (progn (setq wolfe--enable-transient-map t)
			    (wolfe/org-tree-set-transient-map))
		   ;; When mode is disabled
		   (setq wolfe--enable-transient-map nil)))))

(defun wolfe/org-tree-set-transient-map ()
     (interactive)
     (if wolfe--enable-transient-map
	 (let ((map (make-sparse-keymap)))
	   (define-key map (kbd "<right>") 'org-tree-slide-move-next-tree)
	   (define-key map (kbd "<left>")  'org-tree-slide-move-previous-tree)
	   (define-key map (kbd "<up>")    'org-tree-slide-content)
	   (define-key map (kbd "<down>")  'org-tree-slide-display-header-toggle)
	   (set-transient-map map nil 'wolfe/org-tree-set-transient-map))
       (makeunbound wolfe--enable-transient-map)))
;; Org-tree-slide:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Persistent-soft][Persistent-soft:1]]
(require 'persistent-soft)
(persistent-soft-store 'hundred 100 "mydatastore")
(persistent-soft-fetch 'hundred "mydatastore")    ; 100
(persistent-soft-fetch 'thousand "mydatastore")   ; nil

;; quit and restart Emacs

(persistent-soft-fetch 'hundred "mydatastore")    ; 100
;; Persistent-soft:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Polymode][Polymode:1]]
(require 'poly-markdown)
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
;; Polymode:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Poetry-mode][Poetry-mode:1]]
;; (require 'poetry)

  (load-library "~/.emacs.d/elpa/poetry/poetry.el")
;; Poetry-mode:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*People%20with%20nice%20emacs%20config%20files][People with nice emacs config files:1]]

;; People with nice emacs config files:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Perspective][Perspective:1]]
;; (use-package perspective
;;   :ensure t)
;; Perspective:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Powerline][Powerline:1]]
(use-package powerline 
 :ensure t
 :config
 (powerline-center-theme)
 (setq powerline-center-default-separator 'wave))
;; Powerline:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Prolog][Prolog:1]]
(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
(setq prolog-system 'swi)
(setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
				("\\.m$" . mercury-mode))
			       auto-mode-alist))
;; Prolog:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Quelpa][Quelpa:1]]
(use-package quelpa-use-package
    :ensure t
    :init
    (setq quelpa-update-melpa-p nil))
;; Quelpa:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Re-builder%20for%20Regexp][Re-builder for Regexp:1]]
(use-package re-builder
 :ensure t
 :config
 (setq reb-re-syntax 'string))
;; Re-builder for Regexp:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Slime][Slime:1]]
;; Set your lisp system and, optionally, some contribs

  (slime-setup '(slime-repl))
;; (setq inferior-lisp-program "/usr/bin/sbcl")
;; Install sbcl from github sources and NOT with apt
    (setq inferior-lisp-program "/usr/local/bin/sbcl")

  ;; update this path to the correct location.

  ;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/elpa-src/slime-2.23/")

  (add-to-list 'load-path "~/.emacs.d/elpa/slime-20190319.930")
  (require 'slime-autoloads)

  (defun cliki:start-slime ()
	(unless (slime-connected-p)
	  (save-excursion (slime))))
  (add-hook 'slime-mode-hook 'cliki:start-slime)

  (eval-after-load "slime"
    '(progn
      ;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/elpa-src/slime-2.23/contrib/")
      (add-to-list 'load-path "~/.emacs.d/elpa/slime-20190319.930/contrib")
       (slime-setup '(slime-fancy slime-banner))
      (setq slime-complete-symbol*-fancy t)
      (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)))
;; Slime:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Smex][Smex:1]]
;;    (global-set-key (kbd "M-x") 'smex)
;;    (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; Smex:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Speed%20directories%20and%20files][Speed directories and files:1]]
(defvar cyber-filelist nil "alist for files i need to open frequently. Key is a short abbrev string, Value is file path string.")

(setq cyber-filelist
      '(
	("emacs.org" . "~/.emacs.d/emacs.org" )
	("Documents" . "~/Documents/" )
	("org~" . "~/org~/" )
	("Download" . "~/Downloads/" )
	("Music" . "~/Music/")
	("Pictures" . "~/Pictures/" )
	;; more here
	) )

(defun cyber-open-file-fast ()
  "Prompt to open a file from `cyber-filelist'.
URL 'http://ergoemacs.org/emacs/emacs_hotkey_open_file_fast.html'
Version 2015-04-23"
  (interactive)
  (let ((ξabbrevCode
	 (ido-completing-read "Open:" (mapcar (lambda (ξx) (car ξx)) cyber-filelist))))
    (find-file (cdr (assoc ξabbrevCode cyber-filelist)))))
;; Speed directories and files:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Splash-screen][Splash-screen:1]]
;;(display-splash-screen)

     (use-package dashboard
      :ensure t
      :config
     (dashboard-setup-startup-hook))

     ;; Set the title

     ;;(setq dashboard-banner-logo-title "*Welcome to vagner@lea-pet.local Emacs Dashboard*")
     ;;(setq dashboard-banner-logo-title "*Welcome to lea@lea-pet.local Emacs Dashboard*")
     (setq dashboard-banner-logo-title "*Welcome to vagner@Cyberwarrior.local Emacs Dashboard*")
     ;;(setq dashboard-banner-logo-title "*Welcome to lea@Cyberwarrior.local Emacs Dashboard*")

     ;; Set the banner
     ;; (setq dashboard-startup-banner [VALUE])
     (setq dashboard-startup-banner 'official)
     ;; Value can be
     ;; 'official which displays the official emacs logo
     ;; 'logo which displays an alternative emacs logo
     ;; 1, 2 or 3 which displays one of the text banners
     ;; "path/to/your/image.png which displays whatever image you would prefer
     (setq dashboard-items '((recents  . 10)
			   (bookmarks . 5)
			   (projects . 5)
			   (agenda . 5)))

 ;;  You can use any of the following shortcuts inside Dashboard

 ;;  Shortcut	Function
 ;;  Tab Or C-i	Next Item
 ;;  Shift-Tab	Previous Item
 ;;  Return / Mouse Click / C-m	Open
 ;;  r	Recent files
 ;;  m	Bookmarks
 ;;  p	Projects
 ;;  a	Org-Mode Agenda
 ;;  g	Refresh contents
 ;;  {	Previous section
 ;;  }	Next section
;; Splash-screen:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Scheme][Scheme:1]]

;; Scheme:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Shackle][Shackle:1]]
(setq shackle-rules
     '(((svg-2048-mode circe-query-mode) :same t)
       ("*Help*" :align t :select t)
       ("\\`\\*helm.*?\\*\\'" :regexp t :align t)
       ((compilation-mode "\\`\\*firestarter\\*\\'"
	 "\\`\\*magit-diff: .*?\\'") :regexp t :noselect t)
       ("\\`\\*cider-repl .*" :regexp t :align t :size 0.2)
       ((inferior-scheme-mode "*shell*" "*eshell*") :popup t))
      shackle-default-rule '(:select t)
      shackle-default-size 0.4
      shackle-inhibit-window-quit-on-same-windows t)
;; Shackle:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Synonyms%20and%20Thesaurus][Synonyms and Thesaurus:1]]
(use-package synonyms
  :disabled
  :ensure t
  :init
  :config
  (setq synonyms-file "~/thesaurus/mthesaur.txt")
  (setq synonyms-file "~/thesaurus/brazilian-synonyms.txt")
  (setq synonyms-cache-file "~/thesaurus/thes.cache")

  (evil-leader/set-key "sy" 'synonyms))

(use-package powerthesaurus
  :ensure t
  :config
  (defun powerthesaurus-lookup-word-at-point ()
    "Find the word at point synonyms at powerthesaurus.org."
    (interactive)
    (if (region-active-p)
	(powerthesaurus-lookup-word (region-beginning) (region-end))
      (save-mark-and-excursion
	(when (not (looking-at "\\<"))
	  (backward-word))
	(set-mark (point))
	(forward-word)
	(activate-mark)
	(powerthesaurus-lookup-word (region-beginning) (region-end)))))

  (evil-leader/set-key "s" 'powerthesaurus-lookup-word-at-point)
  (evil-leader/set-key "S" 'powerthesaurus-lookup-word))
;; Synonyms and Thesaurus:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Sword-to-org][Sword-to-org:1]]
(add-to-list 'load-path "~/.emacs.d/elpa/sword-to-org/")
(require 'sword-to-org)
;; Sword-to-org:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Telega][Telega:1]]
;; (add-to-list 'load-path "~/.emacs.d/elpa/telega.el")
;; (require 'telega)

;; This is the receipt to install telega
;; After installation, comment it

 (use-package telega
      :quelpa (telega
      :fetcher github
      :repo "zevlg/telega.el"
      :branch "telega-with-inserters"))

;; (add-to-list 'load-path "~/.emacs.d/quelpa/build/telega")

(use-package telega
  :quelpa (telega
	   :fetcher github
	   :repo "zevlg/telega.el"
	   :branch "master"
	   :files (:defaults "README.md" "etc" "server" "Makefile"
			     "test.el"))
  :load-path "~/.emacs.d/quelpa/build/telega"
  :bind 
  (:map telega-msg-button-map
	("j" . nil)
	("k" . nil)
	("h" . nil)
	("l" . nil))
  :custom (telega-use-notifications t))  

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     :custom								    ;;
;; (telega-use-notifications t)						    ;;
;; (telega-completing-read-function #'ivy-completing-read)			    ;;
;; (telega-symbol-msg-succeeded "○")						    ;;
;; (telega-symbol-msg-viewed "●")						    ;;
;; :custom-face								    ;;
;; (telega-chat-inline-reply ((t (:inherit 'font-lock-comment-face))))	    ;;
;; (telega-chat-user-title ((t (:inherit 'font-lock-function-name-face))))	    ;;
;; (telega-chat-timestamp ((t (:inherit 'org-agenda-date))))			    ;;
;; (telega-msg-status ((t (:inherit 'font-lock-constant-face))))		    ;;
;; :hook									    ;;
;; (telega-root-mode . telega-notifications-mode)				    ;;
;; :config									    ;;
;; (setenv "LD_LIBRARY_PATH"							    ;;
;; 	  (concat								    ;;
;; 	   (expand-file-name "~/.telega/:")					    ;;
;; 	   (getenv "LD_LIBRARY_PATH")))						    ;;
;; (require 'telega-notifications)						    ;;
;; :commands (telega)								    ;;
;; :defer t)									    ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Telega:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Text-translation][Text-translation:1]]
(add-to-list 'load-path "~/.emacs.d/elpa/text-translator/")
(require 'text-translator)
(require 'text-translator-load)
(require 'text-translator-vars)

(global-set-key "\C-x\M-t" 'text-translator)
;; Text-translation:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Text-scale][Text-scale:1]]
;; Text-scale

(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)
;; Text-scale:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Tramp][Tramp:1]]
(custom-set-variables
 '(tramp-default-method "ssh")
 '(tramp-default-user "")
 '(tramp-default-host ""))
;; Tramp:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Treemacs][Treemacs:1]]
(use-package treemacs
  :ensure t
  :defer t
  :config
  (progn

    (setq treemacs-follow-after-init          t
	  treemacs-width                      25
	  treemacs-indentation                2
	  treemacs-git-integration            t
	  treemacs-collapse-dirs              3
	  treemacs-silent-refresh             nil
	  treemacs-change-root-without-asking nil
	  treemacs-sorting                    'alphabetic-desc
	  treemacs-show-hidden-files          t
	  treemacs-never-persist              nil
	  treemacs-is-never-other-window      nil
	  treemacs-goto-tag-strategy          'refetch-index)))
;; Treemacs:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Trident%20convert%20lisp%202%20javascript][Trident convert lisp 2 javascript:1]]
(add-to-list 'auto-mode-alist (cons "\\.paren\\'" 'lisp-mode))
(add-hook 'lisp-mode-hook
	  #'(lambda ()
	      (when (and buffer-file-name
			 (string-match-p "\\.paren\\>" buffer-file-name))
		(unless (slime-connected-p)
		  (save-excursion (slime)))
		(trident-mode +1))))

    ;; (use-package :parenscript)

    ;; issue this command in the REPl:
    ;; (ql:quickload :parenscript)
    ;; Then you can use "trident-expand-buffer" 
    ;; etc...
;; Trident convert lisp 2 javascript:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Unicode-fonts][Unicode-fonts:1]]
(use-package unicode-fonts
 :ensure t
 :config
 (unicode-fonts-setup))
;; Unicode-fonts:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Visual-regexp-steroids][Visual-regexp-steroids:1]]
;; you have to issue: Ctrl-x m RET vr/  to see the command
;; if the files are not already in the load path

(add-to-list 'load-path "~/.emacs.d/elpa/visual-regexp-20170301.116/")
(add-to-list 'load-path "~/.emacs.d/elpa/visual-regexp-steroids-20170222.253")
(require 'visual-regexp)
(require 'visual-regexp-steroids)
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
;; if you use multiple-cursors, this is for you:
(define-key global-map (kbd "C-c m") 'vr/mc-mark)
;; to use visual-regexp-steroids's isearch instead of the built-in regexp isearch, also include the following lines:
(define-key esc-map (kbd "C-r") 'vr/isearch-backward) ;; C-M-r
(define-key esc-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s
;; Visual-regexp-steroids:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Emacs-w3m][Emacs-w3m:1]]
(add-to-list 'load-path "~/.emacs.d/elpa/emacs-w3m/")

  (require 'w3m-load)
  (require 'mime-w3m)

  ;; (setq w3m-display-inline-images t) 
     (setq w3m-default-display-inline-images t) 
     (setq w3m-default-save-directory "~/Downloads")
;; Emacs-w3m:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Wanderlust%20email-client][Wanderlust email-client:1]]
(autoload 'wl "wl" "Wanderlust" t)

;; apt install bbdb 

(require 'bbdb) 

;; wanderlust email-client

;; (autoload 'wl "wl" "Wanderlust" t)

;;; bbbd for managing address book on wanderlust
;;; https://emacs-fu.blogspot.com.br/2009/08/managing-e-mail-addresses-with-bbdb.html

(setq bbdb-file "~/.emacs.d/bbdb")           ;; keep ~/ clean; set before loading
(require 'bbdb) 
(bbdb-initialize)
(setq 
    bbdb-offer-save 1                        ;; 1 means save-without-asking

bbdb-use-pop-up t                        ;; allow popups for addresses
;; bbdb-electric-p t                        ;; be disposable with SPC
bbdb-popup-target-lines  1               ;; very small

bbdb-dwim-net-address-allow-redundancy t ;; always use full name
bbdb-quiet-about-name-mismatches 2       ;; show name-mismatches 2 secs

bbdb-always-add-address t                ;; add new addresses to existing...
					 ;; ...contacts automatically
bbdb-canonicalize-redundant-nets-p t     ;; x@foo.bar.cx => x@bar.cx

bbdb-completion-type nil                 ;; complete on anything

bbdb-complete-name-allow-cycling t       ;; cycle through matches
					 ;; this only works partially

bbbd-message-caching-enabled t           ;; be fast
bbdb-use-alternate-names t               ;; use AKA

bbdb-elided-display t                    ;; single-line addresses

;; auto-create addresses from mail
bbdb/mail-auto-create-p 'bbdb-ignore-some-messages-hook   
bbdb-ignore-some-messages-alist ;; don't ask about fake addresses
;; NOTE: there can be only one entry per header (such as To, From)
;; http://flex.ee.uec.ac.jp/texi/bbdb/bbdb_11.html

'(( "From" . "no.?reply\\|DAEMON\\|daemon\\|facebookmail\\|twitter"))
)

 (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
;; Wanderlust email-client:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Winner-mode][Winner-mode:1]]
(when (fboundp 'winner-mode)
     (winner-mode 1))
;; Winner-mode:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Wrap%20lines][Wrap lines:1]]
;; Wrap lines without breaking the last word
(add-hook 'org-mode-hook #'toggle-word-wrap)
;; Wrap lines:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Youtube-dl][Youtube-dl:1]]
(add-to-list 'load-path "~/.emacs.d/elpa/youtube-dl-emacs")
(require 'youtube-dl)
;; Youtube-dl:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Elisp][Elisp:1]]
;;    (use-package elisp
;;      :hook
;;      (after-save . check-parens)
;;      )

    (use-package highlight-defined
      :ensure t
      :custom
      (highlight-defined-face-use-itself t)
      :hook
      (emacs-lisp-mode . highlight-defined-mode))

    (use-package highlight-quoted
      :ensure t
      :hook
      (emacs-lisp-mode . highlight-quoted-mode))

    (use-package eros
      :ensure t
      :hook
      (emacs-lisp-mode . eros-mode))

    (use-package suggest
      :ensure t
      :defer t)

    (use-package ipretty
      :ensure t
      :config
      (ipretty-mode 1))

    (use-package nameless
      :ensure t
      :hook
      (emacs-lisp-mode .  nameless-mode)
      :custom
      (nameless-global-aliases '())
      (nameless-private-prefix t))

    ;; bind-key can't bind to keymaps
    (use-package erefactor
      :ensure t
      :defer t)

    (use-package flycheck-package
      :ensure t
      :defer t
      :after flycheck
      (flycheck-package-setup))


  ;; If emacs does not work because of 
  ;; Dash package complaint, install it with
  ;; apt install dash-el - then install it with
  ;; Alt-x package-reinstall RET dash RET and remove 
  ;; it again with "apt purge dash" 

     (use-package dash
     :ensure t
       :custom
       (dash-enable-fontlock t))
;; Elisp:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Network][Network:1]]
(use-package net-utils
  :ensure-system-package traceroute
  :bind
  (:map mode-specific-map
	:prefix-map net-utils-prefix-map
	:prefix "n"
	("p" . ping)
	("i" . ifconfig)
	("w" . iwconfig)
	("n" . netstat)
	("p" . ping)
	("a" . arp)
	("r" . route)
	("h" . nslookup-host)
	("d" . dig)
	("s" . smbclient)
	("t" . traceroute)))
;; Network:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Save-place][Save-place:1]]
;; Keep point position between re-opening files with recentf/ido  

   (require 'saveplace)
   (save-place-mode 1)
;; Save-place:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*shell-pop][shell-pop:1]]
(use-package shell-pop
:ensure t
  :bind (("C-t" . shell-pop))
  :config
  (setq shell-pop-shell-type (quote ("ehell" "eshell" (lambda nil (eshell)))))
  (setq shell-pop-term-shell "eshell")
  ;; need to do this manually or not picked up by `shell-pop'
  (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type))
;; shell-pop:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Simple-mpc][Simple-mpc:1]]
(use-package simple-mpc
 :ensure t)
;; Simple-mpc:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Command-log-mode][Command-log-mode:1]]
(use-package command-log-mode
   :commands (command-log-mode global-command-log-mode)
   :bind ("C-c o" . clm/toggle-command-log-buffer))
;; Command-log-mode:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Circe][Circe:1]]
(use-package circe
    :ensure t
    :bind ("<S-f2>" . circe-init))

      (use-package sauron-circe
    :ensure quelpa
    :quelpa (sauron-circe :repo "seblemaguer/sauron-circe" :fetcher github)
    :after sauron
    :config
    (sauron-circe-start))

(setq auth-sources '("~/.authinfo.gpg"))

(defun my-fetch-password (&rest params)
  (require 'auth-source)
  (let ((match (car (apply 'auth-source-search params))))
    (if match
	(let ((secret (plist-get match :secret)))
	  (if (functionp secret)
	      (funcall secret)
	    secret))
      (error "Password not found for %S" params))))

(defun my-nickserv-password (server)
  (my-fetch-password :login "" :machine "irc.freenode.net"))

(setq circe-network-options
    '(("Freenode"
       :nick ""

     ;;  :channels ("#alsa" "#bash" "#badrock" "#c" "#clnoobs" "#clojure" "#clojure-beginners" "#clschool" "#coreboot" "#debian" "#debian-offtopic" "#devuan" "#emacs" "#emacs-es" "#erc" "#evil-mode" "#filmsbykris" "#freebsd" "#freedos" "#git" "#gitlab" "#guix" "#hardware" "#haskell" "#i3" "#javascript" "#julia" "#latex" "#libreoffice" "#lisp" "#lisp-es" "#lispcafe" "#lispweb" "#maria" "#math" "#matrix"  "#maxima" "#mpd" "#mysql" "#neomutt" "#oauth" "#org-mode" "#pcbsd" "#physics" "#plasma" "#prolog" "#python" "#qtox" "#ranger" "#regex" "#ring" "#sbcl" "#scala" "#slime" "#startups" "#sword" "#tmux" "#trueos" "#vim" "#vimus" "#wanderlust" "#weechat" "#xfce" "#xiphos")

       :nickserv-password my-nickserv-password)))
;; Circe:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Emms-get-lyrics][Emms-get-lyrics:1]]
(use-package emms
 :ensure t)

(add-to-list 'load-path "~/.emacs.d/elpa/emms-get-lyrics/")
(require 'emms-get-lyrics)
;; Emms-get-lyrics:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*MPV%20as%20a%20player][MPV as a player:1]]
(use-package emms-player-simple-mpv
   :ensure t
   :after emms
   :config

  ;; Subpackages
;;  (use-package emms-player-simple-mpv-e.g.time-display)
;;  (use-package emms-player-simple-mpv-e.g.playlist-fname)
;;  (use-package emms-player-simple-mpv-e.g.hydra)
;;  (use-package emms-player-simple-mpv)
;;  (use-package emms-player-simple-mpv-control-functions)

  (define-emms-simple-player-mpv my-mpv '(file url streamlist playlist)
    (concat "\\`\\(http[s]?\\|mms\\)://\\|"
	     (apply #'emms-player-simple-regexp
		    "aac" "pls" "m3u"
		    emms-player-base-format-list))
    "mpv" "--no-terminal" "--force-window=no" "--audio-display=no")

  (emms-player-simple-mpv-add-to-converters
   'emms-player-my-mpv "." '(playlist)
   (lambda (track-name) (format "--playlist=%s" track-name)))

  (add-to-list 'emms-player-list 'emms-player-my-mpv))

  (use-package emms-mark-ext :ensure t)
;; MPV as a player:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*memacs][memacs:1]]

;; memacs:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Genealogy][Genealogy:1]]
(add-to-list 'load-path "~/.emacs.d/elpa/gedcom")

(autoload 'gedcom-mode "gedcom")
(setq auto-mode-alist (cons '("\\.ged$" . gedcom-mode) auto-mode-alist))
;; Genealogy:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Defaults%20apps][Defaults apps:1]]
(setcdr (assq 'system org-file-apps-defaults-gnu ) "xdg-open %s")
;; Defaults apps:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*org-chef][org-chef:1]]
(use-package org-chef
  :ensure t)
;; org-chef:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Blogging%20with%20emacs][Blogging with emacs:1]]

;; Blogging with emacs:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org2blog][Org2blog:1]]

;; Org2blog:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Ox-hugo][Ox-hugo:1]]
(use-package ox-hugo
  :ensure t   
  :after ox)

 (require 'ox-hugo)
 (require 'org-hugo-auto-export-mode)

;;  (use-package org-capture
;;    :ensure nil
;;    :config
;;     (defun org-hugo-new-subtree-post-capture-template ()
;; ;;      "Returns `org-capture' template string for new Hugo post.
;; ;;    See `org-capture-templates' for more information."

;;      (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
;; 	 (fname (org-hugo-slug title)))
;;        (mapconcat #'identity
;; 	       `(,(concat "* TODO " title)
;; 		 ":PROPERTIES:"
;; 		 ,(concat ":EXPORT_HUGO_BUNDLE: " fname)
;; 		 ":EXPORT_FILE_NAME: index"
;; 		 ":END:"
;; 		 "%?\n")                ;Place the cursor here finally
;; 	       "\n")))
;;    (add-to-list 'org-capture-templates
;; 	     '("o"                ;`org-capture' binding + o
;; 	       "Post"
;; 	       entry
;; 	       ;; It is assumed that below file is present in `org-directory'
;; 	       ;; and that it has an "Ideas" heading. It can even be a
;; 	       ;; symlink pointing to the actual location of all-posts.org!
;; 	       (file+datetree (concat org-directory "~/blog/content/posts/my-post.org")
;; "* TODO %^{Description}  %^g\n%?\nAdded: %U")
;; 	       (function org-hugo-new-subtree-post-capture-template))))
;; Ox-hugo:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Easy-hugo][Easy-hugo:1]]
;; (use-package easy-hugo
;;   :custom
;;   (easy-hugo-basedir "~/Personal/devel/zzamboni.org/zzamboni.org/")
;;   (easy-hugo-url "http://zzamboni.org/")
;;   (easy-hugo-previewtime "300")
;;   ;;(define-key global-map (kbd "C-c C-e") 'easy-hugo)
;;   )
;; Easy-hugo:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Lazyblorg][Lazyblorg:1]]

;; Lazyblorg:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org-refile][Org-refile:1]]
(setq org-refile-targets '((nil :maxlevel . 9)
                                (org-agenda-files :maxlevel . 9)))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling
;; Org-refile:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org-capture][Org-capture:1]]
;; https://cestlaz.github.io/posts/using-emacs-24-capture-2/
  ;; This function pops up Capture templates options in a new emacs frame
  ;; You have to bound it to a desktop key to make it pops up wherever you 
  ;; need 

  (defun org-capture-popup ()
    "Create a new frame and run `org-capture'."
    (interactive)
    (select-frame (make-frame '((org-capture-popup . t))))
    (delete-other-windows)
    (cl-letf (((symbol-function 'switch-to-buffer-other-window) #'switch-to-buffer))
      (condition-case err
	  (org-capture)
	;; `org-capture' signals (error "Abort") when "q" is typed, so
	;; delete the newly-created frame in this scenario.
	(error (when (equal err '(error "Abort"))
		 (delete-frame))))))

  (defadvice org-capture-finalize (after my-delete-capture-frame activate)
    "Delete the frame after `capture-finalize'."
    (when (frame-parameter nil 'org-capture-popup)
      (delete-frame)))

  (defadvice org-capture-destroy (after my-delete-capture-frame activate)
    "Delete the frame after `capture-destroy'."
    (when (frame-parameter nil 'org-capture-popup)
      (delete-frame)))

;; Capture templates start from here

      (global-set-key (kbd "C-c c") 'org-capture)

      (setq org-capture-templates

	'(

  ("a" "Appointments" entry (file+headline "~/org~/my-appointments.org" "Calendar")
   "* APPT %^{Description} %^g\n%?\nAdded: %U")

     ("b" "Books" entry (file+headline "~/org~/books.org" "books to read")
   "* TODO %\\1 - %\\2%?\n%U\n:PROPERTIES:\n:NAME: %^{NAME}\n:TITLE: %^{TITLE}\n:END:\n")

    ;; you have to set up a template for this 
    ;; ("c" "Contacts" entry (file+headline "~/org~/contacts.org" "Contacts"), my/org-contacts-template :empty-lines 1)

     ("d" "Dreams" entry (file+datetree "~/org~/my-dreams.org") "* %^{Description} %^g %?\nAdded: %U")

     ("e" "Cookbook" entry (file "~/org~/cookbook.org")
	 "%(org-chef-get-recipe-from-url)"
	 :empty-lines 1)

     ("f" "Manual Cookbook" entry (file "~/org~/cookbook.org")
	 "* %^{Recipe title: }\n  :PROPERTIES:\n  :source-url:\n  :servings:\n  :prep-time:\n  :cook-time:\n  :ready-in:\n  :END:\n** Ingredients\n   %?\n** Directions\n\n")

     ("j" "Journal" entry (file+datetree "~/org~/journal.org") "* %?\nEntered on %U\n  %i\n  %a")

     ("l" "Log Time" entry (file+datetree "~/org~/timelog.org") "** %U - %^{Activity}  :TIME:")

     ("m" "Brain" entry (function org-brain-goto-end) "* %i%?" :empty-lines 1)

     ("n" "Notes" entry (file+datetree "~/org~/my-notes.org") "* %^{Description} %^g %?\nAdded: %U")

     ;; you have to set hugo up for this
     ;; ("o" "Posts" (file+datetree "~/org~/my-post.org") "* TODO %^{Description} %^g\n%?\nAdded: %U")

     ("t" "Tasks" entry (file+datetree "~/org~/tasks.org")
   "* TODO %^{Description} %^g\n%?\nAdded: %U")

     ;; example is in:
     ;; ~/.emacs.d/elpa/org-plus-contrib-20190520/org-contacts.el
     ("c" "Contacts" entry (file "~/org~/contacts.org")
	"* %(org-contacts-template-name)

     :PROPERTIES:
     :WEBADDRESS:
     :EMAIL: 
     :PHONE:
     :FAX:
     :MOBILE:
     :BIRTHDAY:
     :ADDRESS:
     :NAME:
     :NICKNAME:
     :ALIAS:
     :ICON:
     :IGNORE:
     :NOTE:
     :END:")

     ("w" "Website" plain (function org-website-clipper) "* %a\n%T\n" :immediate-finish t)))
;; Org-capture:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Hyperbole][Hyperbole:1]]
(unless (package-installed-p 'hyperbole)
  (package-refresh-contents)	
  (package-install 'hyperbole))
(require 'hyperbole)
;; Hyperbole:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Eww][Eww:1]]

;; Eww:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Printer][Printer:1]]
(setq lpr-command "gtklp")
(setq ps-lpr-command "gtklp")
;; Printer:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Emacs%20server][Emacs server:1]]
(load "server")
 (unless (server-running-p)
 (server-start))
;; Emacs server:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*epg-gpg2][epg-gpg2:1]]
(setq epg-gpg-program "usr/bin/gpg2")
(require 'epa-file)
(epa-file-enable)
(setq epa-file-select-keys nil)
(setq epa-pinentry-mode 'loopback)
(pinentry-start)
;; epg-gpg2:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*bbdb-database][bbdb-database:1]]
(require 'bbdb)
      (bbdb-initialize 'gnus 'message 'mu4e 'w3)
    ;; (bbdb-initialize 'gnus 'message 'reportmail 'sc 'sendmail 'w3)
    (setq bbdb-north-american-phone-numbers-p nil)
(bbdb-insinuate-message)
    (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
    (setq bbdb-file "~/.emacs.d/bbdb")
    (setq bbdb-send-mail-style 'gnus)
    (setq bbdb-complete-name-full-completion t)
    (setq bbdb-completion-type 'primary-or-name)
    (setq bbdb-complete-name-allow-cycling t)
    (setq
    bbdb-offer-save 1
    bbdb-use-pop-up t
    bbdb-electric-p t
    bbdb-popup-target-lines  1
    )
;; bbdb-database:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*ipp%20Printer][ipp Printer:1]]
(add-to-list 'load-path "~/.emacs.d/elpa/ipp")

(require 'ipp)
;; ipp Printer:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Linguistics][Linguistics:1]]
(use-package linguistic 
 :ensure t)
;; Linguistics:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org-drill][Org-drill:1]]
(use-package org-drill
  :ensure t)
;; Org-drill:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Org-drill-table][Org-drill-table:1]]
(use-package org-drill-table
  :ensure t)
;; Org-drill-table:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Memrise][Memrise:1]]
(use-package memrise
  :quelpa (memrise
	   :fetcher github
	   :repo "SavchenkoValeriy/memrise.el"))

(setq memrise-sync-requests t)
;; Memrise:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Gnutls-fix-bug][Gnutls-fix-bug:1]]
;;   (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3/")
     (setq gnutls-verify-error t)
     (setq tls-checktrust t)
;; Gnutls-fix-bug:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*emacs-wget][emacs-wget:1]]
;; (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/emacs-wget")

  ;; (require 'w3m-wget)
;;   (load "w3m-wget")
;;  (autoload 'wget "wget" "wget interface for Emacs." t)
;;  (autoload 'wget-web-page "wget" "wget interface to download whole web page." t)
;;  (autoload 'w3-wget "w3-wget" "wget interface for Emacs/W3." t)
;;  (setq wget-basic-options (cons "-equiet=off" wget-basic-options))
;;  (setq wget-basic-options (cons "-P." wget-basic-options))
;;  (setq wget-process-buffer nil)
;;  (setq wget-command "/usr/bin/wget")
;; emacs-wget:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*More%20niceties][More niceties:1]]
;; Mouse scrolling
  (setq mouse-wheel-scroll-amount '(1)
	mouse-wheel-progressive-speed nil 
	scroll-conservatively 101
	hscroll-margin 1
	hscroll-step 1
	scroll-preserve-screen-position t) 

  (defalias 'yes-or-no-p 'y-or-n-p)
  (setq confirm-kill-processes nil)

;; gtk-tooltipos
      (setq x-gtk-use-system-tooltips nil
	    use-dialog-box nil)

   ;; Desktop mode
   ;; (desktop-save-mode t)

    ;; Save minibuffer history.
    (savehist-mode 1)

    ;; Each file in a new window.
    ;; (setq pop-up-frames t)

  ;; Disk space is cheap. Save lots. (c) Sacha Chua
  ;; Backups

  (setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
	delete-old-versions -1
	version-control t
	vc-make-backup-files t
	auto-save-list-file-prefix "~/.emacs.d/autosave/"
	auto-save-file-name-transforms '((".*" "~/.emacs.d/autosave/" t))
	undo-tree-auto-save-history t
	undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo/")))

  ;; But don't create stupid lockfiles
  (setq create-lockfiles nil)

  ;; History
  (setq savehist-file "~/.emacs.d/history"
	history-length t
	history-delete-duplicates t
	savehist-save-minibuffer-history 1
	savehist-additional-variables
	'(kill-ring
	  search-ring
	  regexp-search-ring)
	recentf-max-saved-items 50)
  (savehist-mode 1)
  (recentf-mode 1)

;; Which-key
;; C-x to access it

    (use-package which-key
     :ensure t
     :config
      (which-key-mode t))
;; More niceties:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Better%20shell][Better shell:1]]
(use-package better-shell
:ensure t
:bind (("C-'" . better-shell-shell)
("C-;" . better-shell-remote-open)))
;; Better shell:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Virtualenv][Virtualenv:1]]
(use-package virtualenvwrapper
:ensure t
:config
(venv-initialize-interactive-shells)
(venv-initialize-eshell))
;; Virtualenv:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Time%20in%20mode-line][Time in mode-line:1]]
(setq display-time-default-load-average nil)
(setq display-time-interval 1)
(setq display-time-format "%d|%m-%a|%r")
(display-time-mode +1)
;; Time in mode-line:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Long%20lines][Long lines:1]]
(local-set-key (kbd "C-x w") 'toggle-truncate-lines)
;; Long lines:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*evil-macros%20keys][evil-macros keys:1]]
(evil-define-key 'normal 'global
  ;; select the previously pasted text
  "gp" "`[v`]"
  ;; run the macro in the q register
  "Q" "@q")

(evil-define-key 'visual 'global
  ;; run macro in the q register on all selected lines
  "Q" (kbd ":norm @q RET")
  ;; repeat on all selected lines
  "." (kbd ":norm . RET"))

;; alternative command version
(defun my-norm@q ()
  "Apply macro in q register on selected lines."
  (interactive)
  (evil-ex-normal (region-beginning) (region-end) "@q"))

  (evil-define-key 'visual 'global "Q" #'my-norm@q)
;; evil-macros keys:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*emacros][emacros:1]]

;; emacros:1 ends here

;; [[file:~/.dotfiles/emacs/.emacs.d/emacs.org::*Zoom-frm][Zoom-frm:1]]
(add-to-list 'load-path "~/.emacs.d/el-get/zoom-frm")
(require 'zoom-frm)
;; Zoom-frm:1 ends here
