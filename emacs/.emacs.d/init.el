;;; Code:

(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa"))

(setq package-archives '(("gnu"           . "http://elpa.gnu.org/packages/")
                          ("melpa-stable" . "http://stable.melpa.org/packages/")
                          ("melpa"        . "http://melpa.org/packages/")
                          ("org"          . "http://orgmode.org/elpa/")))

(package-initialize)


(let ((bootstrap-file
         (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
        (bootstrap-version 4))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
          (url-retrieve-synchronously
           "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
           'silent 'inhibit-cookies)
        (goto-char (point-max))
        (eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage))

(setq straight-enable-use-package-integration t
  straight-use-package-by-default t
  use-package-always-defer t)

(straight-use-package 'use-package)

(defun cyber/use-package-if-prehook (name _keyword pred rest state)
    (unless pred (error "predicated failed; skipping package")))

  (advice-add 'use-package-handler/:if :before 'cyber/use-package-if-prehook)

  (use-package f
    :ensure t)  ;; this will force use package keyword ":ensure" when using "use-package" 

;; https://zzamboni.org/post/my-emacs-configuration-with-commentary/

   (customize-set-variable 'use-package-always-defer t)

(setq gc-cons-threshold (* 100 1024 1024))

(custom-set-variables
          '(initial-frame-alist (quote ((fullscreen . maximized)))))
     ;; for customizing the face (fonts), do:
     ;; M-x customize-face RET default RET    
     ;;(setq inhibit-startup-screen t)
     (set-default-font "Source Code Pro" nil t)
     (set-face-attribute 'default nil :height 105)
     (visual-line-mode 1)
     (global-visual-line-mode 1)
     (load-theme 'misterioso)
     (tool-bar-mode 0)
     (scroll-bar-mode 0)
     (show-paren-mode 1)
     (toggle-truncate-lines nil) ;; you have to set truncate-partial-width-windows to non-nil for this to work
     (ido-mode 1) ;; this shows minibuffer options
     (blink-cursor-mode 0)
     (setq org-src-wind-setup 'current-window)
     (global-subword-mode 1)

     (defalias 'yes-or-no-p 'y-or-n-p)
	(setq confirm-kill-processes nil)
   (add-hook 'prog-mode-hook 'turn-on-auto-fill)
      (add-hook 'text-mode-hook 'turn-on-auto-fill)

;; http://folk.uio.no/simenheg/init.el.html

(set-language-environment "UTF-8") ; Set up UTF-8 multilingual environment

(setq
 comint-input-ignoredups        t  ; Ignore duplicates in Comint history
 compare-ignore-whitespace      t  ; Ignore whitespace differences
;; default-input-method       "TeX"  ; TeX is the default toggled input method
;; disabled-command-function    nil  ; Enable disabled commands
 eshell-hist-ignoredups         t  ; Ignore duplicates in Eshell history
 history-delete-duplicates      t  ; Delete duplicate history entries
 inhibit-startup-screen         t  ; No startup screen
;; initial-scratch-message      nil  ; No scratch message
 iswitchb-prompt-newbuffer    nil  ; Create new buffers without confirmation
;; kill-read-only-ok              t  ; Killing read-only text is OK
;; password-cache-expiry        nil  ; Cache TRAMP passwords forever
 show-paren-delay               0) ; Don't delay the paren update

(setq-default
;; fill-column                   76  ; Lines break at column 76
;; frame-background-mode      'dark  ; My theme is dark
 indent-tabs-mode             nil  ; Use spaces for indentation
;; major-mode            'text-mode ; text-mode as the default for new buffers
)

;; (blink-cursor-mode              0) ; No blinking cursor
(column-number-mode             1) ; Show column number
(delete-selection-mode          1) ; Delete selection when typing
(fset 'yes-or-no-p      'y-or-n-p) ; Make "yes/no" prompts "y/n"
(global-auto-revert-mode        1) ; Reload files after modification
(iswitchb-mode                  1) ; Neat buffer switching
(menu-bar-mode                  1) ; Menu bar
(prefer-coding-system      'utf-8) ; Always prefer UTF-8
(scroll-bar-mode               -1) ; And no scroll bar either
(show-paren-mode                1) ; Highlight matching parenthesis
(tool-bar-mode                 -1) ; No tool bar, please
(setq create-lockfiles nil)        ; do not save '#' lockfiles

(use-package smart-hungry-delete
  :ensure t
  :bind (("<backspace>" . smart-hungry-delete-backward-char)
		 ("C-d" . smart-hungry-delete-forward-char))
  :defer nil ;; dont defer so we can add our functions to hooks 
  :config (smart-hungry-delete-add-default-hooks)
  )

(defun kill-current-buffer ()
  "Kills the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

(global-set-key (kbd "C-x b") 'ibuffer)

(setq ibuffer-expert t)

(defun close-all-buffers ()
  "Kill all buffers without regard for their origin."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key (kbd "C-M-s-k") 'close-all-buffers)

(use-package switch-window
  :ensure t
  :config
    (setq switch-window-input-style 'minibuffer)
    (setq switch-window-increase 4)
    (setq switch-window-threshold 2)
    (setq switch-window-shortcut-style 'qwerty)
    (setq switch-window-qwerty-shortcuts
        '("a" "s" "d" "f" "j" "k" "l" "i" "o"))
  :bind
    ([remap other-window] . switch-window))

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(use-package fancy-battery
  :ensure t
  :config
    (setq fancy-battery-show-percentage t)
    (setq battery-update-interval 15)
    (if window-system
      (fancy-battery-mode)
      (display-battery-mode)))

(use-package symon
  :ensure t
  :bind
  ("s-h" . symon-mode))

(use-package mark-multiple
  :ensure t
  :bind ("C-$" . 'mark-next-like-this))

(defun cyber/kill-inner-word ()
  "Kills the entire word your cursor is in. Equivalent to 'ciw' in vim."
  (interactive)
  (forward-char 1)
  (backward-word)
  (kill-word 1))
(global-set-key (kbd "C-c i w") 'cyber/kill-inner-word)

(defun cyber/copy-whole-word ()
  (interactive)
  (save-excursion
    (forward-char 1)
    (backward-word)
    (kill-word 1)
    (yank)))
(global-set-key (kbd "C-c w c") 'cyber/copy-whole-word)

(defun cyber/copy-whole-line ()
  "Copies a line without regard for cursor position."
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))))
(global-set-key (kbd "C-c l c") 'cyber/copy-whole-line)

(global-set-key (kbd "C-c l k") 'kill-whole-line)

(when window-system
      (use-package pretty-mode
      :ensure t
      :config
      (global-pretty-mode t)))

(use-package rainbow-mode
 :ensure t
 :init
  (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package rainbow-delimiters
  :ensure t
  :init
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package zzz-to-char
  :ensure t
  :bind ("M-z" . zzz-up-to-char))

(setq kill-ring-max 100)

(use-package popup-kill-ring
  :ensure t
  :bind ("M-K" . popup-kill-ring))

(use-package persistent-scratch
  :config
  (persistent-scratch-setup-default))

;; a function to recreate the scratch buffer
(defun scratch ()
   "create a scratch buffer"
   (interactive)
   (switch-to-buffer-other-window (get-buffer-create "*scratch*"))
   (insert initial-scratch-message)
   (org-mode))

;; https://alhassy.github.io/init/
;; initial-scratch-message
(setq initial-scratch-message (concat
 "#+Title: 'Vagner Rener' @ 'Cyberwarrior"
    "\n# This buffer is for text that is not saved, and for Lisp evaluation."
    "\n# To create a file, visit it with 'C-x C-f' e and enter text in its buffer.\n"))

;;  (setq initial-major-mode 'org-mode)
    (setq initial-major-mode 'fundamental-mode)

(straight-use-package 'centered-window)
  (centered-window-mode 1)

(set-input-method "portuguese-prefix")

(defadvice switch-to-buffer (after activate-input-method activate)
(activate-input-method "portuguese-prefix"))

(add-hook 'text-mode-hook
  (lambda () (set-input-method "portuguese-prefix")))

(dolist (pkgname '(theme-looper
  alect-themes
  base16-theme
  color-theme-modern
  doom-themes
  moe-theme
  ))
(straight-use-package pkgname))

  (global-set-key (kbd "<C-f8>") 'theme-looper-enable-random-theme)

;; Wrap lines without breaking the last word
(add-hook 'org-mode-hook #'toggle-word-wrap)

(load "~/.emacs.d/elpa/emacs-brazilian-holidays/brazilian-holidays.el")

(setq org-ellipsis " ")
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-export-with-smart-quotes t)
(setq org-src-window-setup 'current-window)
(add-hook 'org-mode-hook 'org-indent-mode)

(global-set-key (kbd "C-c '") 'org-edit-src-code)

(setq evil-want-keybinding nil)
 ;; (setq evil-want-C-i-jump nil)
    (unless (display-graphic-p) (setq evil-want-C-i-jump nil))
    
;; (when evil-want-C-i-jump
  ;; (define-key evil-motion-state-map (kbd "C-i") 'evil-jump-forward))

(straight-use-package 'evil)
;; (evil-mode 1)

(straight-use-package 'evil-collection)
;; (evil-collection-init t)

(straight-use-package 'evil-org)

(global-evil-leader-mode)
(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

 ;; Configure leader key

 (evil-leader/set-key-for-mode 'org-mode
	"." 'hydra-org-state/body
	"t" 'org-todo
	"T" 'org-show-todo-tree
	"v" 'org-mark-element
	"a" 'org-agenda
	"c" 'org-archive-subtree
	"l" 'evil-org-open-links
	"C" 'org-resolve-clocks)

(straight-use-package 'org-evil)

(global-set-key [f6] 'spell-checker)
(global-set-key [f7] 'ispell-buffer)

(require 'ispell)
(require 'flyspell)

(defun spell-checker ()
  "spell checker (on/off) with selectable dictionary"
  (interactive)
  (if flyspell-mode
      (flyspell-mode-off)
    (progn
      (flyspell-mode)
      (ispell-change-dictionary
       (completing-read
        "Use new dictionary (RET for *default*): "
        (and (fboundp 'ispell-valid-dictionary-list)
         (mapcar 'list (ispell-valid-dictionary-list)))
        nil t))
      )))

(defun my-turn-spell-checking-on ()
  "Turn flyspell-mode on."
  (flyspell-mode 1))
(add-hook 'text-mode-hook 'my-turn-spell-checking-on)

;; enable flyspell in text mode (and derived modes)
;; (add-hook 'text-mode-hook 'flyspell-mode)

;; (require 'icicles)
;; (icy-mode 1)

(straight-use-package 'company)
     (require 'company)
     (add-hook 'after-init-hook 'global-company-mode)
     (setq company-minimum-prefix-length 3)
     (setq company-idle-delay 0.1)

     (setq company-dabbrev-downcase nil)

   (eval-after-load 'company
     '(progn
        (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
        (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))

   (eval-after-load 'company
     '(progn
        (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
        (define-key company-active-map (kbd "<backtab>") 'company-select-previous)))

   (setq company-frontends
         '(company-pseudo-tooltip-unless-just-one-frontend
           company-preview-frontend
           company-echo-metadata-frontend))

   (setq company-require-match 'never)

   (setq company-auto-complete t)

    (defun my-company-visible-and-explicit-action-p ()
       (and (company-tooltip-visible-p)
            (company-explicit-action-p)))

     (defun company-ac-setup ()
       "Sets up `company-mode' to behave similarly to `auto-complete-mode'."
       (setq company-require-match nil)
       (setq company-auto-complete #'my-company-visible-and-explicit-action-p)
       (setq company-frontends '(company-echo-metadata-frontend
                                 company-pseudo-tooltip-unless-just-one-frontend-with-delay
                                 company-preview-frontend))
       (define-key company-active-map [tab]
         'company-select-next-if-tooltip-visible-or-complete-selection)
       (define-key company-active-map (kbd "TAB")
         'company-select-next-if-tooltip-visible-or-complete-selection))

      (company-ac-setup)

    (custom-set-faces
        '(company-preview
          ((t (:foreground "darkgray" :underline t))))
        '(company-preview-common
          ((t (:inherit company-preview))))
        '(company-tooltip
          ((t (:background "lightgray" :foreground "black"))))
        '(company-tooltip-selection
          ((t (:background "steelblue" :foreground "white"))))
        '(company-tooltip-common
          ((((type x)) (:inherit company-tooltip :weight bold))
           (t (:inherit company-tooltip))))
        '(company-tooltip-common-selection
          ((((type x)) (:inherit company-tooltip-selection :weight bold))
           (t (:inherit company-tooltip-selection)))))

;;;;;;;;;;;;;;;;;;

 (straight-use-package 'company-quickhelp)
(setq company-quickhelp-mode 1)

 ;;;;;;;;;;;;;;;;;;

(straight-use-package '(company-englisp-helper
                           :type git
                           :host github
                           :repo "manateelazycat/company-english-helper"))
   (require 'company-english-helper)

 ;;;;;;;;;;;;;;;;;;

(straight-use-package 'org-bullets)
 (org-bullets-mode 1)
 (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq w3m-display-inline-images t) 
(setq w3m-fill-column 80) ;; if this does not work, modify the file w3m.el itself
(setq w3m-default-display-inline-images t) 
(setq w3m-default-save-directory "~/Downloads")

(straight-use-package 'bug-hunter)

(use-package eloud
     :ensure t
     :load-path "~/.emacs.d/straight/repos/eloud"
     :config
          (setq eloud-espeak-path "/usr/bin/espeak"))

    (require 'eloud)

;; (add-to-list 'load-path "~/.emacs.d/straight/repos/eloud/")
;; (eloud-espeak-path "/usr/bin/espeak")
;; (setq eloud-espeak-path "/usr/bin/espeak-ng -ven-gb -s 160")
;; (setq eloud-espeak-path "/usr/bin/espeak -vpt -s 150")

;; if you want to set espeak voice default pitch, you have to
;; edit the file "/usr/lib/x86_64-linux-gnu/espeak-data/voices/en"

(straight-use-package 'hydra)

(defhydra cyber-hydra-window (global-map "C-c w")
       "Commands relating to window manipulation"
       ("h" windmove-left "move left")
       ("l" windmove-right "move right")
       ("j" windmove-down "move down")
       ("k" windmove-up "move up")
       ("q" delete-window "delete window")
       ("Q" kill-buffer-and-window "kill buffer, delete window")
       ("H" cyber-move-splitter-left "move splitter left")
       ("L" cyber-move-splitter-right "move splitter right")
       ("J" cyber-move-splitter-down "move splitter down")
       ("K" cyber-move-splitter-up "move splitter up")
       ("b" balance-windows)
       ("|" cyber-window-toggle-split-direction)
       ("s" split-window-below "split window (below)")
       ("v" split-window-right "split window (right)")
       (";" ace-window "select window" :exit t))

(defhydra hydra-org-state ()
	 ;; basic navigation
	 ("i" org-cycle)
	 ("I" org-shifttab)
	 ("h" org-up-element)
	 ("l" org-down-element)
	 ("j" org-forward-element)
	 ("k" org-backward-element)
	 ;; navigating links
	 ("n" org-next-link)
	 ("p" org-previous-link)
	 ("o" org-open-at-point)
	 ;; navigation blocks
	 ("N" org-next-block)
	 ("P" org-previous-block)
	 ;; updates
	 ("." org-ctrl-c-ctrl-c)
	 ("*" org-ctrl-c-star)
	 ("-" org-ctrl-c-minus)
	 ;; change todo state
	 ("H" org-shiftleft)
	 ("L" org-shiftright)
	 ("J" org-shiftdown)
	 ("K" org-shiftup)
	 ("t" org-todo))

(dolist (pkgname '(snippet
yasnippet
yasnippet-snippets
yasnippet-classic-snippets))
  (straight-use-package pkgname))

  (yas-global-mode 1)

(use-package counsel
 :straight t
 :bind
 (("M-y" . counsel-yank-pop)
 :map ivy-minibuffer-map
 ("M-y" . ivy-next-line)))

 (setq counsel-fzf-cmd "~/.fzf/bin/fzf -f %s")

(use-package ivy
:straight t
:diminish (ivy-mode)
:bind (("C-x b" . ivy-switch-buffer))
:config
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "%d/%d ")
(setq ivy-display-style 'fancy))

(use-package swiper
:straight t
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

;; (add-to-list 'load-path "~/.emacs.d/local-repo/dired+")
;; (require 'dired+)

(setq dired-dwim-target t)
;; Hide details by default
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
;; Not spawn endless amount of dired buffers
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(use-package all-the-icons
 :straight t)

(use-package all-the-icons-dired
 :straight t)

(use-package dired-rainbow
 :straight t)

(use-package all-the-icons-ivy
 :straight t)

(use-package async
  :ensure t
  :init (dired-async-mode 1))

(use-package eyebrowse
  :straight t
  :config
  (progn
    (define-key eyebrowse-mode-map (kbd "M-1") 'eyebrowse-switch-to-window-config-1)
    (define-key eyebrowse-mode-map (kbd "M-2") 'eyebrowse-switch-to-window-config-2)
    (define-key eyebrowse-mode-map (kbd "M-3") 'eyebrowse-switch-to-window-config-3)
    (define-key eyebrowse-mode-map (kbd "M-4") 'eyebrowse-switch-to-window-config-4)
    (define-key eyebrowse-mode-map (kbd "M-5") 'eyebrowse-switch-to-window-config-5)

    (eyebrowse-mode t)
    (setq eyebrowse-new-workspace t)))

;;  (use-package helm
;;    :straight t)

  ;; helm

     (use-package helm)
        (helm-mode 1)

     (define-key helm-map (kbd "s-j") 'helm-next-line)
     (define-key helm-map (kbd "s-k") 'helm-previous-line)

  ;; helm-swoop


(use-package helm-swoop)

     (global-set-key (kbd "M-x") 'helm-M-x)
     (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
     (global-set-key (kbd "C-x C-f") 'helm-find-files)

(straight-use-package '(helm-deft :type git
                                  :host github
                                  :repo "dfeich/helm-deft"))

(require 'helm-deft)
(setq helm-deft-extension "org")
(setq helm-deft-dir-list '(
                           "~/org~/"
                           "~/Documents/"
                           ))

(use-package beacon
  :straight t
  :defer 10
  :diminish beacon-mode
  :custom
  (beacon-push-mark 10)
  :config
  (beacon-mode +1))

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

(use-package org-ref
  :straight t)

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

(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file)
  (rotate-frame-clockwise))

(global-set-key (kbd "C-c I") 'find-user-init-file)

(use-package avy
  :ensure t
  :bind
    ("M-s" . avy-goto-char))

(setq org-plantuml-jar-path "/usr/share/plantuml/plantuml.jar")

  (dolist (pkgname '(plantuml-mode
flycheck-plantuml))
  (straight-use-package pkgname))

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 (quote
  ((vala . t)
   (stan . t)
   (octave . t)
   (shen . t)
   (screen . t)
   (scheme . t)
   ;; (scala . t)
   (sass . t)
   (picolisp . t)
   (perl . t)
   (ocaml . t)
   (mscgen . t)
   (lilypond . t)
   (J . t)
   (ledger . t)
   (io . t)
   (hledger . t)
   (haskell . t)
   (fortran . t)
   (forth . t)
   (css . t)
   (maxima . t)
   (matlab . t)
   (emacs-lisp . t)
   (clojure . t)
   (awk . t)
   (makefile . t)
   (sqlite . t)
   (sql . t)
   (ruby . t)
   (R . t)
   (js . t)
   (java . t)
   (shell . t)
   (plantuml . t)
   (lisp . t)
   (latex . t)
   (gnuplot . t)
   (dot . t)
   (ditaa . t)
   (org . t)
   (calc . t)
   (C . t)
   (asymptote . t)
   (python . t)
   (emacs-lisp . t))))

   (setq org-confirm-babel-evaluate nil)
   (setq org-export-use-babel t)

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

(use-package pdf-tools
 :straight t
 :config
  (pdf-tools-install))

(use-package org-pdfview
 :straight t)

;; (setq browse-url-browser-function 'browse-url-generic
 ;; browse-url-generic-program "firefox")
 ;; browse-url-generic-program "chromium")

   (setq browse-url-browser-function 'w3m-browse-url)
    (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
  ;; optional keyboard short-cut
    (global-set-key "\C-xm" 'browse-url-at-point)

(straight-use-package 'diatheke)
(setq max-specpdl-size 2000)

;;  (use-package diatheke
;;    :straight t)

;; (setq diatheke-bible "KJVA -f plain")

;; (setq diatheke-bible "ESV -f plain -o s")

;; you can set the Bible inside the buffer with
;; (diatheke-set-bible) + C-x e

;; Keybindings already automatically loaded
;; C-c C-b: select a bible translation
;; C-c C-i: insert a passage
;; C-c C-p: search for a phrase
;; C-c C-m: search for multiple words
;; C-c C-r: search by regex

(use-package dtk
  :bind (("C-c B" . dtk-bible))
  :custom
  (dtk-default-module "KJVA")
  (dtk-default-module-category "Biblical Texts")
  (dtk-word-wrap t))

(add-to-list 'load-path "~/.emacs.d/elpa/sword-to-org/")
(require 'sword-to-org)

(use-package telega
 :straight t
 :bind 
  (:map telega-msg-button-map
    ("j" . nil)
    ("k" . nil)
    ("h" . nil)
    ("l" . nil))
    :custom (telega-notifications-mode t))

(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)

(use-package dtrt-indent
  :straight t
  :diminish t
  :config
  (dtrt-indent-mode +1))

(use-package wgrep
 :straight t)

(use-package engine-mode
  :straight t
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

(use-package erc-hl-nicks
  :ensure t
  :config
    (erc-update-modules))

(use-package elcord
  :ensure t)

(defun my-turn-spell-checking-on ()
  "Turn flyspell-mode on."
  (flyspell-mode 1))

(add-hook 'text-mode-hook 'my-turn-spell-checking-on)

 ;; enable flyspell in text mode (and derived modes)
 ;; (add-hook 'text-mode-hook 'flyspell-mode)

(use-package gitlab
 :straight t)
   (setq gitlab-host "https://gitlab.com"
	 gitlab-token-id "")

(use-package ggtags
:straight t
:config 
 (add-hook 'c-mode-common-hook
      (lambda ()
	(when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'php-mode 'web-mode)
	  (ggtags-mode 1)))))

(use-package ob-translate
       :straight t)
      (define-key org-mode-map (kbd "C-c C-v e") 'org-babel-execute-src-block)

;; https://orgmode.org/manual/Evaluating-code-blocks.html#DOCF142
;; I don't want to execute code blocks with C-c C-c
(setq org-babel-no-eval-on-ctrl-c-ctrl-c t)

(use-package google-translate
:straight t
:config
  (bind-keys*
  ("C-c t" . google-translate-at-point)
  ("C-c T" . google-translate-at-point-reverse)))

(defun google-translate--get-b-d1 ()
      (list 432928 274893998))



(fset 'my-complete-file-name
   (make-hippie-expand-function '(try-complete-file-name-partially
					try-complete-file-name)))
   (global-set-key "\M-/" 'my-complete-file-name)
   (global-set-key "\M-\\" 'comint-dynamic-complete-filename)

(use-package helm-mu
  :straight t)

(use-package eimp
 :ensure t)

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

(defvar imaxima-fnt-size "Large")
(defvar imaxima-use-maxima-mode-flag t)

(setq org-src-tab-acts-natively t)

  (defun my/org-cleanup ()
  (interactive)
  (org-edit-special)
  (indent-buffer)
  (org-edit-src-exit))

  (defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(use-package jabber 
 :straight t)

(use-package linum-relative
  :ensure t
  :init
  (setq linum-format 'linum-relative)
  :config
  (setq linum-relative-current-symbol ""))

  ;; (straight-use-package 'linum)

  ;; (setq linum-relative-current-symbol "")

  ;; (linum-relative-global-mode)
  ;; (eval-after-load "linum"
  ;;   '(set-face-attribute 'linum nil :height 100))

  ;; (autopair-global-mode)

  ;; (global-undo-tree-mode)

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

(use-package lyrics
 :straight t)

(use-package lispy
   :straight t)

  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

  (defun conditionally-enable-lispy ()
    (when (eq this-command 'eval-expression)
      (lispy-mode 1)))

  (add-hook 'minibuffer-setup-hook 'conditionally-enable-lispy)

(use-package lorem-ipsum
    :straight t)

;;(lorem-ipsum-use-default-bindings)

;;  (add-hook 'sgml-mode-hook (lambda ()
;;			    (setq Lorem-ipsum-paragraph-separator "<br><br>\n"
;;				  Lorem-ipsum-sentence-separator "&nbsp class="comment">;&nbsp;"
;;				  Lorem-ipsum-list-beginning "<ul>\n"
;;				  Lorem-ipsum-list-bullet "<li>"
;;				  Lorem-ipsum-list-item-end "</li>\n"
;;				  Lorem-ipsum-list-end "</ul>\n")))

;; (use-package magit 
  ;;  :straight t
  ;;  :config
  ;; (global-set-key (kbd "C-c g") 'magit-status))

(use-package magit
  :straight t
  :config
  (setq magit-push-always-verify nil)
  (setq git-commit-summary-max-length 50)
  :bind
  ("M-g" . magit-status))

(use-package mplayer-mode
  :straight t)

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

(use-package mingus
 :straight t)

(use-package emamux
  :straight t
  :defer t)

(use-package debian-el
  :straight t
  :defer t)

;;    (setq frame-title-format "emacs")
   ;;    (set-default 'cursor-type 'hbar)
   ;;      (ido-mode 1)
   ;;      (column-number-mode 1)
   ;;      (global-hl-line-mode 0)
   ;;      (delete-selection-mode +1)

;; Use xah brackets system, instead of 
;; electric-pairs, paredit, etc...

;; (setq electric-pair-pairs '(
;; 			   (?\{ . ?\})
;; 			   (?\( . ?\))
;; 			   (?\[ . ?\])
;; 			   (?\" . ?\")
;; 			   ))
;; (electric-pair-mode 1)

   ;;      (defalias 'yes-or-no-p 'y-or-n-p)
   ;;      (setq confirm-kill-processes nil)

   ;;    (add-hook 'prog-mode-hook 'turn-on-auto-fill)
   ;;    (add-hook 'text-mode-hook 'turn-on-auto-fill)

   ;; ;; Brent.Longborough's .emacs

   ;; (scroll-bar-mode -1) ; Disable hide scroll-bar
   ;; (tool-bar-mode 0) ; Disable tool bar
   ;; (blink-cursor-mode 0) ; Disable cursor blinking
   ;; (global-visual-line-mode 1); Proper line wrapping
   ;; (global-visual-line-mode 1); Proper line wrapping
   ;; ;; (if (display-graphic-p) (global-hl-line-mode t))
   ;; ;; (global-hl-line-mode 1); Highlight current row
   ;; (show-paren-mode 1); Matches parentheses and such in every mode
   ;; ;;(set-fringe-mode '(0 . 0)); Disable fringe because I use visual-line-mode
   ;; (set-fringe-mode '(4 . 0)) 
   ;; (set-face-background hl-line-face "#f2f1f0"); Same color as greyness in gtk
   ;; (setq inhibit-splash-screen t); Disable splash screen
   ;; (setq visible-bell t); Flashes on error
   ;; (setq calendar-week-start-day 1); Calender should start on Monday
   ;; (add-to-list 'default-frame-alist '(height . 59)); Default frame height.
   ;; (mapc 'global-unset-key [[up] [down] [left] [right]])

   ;; ;; Brent.Longborough upt to here

   ;;  ;;;; Uncomment up or down, but not the two parts

   ;;  (defun 1on1-set-cursor-type (cursor-type)
   ;;    "Set the cursor type of the selected frame to CURSOR-TYPE.
   ;;  When called interactively, prompt for the type to use.
   ;;  To get the frame's current cursor type, use `frame-parameters'."
   ;;    (interactive
   ;;     (list (intern (completing-read
   ;;  		   "Cursor type: "
   ;;  		   (mapcar 'list '("box" "hollow" "bar" "hbar" nil))))))
   ;;    (modify-frame-parameters (selected-frame) (list (cons 'cursor-type cursor-type))))

;; (straight-use-package 'multiple-cursors)
  ;; (require 'multiple-cursors)
  ;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  ;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  ;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  ;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(use-package multiple-cursors
  :ensure t
  :bind 
  (("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this)
   ("C-M->" . mc/unmark-next-like-this)
   ("C-M-<" . mc/unmark-previous-like-this)
   ("C-*" . mc/mark-all-like-this))
  :init
  (bind-keys :prefix-map mc-map
             :prefix "C-x m"
             ("C-a" . mc/edit-beginnings-of-lines)
             ("C-e" . mc/edit-ends-of-lines)
             ("C-m" mc/mark-all-dwim)
             ("a" . mc/mark-all-like-this)
             ("d" . mc/mark-all-symbols-like-this-in-defun)
             ("h" . mc-hide-unmatched-lines-mode)
             ("i" . mc/insert-numbers)
             ("l" . mc/edit-lines)
             ("r" . mc/reverse-regions)
             ("s" . mc/sort-regions)))

(straight-use-package 'mu4e)

	 (global-set-key (kbd "C-<f10>") 'mu4e)

	 ;; default
	 (setq mu4e-maildir "~/gmail/")
	 (setq mu4e-sent-folder "/Sent")
	 ;; (setq mu4e-drafts-folder "/Drafts")
	 (setq mu4e-trash-folder   "/Junk")
	 (setq mu4e-trash-folder  "/Queue")
	 (setq mu4e-inbox-folder  "/Inbox")

	 ;; setup some handy shortcuts
	 ;; you can quickly switch to your Inbox -- press ``ji''
	 ;; then, when you want archive some messages, move them to
	 ;; the 'All Mail' folder by pressing ``ma''.

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

	;; don't keep message buffers around
	(setq message-kill-buffer-on-exit t)

	;; https://github.com/bandresen/mu4e-send-delay

	(add-to-list 'load-path "~/.emacs.d/elpa/mu4e-send-delay")

	;; Recommended settings

        ;; Assigning the scheduled enabled send to C-c C-c

	(add-hook 'mu4e-main-mode-hook (lambda ()
	(define-key mu4e-compose-mode-map
	  (kbd "C-c C-c") 'mu4e-send-delay-send-and-exit)))

      ;; Now you can C-c C-c every mail
      ;; Defaults

      ;; mu4e-send-delay-default-delay is set to “3m”
      ;; mu4e-send-delay-timer is set to every 2 minutes
      ;; mu4e-send-delay-include-header-in-draft is true
      ;; mu4e-send-strip-header-before-send is true

      (setq mu4e-org-contacts-file  "~/org~/contacts.org") 

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

(global-set-key (kbd "<f5>") 'my-save-word)
     (defun my-save-word ()
    (interactive)
    (let ((current-location (point))
	   (word (flyspell-get-word)))
      (when (consp word)    
	(flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))

;;  (straight-use-package 'oauth2)

;;    (use-package oauth2 
;;	   :config
;;	(eval-when-compile
;;	     (defvar oauth--token-data ())))

;; (require 'org)
;;       (setq org-directory "~/~org/")
;;       (define-key global-map "\C-cl" 'org-store-link)
;;       (define-key global-map "\C-ca" 'org-agenda)
;;       (setq org-log-done t)

(setq org-agenda-files (list "~/org~/appointments.org"
			     "~/org~/home.org"
			     "~/org~/studies.org"
			     "~/org~/work.org"))

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

(straight-use-package 'org-brain)
  (setq org-brain-path "~/org~/brain")

  ;; For Evil users
  (with-eval-after-load 'evil
    (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
  (setq org-id-track-globally t)
  (setq org-brain-file-entries-use-title nil)
  (setq org-id-locations-file "~/org~/brain/.org-id-locations")
  ;; (push '("b" "Brain" plain (function org-brain-goto-end)
  ;;     "* %i%?")
  ;; 	   org-capture-templates)
  (setq org-brain-visualize-default-choices 'all)
  (setq org-brain-title-max-length 12)

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

(use-package org-cliplink
 :straight t)

(defun org-brain-cliplink-resource ()
  "Add a URL from the clipboard as an org-brain resource.
Suggest the URL title as a description for resource."
  (interactive)
  (let ((url (org-cliplink-clipboard-content)))
    (org-brain-add-resource
     url
     (org-cliplink-retrieve-title-synchronously url)
     t)))

(global-set-key (kbd "C-x p i") 'org-cliplink)

;; (define-key org-brain-visualize-mode-map (kbd "L") #'org-brain-cliplink-resource)

;; (use-package origami
;; :straight t)

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

;; https://github.com/bastibe/org-journal

(use-package org-journal
 :ensure t)

    (customize-set-variable 'org-journal-dir "~/org~/journal/")
    (customize-set-variable 'org-journal-date-format "%A, %d %B %Y")

    (customize-set-variable 'org-journal-enable-agenda-integration t)
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

(add-hook 'org-mode-hook (lambda () 
  (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link)))

(require 'org-protocol)

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

(use-package epresent
 :straight t)

(use-package org-present
 :straight t
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

(use-package org-present-remote
 :straight t)

(use-package fakir
 :straight t)

(add-to-list 'load-path "/home/vagner/.emacs.d/elpa/emacs-reveal")

;; (setq oer-reveal-plugins nil)
;; (setq oer-reveal-plugins t)

;; Note: give the ABSOLUTE PATH to reveal.js
;; Otherwise it will not work

;; this work only with internet connection
;; (setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
;; (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")

;; this work without internet connection
;; (setq org-reveal-root "file:/home/vagner/reveal-slides/reveal.js")

;; if it does not load, do:
;; Alt-x load-library RET ox-reveal

 (use-package ox-reveal
  :straight t
  :after org
  :custom
  (org-reveal-root "file:/home/vagner/reveal-slides/reveal.js"))

 (use-package htmlize
  :straight t
  :after ox-reveal
  :config
  (setq org-reveal-hlevel 2)
  (setq org-reveal-mathjax t))

    ;; To load Org-reveal, type “Alt-x load-library”, then type “ox-reveal”.
    ;; ~/reveal-slides/reveal.js$ npm start - you have to start the server
    ;; for viewing your slides and using the remote control
    ;; Now you can export this manual into Reveal.js presentation by typing “C-c C-e R B”.
    ;; Open the generated “Readme.html” in your browser and enjoy the cool slides.

(use-package org-re-reveal 
   :straight t
   :config
     (setq org-re-reveal-root "file:/home/vagner/reveal-slides/reveal.js")
     (require 'org-re-reveal)
;;     (setq oer-reveal-plugins t)
     (setq org-re-reveal-hlevel 2))

(use-package org-re-reveal-ref
 :straight t
 :config
   (require 'org-re-reveal-ref))

(use-package oer-reveal
 :straight t
 :config
   (require 'oer-reveal) 
   (setq oer-reveal-plugins t))

(use-package ox-spectacle
      :straight t)

(use-package org-tree-slide
     :straight t
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

(use-package ox-pandoc 
	   :straight t)

(use-package persistent-soft
  :straight t
  :config
(persistent-soft-store 'hundred 100 "mydatastore")
(persistent-soft-fetch 'hundred "mydatastore")    ; 100
(persistent-soft-fetch 'thousand "mydatastore"))   ; nil

;; quit and restart Emacs

(persistent-soft-fetch 'hundred "mydatastore")    ; 100

(use-package poly-markdown
  :straight t
  :config 
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode)))

;; It is not the same poetry package for writing poetry
;; it is an interface for python poetry package tool

   (use-package poetry
    :straight t)

;; This is the poetry-rhyme for writing poetry
;; you need to install the rhyme cli 
;; you have to install "~/Downloand/rhyme_4_poetry.el

(add-to-list 'load-path "~/.emacs.d/local-repo/poetry")
(require 'poetry)

;; (load-library "~/.emacs.d/local-repo/poetry.elc")

(use-package perspective
  :straight t)

(use-package powerline 
    :straight t)

(require 'powerline)
(powerline-default-theme)

  ;; (powerline-center-theme)
  ;; (setq powerline-center-default-separator 'wave))

(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
(setq prolog-system 'swi)
(setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
				("\\.m$" . mercury-mode))
			       auto-mode-alist))

;; (use-package quelpa-use-package
;;     :straight t
;;     :init
;;    (setq quelpa-update-melpa-p nil))

(use-package re-builder
 :straight t
 :config
 (setq reb-re-syntax 'string))

;; ;; Set your lisp system and, optionally, some contribs

  ;; ;; (setq inferior-lisp-program "/usr/bin/sbcl")
  ;; ;; Install sbcl from github sources and NOT with apt
  ;;     (setq inferior-lisp-program "/usr/local/bin/sbcl")

  ;;   ;; update this path to the correct location.

  ;;   ;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/elpa-src/slime-2.23/")

  ;;   ;; (add-to-list 'load-path "~/.emacs.d/elpa/slime-repl-ansi-color-20190426.1414/")

  ;;   (add-to-list 'load-path "~/.emacs.d/straight/repos/slime/")

  ;;   (require 'slime-autoloads)

  ;;   (defun cliki:start-slime ()
  ;; 	(unless (slime-connected-p)
  ;; 	  (save-excursion (slime))))
  ;;   (add-hook 'slime-mode-hook 'cliki:start-slime)

  ;;   (eval-after-load "slime"
  ;;     '(progn
  ;;       ;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/elpa-src/slime-3.23/contrib/")
  ;;       ;; (add-to-list 'load-path "~/.emacs.d/elpa/slime-20190319.930/contrib")
  ;;       (add-to-list 'load-path "~/.emacs.d/straight/build/slime/contrib/")
  ;;        (slime-setup '(slime-fancy slime-banner))
  ;;       (setq slime-complete-symbol*-fancy t)
  ;;       (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)))

  ;;   (require 'slime-autoloads)
  ;;   (setq slime-contribs '(slime-repl))

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'yas-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)

(use-package slime
  :straight t
  :load-path
   ("~/.emacs.d/straight/repos/slime/")
  :config
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))
  (require 'slime-autoloads)

(use-package slime-company
  :straight t
  :init
    (require 'company)
    (slime-setup '(slime-fancy slime-company)))

;;    (global-set-key (kbd "M-x") 'smex)
;;    (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(use-package amx
 :straight t
 :config
  (amx-mode 1))

(defvar cyber-filelist nil "alist for files i need to open frequently. Key is a short abbrev string, Value is file path string.")

(setq cyber-filelist
      '(
	("init.el" . "~/.emacs.d/init.el" )
	("init.org" . "~/.emacs.d/init.org")
	("dotfiles" . "~/.dotfiles/")
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



;; (setq shackle-rules
;;      '(((svg-2048-mode circe-query-mode) :same t)
;;        ("*Help*" :align t :select t)
;;        ("\\`\\*helm.*?\\*\\'" :regexp t :align t)
;;        ((compilation-mode "\\`\\*firestarter\\*\\'"
;; 	 "\\`\\*magit-diff: .*?\\'") :regexp t :noselect t)
;;        ("\\`\\*cider-repl .*" :regexp t :align t :size 0.2)
;;        ((inferior-scheme-mode "*shell*" "*eshell*") :popup t))
;;       shackle-default-rule '(:select t)
;;       shackle-default-size 0.4
;;       shackle-inhibit-window-quit-on-same-windows t)

(use-package synonyms
  :straight t
  :disabled
  :init
  :config
  (setq synonyms-file "~/thesaurus/mthesaur.txt")
  (setq synonyms-file "~/thesaurus/brazilian-synonyms.txt")
  (setq synonyms-cache-file "~/thesaurus/thes.cache")
  (global-set-key (kbd "C-*") 'synonyms))

;;  (evil-leader/set-key "sy" 'synonyms))

(use-package powerthesaurus
  :straight t
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
    (global-set-key (kbd "C-M-x") 'powerthesaurus-lookup-word-at-point)
    (global-set-key (kbd "C-M-y") 'powerthesaurus-lookup-word))

;;  (evil-leader/set-key "s" 'powerthesaurus-lookup-word-at-point)
;;  (evil-leader/set-key "S" 'powerthesaurus-lookup-word))

(use-package tramp
      :init
      (setq tramp-default-method "ssh")
      (setq password-cache-expiry nil)
      :config

      (add-to-list 'tramp-remote-path "~/"))

(use-package treemacs
  :straight t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-follow-delay             0.2
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-desc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :straight t)

(use-package treemacs-projectile
  :after treemacs projectile
  :straight t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :straight t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :straight t)

;; (add-to-list 'auto-mode-alist (cons "\\.paren\\'" 'lisp-mode))
;; (add-hook 'lisp-mode-hook
;; 	  #'(lambda ()
;; 	      (when (and buffer-file-name
;; 			 (string-match-p "\\.paren\\>" buffer-file-name))
;; 		(unless (slime-connected-p)
;; 		  (save-excursion (slime)))
;; 		(trident-mode +1))))

;;     ;; (use-package :parenscript)

;;     ;; issue this command in the REPl:
;;     ;; (ql:quickload :parenscript)
;;     ;; Then you can use "trident-expand-buffer" 
;;     ;; etc...

(use-package unicode-fonts
 :straight t
 :config
 (unicode-fonts-setup))

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

(autoload 'wl "wl" "Wanderlust" t)

;; apt install bbdb 


;; (autoload 'wl "wl" "Wanderlust" t)

;;; bbbd for managing address book on wanderlust
;;; https://emacs-fu.blogspot.com.br/2009/08/managing-e-mail-addresses-with-bbdb.html

(setq bbdb-file "~/.emacs.d/bbdb")           ;; keep ~/ clean; set before loading
;; (bbdb-initialize)
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

(when (fboundp 'winner-mode)
     (winner-mode 1))

(add-to-list 'load-path "~/.emacs.d/local-repo/youtube-dl-emacs")
(require 'youtube-dl)

;;    (use-package elisp
;;      :hook
;;      (after-save . check-parens)
;;      )

    (use-package highlight-defined
      :straight t
      :custom
      (highlight-defined-face-use-itself t)
      :hook
      (emacs-lisp-mode . highlight-defined-mode))

    (use-package highlight-quoted
      :straight t
      :hook
      (emacs-lisp-mode . highlight-quoted-mode))

    (use-package eros
      :straight t
      :hook
      (emacs-lisp-mode . eros-mode))

    (use-package suggest
      :straight t
      :defer t)

    (use-package ipretty
      :straight t
      :config
      (ipretty-mode 1))

    (use-package nameless
      :straight t
      :hook
      (emacs-lisp-mode .  nameless-mode)
      :custom
      (nameless-global-aliases '())
      (nameless-private-prefix t))

    ;; bind-key can't bind to keymaps
    (use-package erefactor
      :straight t
      :defer t)

    (use-package flycheck-package
      :straight t
      :defer t
      :after flycheck
      (flycheck-package-setup))

  ;; If emacs does not work because of 
  ;; Dash package complaint, install it with
  ;; apt install dash-el - then install it with
  ;; Alt-x package-reinstall RET dash RET and remove 
  ;; it again with "apt purge dash-el" 

 (use-package dash
   :straight t
   :custom
   (dash-enable-fontlock t))

(use-package net-utils
  :straight t
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

(require 'saveplace)
(save-place-mode 1)

(use-package shell-pop
:straight t
  :bind (("C-t" . shell-pop))
  :config
  (setq shell-pop-shell-type (quote ("ehell" "eshell" (lambda nil (eshell)))))
  (setq shell-pop-term-shell "eshell")
  ;; need to do this manually or not picked up by `shell-pop'
  (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type))

(use-package simple-mpc
 :straight t)

(use-package command-log-mode
   :ensure t
   :commands (command-log-mode global-command-log-mode)
   :bind ("C-c o" . clm/toggle-command-log-buffer))

(use-package circe
    :straight t
    :bind ("<S-f2>" . circe-init))

    ;; (use-package sauron-circe
    ;; straight t quelpa
    ;; :quelpa (sauron-circe :repo "seblemaguer/sauron-circe" :fetcher github)
    ;; :after sauron
    ;; :config
    ;; (sauron-circe-start))

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

     ;;  :channels ("#alsa" "#bash" "#badrock" "#c" "#clnoobs" "#clojure" "#clojure-beginners" "#clschool" "#coreboot" "#debian" "#debian-offtopic" "#devuan" "#emacs" "#emacs-es" "#erc" "#evil-mode " "#filmsbykris" "#freebsd" "#freedos" "#git" "#gitlab" "#guix" "#hardware" "#haskell" "#i3" "#javascript" "#julia" "#latex" "#libreoffice" "#lisp" "#lisp-es" "#lispcafe" "#lispweb" "#maria" "#math" "#matrix"  "#maxima" "#mpd" "#mysql" "#neomutt" "#oauth" "#org-mode" "#pcbsd" "#physics" "#plasma" "#prolog" "#python" "#qtox" "#ranger" "#regex" "#ring" "#sbcl" "#scala" "#slime" "#startups" "#sword" "#tmux" "#trueos" "#vim" "#vimus" "#wanderlust" "#weechat" "#xfce" "#xiphos")

       :nickserv-password my-nickserv-password)))

(use-package emms
 :straight t)

(add-to-list 'load-path "~/.emacs.d/local-repo/emms-get-lyrics/")
(require 'emms-get-lyrics)

(use-package emms-player-simple-mpv
   :straight t
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

  (use-package emms-mark-ext :straight t)



(add-to-list 'load-path "~/.emacs.d/local-repo/gedcom")

(autoload 'gedcom-mode "gedcom")
(setq auto-mode-alist (cons '("\\.ged$" . gedcom-mode) auto-mode-alist))

(use-package org-chef
  :straight t)

(use-package ox-hugo
  :straight t   
  :after ox)

 (require 'ox-hugo)
 (require 'org-hugo-auto-export-mode)

;;  (use-package org-capture
;;    straight t nil
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

;; (use-package easy-hugo
;;   :custom
;;   (easy-hugo-basedir "~/Personal/devel/zzamboni.org/zzamboni.org/")
;;   (easy-hugo-url "http://zzamboni.org/")
;;   (easy-hugo-previewtime "300")
;;   ;;(define-key global-map (kbd "C-c C-e") 'easy-hugo)
;;   )

(setq org-refile-targets '((nil :maxlevel . 9)
                                (org-agenda-files :maxlevel . 9)))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling

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

     ("k" "Cliplink capture" entry (file "")
          "* TODO %(org-cliplink-capture) \n  SCHEDULED: %t\n" :empty-lines 1)

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

;; (unless (package-installed-p 'hyperbole)
;;   (package-refresh-contents)	
;;   (package-install 'hyperbole))
;; (require 'hyperbole)

(setq lpr-command "gtklp")
(setq ps-lpr-command "gtklp")

(load "server")
 (unless (server-running-p)
 (server-start))

(setq epg-gpg-program "usr/bin/gpg2")
(setq epa-file t)
(epa-file-enable)
(setq epa-file-select-keys nil)
(setq epa-pinentry-mode 'loopback)
(setq pinentry-start t)

(setq bbdb-north-american-phone-numbers-p nil)
 (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
 (setq bbdb-file "~/.emacs.d/bbdb")
 (setq bbdb-send-mail-style 'gnus)
 (setq bbdb-complete-name-full-completion t)
 (setq bbdb-completion-type 'primary-or-name)
 (setq bbdb-complete-name-allow-cycling t)
 (setq
 bbdb-offer-save 1
 bbdb-use-pop-up t
;; bbdb-electric-p t
 bbdb-popup-target-lines  1
 )

(add-to-list 'load-path "~/.emacs.d/local-repo/ipp")
(require 'ipp)

(use-package linguistic 
 :straight t)

(use-package org-drill
  :straight t)

(use-package org-drill-table
  :straight t)

;; (use-package memrise
;;   :quelpa (memrise
;; 	   :fetcher github
;; 	   :repo "SavchenkoValeriy/memrise.el"))

;; (setq memrise-sync-requests t)

;;   (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3/")
;;     (setq gnutls-verify-error t)
;;     (setq tls-checktrust t)

       (toggle-debug-on-error)

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

;; Mouse scrolling
  (setq mouse-wheel-scroll-amount '(1)
	mouse-wheel-progressive-speed nil 
	scroll-conservatively 101
	hscroll-margin 1
	hscroll-step 1
	scroll-preserve-screen-position t) 

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
     :straight t
     :config
      (which-key-mode t))

(use-package key-chord
  :ensure t
  :init
  (progn 
    (setq key-chord-two-keys-delay .015
          key-chord-one-key-delay .020)
    (key-chord-mode 1)
    (key-chord-define-global "cg" 'undo)
    (key-chord-define-global "yp" 'other-window)
    (key-chord-define-global ";0" 'delete-window)
    (key-chord-define-global ";1" 'delete-other-windows)
    (key-chord-define-global ";2" 'split-window-below)
    (key-chord-define-global ";3"  'split-window-right)
    (key-chord-define-global ",." 'beginning-of-buffer)
    (key-chord-define-global ".p" 'end-of-buffer)
    (key-chord-define-global "jw" 'avy-goto-word-or-subword-1)
    (key-chord-define-global "jc" 'avy-goto-char)
    (key-chord-define-global "jl" 'avy-goto-line)
    ;; (key-chord-define-global "jb" 'ace-jump-buffer)
    ;; (key-chord-define-global "jo" 'ace-jump-buffer-other-window)
    (key-chord-define-global "'l" 'ido-switch-buffer)
    (key-chord-define-global "'-" 'smex)
    (key-chord-define-global ",r" 'find-file)
    (key-chord-define-global ".c" 'ido-dired)
    (key-chord-define-global "0r" ")")
    (key-chord-define-global "1'" "!")
    (key-chord-define-global "2," "@")
    (key-chord-define-global "3." "#")
    (key-chord-define-global "4p" "$")
    (key-chord-define-global "5y" "%")
    (key-chord-define-global "6y" "^")
    (key-chord-define-global "7f" "&")
    (key-chord-define-global "8g" "*")
    (key-chord-define-global "9c" "(")
    (key-chord-define-global "-l" "_")
    (key-chord-define emacs-lisp-mode-map "7f" "&optional ")))

(use-package better-shell
:straight t
:bind (("C-'" . better-shell-shell)
("C-;" . better-shell-remote-open)))

(use-package virtualenvwrapper
:straight t
:config
(venv-initialize-interactive-shells)
(venv-initialize-eshell))

(setq display-time-default-load-average nil)
(setq display-time-interval 1)
(setq display-time-format "%d|%m-%a|%r")
(display-time-mode +1)

(setq truncate-partial-width-windows 1)
(setq truncate-lines 1)
(global-set-key (kbd "C-x t") 'toggle-truncate-lines)

;; (evil-define-key 'normal 'global
;;   ;; select the previously pasted text
;;   "gp" "`[v`]"
;;   ;; run the macro in the q register
;;   "Q" "@q")

;; (evil-define-key 'visual 'global
;;   ;; run macro in the q register on all selected lines
;;   "Q" (kbd ":norm @q RET")
;;   ;; repeat on all selected lines
;;   "." (kbd ":norm . RET"))

;; ;; alternative command version
;; (defun my-norm@q ()
;;   "Apply macro in q register on selected lines."
;;   (interactive)
;;   (evil-ex-normal (region-beginning) (region-end) "@q"))

;;   (evil-define-key 'visual 'global "Q" #'my-norm@q)



;; (add-to-list 'load-path "~/.emacs.d/local-repo/zoom-frm")
;; (require 'zoom-frm)

(use-package openwith
 :straight t
 :config
(setq openwith-associations '(("\\.mp4\\'" "smplayer" (file)))))

;; (use-package org-mind-map
;;   :init
;;   (require 'ox-org)
;;   :straight t
;;   ;; Uncomment the below if 'ensure-system-packages` is installed
;;   ensure-system-package (gvgen . graphviz)
;;   :config
;;      (setq org-mind-map-engine "dot")    ; Default. Directed Graph
;;   ;; (setq org-mind-map-engine "neato")  ; Undirected Spring Graph
;;   ;; (setq org-mind-map-engine "twopi")  ; Radial Layout
;;      (setq org-mind-map-engine "fdp")    ; Undirected Spring Force-Directed
;;   ;; (setq org-mind-map-engine "sfdp")   ; Multiscale version of fdp for the layout of large graphs
;;   ;; (setq org-mind-map-engine "circo")  ; Circular Layout
;;      )

 (use-package org-mind-map
     :straight t
     :init
     (require 'ox-org))

(use-package php-mode
    :straight t)

  (use-package ac-php
    :straight t)

(use-package phpunit  
    :straight t
    :config
    (setq phpunit-configuration-file "phpnit.xml")
    (setq phpunit-root-directory "./"))

  (use-package php-auto-yasnippets
    :straight t)

(setq php-ext-path "~/.emacs.d/local-repo/php-ext/")
(load (concat php-ext-path "php-ext.el"))

   ;; (add-to-list 'load-path "~/.emacs.d/local-repo/php-ext")
   ;; (require 'php-ext)

(use-package web-mode
  :straight t
  :mode
  ("\\.phtml\\'" "\\.tpl\\.php\\'" "\\.[agj]sp\\'" "\\.as[cp]x\\'"
  "\\.erb\\'" "\\.mustache\\'" "\\.djhtml\\'" "\\.html?\\'")

  :init
  (setq web-mode-markup-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-css-indent-offset 2

        web-mode-enable-auto-pairing t
        web-mode-enable-auto-expanding t
        web-mode-enable-css-colorization t)

  :config
  ;; Template
  (setq web-mode-engines-alist
        '(("php"    . "\\.phtml\\'")
          ("blade"  . "\\.blade\\."))
        )

  )

(use-package web-beautify
  :straight t
  :commands (web-beautify-css
             web-beautify-css-buffer
             web-beautify-html
             web-beautify-html-buffer
             web-beautify-js
             web-beautify-js-buffer))

(use-package web-completion-data :straight t)
(use-package web-mode-edit-element :straight t)

(use-package impatient-mode 
:straight t)

(use-package emmet-mode 
:straight t)

(use-package ripgrep
  :straight t)

(add-hook 'shell-mode-hook 'yas-minor-mode)
(add-hook 'shell-mode-hook 'flycheck-mode)
(add-hook 'shell-mode-hook 'company-mode)

(defun shell-mode-company-init ()
  (setq-local company-backends '((company-shell
                                  company-shell-env
                                  company-etags
                                  company-dabbrev-code))))

(use-package company-shell
  :ensure t
  :config
    (require 'company)
    (add-hook 'shell-mode-hook 'shell-mode-company-init))

(use-package sudo-edit
  :ensure t
  :bind
    ("s-e" . sudo-edit))

(use-package diminish
  :ensure t
  :init
  (diminish 'which-key-mode)
  (diminish 'linum-relative-mode)
  (diminish 'hungry-delete-mode)
  (diminish 'visual-line-mode)
  (diminish 'subword-mode)
  (diminish 'beacon-mode)
  (diminish 'centered-window-mode)
  (diminish 'irony-mode)
  (diminish 'page-break-lines-mode)
  (diminish 'auto-revert-mode)
  (diminish 'rainbow-delimiters-mode)
  (diminish 'rainbow-mode)
  (diminish 'yas-minor-mode)
  (diminish 'flycheck-mode)
  (diminish 'helm-mode)
  (diminish 'abbrev-mode)
  (diminish 'text-scale-mode)
  (diminish 'eldoc-mode)
  (diminish 'undo-tree-mode)
  (diminish 'auto-fill-mode)
  (diminish 'org-indent-mode)
  (diminish 'company-mode)
  (diminish 'flycheck-mode)
  (diminish 'flyspell-mode))

(straight-use-package 'debpaste)
(straight-use-package 'ix)

(use-package smartparens
  :straight t
  :config
  ;; Activate smartparens globally
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)

  ;; Activate smartparens in minibuffer
  (add-hook 'eval-expression-minibuffer-setup-hook #'smartparens-mode)

  ;; Do not pair simple quotes
  (sp-pair "'" nil :actions :rem))

(straight-use-package 'free-keys)




