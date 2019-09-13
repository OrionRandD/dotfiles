
;; Very good emacs init.el
;; source https://framagit.org/gabylaunay/emacs-config/raw/master/init.el

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0c58b8e826a6ae7f3b7f5cc08a4ad750d2df4441fb85e08d3f387b0823fd6960" "fa1cc429fc7f6d53a9158ac5903645a9ddd5bad63d6de361a10c915fc546399d" "ba210af726d30f194443ae7ebce0d5988f2fd1e18bcee2482c3aeda9b9f033cd" "688edc8fafb10624d40e59b44e90507dc1745f1174459c9c9da833bb1a74cd38" "173de0989b6bc3fb2d2b8ea181052d68b877285ec4581924f7d7b27dc333c769" "d09467d742f713443c7699a546c0300db1a75fed347e09e3f178ab2f3aa2c617" "fdb638d754fb63902ff88ed0f7c414d27fd1f181039c41554ef4a1fdee3b2bf0" default)))
 '(package-selected-packages
   (quote
    (helm-dash ox-pandoc flycheck-grammalecte helm-gitignore volatile-highlights spaceline-all-the-icons all-the-icons systemd shut-up helpful mw-thesaurus powerthesaurus slime minimap esup company-reftex vlf evil-cleverparens powerline auctex yasnippet magit evil s autothemer company-auctex company-shell ein scad-preview scad-mode org-wild-notifier xterm-color camcorder fasd yaml-mode memory-usage visual-fill-column define-word suggest diff-hl web-mode wordnut use-package swoop pyvenv pdf-tools parsebib paradox org-plus-contrib org-autolist multi-term magit-lfs htmlize hlinum highlight-indentation helm-tramp helm-swoop helm-google helm-github-stars helm-flyspell helm-flx helm-descbinds helm-css-scss helm-company google-translate google github-browse-file ghci-completion find-file-in-project f expand-region evil-visualstar evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lion evil-leader evil-indent-plus evil-exchange evil-escape emms elfeed-org el-get dired-narrow delight cython-mode css-eldoc company-web company-statistics company-quickhelp company-math biblio bash-completion avy auto-dictionary auctex-latexmk adaptive-wrap)))
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((eval add-hook
           (quote after-save-hook)
           (quote org-agenda-maybe-redo)
           nil t)
     (encoding . utf-8)
     (auto-dictionary-mode)
     (ispell-local-dictionnary . "fr")
     (auto-dict-mode))))
 '(shr-max-image-proportion 0.5))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Garbage collector
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;no gc at startup
(setq gc-cons-threshold 100000000)
;; restore after startup
(add-hook 'after-init-hook #'(lambda ()
                               (setq gc-cons-threshold 800000)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package management
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package sources
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ;; ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ))
(package-initialize)
;; command to install package automaticly through elpa
(defun require-package (package)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

;; use-package
(require-package 'use-package)

;; upgrade all packages (elpa + el-get)
(defun auto-upgrade()
  "Upgrade all packages, no questions asked."
  (interactive)
  ;; (save-window-excursion
  (paradox-upgrade-packages)
  (el-get-update-all t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; El-get
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; el-get
(use-package el-get
  :ensure
  :init
  (require 'el-get)
  :config
  (setq el-get-notify-type 'message))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Classic config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fonts
;; (add-to-list 'default-frame-alist '(font . "Liberation Mono-10:antialias=1"))
(add-to-list 'default-frame-alist '(font . "dejavu sans Mono-11:antialias=1"))
;; (add-to-list 'default-frame-alist '(font . "bitstream vera sans Mono-9:antialias=1"))
;; (add-to-list 'default-frame-alist '(font . "inconsolata:antialias=1"))
;; Global modes
(global-linum-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)
(tooltip-mode 0)
(scroll-bar-mode 0)
(global-hl-line-mode 1)
(global-visual-line-mode 1)
(blink-cursor-mode 0)  ; cursor never blink
(mouse-wheel-mode 0) ; no mouse scrolling
(setq-default indent-tabs-mode nil) ;; don't use tabs to indent
;; GUI config
(setq inhibit-default-init t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq message-log-max t)
(setq disabled-command-function nil)
(setq ring-bell-function 'ignore) ; remove annoying ring bell
(setq use-dialog-box nil) ;; don't make dialogs, ask in emacs
(defalias 'yes-or-no-p 'y-or-n-p) ;; remove annoying yes or no question
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; Scroll
(setq scroll-margin 10               ;; nice scroll
      scroll-conservatively 100
      scroll-up-aggressively 0.7
      scroll-down-aggressively 0.7
      scroll-preserve-screen-position t
      auto-window-vscroll nil
      hscroll-margin 1
      hscroll-step 1)
;; Encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; Backups
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
;; PATHS
(setenv "PATH" (concat (expand-file-name "~/.local/bin:") (getenv "PATH")))
;; Others
(setq sentence-end-double-space nil)  ; to get correct sentence motion
(setq recentf-max-saved-items 1000)
(setq load-prefer-newer t) ; prefer new el (and recompile them to .elc)
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; remove trailing whitespace and lines
(define-key key-translation-map (kbd "ESC") (kbd "C-g")) ;; remove ESC as a prefix command

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs server
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; shutdown (nicely) the current emacs server
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server."
  (interactive)
  (save-some-buffers t)
  (kill-emacs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Deactivate garbage collector while in minibuffer (performance improvement)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))
(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))
(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color Theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package autothemer
  :ensure)
(use-package darktooth-theme
  :init
  (el-get-bundle darktooth
    :url "https://github.com/emacsfodder/emacs-theme-darktooth.git")
  :config
  (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/el-get/darktooth/"))
  (load-theme 'darktooth)
  ;; change annoying hl-line background color
  (set-face-background 'hl-line "grey20"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Cask
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package cask
;;   :ensure)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dependencies
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package s :ensure)  ;; needed by elpy
(use-package parsebib :ensure)  ;; needed by bibtex-completion
(use-package f :ensure)  ;; needed by helm-bibtex


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package evil
  :ensure
  :after evil-leader
  :config
  (evil-mode t)
  (add-hook 'evil-jumps-post-jump-hook 'recenter)
  (setq evil-symbol-word-search t ; make '*' and '#' work with symbols
        evil-move-cursor-back nil ; no return when leaving editing mode
        evil-insert-state-message nil
        evil-normal-state-message nil
        evil-visual-state-message nil
        evil-emacs-state-message nil
        evil-motion-state-message nil
        evil-replace-state-message nil
        evil-jumps-cross-buffers nil)
  (defun evil-scroll-up-half ()
    (interactive)
    (evil-set-jump)
    (evil-scroll-up 0))
  (defun evil-scroll-down-half ()
    (interactive)
    (evil-set-jump)
    (evil-scroll-down 0))
  (defun evil-scroll-up-half-other-window ()
    (interactive)
    (scroll-other-window (/ (- 1 (window-height)) 2)))
  (defun evil-scroll-down-half-other-window ()
    (interactive)
    (scroll-other-window (/ (1- (window-height)) 2)))
  :bind (([?\r] . evil-ret-and-indent) ; auto-indent
         :map evil-normal-state-map
         ;; set j and k to go through visual lines and remove use of arrows
         ("j" . evil-next-visual-line)
         ("k" . evil-previous-visual-line)
         ([up] . undefined)
         ([down] . undefined)
         ([left] . undefined)
         ([right] . undefined)
         ("C-k" . evil-scroll-up-half)
         ("C-j" . evil-scroll-down-half)
         ("C-S-j" . evil-scroll-down-half-other-window)
         ("C-S-k" . evil-scroll-up-half-other-window)
         :map evil-visual-state-map
         ("j" . evil-next-visual-line)
         ("k" . evil-previous-visual-line)
         ([up] . undefined)
         ([down] . undefined)
         ([left] . undefined)
         ([right] . undefined)
         ("C-k" . evil-scroll-up-half)
         ("C-j" . evil-scroll-down-half)
         ("C-S-j" . evil-scroll-down-half-other-window)
         ("C-S-k" . evil-scroll-up-half-other-window)
         :map evil-motion-state-map
         ("j" . evil-next-visual-line)
         ("k" . evil-previous-visual-line)
         ([up] . undefined)
         ([down] . undefined)
         ([left] . undefined)
         ([right] . undefined)
         ("C-k" . evil-scroll-up-half)
         ("C-j" . evil-scroll-down-half)
         ("C-S-j" . evil-scroll-up-half-other-window)
         ("C-S-k" . evil-scroll-down-half-other-window)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dvorak
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar dvorak-p nil
  "Is dvorak mode activated.")

(defun switch-to-dvorak ()
  ""
  (interactive)
  (cond
   (dvorak-p
    (evil-global-set-key 'normal (kbd "h") nil)
    (evil-global-set-key 'normal (kbd "s") nil)
    (evil-global-set-key 'normal (kbd "t") nil)
    (evil-global-set-key 'normal (kbd "n") nil)
    (setq evil-escape-key-sequence "df")
    (define-key global-map (kbd "M-x") 'helm-M-x)
    (setq dvorak-p nil)
    (message "Deactivated Dvorak mode"))
   (t
    (evil-global-set-key 'normal (kbd "h") 'evil-backward-char)
    (evil-global-set-key 'normal (kbd "s") 'evil-forward-char)
    (evil-global-set-key 'normal (kbd "t") 'evil-next-visual-line)
    (evil-global-set-key 'normal (kbd "n") 'evil-previous-visual-line)
    (setq evil-escape-key-sequence "eu")
    (define-key global-map (kbd "M-q") 'helm-M-x)
    (setq dvorak-p t)
    (message "Activated Dvorak mode"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil-leader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package evil-leader
  :ensure
  :init
  (global-evil-leader-mode)
  :config
  (evil-leader/set-leader ",")
  (setq evil-leader/no-prefix-mode-rx '("magit-.*-mode" "gnus-.*-mode" "pdf-view-mode"))
  :bind (:map evil-leader--default-map
              ("gd" . evil-goto-definition)
              ("gb" . pop-tag-mark)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil-escape
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package evil-escape
  :ensure
  :after evil
  :config
  (evil-escape-mode t)
  (setq evil-escape-delay 0.2)
  (setq evil-escape-unordered-key-sequence nil)
  (setq evil-escape-key-sequence "df")
  ;; Deactivate ESC key
  (global-set-key (kbd "<escape>") nil)
  (evil-global-set-key 'visual (kbd "<escape>") nil)
  (evil-global-set-key 'motion (kbd "<escape>") nil)
  (evil-global-set-key 'insert (kbd "<escape>") nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil special modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO : Take a look from time to time for new supported modes
(use-package evil-special-modes
  :init
  (el-get-bundle evil-special-modes
    :url "https://www.github.com/Ambrevar/evil-special-modes.git")
  :config
  (require 'evil-minibuffer)
  (evil-minibuffer-init)
  (with-eval-after-load 'calendar
    (require 'evil-calendar)
    (evil-calendar-set-keys))
  (with-eval-after-load 'cus-edit
    (require 'evil-custom)
    (evil-custom-set-keys))
  (with-eval-after-load 'debug
    (require 'evil-debugger)
    (evil-debugger-set-keys))
  (with-eval-after-load 'diff-mode
    (require 'evil-diff-mode)
    (evil-diff-mode-set-keys))
  (with-eval-after-load 'eshell
    (require 'evil-eshell)
    (evil-eshell-set-keys))
  (with-eval-after-load 'help
    (require 'evil-help)
    (evil-help-set-keys))
  (with-eval-after-load 'image-mode
    (require 'evil-image)
    (evil-image-set-keys))
  ;; (with-eval-after-load 'info
  ;;   (require 'evil-info)
  ;;   (evil-info-set-keys))
  (with-eval-after-load 'man
    (require 'evil-man)
    (evil-man-set-keys))
  (with-eval-after-load 'package
    (require 'evil-package)
    (evil-package-set-keys))
  (with-eval-after-load 'proced
    (require 'evil-proced)
    (evil-proced-set-keys))
  (with-eval-after-load 'profiler
    (require 'evil-profiler)
    (evil-profiler-set-keys))
  (with-eval-after-load 'term
    (require 'evil-term)
    (evil-term-set-keys))
  (with-eval-after-load 'woman
    (require 'evil-woman)
    (evil-woman-set-keys)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil-numbers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package evil-numbers
  :ensure
  :after evil
  :bind (:map evil-leader--default-map
              ("+" . evil-numbers/inc-at-pt)
              ("-" . evil-numbers/dec-at-pt)
              ("+" . evil-numbers/inc-at-pt)
              ("-" . evil-numbers/dec-at-pt)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil-matchit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package evil-matchit
  :ensure
  :after evil
  :config
  (global-evil-matchit-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil-indent-plus
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package evil-indent-plus
  :ensure
  :after evil
  :bind (:map evil-inner-text-objects-map
              ("i" . evil-indent-plus-i-indent)
              ("I" . evil-indent-plus-i-indent-up)
              :map evil-outer-text-objects-map
              ("i" . evil-indent-plus-a-indent)
              ("I" . evil-indent-plus-a-indent-up)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil-visualstar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package evil-visualstar
  :ensure
  :after evil
  :config
  (global-evil-visualstar-mode)
  (setq evil-visualstar/persistent t)
  :bind (:map evil-visual-state-map
              ("*" . evil-visualstar/begin-search-forward)
              ("µ" . evil-visualstar/begin-search-backward)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil-exchange
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; bound to "gx", with "gX" to cancel
(use-package evil-exchange
  :ensure
  :after evil
  :config
  (evil-exchange-install))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil-surround
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package evil-surround
  :disabled
  :ensure
  :after evil
  :config
  (global-evil-surround-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil-args
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO : not sure that it deserves a pull request...
(use-package evil-args
  :init
  (el-get-bundle evil-args
    :url "https://www.github.com/galaunay/evil-args.git"
    :features evil-args)
  :after evil
  :bind (:map evil-inner-text-objects-map
              ("a" . evil-inner-arg)
              :map evil-outer-text-objects-map
              ("a" . evil-outer-arg)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil-textobj-anyblock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package evil-textobj-anyblock
  :init
  (el-get-bundle evil-textobj-anyblock
    :url "https://github.com/noctuid/evil-textobj-anyblock.git"
    :features evil-textobj-anyblock)
  :after evil
  :config
  (setq evil-textobj-anyblock-blocks
        '(("(" . ")")
          ("{" . "}")
          ("\\[" . "\\]")
          ("<" . ">")
          ("\"" . "\"")
          ("`" . "`")
          ("“" . "”")))
  :bind (:map evil-inner-text-objects-map
              ("b" . evil-textobj-anyblock-inner-block)
              :map evil-outer-text-objects-map
              ("b" . evil-textobj-anyblock-a-block)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil-little-sentences
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-define-text-object evil-outer-little-sentence (count &optional beg end type)
  "Select outer little sentences"
  (let ((beg) (beg-del) (end) (end-del) (curr (point))
        (ls-opening "\\(,\\|\\.\\|^\\|:\\)")
        (ls-closing "\\(,\\|\\.\\|$\\|:\\)"))
    (save-excursion
      ;; Get region and delimiters
      (re-search-backward ls-opening nil t)
      (setq beg-del (match-string 0))
      (setq beg (point))
      (goto-char curr)
      (re-search-forward ls-closing nil t)
      (setq end-del (match-string 0))
      (setq end (- (point) 1))
      ;; adapt in case of begin of line
      (when (string= beg-del "")
        (re-search-forward "[^\s-]" nil t)
        (setq end (- (point) 1)))
      ;; adapt in case of end of line
      (when (string= end-del "")
        (setq end (+ end 1))))
    (evil-range beg end)))
(evil-define-text-object evil-inner-little-sentence (count &optional beg end type)
  "Select inner little sentences"
  (let ((beg) (beg-del) (end) (end-del) (curr (point))
        (ls-opening "\\(,\\|\\.\\|^\\|:\\)")
        (ls-closing "\\(,\\|\\.\\|$\\|:\\)"))
    (save-excursion
      ;; Get region and delimiters
      (re-search-backward ls-opening nil t)
      (setq beg-del (match-string 0))
      (setq beg (point))
      (goto-char curr)
      (re-search-forward ls-closing nil t)
      (setq end-del (match-string 0))
      (setq end (- (point) 1))
      ;; adapt to not take first deliliter
      (when (not (string= beg-del ""))
        (goto-char (+ beg 1))
        (re-search-forward "[^\s-]" nil t)
        (setq beg (- (point) 1)))
      ;; adapt in case of end of line
      (when (string= end-del "")
        (setq end (+ end 1))))
    (evil-range beg end)))
(define-key evil-outer-text-objects-map "S" 'evil-outer-little-sentence)
(define-key evil-outer-text-objects-map "s" 'evil-inner-little-sentence)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil-lion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for alignement (use 'gl' for left align and 'gL' for right align
(use-package evil-lion
  :defer
  :ensure
  :config
  (evil-lion-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Minibuffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; todo : add ":" and "/" (related to evil ?)
(minibuffer-electric-default-mode 1)
(mapc (lambda (keymap)
        (define-key (eval keymap) (kbd "M-j") 'next-line-or-history-element)
        (define-key (eval keymap) (kbd "M-k") 'previous-line-or-history-element))
      '(minibuffer-local-map
        minibuffer-local-ns-map
        minibuffer-local-completion-map
        minibuffer-local-must-match-map
        minibuffer-inactive-mode-map
        minibuffer-local-shell-command-map
        minibuffer-local-isearch-map
        evil-ex-map
        evil-ex-search-keymap
        evil-ex-completion-map))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Save place
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package saveplace
  :ensure
  :config
  (save-place-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-set-initial-state 'Custom-mode 'normal)
(add-hook 'custom-mode-hook (lambda() (setq-local yas-dont-activate t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Window management
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package window
  :init
  (defun goto-message-buffer (&optional visit)
    "Goto the message buffer"
    (interactive)
    (let ((cur-buf (current-buffer)))
      (switch-to-buffer-other-window "*Messages*")
      (goto-char (point-max))
      (when (not visit)
        (switch-to-buffer-other-window cur-buf))))
  (defun show-message-buffer ()
    "Show the message buffer"
    (interactive)
    (goto-message-buffer t))
  (defun goto-same-buffer ()
    "Open a new window with the same buffer"
    (interactive)
    (switch-to-buffer-other-window (current-buffer)))
  (defun toggle-window-split ()
    (interactive)
    (if (= (count-windows) 2)
        (let* ((this-win-buffer (window-buffer))
               (next-win-buffer (window-buffer (next-window)))
               (this-win-edges (window-edges (selected-window)))
               (next-win-edges (window-edges (next-window)))
               (this-win-2nd (not (and (<= (car this-win-edges)
                                           (car next-win-edges))
                                       (<= (cadr this-win-edges)
                                           (cadr next-win-edges)))))
               (splitter
                (if (= (car this-win-edges)
                       (car (window-edges (next-window))))
                    'split-window-horizontally
                  'split-window-vertically)))
          (delete-other-windows)
          (let ((first-win (selected-window)))
            (funcall splitter)
            (if this-win-2nd (other-window 1))
            (set-window-buffer (selected-window) this-win-buffer)
            (set-window-buffer (next-window) next-win-buffer)
            (select-window first-win)
            (if this-win-2nd (other-window 1))))))
  :bind (:map evil-insert-state-map
              ("C-w" . nil)
              ("C-w t" . toggle-window-split)
              ("C-w C-t" . toggle-window-split)
              :map evil-normal-state-map
              ("C-w" . nil)
              ("C-w t" . toggle-window-split)
              ("C-w C-t" . toggle-window-split)
              :map evil-motion-state-map
              ("C-w" . nil)
              ("C-w t" . toggle-window-split)
              ("C-w C-t" . toggle-window-split)
              :map evil-emacs-state-map
              ("C-w" . nil)
              ("C-w t" . toggle-window-split)
              ("C-w C-t" . toggle-window-split)
              ;; ("C-w w" . evil-window-next)
              ;; ("C-w C-w" . evil-window-next)
              ;; ("C-w m" . goto-message-buffer)
              ;; ("C-w C-m" . goto-message-buffer)
              ;; ("C-w i" . goto-same-buffer)
              ;; ("C-w C-i" . goto-same-buffer)
              ;; ("C-w o" . delete-other-windows)
              ;; ("C-w C-o" . delete-other-windows)
              ;; ("C-w S-r"  . evil-window-rotate-upwards)
              ;; ("C-w c"  . evil-window-delete)
              ;; ("C-w C-c"  . evil-window-delete)
              ;; ("C-w s"  . evil-window-split)
              ;; ("C-w C-s"  . evil-window-split)
              ;; ("C-w v"  . evil-window-vsplit)
              ;; ("C-w C-v"  . evil-window-vsplit)
              ;; ("C-w t" . toggle-window-split)
              ;; ("C-w C-t" . toggle-window-split)
              ;; ("C-w a" . window-configuration-to-register)
              ;; ("C-w C-a" . window-configuration-to-register)
              ;; ("C-w j" . jump-to-register)
              ;; ("C-w C-j" . jump-to-register)
              ;; :map evil-normal-state-map
              ;; ("C-w m" . goto-message-buffer)
              ;; ("C-w C-m" . show-message-buffer)
              ;; ("C-w i" . goto-same-buffer)
              ;; ("C-w C-i" . goto-same-buffer)
              ;; ("C-w t" . toggle-window-split)
              ;; ("C-w C-t" . toggle-window-split)
              ;; ("C-w a" . window-configuration-to-register)
              ;; ("C-w C-a" . window-configuration-to-register)
              ;; ("C-w j" . jump-to-register)
              ;; ("C-w C-j" . jump-to-register)
              :map global-map
              ("C-w" . nil)
              ("C-w w" . other-window)
              ("C-w C-w" . other-window)
              ("C-w m" . goto-message-buffer)
              ("C-w C-m" . goto-message-buffer)
              ("C-w i" . goto-same-buffer)
              ("C-w C-i" . goto-same-buffer)
              ("C-w o" . delete-other-windows)
              ("C-w C-o" . delete-other-windows)
              ("C-w S-r" . evil-window-rotate-upwards)
              ("C-w c" . delete-window)
              ("C-w C-c" . delete-window)
              ("C-w s" . split-window-horizontally)
              ("C-w C-s" . split-window-horizontally)
              ("C-w v". split-window-vertically)
              ("C-w C-v" . split-window-vertically)
              ("C-w t" . toggle-window-split)
              ("C-w C-t" . toggle-window-split)
              ("C-w a" . window-configuration-to-register)
              ("C-w C-a" . window-configuration-to-register)
              ("C-w j" . jump-to-register)
              ("C-w C-j" . jump-to-register)
              ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Parentheses
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(evil-leader/set-key "mp" (lambda ()
                            (interactive)
                            (check-parens)
                            (message "No mismatch")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Indentation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun auto-indent-whole-buffer ()
  "Re-indent the whole buffer."
  (interactive)
  (save-excursion
    (evil-indent (point-min) (point-max))))
(evil-leader/set-key "=" 'auto-indent-whole-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Commenter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; nerd commenter
(use-package evil-nerd-commenter
  :ensure)
(use-package evilnc-comment-operator
  :init
  (el-get-bundle evil-comment-block
    :url "https://github.com/galaunay/evil-comment-block.git")
  :bind (:map evil-leader--default-map
              ("c" . evilnc-comment-operator)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Help mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key help-mode-map (kbd "<tab>") 'forward-button)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Info mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-leader/set-key "ha" 'info-apropos)
(evil-leader/set-key "hi" 'info)
(evil-define-key 'motion Info-mode-map
  ;; motion: Restore some Evil keys that got overriden.
  "w" 'evil-forward-word-begin
  "e" 'evil-forward-word-end
  "ge" 'evil-backward-word-end
  "gE" 'evil-backward-WORD-end
  "b" 'evil-backward-word-begin
  "gg" 'evil-goto-first-line
  "t" 'evil-find-char-to
  "T" 'evil-find-char-to-backward
  "f" 'evil-find-char
  "n" 'evil-search-next
  "?" 'evil-search-backward
  (kbd "<tab>") 'Info-next-reference
  (kbd "S-<tab>") 'Info-prev-reference
  ;; goto
  "gn" 'Info-goto-node
  "gt" 'Info-top-node
  "u" 'Info-up
  "gT" 'Info-toc
  "gf" 'Info-follow-reference
  ;; (kbd "C-o") 'Info-history-back
  ;; (kbd "C-i") 'Info-history-forward
  ;; "[" and "]" are Emacs default for fine-grained browsing.
  ;; We usually use "C-j"/"C-k" for that.
  (kbd "L") 'Info-history-forward
  (kbd "H") 'Info-history-back
  (kbd "K") 'Info-up
  ;; (kbd "M-w") 'Info-copy-current-node-name
  "p" nil

  ;; quit
  "q" 'Info-exit
  "ZQ" 'evil-quit
  "ZZ" 'Info-exit)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helpful mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package shut-up
  :ensure)
(use-package helpful
  :ensure
  :after shut-up
  :config
  (evil-set-initial-state 'helpful-mode 'motion)
  ;; Overwrite base describe functions
  (advice-add 'describe-variable :override #'helpful-variable)
  (advice-add 'describe-symbol :override #'helpful-symbol)
  (advice-add 'describe-variable :override #'helpful-variable)
  (advice-add 'describe-function :override #'helpful-function)
  (advice-add 'describe-key :override #'helpful-key)
  ;; keybinding
  (evil-define-key 'motion helpful-mode-map
    (kbd "TAB") 'forward-button
    (kbd "<backtab>") 'backward-button
    (kbd "RET") 'helpful-visit-reference
    (kbd "u") 'helpful-update
    (kbd "SPC") 'mini))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Calc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-leader/set-key "bc" 'quick-calc)
(evil-leader/set-key "bC" (lambda () (interactive) (quick-calc) (evil-paste-after 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Avy (move to)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package avy
  :ensure
  :bind (:map evil-normal-state-map
              ("gt" . evil-avy-goto-char-2)
              ("gr" . avy-goto-word-1)
              :map evil-visual-state-map
              ("gt" . evil-avy-goto-char-2)
              ("gr" . avy-goto-word-1)
              :map evil-operator-state-map
              ("gt" . evil-avy-goto-char-2)
              ("gr" . avy-goto-word-1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Line number
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package nlinum
  :disabled
  :ensure
  :config
  ;; Pre-compute line number
  (add-hook 'nlinum-mode-hook
            (lambda ()
              (unless (boundp 'nlinum--width)
                (setq nlinum--width
                      (length (number-to-string
                               (count-lines (point-min) (point-max))))))))
                                        ; fix bug with new frames
  (defun initialize-nlinum (&optional frame)
    (require 'nlinum)
    (add-hook 'prog-mode-hook 'nlinum-mode))
  (when (daemonp)
    (add-hook 'window-setup-hook 'initialize-nlinum)
    (defadvice make-frame (around toggle-nlinum-mode compile activate)
      (nlinum-mode -1) ad-do-it (nlinum-mode 1))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Highlight line number
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package hlinum
  :ensure
  :disabled
  :config
  (hlinum-activate)
  ;; remove hlinum when in visual mode (performance issues)
  (add-hook 'evil-visual-state-entry-hook 'hlinum-deactivate)
  (add-hook 'evil-visual-state-exit-hook 'hlinum-activate))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Shell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package bash-completion
  :ensure
  :config
  (bash-completion-setup)
  (evil-define-key 'insert eshell-mode-map (kbd "M-k") 'eshell-next-matching-input-from-input)
  (evil-define-key 'insert eshell-mode-map (kbd "M-j") 'eshell-previous-matching-input-from-input)
  (evil-define-key 'normal eshell-mode-map (kbd "i") 'evil-insert-at-buffer-end)
  (evil-leader/set-key "hs" 'evil-lookup))
(use-package multi-term
  :ensure
  :config
  (setq multi-term-program "/bin/zsh")
  (setq multi-term-buffer-name "term")
  ;; cursor always at the bottom of the window.
  (defun init-term-settings ()
    (setq-local scroll-margin 1)
    (setq-local scroll-conservatively 0)
    (setq-local scroll-step 1))
  (add-hook 'term-mode-hook 'init-term-settings)
  ;; function to insert cursor at the buffer end
  (defun evil-insert-at-buffer-end ()
    (interactive)
    (if (not (equal (line-number-at-pos (point-max)) (line-number-at-pos)))
        (progn
          (evil-goto-line)
          (evil-end-of-visual-line)
          (evil-insert nil))
      (evil-insert nil)))
  ;; remove yas
  (add-hook 'term-mode-hook (lambda() (setq-local yas-dont-activate t)))
  ;; travezl between emacs state and normal state
  (evil-set-initial-state 'term-mode 'emacs)
  (evil-define-key 'emacs term-raw-map (kbd "<escape>") 'term-send-esc)
  (evil-define-key 'normal term-raw-map (kbd "i") 'evil-emacs-state)
  (evil-define-key 'normal term-raw-map (kbd "a") 'evil-emacs-state)
  (evil-define-key 'normal term-raw-map (kbd "S-a") 'evil-emacs-state)
  (evil-define-key 'normal term-raw-map (kbd "S-i") 'evil-emacs-state)
  (evil-define-key 'emacs term-raw-map (kbd "C-c n") 'evil-normal-state)
  (evil-define-key 'emacs term-raw-map (kbd "C-c C-n") 'evil-normal-state)
  ;; keybinding
  (evil-define-key 'emacs term-raw-map (kbd "M-j") 'term-send-down)
  (evil-define-key 'emacs term-raw-map (kbd "M-k") 'term-send-up)
  (evil-define-key 'emacs term-raw-map (kbd "M-h") 'term-send-left)
  (evil-define-key 'emacs term-raw-map (kbd "M-l") 'term-send-right)
  ;; (evil-leader/set-key "bs" 'multi-term)
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bash
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company-shell
  :ensure
  :config
  (add-to-list 'company-backends '(company-shell company-shell-env))
  )
(add-hook 'sh-mode-hook 'flymake-mode)
(defun shell-script-compilation-execute-script ()
  "Execute the current shell script in a compilation buffer "
  (interactive)
  (save-buffer)
  (compile (format "bash %s" (buffer-file-name)))
  (save-mark-and-excursion
    (switch-to-buffer-other-window "*compilation*")
    (goto-char (point-max))))
(defun shell-script-compilation-switch-to-compilation-buffer ()
  "Switch to the compilation-buffer"
  (interactive)
  (switch-to-buffer-other-window "*compilation*")
  (goto-char (point-max)))
(defun shell-script-compilation-close-compilation-buffer ()
  (interactive)
  (kill-buffer "*compilation*"))
(evil-leader/set-key-for-mode 'shell-script-mode
  "ee" 'shell-script-compilation-execute-script
  "ll" 'shell-script-compilation-switch-to-compilation-buffer
  "lc" 'shell-script-compilation-close-compilation-buffer
  "lk" 'shell-script-compilation-close-compilation-buffer)
(defun colorize-compilation-buffer-on-modification (beg end len)
  "Colorize the modified part of the compilation buffer
Meant to be add in `after-change-functions'. "
  (ansi-color-apply-on-region beg end))
(add-hook 'compilation-mode-hook
          (lambda ()
            (add-hook 'after-change-functions
                      'colorize-compilation-buffer-on-modification
                      nil t)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Magit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package magit
  :ensure
  :config
  (add-hook 'magit-mode-hook 'visual-line-mode)
  (setq magit-diff-arguments (quote ("--stat" "--no-ext-diff" "--patience")))
  (setq magit-save-repository-buffers (quote dontask))
  (add-hook 'magit-log-mode-hook (lambda () (visual-line-mode -1))))

(use-package evil-magit
  :ensure
  :init
  (require 'evil-magit)
  :config
  ;; (setq evil-magit-state 'motion)
  ;;  (add-hook 'git-rebase-mode-hook 'turn-off-evil-snipe-override-mode)
  :after (magit evil)
  :bind (:map evil-leader--default-map
              ("vi" . magit-init)
              ("vs" . magit-status)
              ("vo" . magit-checkout)
              ("vf" . magit-find-file)
              ("vc" . magit-show-commit)
              ("vb" . magit-blame)
              ("vr" . vc-region-history)
              ("vd" . magit-diff-dwim)
              ("vf" . magit-find-file)))

(use-package magit-lfs
  :ensure
  :config)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Magithub
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package magithub
  :ensure
  (require 'magithub)
  :config
  (magithub-feature-autoinject t)
  :after magit
  :disabled)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Gitignore
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package helm-gitignore
  :ensure)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smerge
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-define-key 'normal smerge-mode-map
  (kbd "M-n") 'smerge-next
  (kbd "M-p") 'smerge-prev
  (kbd "M-a") 'smerge-keep-all
  (kbd "M-m") 'smerge-keep-mine
  (kbd "M-b") 'smerge-keep-base
  (kbd "M-o") 'smerge-keep-other
  (kbd "M-r") 'smerge-resolve)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Github integration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package github-browse-file
  :ensure
  :config
  (setq github-browse-file-show-line-at-point t)
  :bind (:map evil-leader--default-map
              ("vhf" . github-browse-file)
              ("vhc" . github-browse-commit)
              ("vhb" . github-browse-file-blame)))

(use-package helm-github-stars
  :ensure
  :config
  (setq helm-github-stars-username "galaunay")
  (setq helm-github-stars-refetch-time 0.5)
  :bind (:map evil-leader--default-map
              ("zh" . helm-github-stars)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org-autolist
  :ensure
  :after org)
(use-package ox-reveal
  :disabled
  :ensure
  :config
  (require 'ox-reveal))
;; (use-package org-plus-contrib
;;   :ensure
;;   :after org
;;   :init
;;   )
(use-package org
  :ensure org-plus-contrib
  :after visual-fill-column
  :init
  (require 'org-depend)
  (require 'org-agenda)
  :config
  ;; settings
  (setq org-agenda-files (quote ("~/dev/todo/Todo.org"))
        org-default-notes-file (expand-file-name "~/dev/todo/Todo.org")
        org-enforce-todo-dependencies t
        org-return-follows-link t
        org-log-done 'time
        org-refile-targets '((nil . (:maxlevel . 10)))
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-timestamp-if-done t
        org-agenda-show-future-repeats t
        org-agenda-todo-ignore-with-date t)
  ;; agenda views
  (setq org-agenda-custom-commands
        (quote
         (("n" "Agenda and all TODOs"
           ((agenda "" nil)
            (alltodo ""
                     ((org-agenda-sorting-strategy
                       (quote
                        (priority-down todo-state-up)))))))
          ("c" "Chaos related tasks"
           ((agenda "" ((org-agenda-overriding-header "Chaos agenda")
                        (org-agenda-category-filter-preset (quote ("+Chaos")))))
            (alltodo "" ((org-agenda-overriding-header "Chaos tasks")
                         (org-agenda-category-filter-preset (quote ("+Chaos")))))))
          ("a" "Cleaning related tasks"
           ((agenda "" ((org-agenda-overriding-header "Cleaning agenda")
                        (org-agenda-category-filter-preset (quote ("+Cleaning")))))))
          ("s" "GSLIPS related tasks"
           ((agenda "" ((org-agenda-overriding-header "GSLIPS agenda")
                        (org-agenda-category-filter-preset (quote ("+Gslips")))))
            (alltodo "" ((org-agenda-overriding-header "SLIPS tasks")
                         (org-agenda-category-filter-preset (quote ("+Gslips")))))))
          )))
  ;; hooks
  (add-hook 'org-mode-hook 'visual-fill-column-mode)
  (add-hook 'org-mode-hook (lambda ()
                             (setq-local company-auto-complete nil)
                             (setq-local company-idle-delay nil)))
  (add-hook 'org-agenda-finalize-hook (lambda ()
                                        (toggle-truncate-lines 1)))
  (add-hook 'org-mode-hook 'org-autolist-mode)
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook 'adaptive-wrap-prefix-mode)
  (add-hook 'org-mode-hook (lambda () (drag-stuff-mode -1)))
  ;; Capture templates
  (setq org-capture-templates
        (quote
         (("t" "TODO Task" entry
           (file+headline org-default-notes-file "To classify")
           "* TODO %?")
          ("T" "TODO Task (with link)" entry
           (file+headline org-default-notes-file "To classify")
           "* TODO %?\n  %a")
          ("d" "Dated task" entry
           (file+headline org-default-notes-file "To classify")
           "* %?\n  %^{Date}t\n" t)
          ("D" "Dated task (with link)" entry
           (file+headline org-default-notes-file "To classify")
           "* %?\n  %^{Date}t\n  %a" t)
          ("s" "Scheduled task" entry
           (file+headline org-default-notes-file "To classify")
           "* TODO %?\n  SCHEDULED: %^{Schedule for}t" t)
          ("S" "Scheduled task (with link)" entry
           (file+headline org-default-notes-file "To classify")
           "* TODO %?\n  SCHEDULED: %^{Schedule for}t\n  %a" t)
          ("e" "Event" entry
           (file+headline org-default-notes-file "To classify")
           "* %?\n  %^{Date}t" t)
          ("E" "Event (with link)" entry
           (file+headline org-default-notes-file "To classify")
           "* %?\n  %^{Date}t\n  %a" t)
          ("l" "Deadline" entry
           (file+headline org-default-notes-file "To classify")
           "* TODO %?\n  DEADLINE: %^{Deadline}t" t)
          ("L" "Deadline (with link)" entry
           (file+headline org-default-notes-file "To classify")
           "* TODO %?\n  DEADLINE: %^{Deadline}t\n  %a" t))))
  ;; colored paths
  (defface org-link-broken
    '((t :inherit org-warning :underline t))
    "Face for broken links."
    :group 'org-faces)
  (org-link-set-parameters
   "file" :face (lambda (path) (if (file-exists-p path) 'org-link 'org-link-broken)))
  ;; Additional functions
  (defun org-move-thing-up ()
    (interactive)
    (cond
     ((org-at-item-p)
      (org-move-item-up))
     ((org-at-heading-p)
      (drag-stuff-up 1))
     ((org-at-timestamp-p)
      (org-timestamp-up))))
  (defun org-move-thing-down ()
    (interactive)
    (cond
     ((org-at-item-p)
      (org-move-item-down))
     ((org-at-heading-p)
      (drag-stuff-down 1))
     ((org-at-timestamp-p)
      (org-timestamp-down))))
  (defun org-move-subtree-or-list-up ()
    (interactive)
    (if (org-at-item-p)
        (org-move-item-up)
      (org-move-subtree-up)))
  (defun org-move-subtree-or-list-down ()
    (interactive)
    (if (org-at-item-p)
        (org-move-item-down)
      (org-move-subtree-down)))
  (defun org-promote-heading-or-item ()
    (interactive)
    (if (org-at-item-p)
        (org-outdent-item)
      (org-do-promote)))
  (defun org-demote-heading-or-item ()
    (interactive)
    (if (org-at-item-p)
        (org-indent-item)
      (org-do-demote)))
  (defun org-promote-subtree-or-list ()
    (interactive)
    (if (org-at-item-p)
        (org-outdent-item-tree)
      (org-promote-subtree)))
  (defun org-demote-subtree-or-list ()
    (interactive)
    (if (org-at-item-p)
        (org-indent-item-tree)
      (org-demote-subtree)))
  (defun org-archive-done-tasks ()
    (interactive)
    (org-map-entries
     (lambda ()
       (org-archive-subtree)
       (setq org-map-continue-from (outline-previous-heading)))
     "/DONE" 'agenda))
  (defun org-agenda-strip-by-category ()
    (interactive)
    (org-agenda-filter-by-category 4))
  ;; keybinding in other modes
  (evil-leader/set-key (kbd "rc") 'org-capture)
  (evil-leader/set-key (kbd "ra") 'org-agenda)
  (evil-leader/set-key (kbd "rl") 'org-store-link)
  (evil-leader/set-key-for-mode 'org-mode (kbd "il") 'org-insert-link)
  (evil-set-initial-state 'org-agenda-mode 'emacs)
  ;; keybinding in org-mode
  (evil-define-key 'normal org-mode-map
    "+" 'org-timestamp-up-day
    "-" 'org-timestamp-down-day
    "H" 'outline-up-heading
    "<" 'org-promote-heading-or-item
    ">" 'org-demote-heading-or-item
    (kbd "M-j") 'org-move-thing-down
    (kbd "M-k") 'org-move-thing-up
    (kbd "M-L") 'org-demote-subtree-or-list
    (kbd "M-J") 'org-move-subtree-or-list-down
    (kbd "M-K") 'org-move-subtree-or-list-up
    (kbd "M-H") 'org-promote-subtree-or-list
    (kbd "<return>") 'org-return
    (kbd "<tab>") 'org-cycle
    (kbd "M-<tab>") 'org-reveal)
  (evil-define-key 'insert org-mode-map
    (kbd "<tab>") (lambda ()
                    (interactive)
                    (if (looking-at "\\_>")
                        (or (tab-indent-or-complete) (org-cycle))
                      (org-cycle))))
  (evil-leader/set-key-for-mode 'org-mode
    (kbd "e") 'org-export-dispatch
    (kbd "mm") 'org-refile ;; move subtree elsewhere
    (kbd "ms") 'org-sort
    (kbd "mh") 'org-toggle-heading
    (kbd "ml") 'org-toggle-item
    (kbd "mc") 'org-toggle-checkbox
    (kbd "mt") 'org-todo
    (kbd "mp") 'org-priority
    (kbd "ne") 'org-narrow-to-element
    (kbd "nw") 'widen
    (kbd "dd") 'org-time-stamp
    (kbd "dD") 'org-deadline
    (kbd "dk") 'org-timestamp-up-day
    (kbd "dj") 'org-timestamp-down-day
    (kbd "dl") 'org-deadline
    (kbd "ds") 'org-schedule
    (kbd "ir") 'org-set-property
    (kbd "gt") 'org-open-at-point
    (kbd "rt") 'org-sparse-tree
    (kbd "ih") (lambda () (interactive) (org-insert-heading-after-current) (evil-insert-state))
    (kbd "dl") 'org-toggle-link-display
    (kbd "di") 'org-toggle-inline-images
    (kbd "r$") 'org-archive-subtree)
  (evil-define-key 'emacs org-agenda-mode-map
    "+" 'org-agenda-do-date-later
    "-" 'org-agenda-do-date-earlier
    "s" 'org-agenda-schedule
    "D" 'org-agenda-deadline
    "<" 'org-agenda-filter-by-category
    ">" 'org-agenda-strip-by-category
    (kbd "C-j") 'evil-scroll-down-half
    (kbd "C-k") 'evil-scroll-up-half
    "d" 'org-agenda-date-prompt
    "i" nil
    "ir" 'org-agenda-set-property
    "j" 'org-agenda-next-line
    "k" 'org-agenda-previous-line
    "gg" 'evil-goto-first-line
    "gt" 'org-agenda-open-link
    "G" 'evil-goto-line
    "J" 'org-agenda-later
    "K" 'org-agenda-earlier
    (kbd "RET") 'org-agenda-goto
    (kbd "TAB") 'org-agenda-show
    (kbd "<tab>") 'org-agenda-show
    "p" 'org-agenda-priority)
  )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-babel
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (emacs-lisp . t)
   (shell . t)
   (latex . t)
   ))
(setq org-confirm-babel-evaluate nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-latex
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-latex-listings 'minted)
(add-to-list 'org-latex-packages-alist '("" "minted"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-calendar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key org-read-date-minibuffer-local-map (kbd "M-j")
  (lambda () (interactive)
    (org-eval-in-calendar '(calendar-forward-week 1))))
(define-key org-read-date-minibuffer-local-map (kbd "M-k")
  (lambda () (interactive)
    (org-eval-in-calendar '(calendar-backward-week 1))))
(define-key org-read-date-minibuffer-local-map (kbd "M-h")
  (lambda () (interactive)
    (org-eval-in-calendar '(calendar-backward-day 1))))
(define-key org-read-date-minibuffer-local-map (kbd "M-l")
  (lambda () (interactive)
    (org-eval-in-calendar '(calendar-forward-day 1))))
(define-key org-read-date-minibuffer-local-map (kbd "M-L")
  (lambda () (interactive)
    (org-eval-in-calendar '(calendar-forward-month 1))))
(define-key org-read-date-minibuffer-local-map (kbd "M-H")
  (lambda () (interactive)
    (org-eval-in-calendar '(calendar-backward-month 1))))
(define-key org-read-date-minibuffer-local-map (kbd "M-t")
  (lambda () (interactive)
    (org-eval-in-calendar '(calendar-goto-today))))

(defun org-read-date-display ()
  "Display the current date prompt interpretation in the minibuffer."
  (when org-read-date-display-live
    (when org-read-date-overlay
      (delete-overlay org-read-date-overlay))
    (when (minibufferp (current-buffer))
      (save-excursion
        (end-of-line 1)
        (while (not (equal (buffer-substring
                            (max (point-min) (- (point) 4)) (point))
                           "    "))
          (insert " ")))
      (let* ((ans (concat (buffer-substring (point-at-bol) (point-max))
                          " " (or org-ans1 org-ans2)))
             (org-end-time-was-given nil)
             (f (org-read-date-analyze ans org-def org-defdecode))
             (fmts (if org-dcst
                       org-time-stamp-custom-formats
                     org-time-stamp-formats))
             (fmt (if (or org-with-time
                          (and (boundp 'org-time-was-given) org-time-was-given))
                      (cdr fmts)
                    (car fmts)))
             (txt (format-time-string fmt (apply 'encode-time f)))
             (txt (if org-read-date-inactive (concat "[" (substring txt 1 -1) "]") txt))
             (txt (concat "=> " txt)))
        (when (and org-end-time-was-given
                   (string-match org-plain-time-of-day-regexp txt))
          (setq txt (concat (substring txt 0 (match-end 0)) "-"
                            org-end-time-was-given
                            (substring txt (match-end 0)))))
        (when org-read-date-analyze-futurep
          (setq txt (concat txt " (=>F)")))
         (setq org-read-date-overlay
               (make-overlay (1- (point-at-eol)) (point-at-eol)))
         (org-overlay-display org-read-date-overlay txt 'secondary-selection)
         (when org-read-date-popup-calendar
          (let ((date-calendar (list (nth 4 f) (nth 3 f) (nth 5 f)))
                (org-ans2 nil))  ;; avoid org-eval-in-calendar to overwrite org-ans2
            (org-eval-in-calendar
             `(calendar-goto-date ',date-calendar))))
        ))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Htmlize
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package htmlize
  :ensure)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Powerline
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package powerline
  :ensure)
;; :init
;; (el-get-bundle powerline
;;   :url "https://www.github.com/milkypostman/powerline.git"
;;   :features powerline)
;; :config
;; (powerline-default-theme))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Spaceline
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package spaceline
  :init
  (el-get-bundle spaceline
    :url "https://github.com/TheBB/spaceline.git")
  (require 'spaceline-config)
  :config
  (spaceline-emacs-theme)
  (spaceline-helm-mode)
  (spaceline-toggle-version-control-off)
  (spaceline-toggle-helm-help-off)
  (spaceline-toggle-buffer-id-on)
  (spaceline-toggle-major-mode-on)
  (setq evil-emacs-state-cursor '("SkyBlue2" bar)
        evil-normal-state-cursor '("DarkGoldenrod2" box)
        evil-visual-state-cursor '("gray" box)
        evil-insert-state-cursor '("chartreuse3" bar)
        evil-replace-state-cursor '("chocolate" box)
        evil-operator-state-cursor '(hollow)
        evil-motion-state-cursor '("plum3" box)
        spaceline-highlight-face-func 'spaceline-highlight-face-evil-state))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Undo-Tree
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package undo-tree
  :ensure
  :init
  (global-undo-tree-mode)
  :config
  (setq undo-tree-auto-save-history t) ; related to bug (https://github.com/syl20bnr/spacemacs/issues/298)
  (setq undo-tree-history-directory-alist (quote ((".*" . "/tmp/undo-tree-history"))))
  (setq undo-tree-visualizer-diff t)
  ;;  (add-hook 'undo-tree-visualizer-mode-hook 'turn-off-evil-snipe-override-mode)
  (evil-define-key 'motion undo-tree-visualizer-mode-map
    "j" 'undo-tree-visualize-redo
    "k" 'undo-tree-visualize-undo
    "t" 'undo-tree-visualizer-toggle-timestamps
    "s" 'undo-tree-visualizer-selection-mode
    [?\r] 'undo-tree-visualizer-quit)
  :bind (:map evil-leader--default-map
              ("u" . undo-tree-visualize)
              :map evil-normal-state-map
              ("u" . undo-tree-undo)
              ("U" . undo-tree-redo)
              :map evil-visual-state-map
              ("u" . undo)
              ("U" . redo)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Recentf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'recentf)
(recentf-cleanup)  ;; clean it now to avoid having to clean it when helm fist call

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package helm
  :ensure
  :config
  (require 'helm)
  (require 'helm-config)
  (helm-mode 1)
  (helm-autoresize-mode 1)
  (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
  (setq helm-mini-default-sources             (quote (helm-source-buffers-list helm-source-recentf helm-source-buffer-not-found))
        helm-find-files-ignore-thing-at-point t
        helm-split-window-in-side-p           t
        helm-move-to-line-cycle-in-source     t
        helm-ff-search-library-in-sexp        t
        helm-ff-skip-boring-files             t
        helm-scroll-amount                    8
        helm-ff-file-name-history-use-recentf t
        helm-find-file-ignore-thing-at-point  t
        helm-window-prefer-horizontal-split   t
        helm-display-header-line              nil
        helm-echo-input-in-header-line        nil
        helm-mode-line-string                 ""
        helm-top-mode-line                    ""
        helm-comp-read-mode-line              ""
        helm-read-file-name-mode-line-string  ""
        helm-find-files-doc-header            ""
        helm-autoresize-max-height            '40
        helm-autoresize-min-height            '40
        helm-M-x-fuzzy-match                  t
        helm-buffers-fuzzy-matching           t
        helm-truncate-lines                   t
        helm-recentf-fuzzy-match              t)
  (delete-selection-mode t)   ; to be sure helm-show-kill-ring replace selection
  (defun do-nothing ()
    (interactive))
  (defun mini ()
    ""
    (interactive)
    (helm-mini))
  :bind (:map evil-leader--default-map
              ("nf" . helm-find-files)
              ("rk" . helm-show-kill-ring)
              ("rr" . helm-register)
              ("ns" . helm-semantic-or-imenu)
              ("nS" . helm-imenu-in-all-buffers)
              ("hh" . helm-apropos)
              ("hk" . helm-descbinds)
              ("zw" . helm-wikipedia-suggest)
              ("br" . helm-regexp)
              ("np" . helm-list-emacs-process)
              ("nl" . helm-locate)
              ("hr" . helm-resume)
              ;; ("bt" . helm-top)
              :map evil-normal-state-map
              ([? ] . helm-mini)
              :map global-map
              ("M-x" . helm-M-x)
              ;;              :map helm-M-x-map
              ;;              ("M-x" . do-nothing)
              :map helm-map
              ([?\t] . helm-execute-persistent-action)
              ([backtab] . helm-find-files-up-one-level)
              ("M-u" . helm-execute-persistent-action)
              ("M-i" . helm-select-action)
              ("M-j" . helm-next-line)
              ("M-k" . helm-previous-line)
              ("M-l" . helm-next-source)
              ("M-h" . helm-previous-source)
              ("M-s" . helm-toggle-visible-mark)
              ("M-a" . helm-mark-all)
              ("M-d" . helm-unmark-all)
              ([up] . nil)
              ([down] . nil)
              ([left] . nil)
              ([right] . nil)
              :map helm-find-files-map
              ("M-r" . helm-ff-run-rename-file)
              ("M-c" . helm-ff-run-copy-file)
              ("M-w" . helm-ff-run-switch-other-window)
              ("M-f" . helm-ff-run-switch-other-frame)
              ("M-p" . helm-ff-run-complete-fn-at-point)
              ("M-i" . helm-select-action)
              ("M-h" . helm-ff-file-name-history)
              ("M-l" . helm-ff-run-locate)
              :map helm-buffer-map
              ("M-w" . helm-buffer-switch-other-window)
              ("M-f" . helm-buffer-switch-other-frame)
              ("M-q" . helm-buffer-run-kill-persistent)
              ("M-S-q" . helm-buffer-run-kill-buffers)
              ("M-o" . helm-buffers-run-multi-occur)
              ("M-v" . helm-buffers-toggle-show-hidden-buffers)
              :map helm-generic-files-map
              ("M-i" . helm-select-action)
              ("M-r" . helm-ff-run-rename-file)
              ("M-c" . helm-ff-run-copy-file)
              ("M-w" . helm-ff-run-switch-other-window)
              ("M-f" . helm-ff-run-switch-other-frame)
              ("M-l" . helm-ff-run-locate)
              :map helm-moccur-map
              ("M-u" . helm-execute-persistent-action)
              ("M-w" . helm-moccur-run-goto-line-ow)
              ("M-f" . helm-moccur-run-goto-line-of)))
(use-package helm-flx
  :ensure
  :after helm
  :config
  (helm-flx-mode 1))
(use-package helm-flyspell
  :ensure
  :after helm)
(use-package helm-google
  :ensure
  :after helm
  :config
  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t)))
(use-package helm-descbinds
  :ensure
  :after helm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm-swoop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package swoop
  :ensure
  :config
  (setq swoop-font-size-change nil
        swoop-use-target-magnifier-around nil
        swoop-use-target-magnifier-size nil))
(use-package helm-swoop
  :ensure
  :after (helm swoop)
  :config
  (setq helm-swoop-split-with-multiple-windows t)
  (setq helm-swoop-split-direction 'split-window-vertically)
  (setq helm-swoop-pre-input-function (lambda () ""))
  (setq helm-swoop-use-line-number-face t)
  (defun helm-swoop-revive ()
    (interactive)
    (helm-swoop :$query helm-swoop-last-query))
  :bind (:map evil-leader--default-map
              ("ss" . helm-swoop)
              ("sr" . helm-swoop-revive)
              ("sm" . helm-multi-swoop)
              ("sc" . helm-multi-swoop-current-mode)
              ("sa" . helm-multi-swoop-all)
              :map helm-swoop-map
              ("M-m" . helm-multi-swoop-all-from-helm-swoop)
              ("M-i" . helm-select-action)
              ("M-e" . helm-swoop-edit)
              :map helm-multi-swoop-map
              ("M-m" . helm-multi-swoop-all-from-helm-swoop)
              ("M-i" . helm-select-action)
              ("M-e" . helm-multi-swoop-edit)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ivy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ivy
  :ensure
  :disabled
  :config
  (ivy-mode 1))

(use-package counsel
  :ensure
  :disabled
  :after ivy
  :config
  (defun mini ()
    ""
    (interactive)
    (ivy-switch-buffer))
  (setq completing-read-function 'ivy-completing-read
        projectile-completion-system 'helm)
  :bind (:map evil-leader--default-map
              ("ss" . swiper)
              ("sr" . ivy-resume)
              ("sm" . swiper-multi)
              ;; ("sc" . helm-multi-swoop-current-mode)
              ("sa" . swiper-all)
              ("nf" . counsel-find-file)
              ("rk" . counsel-show-kill-ring)
              ("pp" . counsel-projectile)
              ("rr" . counsel-evil-registers)
              ("ns" . counsel-semantic-or-imenu)
              ;; ("nS" . helm-imenu-in-all-buffers)
              ("hh" . counsel-apropos)
              ("hk" . counsel-descbinds)
              ;; ("zw" . helm-wikipedia-suggest)
              ;; ("br" . helm-regexp)
              ("np" . counsel-list-process)
              ("nl" . counsel-locate)
              ("hr" . ivy-resume)
         :map global-map
              ("M-x" . counsel-M-x)
         :map evil-normal-state-map
              ([? ] . ivy-switch-buffer)
         :map ivy-minibuffer-map
              ;; ([?\t] . ivy-alt-done)
              ;; ([?\t] . ivy-call)
              ;; ([backtab] . ivy-previous-history-element)
              ("M-i" . ivy-dispatching-done)
              ("M-j" . ivy-next-line)
              ("M-k" . ivy-previous-line)
              ;; ("M-l" . helm-next-source)
              ;; ("M-h" . helm-previous-source)
              ;; ("M-s" . helm-toggle-visible-mark)
              ;; ("M-a" . helm-mark-all)
              ;; ("M-d" . helm-unmark-all)
              ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Handle files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun move-file (new-location)
  "Write this file to NEW-LOCATION, and delete the old one."
  (interactive (list (if buffer-file-name
                         (read-file-name "Move current file to: ")
                       (read-file-name "Move current file to: "
                                       default-directory
                                       (expand-file-name (file-name-nondirectory (buffer-name))
                                                         default-directory)))))
  (when (file-exists-p new-location)
    (delete-file new-location))
  (let ((old-location (buffer-file-name)))
    (write-file new-location t)
    (when (and old-location
               (file-exists-p new-location)
               (not (string-equal old-location new-location)))
      (delete-file old-location))))
(evil-leader/set-key (kbd "nm") 'move-file)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dired
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package dired
  :config
  (setq dired-listing-switches "-alh"
        dired-auto-revert-buffer t)
  (defun dired-quit-dired-buffers ()
    "Go back to the last non-dired buffer visited."
    (interactive)
    (while (string= major-mode 'dired-mode)
      (quit-window)))
  (defun dired-open-file-externally ()
    "Open the file under point using whippet !"
    (interactive)
    (let* ((file (dired-get-filename nil t)))
      (message "Opening %s..." (format "%s.%s" (file-name-base file)
               (file-name-extension file)))
      (call-process "whippet" nil 0 nil "-A" file)))

  (eval-after-load 'dired
    '(progn
       (evil-set-initial-state 'dired-mode 'normal)
       ;; use the standard Dired bindings as a base
       (evil-make-overriding-map dired-mode-map 'normal t)
       (evil-define-key 'normal dired-mode-map
         "h" 'evil-backward-char
         "j" 'evil-next-line
         "k" 'evil-previous-line
         "l" 'evil-forward-char
         "q" 'dired-quit-dired-buffers
         "r" 'revert-buffer
         "gg" 'evil-goto-first-line
         "G" 'evil-goto-line
         "H" 'dired-up-directory
         "L" 'dired-find-file
         "J" 'dired-goto-file       ; "j"
         (kbd "O") 'dired-open-file-externally
         "K" (lambda () (interactive) (dired-do-kill-lines 1))   ; "k"
         "r" 'dired-do-redisplay    ; "l"
         "f" 'dired-narrow
         "e" 'wdired-change-to-wdired-mode
         "%" nil
         "%d" 'dired-flag-files-regexp
         (kbd "C-M-k") 'dired-prev-subdir
         (kbd "C-M-j") 'dired-next-subdir
         ;; "gg" 'evil-goto-first-line
         ;; "G" 'evil-goto-line
         ;; "gr" 'revert-buffer
         (kbd "SPC") 'mini)))
  (evil-leader/set-key "nd" 'dired-jump)
  (evil-leader/set-key "nD" 'dired-jump-other-window)
  (evil-leader/set-key "nh" (lambda ()
                              (interactive)
                              (dired (expand-file-name "~")))))

(use-package dired-narrow
  :ensure
  )

(use-package dired-sort
  :disabled
  :ensure)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ranger
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ranger
  :disabled
  :ensure
  :config
  (ranger-override-dired-mode t)
  (setq ranger-cleanup-on-disable t
        ranger-show-dotfiles t
        ranger-parent-depth 1
        ranger-preview-file t
        ranger-show-literal nil
        ranger-max-preview-size 10)
  :bind (:map evil-leader--default-map
              ("nr" . ranger)
              :map ranger-mode-map
              ([?\t] . ranger-find-file)
              ([backtab] . ranger-up-directory)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Semantic mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(semantic-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Projectile
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package projectile
  :init
  (el-get-bundle projectile
    :url "https://www.github.com/bbatsov/projectile.git"
    :branch "master"
    :features projectile)
  (projectile-mode)
  :config
  (setq projectile-use-git-grep t)
  (setq projectile-completion-system 'helm)
  (setq projectile-mode-line (quote (:eval
                                     (if (magit-get-current-branch)
                                         (format " %s[%s]" (projectile-project-name) (magit-get-current-branch))
                                       (format " %s" (projectile-project-name))))))
  (setq projectile-sort-order (quote recentf))
  ;; (setq projectile-sort-order (quote access-time))
  ;; Remove el-get and elpa from known projects
  (setq projectile-enable-caching t)
  (defun my-projectile-ignore-project (project-root)
    (string-match-p "\\(\\/el-get\\/\\|\\/elpa\\/\\)" project-root))
        ;; (string-match-p "\\/.Mail\\/" project-root)))
  (setq projectile-ignored-project-function 'my-projectile-ignore-project)
  ;; Additionnal functions
  (defun projectile-kill-buffers ()
    "Kill all project buffers."
    (interactive)
    (let ((name (projectile-project-name))
          (buffers (projectile-project-buffers)))
      (if (yes-or-no-p
           (format "Are you sure you want to kill %d buffer(s) for '%s'? "
                   (length buffers) name))
          (progn
            (mapc #'save-buffer (cl-remove-if 'buffer-base-buffer buffers))
            (mapc #'kill-buffer (cl-remove-if 'buffer-base-buffer buffers))))))
  (defun projectile-find-file-matching-regex (regex)
    "Return a list of project files matching
     REGEX regular expression"
    (let* ((current-buffers (projectile-project-buffers)))
      (cl-flet ((buffer-list (&optional frame) (projectile-project-buffers)))
        (helm-imenu-in-all-buffers))))
  :bind (:map evil-leader--default-map
              ("pk" . projectile-kill-buffers)
              ("pr" . projectile-replace-regexp)
              ("pi" . projectile-invalidate-cache)))

(use-package helm-projectile
  :init
  (el-get-bundle helm-projectile
    :url "https://github.com/bbatsov/helm-projectile.git"
    :branch "master"
    :features helm-projectile)
  (helm-projectile-on)
  :config
  (setq helm-projectile-truncate-lines t
        helm-projectile-set-input-automatically nil)
  (defun projectile-open-all-files ()
    "Open all files with the same extension in the current project."
    (interactive)
    (let ((ext (file-name-extension (buffer-file-name))))
      (cl-loop
       for file in (projectile-current-project-files)
       if (string= (file-name-extension file) ext)
       do
       (message "file: %s" (concat (projectile-project-root) file))
       (find-file-noselect (concat (projectile-project-root) file))
       )))
  (defun projectile-recall-dirty-projects ()
    (interactive)
    (projectile-browse-dirty-projects t))
  ;; set keybindings
  (helm-projectile-define-key helm-projectile-projects-map
    (kbd "<tab>") (lambda (project)
                    (let ((projectile-completion-system 'helm))
                      (projectile-switch-project-by-name project)))
    (kbd "M-g") #'helm-projectile-vc
    (kbd "M-u") #'helm-projectile-switch-to-buffer
    (kbd "M-e") #'helm-projectile-switch-to-eshell
    (kbd "M-o") #'helm-projectile-grep
    (kbd "M-d") #'helm-projectile-remove-known-project)
  (helm-projectile-define-key helm-projectile-find-file-map
    (kbd "<backtab>") 'helm-projectile-switch-project)
  :bind (:map helm-projectile-find-file-map
              ("M-l" . helm-next-source) ; correct M-l overrinded by projectile)
              ("M-i" . helm-select-action)
              :map evil-leader--default-map
              ("pp" . helm-projectile-switch-project)
              ("pf" . helm-projectile-find-file)
              ("pF" . helm-projectile-find-file-in-known-projects)
              ("pd" . helm-projectile-find-dir)
              ("pg" . helm-projectile-grep)
              ("pG" . projectile-grep)
              ("pO" . projectile-open-all-files)
              ("pc" . projectile-browse-dirty-projects)
              ("pC" . projectile-recall-dirty-projects)))
;; ("pc" . projectile-recall-dirty-projects)))

(use-package helm-projectile-open-with
  :init
  (el-get-bundle helm-projectile-open-with
    :url "https://github.com/galaunay/helm-projectile-open-with.git"
    :branch "master"
    :features helm-projectile-open-with)
  :bind(:map evil-leader--default-map
             ("po" . helm-projectile-open-with)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Frame controle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-leader/set-key "ff" 'other-frame)
(evil-global-set-key 'insert (kbd "C-f f") 'other-frame)
(evil-global-set-key 'insert (kbd "C-f C-f") 'other-frame)
(evil-global-set-key 'normal (kbd "C-f f") 'other-frame)
(evil-global-set-key 'normal (kbd "C-f C-f") 'other-frame)
(evil-leader/set-key "fn" 'make-frame)
(evil-leader/set-key "fc" 'delete-frame)
(defun delete-frame-by-name (frame-name)
  (interactive "sFrame name:")
  (let ((frames (frame-list)))
    (catch 'break
      (while frames
        (let ((frame (car frames)))
          (if (equal (frame-parameter frame 'name) frame-name)
              (throw 'break (delete-frame frame))
            (setq frames (cdr frames))))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package yasnippet
  :ensure
  ;; :init
  ;; (el-get-bundle yasnippet
  ;;   :url "https://github.com/joaotavora/yasnippet.git"
  ;;   :features yasnippet)
  :config
  (setq yas-snippet-dirs (quote ("~/.emacs.d/snippets")))
  (yas-global-mode 1)
  (setq yas-indent-line (quote fixed))
  (setq yas-snippet-revival nil)
  (setq yas-triggers-in-field t)
  (setq yas-new-snippet-default
        "# -*- mode: snippet -*-
# contributor: ${4:galaunay}
# name: $1
# key: ${2:${1:$(yas--key-from-desc yas-text)}}
# expand-env: (${3:})
# --
$0")
  :bind (:map evil-leader--default-map
              ("yi" . yas-insert-snippet)
              ("yt" . yas-describe-tables)
              ("yr" . yas-reload-all)
              ("yn" . yas-new-snippet)
              ("yv" . yas-visit-snippet-file)
              :map yas-keymap
              ("C-<tab>" . yas-next-field-or-maybe-expand)
              ("<tab>" . yas-next-field)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Company mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company-quickhelp
  :ensure
  :after company)
(use-package company
  :ensure
  :config
  (require 'company)
  (require 'company-quickhelp)
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay nil)
  (setq company-auto-complete nil)
  (setq company-minimum-prefix-length 3)
  (setq company-show-numbers nil)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-minimum-width 0)
  (setq company-dabbrev-code-everywhere t)
  (setq company-selection-wrap-around t)
  (setq company-require-match nil)
  (setq company-transformers (quote (company-sort-by-occurrence)))
  (setq company-frontends '(company-pseudo-tooltip-unless-just-one-frontend company-echo-metadata-frontend company-preview-if-just-one-frontend))
  (company-quickhelp-mode t)
  (setq company-quickhelp-delay nil)
  (setq company-quickhelp-use-propertized-text t)
  (defun company-check-expansion ()
    (save-excursion
      (if (looking-at "\\_>") t
        (backward-char 1)
        (if (looking-at "\\.") t))))
  ;; (backward-char 1)
  ;; (if (looking-at "->") t nil)))))
  (defun tab-indent-or-complete ()
    (interactive)
    (or
     (when (org-at-table-p) (orgtbl-tab nil) t)
     (when helm-alive-p (helm-execute-persistent-action) t)
     (when (minibufferp) (completion-at-point) t)
     (yas-expand)
     (when (and company-mode (company-check-expansion))
       (company-complete-common) t)
     (completion-at-point)
     (indent-for-tab-command)))
  (evil-global-set-key 'insert (kbd "<tab>") 'tab-indent-or-complete)
  (defun company-abort-and-space ()
    (interactive)
    (company-abort)
    (insert " "))
  :bind (:map company-active-map
              ("<escape>" . company-abort)
              ("M-q" . company-abort)
              ("M-j" . company-select-next)
              ("M-k" . company-select-previous)
              ("M-d" . company-quickhelp-manual-begin)
              ("M-c" . company-show-location)
              ("M-h" . helm-company)
              ("M-s" . company-search-candidates)
              ("M-f" . company-filter-candidates)
              :map company-filter-map
              ("<escape>" . company-filter-abort)
              ("SPC" . company-abort-and-space)
              ("M-j" . company-select-next)
              ("M-k" . company-select-previous)
              ("M-q" . company-filter-abort)
              ("M-d" . company-quickhelp-manual-begin)
              ("M-c" . company-show-location)
              ("M-h" . helm-company)
              ("M-o" . company-search-toggle-filtering)
              :map company-search-map
              ("<escape>" . company-search-abort)
              ("SPC" . company-abort-and-space)
              ("M-j" . company-select-next)
              ("M-k" . company-select-previous)
              ("M-n" . company-search-repeat-forward)
              ("M-p" . company-search-repeat-backward)
              ("M-q" . company-search-abort)
              ("M-d" . company-quickhelp-manual-begin)
              ("M-c" . company-show-location)
              ("M-h" . helm-company)
              ("M-o" . company-search-toggle-filtering)
              ))
(use-package helm-company
  :ensure
  :after (helm company)
  :config
  (require 'helm-company))

(use-package company-math
  :ensure
  :after company)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Google
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package google
  :ensure
  :bind (:map evil-leader--default-map
              ("zg" . helm-google)))

(use-package google-translate
  :ensure
  :config
  (setq google-translate-pop-up-buffer-set-focus t)
  (setq google-translate-default-target-language "fr")
  (setq google-translate-default-source-language "auto")
  (setq google-translate-listen-program "mplayer")
  (defun google-translate-query-translate-to-fr ()
    (interactive)
    (let ((google-translate-default-source-language "auto")
          (google-translate-default-target-language "fr"))
      (google-translate-query-translate)))
  (defun google-translate-at-point-to-fr ()
    (interactive)
    (let ((google-translate-default-source-language "auto")
          (google-translate-default-target-language "fr"))
      (google-translate-at-point)))
  (defun google-translate-query-translate-to-en ()
    (interactive)
    (let ((google-translate-default-source-language "fr")
          (google-translate-default-target-language "en"))
      (google-translate-query-translate)))
  (defun google-translate-query-translate-to-en-and-speak ()
    (interactive)
    (let ((google-translate-default-source-language "fr")
          (google-translate-default-target-language "en"))
      (google-translate-query-translate)
      (forward-button 2)
      (push-button)))
  (defun google-translate-at-point-to-en ()
    (interactive)
    (let ((google-translate-default-source-language "fr")
          (google-translate-default-target-language "en"))
      (google-translate-at-point)))
  :bind (:map evil-leader--default-map
              ("te" . google-translate-query-translate-to-en)
              ("tse" . google-translate-query-translate-to-en-and-speak)
              ("tpe" . google-translate-at-point-to-en)
              ("tf" . google-translate-query-translate-to-fr)
              ("tpf" . google-translate-at-point-to-fr)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Web search engines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-leader/set-key "zr" (lambda (string)
                            (interactive "s[Context] Search for : ")
                            (browse-url (format "http://context.reverso.net/translation/french-english/%s" string ))))
(evil-leader/set-key "zm" (lambda (string)
                            (interactive "s[Matplotlib] Search for : ")
                            (browse-url (format "http://matplotlib.org/search.html?q=%s&check_keywords=yes&area=default" string))))
;; (evil-leader/set-key "zS" (lambda (string)
;;                             (interactive "s[Scihub] DOI : ")
;;                             (browse-url (format "https://sci-hub.cc/%s" string))))
;; (evil-leader/set-key "zs" (lambda (string)
;;                             (interactive "s[Libgen] Search for : ")
;;                             (browse-url (format "http://libgen.io/search.php?req=%s"
;;                                                 (replace-regexp-in-string "\\s-" "+" string)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Qutebrowser
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq helm-external-programs-associations
      '(("html" . "qutebrowser")
        ("pdf" . "okular")))
(defvar browse-url-qutebrowser-program "qutebrowser"
  "The name by which to invoke Qutebrowser or a variant of it.")
(defvar browse-url-qutebrowser-arguments nil
  "A list of strings to pass to Qutebrowser (or variant) as arguments.")
(defvar browse-url-qutebrowser-new-window-is-tab nil
  "Whether to open up new windows in a tab or a new window.
If non-nil, then open the URL in a new tab rather than a new window if
‘browse-url-qutebrowser’ is asked to open it in a new window.")
(defun browse-url-qutebrowser (url &optional new-window)
  (interactive (browse-url-interactive-arg "URL: "))
  (setq url (browse-url-encode-url url))
  (let* ((process-environment (browse-url-process-environment)))
    (apply 'start-process
           (concat "qutebrowser " url) nil
           browse-url-qutebrowser-program
           (append
            browse-url-qutebrowser-arguments
            (if (browse-url-maybe-new-window new-window)
                (if browse-url-qutebrowser-new-window-is-tab
                    '("--target tab")
                  '("--target window")))
            (list url)))))
(defun browse-url-default-browser-add-qutebrowser (orig-fun &rest args)
  (or (apply 'browse-url-qutebrowser args)
      (apply orig-fun args)))
(advice-add 'browse-url-default-browser
            :around #'browse-url-default-browser-add-qutebrowser)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Eww
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package eww
  :disabled
  :config
  ;; (evil-leader/set-key "zb" 'eww)
  ;; (evil-leader/set-key "zm" 'eww-list-bookmarks)
  (evil-define-key 'normal eww-mode-map "q" 'quit-window)
  (evil-define-key 'normal eww-mode-map "r" 'eww-reload)
  (evil-define-key 'normal eww-mode-map "s" 'eww)
  (evil-define-key 'normal eww-mode-map "H" 'eww-previous-url)
  (evil-define-key 'normal eww-mode-map "L" 'eww-previous-url)
  (evil-define-key 'normal eww-mode-map "J" 'eww-list-histories)
  (evil-define-key 'normal eww-mode-map "m" 'eww-add-bookmark)
  (evil-define-key 'normal eww-mode-map "M" 'eww-list-bookmarks)
  (evil-define-key 'normal eww-mode-map "R" 'eww-browse-with-external-browser)
  (evil-define-key 'normal eww-mode-map (kbd "<tab>") 'shr-next-link)
  (evil-define-key 'normal eww-mode-map (kbd "<backtab>") 'shr-previous-link)
  (evil-define-key 'normal eww-history-mode-map "q" 'quit-window)
  (evil-define-key 'normal eww-history-mode-map (kbd "<return>") 'eww-history-browse)
  (evil-define-key 'normal eww-bookmark-mode-map "q" 'quit-window)
  (evil-define-key 'normal eww-bookmark-mode-map (kbd "<return>") 'eww-bookmark-browse)
  (evil-define-key 'normal eww-bookmark-mode-map "x" 'eww-bookmark-kill))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Comint
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package comint
  :config
  (require 'comint)
  (setq comint-prompt-read-only t)
  (defun my-comint-preoutput-read-only (text)
    (propertize text 'read-only t))
  (defun my-comint-goto-prompt-at-insertion ()
    (let ((end 0))
      (save-excursion
        (forward-line 1)
        (when (equal (point) (point-max))
          (setq end 1)))
      (when (equal end 0)
        (goto-char (point-max)))))
  (add-hook 'comint-preoutput-filter-functions  ;; make everythin read-only
            'my-comint-preoutput-read-only)
  (add-hook 'comint-mode-hook
            (lambda () (add-hook 'evil-insert-state-entry-hook 'my-comint-goto-prompt-at-insertion nil t)))
  (add-hook 'comint-mode-hook (lambda () (drag-stuff-mode -1)))
  (evil-define-key 'normal comint-mode-map "M-k" 'comint-previous-input)
  (evil-define-key 'normal comint-mode-map "M-j" 'comint-next-input)
  (evil-define-key 'normal comint-mode-map "M-l" 'helm-comint-input-ring)
  :bind (:map comint-mode-map
              ("M-k" . comint-previous-input)
              ("M-j" . comint-next-input)
              ("M-l" . helm-comint-input-ring)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Max column indicator
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package fill-column-indicator
  :disabled
  :ensure
  :config
  (setq fci-rule-color "dim gray"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Elpy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package pyvenv
  :ensure)
(use-package highlight-indentation
  :ensure)
(use-package find-file-in-project
  :ensure)
(use-package elpy
  :init
  (el-get-bundle elpy
    :type git
    :url "https://www.github.com/jorgenschaefer/elpy"
    :branch "master"
    :features elpy)
  ;; Be sure to use last elpy version !
  (el-get-update 'elpy)
  :after (visual-fill-column find-file-in-project)
  :config
  ;; enable Elpy
  (with-eval-after-load 'python (elpy-enable))
  ;; Elpy general settings
  (setq elpy-modules (quote (elpy-module-company
                             elpy-module-yasnippet
                             elpy-module-flymake
                             elpy-module-eldoc
                             elpy-module-sane-defaults))
        elpy-eldoc-show-current-function nil
        elpy-rpc-timeout 10
        elpy-dedicated-shells t
        elpy-test-runner 'elpy-test-pytest-runner
        elpy-shell-echo-input nil
        elpy-shell-echo-output nil
        elpy-shell-capture-last-multiline-output nil
        elpy-rpc-python-command "python"
        python-shell-interpreter "python"
        python-shell-interpreter-args "-i"
        ;; python-shell-interpreter "jupyter"
        ;; python-shell-interpreter-args "console --simple-prompt"
        ;; python-shell-interpreter-interactive-arg "console --simple-prompt"
        python-shell-completion-native-enable nil
        python-indent-guess-indent-offset nil
        elpy-shell-use-project-root nil
        elpy-profile-visualizer "snakeviz")
  ;; python hooks
  (add-hook 'python-mode-hook (lambda ()
                                (visual-line-mode -1)
                                (setq truncate-lines t)
                                (visual-fill-column-mode)))
  ;; elpy hooks
  (add-hook 'elpy-mode-hook (lambda () (elpy-shell-toggle-dedicated-shell 1)))
  ;; Custom function
  (defun elpy-switch-to-dev-version ()
    "Switch to the development version of elpy."
    (interactive)
    (add-to-list 'load-path "~/dev/elpy")
    (load-library "elpy")
    (load-library "elpy-shell")
    (load-library "elpy-profile")
    (load-library "elpy-refactor")
    (load-library "elpy-django")
    (setenv "PATH" (format "~/dev/elpy/elpy:%s" (getenv "PATH")))
    (elpy-rpc-restart))
  (defun elpy-switch-python-2-or-3 ()
    "Switch between python version 2 and 3"
    (interactive)
    (if (string-equal elpy-rpc-python-command "python3")
        (progn
          (setq elpy-rpc-python-command "python2"
                python-shell-interpreter "python2")
          (message "Swiched to Python 2"))
      (setq elpy-rpc-python-command "python3"
            python-shell-interpreter "python3")
      (message "Switched to Python 3"))
    (elpy-rpc-restart))
  (defun elpy-shell-interrupt ()
    "Interrupt the python shell associated with the current python buffer."
    (interactive)
    (elpy-shell-switch-to-shell)
    (interrupt-process)
    (elpy-shell-switch-to-buffer))
  (defun elpy-temp-python-buffer ()
    (interactive)
    (let ((tmpfile (make-temp-file "elpy-tmp-" nil ".py")))
      (find-file tmpfile)
      (insert
       "#!/bin/env python 3


import matplotlib.pyplot as plt
import numpy as np
import pdb

")))
  (defun elpy-transform-to-f-string ()
    "Transform the current string to an f string."
    (interactive)
    (save-excursion
      (re-search-backward "\\(\"\\|\'\\)")
      (if (not (looking-back "f"))
          (insert "f")
        (backward-char 1)
        (delete-char 1))))
  (defun elpy-goto-import-header ()
    "Jump to the import header."
    (interactive)
    (evil-set-jump)
    (goto-char (point-min))
    (re-search-forward "^import"))
  (defun elpy-shell-goto-last-error ()
    "Jump to the last error reported by the shell."
    (interactive)
    (elpy-shell-switch-to-shell)
    (goto-char (point-max))
    (while (condition-case nil
               (progn (compile-goto-error) nil)
             (error t))
      (forward-line -1)))

  ;; Temporary
  ;;     Get font locking right (wait for https://debbugs.gnu.org/cgi/bugreport.cgi?bug=32344 to be fixed)
  (advice-add 'elpy-shell--insert-and-font-lock
              :around (lambda (f string face &optional no-font-lock)
                        (if (not (eq face 'comint-highlight-input))
                            (funcall f string face no-font-lock)
                          (funcall f string face t)
                          (python-shell-font-lock-post-command-hook))))
  (advice-add 'comint-send-input
              :around (lambda (f &rest args)
                        (when (eq major-mode 'inferior-python-mode)
                          (cl-letf ((g (symbol-function 'add-text-properties))
                                    ((symbol-function 'add-text-properties)
                                     (lambda (start end properties
                                                    &optional object)
                                       (unless (eq (nth 3 properties)
                                                   'comint-highlight-input)
                                         (funcall g start end properties
                                                  object)))))
                            (apply f args)))))

  ;; Elpy general keybinding
  (evil-define-key 'normal 'python-mode-map
    (kbd ">") 'python-indent-shift-right
    (kbd "<") 'python-indent-shift-left)

  (evil-leader/set-key (kbd "by") 'elpy-temp-python-buffer)
  (evil-leader/set-key-for-mode 'python-mode
    "ll" (lambda () (interactive) (elpy-shell-switch-to-shell) (evil-goto-line))
    "lc" 'elpy-shell-interrupt
    "lak" (lambda () (interactive) (elpy-shell-kill-all t nil))
    "lk" (lambda () (interactive) (elpy-shell-kill t))
    "lo" 'elpy-shell-goto-last-error
    "ee"
    (lambda ()
      "Send region or buffer to python shell"
      (interactive)
      (elpy-shell-send-region-or-buffer t)
      (deactivate-mark)
      (let ((currbuf (current-buffer)))
        (pop-to-buffer (process-buffer (elpy-shell-get-or-create-process)))
        (my-comint-goto-prompt-at-insertion)
        (pop-to-buffer currbuf)))
    "eq"
    (lambda ()
      "Quietly send region or buffer to python shell"
      (interactive)
      (elpy-shell-send-region-or-buffer)
      (deactivate-mark))
    "ep" 'elpy-shell-send-group
    "ec" 'elpy-shell-send-defclass
    "ef" 'elpy-shell-send-defun
    "et" 'elpy-test
    "eT" (lambda () (interactive) (elpy-test t))
    "er" 'elpy-profile
    "mr" 'elpy-multiedit-python-symbol-at-point
    "hd" 'elpy-doc
    "gd" 'xref-find-definitions
    "gD" 'xref-find-definitions-other-window
    "ga" 'elpy-goto-assignment
    "gA" 'elpy-goto-assignment-other-window
    "gr" (lambda () (interactive)
           (let ((id (elpy-xref--identifier-at-point)))
             (if id
                 (xref-find-references (elpy-xref--identifier-at-point))
               (error "No valid symbol at point"))))
    "gi" 'elpy-goto-import-header
    "mf" 'elpy-transform-to-f-string)

  ;; python shell keybindings
  (with-eval-after-load 'python
    (evil-define-key 'insert inferior-python-mode-map (kbd "<tab>") 'company-complete-common)
    (evil-define-key 'normal python-mode-map (kbd "<tab>") 'indent-according-to-mode))
  (evil-define-key 'normal python-mode-map "L" 'evil-forward-any-arg)
  (evil-define-key 'normal python-mode-map "H" 'evil-backward-any-arg)
  (evil-define-key 'normal inferior-python-mode-map "L" 'evil-forward-any-arg)
  (evil-define-key 'normal inferior-python-mode-map "H" 'evil-backward-any-arg))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO : Completion at point does not work in pdb
;; Due to bug in company ?
;; (defadvice python-shell-completion-at-point (before fix-company-bug activate)
;;   "Fix a bug in company, modifying the current point"
;;   (goto-char (point-max)))
;; from https://github.com/company-mode/company-mode/issues/759
;; (defadvice python-shell-completion-at-point (around fix-company-bug activate)
;;   "python-shell-completion-at-point breaks when point is before the prompt"
;;   (when (>= (point) (cdr comint-last-prompt))
;;     ad-do-it))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python debugging (gud)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; perso functions
(defun elpy-debug-current-script ()
  "Use Gud on the current script for debugging purpose."
  (interactive)
  (lambda () (interactive)
    (let ((gudbuff (format "*gud-%s*" (buffer-name (current-buffer)))))
      (if (not (get-buffer-process gudbuff))
          (if (get-buffer gudbuff)
              (save-window-excursion
                (ignore-errors
                  (pdb (format "pdb %s" (buffer-file-name (current-buffer))))))
            (pdb (format "pdb %s" (buffer-file-name (current-buffer)))))
        (switch-to-buffer-other-window gudbuff)))))
(defun elpy-pdb-post-mortem ()
  "Send 'pdb.pm()' to the associated python shell."
  (interactive)
  (let* ((bufname (format "*%s*" (python-shell-get-process-name nil)))
         (proc (get-buffer-process bufname)))
    (if (not proc)
        (message "No active Python shell")
      (elpy-shell-switch-to-shell)
      (goto-char (point-max))
      (insert "import pdb; pdb.pm()")
      (comint-send-input))))
(defun quit-gud-or-postmortem-python-debugging ()
  "Quit gud or post-mortem python debugging."
  (interactive)
  ;; gud style
  (let* ((gudbuff (format "*gud-%s*" (buffer-name (current-buffer)))))
    (if (get-buffer gudbuff)
        (with-current-buffer gudbuff
          (when (get-buffer-process gudbuff)
            (kill-process (get-buffer-process gudbuff)))
          (delete-windows-on gudbuff)
          (kill-buffer))
      ;; post-mortem style
      (let* ((bufname (format "*Python[%s]*" (buffer-name))))
        (with-current-buffer bufname
          (if (save-excursion
                (goto-char (point-max))
                (forward-line -1)
                (end-of-line)
                (re-search-forward "Pdb" (point-max) t))
              (progn
                (goto-char (point-max))
                (insert "exit")
                (comint-send-input))
            ;; no style
            (message "No debugging window to close")))))))
;; keybinding
(evil-leader/set-key-for-mode 'python-mode "dd" 'elpy-debug-current-script)
(evil-leader/set-key-for-mode 'python-mode "df" 'gud-finish)
(evil-leader/set-key-for-mode 'python-mode "dc" 'gud-cont)
(evil-leader/set-key-for-mode 'python-mode "db" 'gud-break)
(evil-leader/set-key-for-mode 'python-mode "dB" 'gud-remove)
(evil-leader/set-key-for-mode 'python-mode "dn" 'gud-next)
(evil-leader/set-key-for-mode 'python-mode "dk" 'gud-up)
(evil-leader/set-key-for-mode 'python-mode "dj" 'gud-down)
(evil-leader/set-key-for-mode 'python-mode "dr" 'gud-refresh)
(evil-leader/set-key-for-mode 'python-mode "de" 'gud-statement)
(evil-leader/set-key-for-mode 'python-mode "dp" 'gud-print)
(evil-leader/set-key-for-mode 'python-mode "ds" 'gud-step)
(evil-leader/set-key-for-mode 'python-mode "dq" 'quit-gud-or-postmortem-python-debugging)
(evil-leader/set-key-for-mode 'python-mode "dm" 'elpy-pdb-post-mortem)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python-notebook
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ein
  :ensure
  :config
  (push 'ein:notebooklist-mode evil-motion-state-modes)
  (evil-leader/set-key "js" 'ein:jupyter-server-start)
  (evil-leader/set-key "jS" 'ein:jupyter-server-stop)
  (evil-leader/set-key "jj" 'ein:jupyter-server-login-and-open))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Xref
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-define-key 'normal xref--xref-buffer-mode-map
  (kbd "<return>") (lambda () (interactive)
                     (let ((buf (current-buffer)))
                       (xref-goto-xref)
                       (with-current-buffer buf
                         (kill-buffer-and-window))))
  (kbd "<tab>") 'xref-show-location-at-point
  "q" 'quit-window
  "r" 'xref-query-replace-in-results)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Haskell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ghci-completion
  :ensure)
(use-package haskell-mode
  :disabled
  :ensure
  :config
  (setq haskell-mode-hook
        (quote
         (highlight-uses-mode interactive-haskell-mode flymake-mode)))
  ;; hooks
  (add-hook 'haskell-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends)
                   (append '((company-capf company-dabbrev-code))
                           company-backends))))
  (setq haskell-compile-command "ghc %s")
  (evil-leader/set-key-for-mode 'haskell-mode
    (kbd "ee") 'haskell-process-load-file
    (kbd "ek") 'haskell-process-restart))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flymake
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keybinding
(cl-loop
 for mode in '(python-mode emacs-lisp-mode)
 do
 (evil-leader/set-key-for-mode mode
   "ob" 'flymake-start
   "ol" 'flymake-switch-to-log-buffer
   "ov" 'flymake-reporting-backends
   "on" 'flymake-goto-next-error
   "op" 'flymake-goto-prev-error
   "ob" 'flymake-diagnostic-buffer
   "oo" 'flymake-show-diagnostics-buffer))
;; flymake error list
(push 'flymake-diagnostics-buffer-mode evil-motion-state-modes)
(evil-define-key 'motion flymake-diagnostics-buffer-mode-map
  (kbd "RET") 'flymake-goto-diagnostic
  (kbd "TAB") 'flymake-show-diagnostic)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cython
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO : Cython : finish compilation using distutil
(use-package cython-mode
  :ensure
  :config
  (require 'cython-mode)
  (evil-leader/set-key-for-mode cython-mode-map "ee" 'cython-compile))
(defun cython-compile-using-distutil-sentinel (proc string)
  (cond
   ((string= string "finished\n")
    (message "Compilation OK"))
   (t
    (message "Compilation end with errors"))))
(defun cython-compile-using-distutil ()
  "Compile the cython file (or project) using the project 'setup.py' file."
  (interactive)
  (let* ((file (car (projectile-find-file-matching-regex "setup\\.py")))
         (cmd (list python-shell-interpreter file "build_ext" "--inplace"))
         (proc (make-process :name "Run_setup.py"
                             :buffer "*setup.py*"
                             :command cmd
                             :sentinel 'cython-compile-using-distutil-sentinel)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Elisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package lisp-mode
  :after visual-fill-column
  :config
  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
  (add-hook 'emacs-lisp-mode-hook 'flymake-mode)
  (add-hook 'emacs-lisp-mode-hook 'visual-fill-column-mode)
  (evil-leader/set-key-for-mode 'emacs-lisp-mode "ee"
    'evil-eval-buffer-or-region)
  (evil-leader/set-key-for-mode 'emacs-lisp-mode "eb" 'eval-buffer)
  (evil-leader/set-key-for-mode 'emacs-lisp-mode "ef" 'eval-defun)
  (evil-leader/set-key-for-mode 'emacs-lisp-mode "ec" 'emacs-lisp-byte-compile-and-load)
  (evil-leader/set-key-for-mode 'emacs-lisp-mode "edf" (lambda () (interactive) (eval-defun t)))
  (evil-leader/set-key-for-mode 'emacs-lisp-mode "gd" (lambda () (interactive)
                                                        (find-function (function-called-at-point))))
  (evil-leader/set-key-for-mode 'emacs-lisp-mode "gD" 'find-function-at-point)
  (defun evil-eval-buffer-or-region (beg end)
    (interactive (if (use-region-p)
                     (list (region-beginning) (region-end))
                   (list nil nil)))
    ;; Ensure process exists
    (if (use-region-p)
        (progn
          (eval-region beg end)
          (message "Evaluated region"))
      (eval-buffer)
      (message "Evaluated buffer"))
    (deactivate-mark))
  (defun evil-eval-region (beg end)
    (interactive (if (use-region-p)
                     (list (region-beginning) (region-end))
                   (list nil nil)))
    ;; Ensure process exists
    (if (use-region-p)
        (eval-region beg end))
    (deactivate-mark))
  (defun describe-at-point ()
    "Show the documentation of the Elisp function and variable near point.
        This checks in turn:
        -- for a function name where point is
        -- for a variable name where point is
        -- for a surrounding function call
        "
    (interactive)
    (let (sym)
      (cond ((setq sym (ignore-errors
                         (with-syntax-table emacs-lisp-mode-syntax-table
                           (save-excursion
                             (or (not (zerop (skip-syntax-backward "_w")))
                                 (eq (char-syntax (char-after (point))) ?w)
                                 (eq (char-syntax (char-after (point))) ?_)
                                 (forward-sexp -1))
                             (skip-chars-forward "`'")
                             (let ((obj (read (current-buffer))))
                               (and (symbolp obj) (fboundp obj) obj))))))
             (describe-function sym))
            ((setq sym (variable-at-point)) (describe-variable sym))
            ;; now let it operate fully -- i.e. also check the
            ;; surrounding sexp for a function call.
            ((setq sym (function-at-point)) (describe-function sym)))))
  (evil-leader/set-key-for-mode 'emacs-lisp-mode "hd" 'describe-at-point)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Lisp interaction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key lisp-interaction-mode-map (kbd "C-<return>") 'eval-print-last-sexp)
(evil-leader/set-key-for-mode 'lisp-interaction-mode "ee" 'evil-eval-buffer-or-region)
(evil-leader/set-key-for-mode 'lisp-interaction-mode "eb" 'eval-buffer)
(evil-leader/set-key-for-mode 'lisp-interaction-mode "ef" 'eval-defun)
(evil-leader/set-key-for-mode 'lisp-interaction-mode "edf" (lambda () (interactive) (eval-defun t)))
(evil-leader/set-key-for-mode 'lisp-interaction-mode "gd" (lambda () (interactive)
                                                            (find-function (function-called-at-point))))
(evil-leader/set-key-for-mode 'lisp-interaction-mode "gD" 'find-function-at-point)
(evil-leader/set-key-for-mode 'lisp-interaction-mode "hd" 'describe-at-point)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Edebug
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-add-to-alist 'evil-overriding-maps 'edebug-mode-map nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Wrap
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package adaptive-wrap
  :ensure
  :config
  ;; (setq adaptive-fill-regexp "[ 	]*\\([-–!|#%;>*·•‣⁃◦]+[ 	]*\\)*")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auctex
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO : Latex : need cleaning
;; TODO : Work on a way to use langtool on latex without checking useless things
;; Install
(use-package auctex-custom
  :init
  (el-get-bundle auctex-custom
    :url "https://www.github.com/galaunay/auctex-custom.git"
    :branch "master")
  :after tex)

(use-package tex
  :ensure auctex
  :after visual-fill-column
  :init
  (require 'tex)
  (require 'tex-buf)
  (require 'preview)
  :config
  ;; hooks
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'show-paren-mode)
  (add-hook 'LaTeX-mode-hook 'visual-line-mode) ; line wrapping
  (add-hook 'LaTeX-mode-hook 'visual-fill-column-mode)
  (add-hook 'LaTeX-mode-hook 'toggle-word-wrap) ; line wrapping
  (add-hook 'LaTeX-mode-hook 'adaptive-wrap-prefix-mode) ; line wrapping
  (add-hook 'LaTeX-mode-hook 'yas-minor-mode) ; snippets
  (add-hook 'LaTeX-mode-hook (lambda ()
                               (setq-local company-auto-complete nil)
                               (setq-local company-idle-delay nil)
                               (setq-local visual-fill-column-center-text t)
                               (setq-local visual-fill-column-width 80)))
  (add-hook 'TeX-error-overview-mode-hook (lambda ()
                                            (visual-line-mode -1)
                                            (setq truncate-lines t)))
  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer)
  ;; Config
  (setq TeX-auto-save t
        TeX-save-query nil
        TeX-parse-self t
        TeX-clean-confirm nil
        TeX-debug-warnings t
        TeX-PDF-mode t
        TeX-error-overview-open-after-TeX-run t
        TeX-newline-function (quote newline-and-indent)
        TeX-source-correlate-method 'synctex
        TeX-source-correlate-start-server t
        TeX-source-correlate-mode t
        TeX-view-program-selection '((output-pdf "PDF Tools"))
        preview-auto-cache-preamble t
        preview-image-type (quote dvipng)
        preview-scale-function (lambda nil
                                 (* (/ 9.0 (preview-document-pt)) 1.3)))

  (setq-default TeX-master nil)
  ;; keybinding
  (evil-leader/set-key-for-mode 'latex-mode
    "ee" (lambda () (interactive)
           (TeX-error-overview-quit-help)
           (TeX-save-buffer-or-project)
           (TeX-command-master))
    "ea" 'TeX-toggle-compilation-on-save
    "el" (lambda () (interactive)
           (TeX-save-and-command "LaTeX" 'TeX-master-file))
    "em" (lambda () (interactive)
           (TeX-save-and-command "LatexMk" 'TeX-master-file))
    "ev" (lambda () (interactive)
           (TeX-command-and-show "LatexMk" 'TeX-master-file))
    "eo" (lambda () (interactive)
           (TeX-save-and-command "Check" 'TeX-master-file))
    "vv" (lambda () (interactive)
           (let ((TeX-current-process-region-p nil))
             (TeX-view)))
    "gv" (lambda () (interactive)
           (let ((TeX-current-process-region-p nil))
             (TeX-view)
             (evil-window-next nil)))
    "eE" (lambda () (interactive)
           (TeX-error-overview-quit-help)
           (save-buffer)
           (TeX-command-buffer))
    "eL" (lambda () (interactive)
           (TeX-save-and-command-on-region "LaTeX" 'TeX-region-file))
    "eM" (lambda () (interactive)
           (TeX-save-and-command-on-region "LatexMk" 'TeX-region-file))
    "eV" (lambda () (interactive)
           (TeX-command-and-show-on-region "LatexMk" nil 'TeX-region-file))
    "vV" (lambda () (interactive)
           (let ((TeX-current-process-region-p t))
             (TeX-view)))
    "ek" (lambda () (interactive)
           (setq compilation-in-progress nil) (TeX-kill-job))
    "ec" (lambda () (interactive)
           (shell-command "rm -f .fuse_hidden*" nil nil)
           (shell-command "rm -rf _region_*" nil nil)
           (shell-command "rm -f *.log" nil nil)
           (shell-command "rm -rf auto" nil nil)
           (shell-command "rm -f *.tns" nil nil)
           (TeX-command "Clean" 'TeX-master-file))
    "otn" 'TeX-next-error
    "otp" 'TeX-previous-error
    "oto" 'TeX-error-overview
    "otl" (lambda () (interactive) (TeX-recenter-output-buffer nil))
    "ottb" 'TeX-toggle-debug-bad-boxes
    "ottw" 'TeX-toggle-debug-warnings
    "otti" 'TeX-interactive-mode
    "im" 'helm-insert-latex-math
    "ie" 'LaTeX-environment
    "iE" 'LaTeX-close-environment
    "if" 'TeX-insert-macro
    "me" (lambda () (interactive) (LaTeX-environment t))
    ;; repalced by ialign
    ;; "ma" (lambda () (interactive)
    ;;        (if (use-region-p)
    ;;            (align (region-beginning) (region-end))
    ;;          (align-current)))
    "gm" 'TeX-goto-master-file
    "hd" 'TeX-doc
    "epb" 'preview-buffer
    "epc" 'preview-clearout-buffer
    "epr" 'preview-region
    "epp" 'preview-at-point
    "epe" 'preview-environment
    "eps" 'preview-section)
  ;; latex error keybinding
  (define-key TeX-error-overview-mode-map (kbd "<tab>")
    'TeX-error-overview-goto-source)
  (define-key TeX-error-overview-mode-map (kbd "<return>")
    'TeX-error-overview-jump-to-source)
  (evil-define-key 'normal TeX-error-overview-mode-map (kbd "b")
    'TeX-error-overview-toggle-debug-bad-boxes)
  (evil-define-key 'normal TeX-error-overview-mode-map (kbd "w")
    'TeX-error-overview-toggle-debug-warnings)
  (evil-define-key 'normal TeX-error-overview-mode-map (kbd "q")
    'TeX-error-overview-quit-help)
  (evil-leader/set-key-for-mode 'latex-mode (kbd "gf")
    'TeX-find-figure-by-number)
  (evil-leader/set-key-for-mode 'latex-mode (kbd "ge")
    'TeX-find-equation-by-number)
  )

(use-package math-symbol-lists
  :ensure)

(use-package auctex-latexmk
  :after tex
  :ensure
  :config
  (require 'auctex-latexmk)
  (auctex-latexmk-setup)
  (setq LaTeX-clean-intermediate-suffixes
        (quote
         ("\\.aux" "\\.bbl" "\\.blg" "\\.brf" "\\.fot" "\\.glo" "\\.gls" "\\.idx" "\\.ilg" "\\.ind"
          "\\.lof" "\\.log" "\\.lot" "\\.nav" "\\.out" "\\.snm" "\\.toc" "\\.url" "\\.synctex\\.gz"
          "\\.bcf" "\\.run\\.xml" "\\.fls" "-blx\\.bib" "\\.fdb_latexmk" "\\.aux.bak" "\\.fls" "\\.nlo"
          "\\.cb" "\\.cb2" "\\.maf" "\\.nls"
          "\\.mtc" "\\.mtc0" "\\.mtc1" "\\.mtc2" "\\.mtc3" "\\.mtc4" "\\.mtc5" "\\.mtc6" "\\.mtc7" "\\.mtc8" "\\.mtc9" )))
  (setq auctex-latexmk-inherit-TeX-PDF-mode t))

(use-package zotelo
  :after auctex
  :disabled
  :ensure)

(use-package company-auctex
  :after auctex
  :init
  (el-get-bundle company-auctex
    :url "https://www.github.com/emacsmirror/company-auctex.git"
    :features company-auctex)
  (require 'company-auctex)
  :config
  (company-auctex-init))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Perso latex functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO : Latex : need cleaning
;; documentation
(defun TeX-doc ()
  "Search documentation with texdoc for symbol at point."
  (interactive)
  (let ((err nil)
        (symb (thing-at-point 'symbol)))
    (with-temp-buffer
      (call-process "texdoc" nil t nil "--view" symb)
      (goto-char (point-min))
      (when (re-search-forward "^Sorry, no documentation found for.*$" (point-max) t)
        (setq err t))
      )
    (if err
        (browse-url (format "https://duckduckgo.com/?q=latex+%s" symb)))))
;; Split sentences
(defun split-sentences ()
  "Make the current region/buffer one setence per line."
  (interactive)
  (let ((nmb_repl 0)
        (beg (if (region-active-p) (region-beginning) (line-beginning-position)))
        (end (if (region-active-p) (region-end) (line-end-position))))
    (evil-normal-state)
    (save-excursion
      (goto-char beg)
      (while (re-search-forward "\\. \\([^\n]\\)" end t)
        (setq nmb_repl (+ nmb_repl 1))
        (replace-match ". \n\\1" nil nil)))
    (if (= nmb_repl 0)
        (message "No sentences to split")
      (message "%s sentences splited" (+ nmb_repl 1)))))
;; (defun split-sentences-in-buffer ()
;;   (interactive)
;;   (let ((nmb_repl 0)
;;         (match))
;;     (save-excursion
;;       (goto-char (point-min))
;;       (while (re-search-forward "\\. [^\n]" (point-max) t)
;;         (backward-char 2)
;;         (when (y-or-n-p "Split here ? ")
;;           (delete-char 1)
;;           (insert "\n")
;;           (setq nmb_repl (+ nmb_repl 1)))
;;         (forward-char 2)))
;;     (if (= nmb_repl 0)
;;         (message "No sentences to split")
;;       (message "%s sentences splited" (+ nmb_repl 1)))))
(defun latex-clean-blank-lines ()
  "Normalize blank lines between paragraph/sections."
  (interactive)
  (let ((blanck-regex "^\\s-*$"))
    (save-excursion
      ;; remove trailling whitespaces
      (delete-trailing-whitespace)
      (goto-char (point-min))
      (forward-line)
      ;; kill redondant empty lines
      (while (re-search-forward blanck-regex (- (point-max) 1) t)
        (forward-line)
        (while (re-search-forward blanck-regex (line-end-position) t)
          (when (not (string-match blanck-regex (thing-at-point 'line)))
            (error "Try to remove a non-empty line: %s" (thing-at-point 'line)))
          (beginning-of-line)
          (kill-line)))
      ;; Add line before section if not alreday the case
      (goto-char (point-min))
      (while (re-search-forward "^\\\\\\(\\(sub\\)*section\\|chapter\\|part\\){.*}$" (point-max) t)
        (beginning-of-line)
        (forward-line -1)
        (when (not (re-search-forward blanck-regex (line-end-position) t))
          (forward-line)
          (newline))
        (forward-line 2))))
  (message "This is an experimental function, you should check diff before proceeding"))
;; section and environnement operators
(evil-define-text-object evil-latex-outer-section (count &optional beg end type)
  "Select outer sections"
  (let ((beg nil) (end nil))
    (save-excursion
      (LaTeX-mark-section)
      (setq beg (region-beginning))
      (setq end (region-end)))
    (evil-range beg end)))
(evil-define-text-object evil-latex-inner-section (count &optional beg end type)
  "Select inner sections"
  (let ((beg nil) (end nil))
    (save-excursion
      (LaTeX-mark-section)
      ;; get first line
      (forward-line)
      (if (re-search-forward "^\\\\label{.*}$" (line-end-position) t)
          (forward-line))
      (setq beg (region-beginning))
      (setq end (region-end)))
    (evil-range beg end)))
(evil-define-text-object evil-latex-inner-environment (count &optional beg end type)
  "Select inner environment"
  (let ((cur (point)) (beg nil) (end nil))
    (save-excursion
      (LaTeX-find-matching-end)
      (setq end (line-beginning-position 1))
      (goto-char cur)
      (LaTeX-find-matching-begin)
      (setq beg (line-beginning-position 2)))
    (evil-range beg end)))
(evil-define-text-object evil-latex-outer-environment (count &optional beg end type)
  "Select outer environment"
  (let ((cur (point)) (beg nil) (end nil))
    (save-excursion
      (LaTeX-find-matching-end)
      (setq end (line-beginning-position 2))
      (goto-char cur)
      (LaTeX-find-matching-begin)
      (setq beg (point)))
    (evil-range beg end)))

;; edit the figure at point
;; TODO : Add message when executable not found
(defun latex-edit-figure-at-point ()
  "Edit the figure at point with an external editor."
  (interactive)
  (let ((beg) (end) (reg-beg) (reg-end) (filename)
        (proj-files (projectile-current-project-files))
        (curr-file) (stop) (fsvg) (fpdf) (feps) (fpng) (fxcf)
        (curr-env (LaTeX-current-environment))
        (curr-filename nil))
    (save-excursion
      ;; Goto to a figure if not currently at point
      (when (not (string-match "figure.*" (LaTeX-current-environment)))
        (TeX-find-figure-by-number (read-number "Figure number: ")))
      ;; Find figure beginning and end
      (LaTeX-find-matching-end)
      (setq reg-end (point))
      (forward-line -1)
      (LaTeX-find-matching-begin)
      (setq reg-beg (point))
      ;; get figure filename
      (re-search-forward "\\\\includegraphics\\(\\[.*\\]\\)?[\n]?[ ]*{\\([^}]*\\)}" reg-end t)
      (setq filename (match-string 2))
      (setq filename (replace-regexp-in-string ".+/" "" filename))
      (setq filename (replace-regexp-in-string "\\..+" "" filename))
      ;; Search for file of different extensions in project
      (while (not (= (length proj-files) 0))
        (setq curr-file (format "%s%s" (projectile-project-root) (pop proj-files)))
        (setq curr-filename (replace-regexp-in-string ".+/" "" curr-file))
        (when (string= curr-filename (format "%s.svg" filename))
          (setq fsvg curr-file))
        (when (string= curr-filename (format "%s.pdf" filename))
          (setq fpdf curr-file))
        (when (string= curr-filename (format "%s.eps" filename))
          (setq feps curr-file))
        (when (string= curr-filename (format "%s.xcf" filename))
          (setq fxcf curr-file))
        (when (or
               (or (string= curr-filename (format "%s.png" filename))
                   (string= curr-filename (format "%s.jpg" filename)))
               (string= curr-filename (format "%s.jpeg" filename)))
          (setq fpng curr-file))
        ))
    ;; open the best file
    (if fsvg
        (progn
          (call-process "/bin/bash" nil 0 nil "-c" (format "inkscape \"%s\"" fsvg))
          (message "Opening \"%s\" with Inkscape..." fsvg))
      (if fpdf
          (progn
            (call-process "/bin/bash" nil 0 nil "-c" (format "inkscape \"%s\"" fpdf))
            (message "Opening \"%s\" with Inkscape..." fpdf))
        (if feps
            (progn
              (call-process "/bin/bash" nil 0 nil "-c" (format "inkscape \"%s\"" feps))
              (message "Opening \"%s\" with Inkscape..." feps))
          (if fxcf
              (progn
                (call-process "/bin/bash" nil 0 nil "-c" (format "gimp \"%s\"" fxcf))
                (message "Opening \"%s\" with Gimp..." fxcf))
            (if fpng
                (progn
                  (call-process "/bin/bash" nil 0 nil "-c" (format "gimp \"%s\"" fpng))
                  (message "Opening \"%s\" with Gimp..." fpng))
              (message "File %s not found" filename))))))))

;; move between tex files
(defun TeX-goto-master-file ()
  "Go to the master TeX file."
  (interactive)
  (find-file (format "%s/%s.tex" (TeX-master-directory) (TeX-master-file))))

;; keybindings
(define-key evil-inner-text-objects-map "ls" 'evil-latex-inner-section)
(define-key evil-outer-text-objects-map "ls" 'evil-latex-outer-section)
(define-key evil-outer-text-objects-map "le" 'evil-latex-outer-environment)
(define-key evil-inner-text-objects-map "le" 'evil-latex-inner-environment)
(evil-leader/set-key-for-mode 'latex-mode
  "mss" 'split-sentences
  "mcc" 'latex-clean-blank-lines
  ;; "msb" 'split-sentences-in-buffer
  "mf" 'latex-edit-figure-at-point)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Latexdiff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package latexdiff
  :init
  :disabled
  (el-get-bundle latexdiff
    :url "https://www.github.com/galaunay/latexdiff.el.git"
    :features latexdiff)
  :after helm
  :config
  (evil-leader/set-key-for-mode 'latex-mode "edd" 'helm-latexdiff-vc)
  (evil-leader/set-key-for-mode 'latex-mode "edr" 'helm-latexdiff-vc-range)
  (evil-leader/set-key-for-mode 'latex-mode "edf" 'latexdiff)
  (evil-leader/set-key-for-mode 'latex-mode "edc" 'latexdiff-clean))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PDF tools
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package pdf-tools
  :ensure
  :init
  (pdf-tools-install t)
  :config
  (setq pdf-outline-imenu-use-flat-menus t
        pdf-misc-print-programm "/usr/bin/lpr"
        pdf-misc-print-programm-args (quote  "-p sides=two-sieded-long-edge")
        pdf-view-midnight-colors '("#FDF4C1" . "#282828" ))
  ;; adapt for evil
  (add-to-list 'evil-motion-state-modes 'pdf-view-mode)
  (add-to-list 'evil-motion-state-modes 'pdf-outline-buffer-mode)
  (add-to-list 'evil-motion-state-modes 'pdf-occur-buffer-mode)
  ;; hooks
  (add-hook 'pdf-view-mode-hook (lambda ()
                                  (line-number-mode -1)
                                  (drag-stuff-mode -1)
                                  (hl-line-mode -1)
                                  (font-lock-mode -1)
                                  (company-mode -1)
                                  (visual-line-mode -1)
                                  (undo-tree-mode -1)
                                  (yas-minor-mode -1)
                                  (pdf-outline-imenu-enable)
                                  ;; provoke slow down ?
                                  ;; (pdf-view-midnight-minor-mode 1)
                                  ))
  ;; custom functions
  (defun pdf-misc-ask-and-print-document ()
    "Ask for printing parameters and print curent pdf."
    (interactive)
    (let* ((pages (read-string "Pages: "
                               (format "1-%s" (pdf-info-number-of-pages))))
           (first-page (string-to-number (car (split-string pages "-"))))
           (last-page (string-to-number (car (cdr (split-string pages "-")))))
           (sides (read-string "Double-sided (short/long/): " "long"))
           (printer (read-string "Printer: " "default"))
           (num-copy (read-number "Number of copies: " 1)))
      ;; test
      (when (or (< first-page 1)
                (> last-page (pdf-info-number-of-pages))
                (< last-page first-page))
        (error "Unconsistent page range: %s (max 1-%s)"
               pages (pdf-info-number-of-pages)))
      (when (not (or (string= sides "long")
                     (string= sides "short")
                     (string= sides "")))
        (error "Unknown sides value: %s (should be long, short or nothing)"
               sides))
      (when (< num-copy 1)
        (error "Wrong number of copies: %s (min 1)" num-copy))
      (let ((pdf-misc-print-programm-args
             (-non-nil (list (format "-o page-ranges=%s" pages)
                             (when (not (string= sides ""))
                               (format "-o sides=two-sided-%s-edge" sides))
                             (when (not (string= printer "default"))
                               (format "-P %s" printer))
                             (format "-# %s" num-copy)))))
        (if (y-or-n-p
             (format "Print '%s' with parameters : %s ? " (buffer-name)
                     pdf-misc-print-programm-args))
            (pdf-misc-print-document (buffer-file-name))
          (message "Printing aborded")))))

  (defun pdf-view-open-pdf-externally ()
    "Open the current pdf externally"
    (interactive)
    (helm-open-file-externally (buffer-file-name)))

  (defun pdf-view-open-pdf-externally-choose ()
    "Open the current pdf externally"
    (interactive)
    (let ((helm-external-programs-associations '()))
      (helm-open-file-externally (buffer-file-name))))

  ;; outline keybindings
  (evil-define-key 'motion pdf-outline-buffer-mode-map
    (kbd "<tab>") 'outline-toggle-children
    (kbd "RET") 'pdf-outline-follow-link
    (kbd "SPC") 'pdf-outline-display-link
    (kbd "gc") 'pdf-outline-move-to-current-page
    (kbd "gg") 'beginning-of-buffer
    (kbd "G") 'pdf-outline-end-of-buffer
    (kbd "H") 'hide-sublevels
    (kbd "S") 'show-all
    (kbd "s") 'show-subtree)

  ;; occur keybindings
  (evil-define-key 'motion pdf-occur-buffer-mode-map
    (kbd "g") 'pdf-occur-revert-buffer-with-args
    (kbd "RET") 'pdf-occur-goto-occurrence
    (kbd "SPC") 'pdf-occur-view-occurrence
    (kbd "K") 'pdf-occur-abort-search
    (kbd "g") 'pdf-occur-revert-buffer-with-args)

  ;; view keybindings
  (evil-define-key 'motion pdf-view-mode-map
    (kbd "F") 'pdf-links-action-perform
    (kbd "o") 'pdf-view-open-pdf-externally
    (kbd "O") 'pdf-view-open-pdf-externally-choose
    (kbd "J") 'pdf-view-next-line-or-next-page
    (kbd "K") 'pdf-view-previous-line-or-previous-page
    (kbd "L") 'image-forward-hscroll
    (kbd "H") 'image-backward-hscroll
    (kbd "j") (lambda () (interactive) (pdf-view-next-line-or-next-page 10))
    (kbd "k") (lambda () (interactive)
                (pdf-view-previous-line-or-previous-page 10))
    (kbd "l") (lambda () (interactive) (image-forward-hscroll 10))
    (kbd "h") (lambda () (interactive) (image-backward-hscroll 10))
    (kbd "gg") 'pdf-view-first-page
    (kbd "G") 'pdf-view-last-page
    (kbd "C-j") 'pdf-view-next-page
    (kbd "C-k") 'pdf-view-previous-page
    (kbd "0") 'image-bol
    (kbd "$") 'image-eol
    ;; mouse
    (kbd "<down-mouse-1>") 'pdf-view-mouse-set-region
    (kbd "<mouse-4>") (lambda () (interactive)
                        (pdf-view-scroll-down-or-previous-page 3))
    (kbd "<mouse-5>") (lambda () (interactive)
                        (pdf-view-scroll-up-or-next-page 3))
    (kbd "<mouse-6>") (lambda (&rest) (interactive)
                        (image-backward-hscroll 3))
    (kbd "<mouse-7>") (lambda (&rest) (interactive)
                        (image-forward-hscroll 3))
    (kbd "<C-mouse-4>") (lambda (&rest) (interactive) (image-forward-hscroll 3))
    (kbd "<C-mouse-5>") (lambda (&rest) (interactive) (image-backward-hscroll 3))
    (kbd "<S-mouse-4>") (lambda (&rest) (interactive) (pdf-view-enlarge 1.25))
    (kbd "<S-mouse-5>") (lambda (&rest) (interactive) (pdf-view-shrink 1.25))
    (kbd "<M-mouse-1>") (lambda (&rest) (interactive)
                          (pdf-view-mouse-set-region-rectangle))
    ;; yank
    (kbd "y") 'pdf-view-kill-ring-save
    ;; Navigate
    (kbd "gt") (lambda ()
                 (interactive)
                 (let* ((size (pdf-view-image-size))
                        (width (car size))
                        (height (cdr size)))
                   (pdf-sync-backward-search (/ width 2) (/ height 2))
                   (evil-scroll-line-to-center (line-number-at-pos (point)))))
    (kbd "gp") 'pdf-view-goto-page
    (kbd "gl") 'pdf-view-goto-label
    (kbd "m") 'pdf-view-position-to-register
    (kbd "`") 'pdf-view-jump-to-register
    ;; (kbd "@") 'pdf-view-got
    ;; Scale/Fit
    (kbd "zi") 'pdf-view-enlarge
    (kbd "zo") 'pdf-view-shrink
    (kbd "zr") (lambda ()
                 (interactive)
                 (setq pdf-view-display-size 1.5)
                 (pdf-view-redisplay t))
    (kbd "fw") 'pdf-view-fit-width-to-window
    (kbd "fh") 'pdf-view-fit-height-to-window
    (kbd "fp") 'pdf-view-fit-page-to-window
    (kbd "cm") 'pdf-view-set-slice-using-mouse
    (kbd "cb") 'pdf-view-set-slice-from-bounding-box
    (kbd "cr") 'pdf-view-reset-slice
    ;; Save/Export
    ;; Use M + mouse to select the region you want
    (kbd "ei") (lambda () (interactive)
                 (pdf-view-extract-region-image (pdf-view-active-region)))
    ;; Actions
    (kbd "/") 'isearch-forward
    (kbd "?") 'isearch-backward
    (kbd "s") 'pdf-occur
    (kbd "t") 'pdf-outline
    (kbd "p") 'pdf-misc-ask-and-print-document
    (kbd "r") 'pdf-view-revert-buffer
    ;; (kbd "t") 'pdf-annot-attachment-dired
    (kbd "n") 'pdf-view-midnight-minor-mode
    ;; Other
    (kbd "q") nil
    (kbd "Q") nil
    (kbd "<SPC>") 'mini)

  ;; annotation keybindings
  (evil-define-key 'motion pdf-annot-minor-mode-map
    ;; Annotations
    (kbd "am") 'pdf-annot-add-markup-annotation
    (kbd "ah") 'pdf-annot-add-highlight-markup-annotation
    (kbd "ag") 'pdf-annot-add-squiggly-markup-annotation
    (kbd "as") 'pdf-annot-add-strikeout-markup-annotation
    (kbd "au") 'pdf-annot-add-underline-markup-annotation
    (kbd "ad") 'pdf-annot-delete
    (kbd "at") 'pdf-annot-add-text-annotation
    (kbd "al") 'pdf-annot-list-annotations)
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Docview
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package doc-view
  :disabled  ;; make pdf tools buggy
  :init
  (require 'doc-view)
  :config
  (add-to-list 'evil-motion-state-modes 'doc-view-mode)
  (setq doc-view-continuous t
        doc-view-conversion-refresh-interval nil
        doc-view-image-width 750
        doc-view-resolution 200)
  (evil-define-key 'motion doc-view-mode-map
    (kbd "J") 'doc-view-next-line-or-next-page
    (kbd "K") 'doc-view-previous-line-or-previous-page
    (kbd "L") 'image-forward-hscroll
    (kbd "H") 'image-backward-hscroll
    (kbd "j") (lambda () (interactive) (doc-view-next-line-or-next-page 10))
    (kbd "k") (lambda () (interactive)
                (doc-view-previous-line-or-previous-page 10))
    (kbd "l") (lambda () (interactive) (image-forward-hscroll 10))
    (kbd "h") (lambda () (interactive) (image-backward-hscroll 10))
    (kbd "gg") 'doc-view-first-page
    (kbd "G") 'doc-view-last-page
    (kbd "C-j") 'doc-view-next-page
    (kbd "C-k") 'doc-view-previous-page
    (kbd "C-j") 'doc-view-next-page
    (kbd "C-k") 'doc-view-previous-page
    (kbd "0") 'image-bol
    (kbd "$") 'image-eol
    (kbd "fw") 'doc-view-fit-width-to-window
    (kbd "fh") 'doc-view-fit-height-to-window
    (kbd "fp") 'doc-view-fit-page-to-window
    (kbd "zi") 'doc-view-enlarge
    (kbd "zo") 'doc-view-shrink
    (kbd "zr") 'doc-view-scale-reset
    (kbd "cm") 'doc-view-set-slice-using-mouse
    (kbd "cb") 'doc-view-set-slice-from-bounding-box
    (kbd "cr") 'doc-view-reset-slice
    ;; mouse
    (kbd "<down-mouse-1>") 'doc-view-mouse-set-region
    (kbd "<mouse-4>") (lambda (&rest) (interactive)
                        (doc-view-scroll-down-or-previous-page 3))
    (kbd "<mouse-5>") (lambda (&rest) (interactive)
                        (doc-view-scroll-up-or-next-page 3))
    (kbd "<C-mouse-4>") (lambda (&rest) (interactive) (image-forward-hscroll 3))
    (kbd "<C-mouse-5>") (lambda (&rest) (interactive) (image-backward-hscroll 3))
    (kbd "<S-mouse-4>") (lambda (&rest) (interactive) (doc-view-enlarge 1.25))
    (kbd "<S-mouse-5>") (lambda (&rest) (interactive) (doc-view-shrink 1.25))
    (kbd "<M-mouse-1>") (lambda (&rest) (interactive)
                          (doc-view-mouse-set-region-rectangle))
    ;;
    (kbd "/") 'isearch-forward
    (kbd "?") 'isearch-backward
    ;;
    (kbd "q") nil
    (kbd "Q") nil
    (kbd "<SPC>") 'mini)
  (add-hook 'doc-view-minor-mode-hook 'doc-view-fit-page-to-window))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Image-view
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-leader/set-key (kbd "nt") 'image-dired)
(add-to-list 'evil-motion-state-modes 'image-dired-thumbnail-mode)
(add-hook 'image-dired-thumbnail-mode-hook (lambda ()
                                             (hl-line-mode -1)))
(evil-define-key 'motion image-dired-thumbnail-mode-map
  (kbd "l") 'image-dired-forward-image
  (kbd "h") 'image-dired-backward-image
  (kbd "RET") 'image-dired-display-thumbnail-original-image
  (kbd "SPC") 'image-dired-display-next-thumbnail-original
  (kbd "SPC") 'image-dired-jump-original-dired-buffer
  (kbd "<") 'image-dired-rotate-thumbnail-left
  (kbd ">") 'image-dired-rotate-thumbnail-right
  (kbd "q") 'image-dired-kill-buffer-and-window)
(add-to-list 'evil-motion-state-modes 'image-dired-display-image-mode)
(add-to-list 'evil-motion-state-modes 'image-mode)
(evil-define-key 'motion image-dired-display-image-mode-map
  (kbd "q") 'quit-window
  (kbd "s") 'image-dired-display-current-image-sized
  (kbd "f") 'image-dired-display-current-image-full)
;; TODO: use image-dired

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Thesaurus and synonyms
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package helm-wordnet
  :disabled
  :ensure
  :init
  (require 'helm-wordnet)
  :after helm
  :config
  (setq helm-wordnet-post-arg "-synsn -synsv -synsa -synsr")
  (setq helm-wordnet-post-arg "")
  (evil-leader/set-key "bw" 'helm-wordnet))

(use-package wordnut
  :ensure
  :init
  (require 'wordnut)
  :config
  ;; I don't want to select the word at point
  (defun wordnut-search (word)
    "Prompt for a word to search for, then do the lookup."
    (interactive (list (wordnut--completing "")))
    (ignore-errors
      (wordnut--history-update-cur wordnut-hs))
    (wordnut--lookup word))
  (evil-leader/set-key "bw" 'wordnut-search)
  (add-to-list 'evil-motion-state-modes 'wordnut-mode)
  (evil-leader/set-key-for-mode 'wordnut-mode (kbd "gd")
    'wordnut-lookup-current-word)
  (evil-leader/set-key-for-mode 'wordnut-mode (kbd "gb")
    'wordnut-history-backward)
  (evil-leader/set-key-for-mode 'wordnut-mode (kbd "gf")
    'wordnut-history-forward)
  (evil-define-key 'motion wordnut-mode-map "J" 'outline-next-heading)
  (evil-define-key 'motion wordnut-mode-map "K" 'outline-previous-heading))

(use-package synonyms
  :disabled
  :ensure
  :init
  (require 'synonyms)
  :config
  (setq synonyms-file "~/.emacs.d/thesaurus/mthesaur.txt")
  (setq synonyms-cache-file "~/.emacs.d/thes.cache")
  (evil-leader/set-key "sy" 'synonyms))

(use-package powerthesaurus
  :ensure
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
  (evil-leader/set-key "bs" 'powerthesaurus-lookup-word-at-point)
  (evil-leader/set-key "bS" 'powerthesaurus-lookup-word))

(use-package mw-thesaurus
  :ensure
  :config
  (defun mw-thesaurus--lookup ()
    "Look up a thesaurus definition for a word using Merriam-Webster online dictionary."
    (interactive)
    (let* ((word (format "%s" (read-from-minibuffer "Lookup for: ")))
           (url (concat (symbol-value 'mw-thesaurus--base-url)
                        word "?key="
                        (symbol-value 'mw-thesaurus--api-key))))
      (request url
               :parser (lambda () (xml-parse-region (point-min) (point-max)))
               :success (cl-function
                         (lambda (&key data &allow-other-keys)
                           (mw-thesaurus--create-buffer word data))))))
  (evil-leader/set-key "bt" 'mw-thesaurus--lookup-at-point)
  (evil-leader/set-key "bT" 'mw-thesaurus--lookup))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Words and char stats
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun count-words-region-or-buffer (posBegin posEnd)
  "Print number of words and chars in region."
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list (point-min) (point-max))))
  (save-excursion
    (let (wordCount charCount)
      (setq wordCount 0)
      (setq charCount (- posEnd posBegin))
      (goto-char posBegin)
      (while (and (< (point) posEnd)
                  (re-search-forward "\\w+\\W*" posEnd t))
        (setq wordCount (1+ wordCount)))
      (message "Words: %d  -  Chars: %d" wordCount charCount))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reftex
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO : Reftex : need cleaning
(use-package company-reftex
  :init
  (el-get-bundle company-reftex
    :url "https://www.github.com/TheBB/company-reftex.git"
    :features company-reftex)
  :after reftex
  :config
  (with-eval-after-load 'reftex
    (add-to-list 'company-backends 'company-reftex-labels)
    (add-to-list 'company-backends 'company-reftex-citations)
    )
  )

(use-package reftex
  :ensure
  :config
  (require 'reftex)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; add to AUCTeX LaTeX mode
  (setq reftex-cite-format (quote natbib))
  (setq reftex-plug-into-AUCTeX t)
  (setq reftex-toc-include-labels nil)
  (setq reftex-toc-split-windows-fraction 0.33)
  (setq reftex-toc-split-windows-horizontally t)
  (add-hook 'reftex-toc-mode-hook (lambda ()
                                    (visual-line-mode -1)
                                    (setq truncate-lines t)))
  (setq reftex-insert-label-flags (quote ("s" "nil")))
  (setq reftex-toc-follow-mode t)
  (setq reftex-cite-key-separator ", ")
  (setq reftex-label-menu-flags (quote (t t t t nil nil t nil)))
  ;; custom functions
  (defun reftex-toc-incr-level ()
    (interactive)
    (let ((new-max-level (+ (string-to-number
                             reftex-toc-max-level-indicator)
                            1)))
      (if (string-equal reftex-toc-max-level-indicator "ALL")
          (setq new-max-level 6)
        (if (> new-max-level 6)
            (setq new-max-level 6)))
      (reftex-toc-max-level new-max-level)))
  (defun reftex-toc-decr-level ()
    (interactive)
    (let ((new-max-level (- (string-to-number
                             reftex-toc-max-level-indicator)
                            1)))
      (if (string-equal reftex-toc-max-level-indicator "ALL")
          (setq new-max-level 5)
        (if (< new-max-level 1)
            (setq new-max-level 1)))
      (reftex-toc-max-level new-max-level)))
  ;; keybinding
  (evil-leader/set-key-for-mode 'latex-mode "tt"
    (lambda () (interactive) (delete-other-windows) (reftex-toc)))
  (evil-leader/set-key-for-mode 'latex-mode "tr" 'reftex-parse-all)
  (evil-leader/set-key-for-mode 'latex-mode "icc" 'reftex-citation)
  (evil-leader/set-key-for-mode 'latex-mode "ict"
    (lambda () (interactive) (reftex-select-citation-with-completion 116)))
  (evil-leader/set-key-for-mode 'latex-mode "icp"
    (lambda () (interactive) (reftex-select-citation-with-completion 112)))
  (evil-leader/set-key-for-mode 'latex-mode "ir"
    'reftex-select-label-with-completion)
  (evil-leader/set-key-for-mode 'latex-mode "il" 'reftex-label)
  (evil-leader/set-key-for-mode 'latex-mode "gl" (lambda () (interactive) (xref-push-marker-stack) (reftex-goto-label)))
  (evil-leader/set-key-for-mode 'latex-mode "gr" (lambda () (interactive) (xref-push-marker-stack) (reftex-view-crossref 2)))
  (evil-leader/set-key-for-mode 'latex-mode "ml" (lambda () (interactive) (save-excursion (reftex-change-label))))
  ;; reftex toc keybinding
  (with-eval-after-load 'reftex-toc
    (evil-add-to-alist 'evil-overriding-maps 'reftex-toc-mode-map nil)
    (define-key reftex-toc-map "j" 'reftex-toc-next)
    (define-key reftex-toc-map "k" 'reftex-toc-previous)
    (define-key reftex-toc-map (kbd "M-j") 'reftex-toc-next-heading)
    (define-key reftex-toc-map (kbd "M-k") 'reftex-toc-previous-heading)
    (define-key reftex-toc-map (kbd "SPC") 'reftex-toc-goto-line)
    (define-key reftex-toc-map (kbd "RET") 'reftex-toc-goto-line-and-hide)
    (define-key reftex-toc-map (kbd "<tab>") 'reftex-toc-incr-level)
    (define-key reftex-toc-map (kbd "<backtab>") 'reftex-toc-decr-level))
  ;; reftex selection kebinding
  (with-eval-after-load "reftex-sel"
    (define-key reftex-select-bib-mode-map "j" 'reftex-select-next)
    (define-key reftex-select-bib-mode-map "k" 'reftex-select-previous)
    (define-key reftex-select-bib-mode-map (kbd "M-j") 'reftex-select-next)
    (define-key reftex-select-bib-mode-map (kbd "M-k") 'reftex-select-previous)
    (define-key reftex-select-bib-mode-map "s" 'reftex-select-mark)
    (define-key reftex-select-bib-mode-map "d" 'reftex-select-unmark)
    (define-key reftex-select-label-mode-map "j" 'reftex-select-next)
    (define-key reftex-select-label-mode-map "k" 'reftex-select-previous)
    (define-key reftex-select-label-mode-map "s" 'reftex-select-mark)
    (define-key reftex-select-label-mode-map "d" 'reftex-select-unmark))
  ;; insert citation with completion
  (defun reftex-select-citation-with-completion (&optional key-format)
    "Use minibuffer to read a citation key with completion."
    (interactive)
    (let* ((bibtype (reftex-bib-or-thebib))
           (found-list
            (cond
             ((eq bibtype 'bib)
              ;; using BibTeX database files.
              (reftex-extract-bib-entries (reftex-get-bibfile-list)))
             ((eq bibtype 'thebib)
              ;; using thebibliography environment.
              (reftex-extract-bib-entries-from-thebibliography
               (reftex-uniquify
                (mapcar 'cdr
                        (reftex-all-assq
                         'thebib (symbol-value reftex-docstruct-symbol))))))
             (reftex-default-bibliography
              (message "Using default bibliography")
              (reftex-extract-bib-entries (reftex-default-bibliography)))
             (t (error "No valid bibliography in this document, and no default available"))))
           (key (completing-read "Citation key: " found-list))
           (entry (assoc key found-list))
           (format (reftex-figure-out-cite-format nil nil key-format)))
      (cond
       ((or (null key) (equal key "")))
       (entry
        (setq reftex-select-data entry)
        (setq last-data reftex-select-data)
        ;; Format the citation and insert it
        (setq string (if reftex-format-cite-function
                         (funcall reftex-format-cite-function
                                  (reftex-get-bib-field "&key" entry)
                                  format)
                       (reftex-format-citation entry format)))
        ;; Should we cleanup empty optional arguments?
        (when reftex-cite-cleanup-optional-args
          (cond
           ((string-match "\\([a-zA-Z0-9]\\)\\[\\]{" string)
            (setq string (replace-match "\\1{" nil nil string)))
           ((string-match "\\[\\]\\(\\[[a-zA-Z0-9., ]+\\]\\)" string)
            (setq string (replace-match "\\1" nil nil string)))
           ((string-match "\\[\\]\\[\\]" string)
            (setq string (replace-match "" t t string)))))
        (insert string)))))
  ;; insert label with completion
  (defun reftex-select-label-with-completion ()
    "Use minibuffer to read a label to reference, with completion."
    (interactive)
    (reftex-access-scan-info 1)
    (let ((form "~\\ref{%s}")
          (label (completing-read "Label: " (symbol-value reftex-docstruct-symbol)
                                  nil nil reftex-prefix))
          (reftex-refstyle (when (and (boundp 'reftex-refstyle) reftex-refstyle)
                             reftex-refstyle)))
      ;; remove ~ if necessary
      (when (and (= ?~ (string-to-char form))
                 (member (preceding-char) '(?\ ?\t ?\n ?~)))
        (setq form (substring form 1)))
      ;; do we have a special format?
      (unless (string= reftex-refstyle "\\ref")
        (setq reftex-format-ref-function 'reftex-format-special))
      ;; insert reference
      (unless (or (equal label "") (equal label reftex-prefix))
        (insert (format form label)))))
  ;; regexp repalce for labels
  (defun projectile-replace-regexp-raw (FROM TO &optional EXT)
    (let* ((curr-buff (current-buffer))
           (directory (projectile-project-root))
           (files
            (-reject #'file-directory-p
                     (-map #'projectile-expand-root (projectile-dir-files directory))))
           (ext-files ()))
      ;; get files by extension
      (if EXT
          (dolist (file files)
            (when (string-match (format ".*%s$" EXT) file)
              (push file ext-files)
              (print file)))
        (setq ext-files files))
      (condition-case nil
          (tags-query-replace FROM TO nil (cons 'list ext-files))
        (error nil))
      (switch-to-buffer curr-buff)))
  ;; update labels
  (defun reftex-update-label ()
    "Update the label and its reference at point.
Work only with label occupying a whole line."
    (interactive)
    (let ((old-label nil) (new-label nil) (occ 0))
      (save-excursion
        (beginning-of-line)
        (if (not (search-forward-regexp "^\\\\label{\\(.+\\)}$" (line-end-position) t))
            (message "No label at point")
          (setq old-label (match-string 1))
          (beginning-of-line)
          (kill-line)
          (reftex-parse-all)
          (setq new-label (reftex-label))
          (if (string= old-label new-label)
              (message "Label already up-to-date")
            (goto-char 0)
            (projectile-replace-regexp-raw
             (concat "\\\\\\([^\\s-{}]+\\){" old-label "}")
             (concat "\\\\\\1{" new-label "}")
             "tex")))))
    (message "Done"))
  ;; update labels and add missing ones labels
  (defun reftex-update-all-labels ()
    (interactive)
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "\\\\\\(\\(sub\\)*section\\|part\\|chapter\\){[^}]*}" (point-max) t)
        (forward-line)
        (beginning-of-line)
        (if (re-search-forward "\\\\label{[^}]*}" (line-end-position) t)
            (reftex-update-label)
          (newline)
          (forward-line -1)
          (reftex-label))))
    (message "Done"))
  (evil-leader/set-key-for-mode 'latex-mode "mul" 'reftex-update-label)
  (evil-leader/set-key-for-mode 'latex-mode "mual" 'reftex-update-all-labels))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Biblio
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package biblio
  :ensure
  :config
  (evil-leader/set-key (kbd "zb") 'crossref-lookup))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flyspell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO : Flyspell : need cleaning
(use-package flyspell
  :ensure
  :after auto-dictionary
  :config
  (setq ispell-program-name "aspell")
  (setq flyspell-issue-message-flag nil)
  (add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))
  ;; function to switch between french and english
  (defun flyspell-switch-dictionary()
    (interactive)
    (let* ((dic ispell-current-dictionary)
           (change (if (string= dic "francais") "english" "francais")))
      (ispell-change-dictionary change)
      (auto-dictionary-mode -1)
      (flyspell-buffer)
      (message "Dictionary switched from %s to %s" dic change)))
  (defun flyspell-goto-previous-error ()
    "Go to the previous detected error.
In general FLYSPELL-GOTO-PREVIOUS-ERROR must be used after
FLYSPELL-BUFFER."
    (interactive)
    (let ((pos (point))
          (min (point-min)))
      (if (and (eq (current-buffer) flyspell-old-buffer-error)
               (eq pos flyspell-old-pos-error))
          (progn
            (if (= flyspell-old-pos-error min)
                ;; goto end of buffer
                (progn
                  (message "Restarting from buffer end")
                  (goto-char (point-max)))
              (backward-word 1))
            (setq pos (point))))
      ;; seek the previous error
      (while (and (> pos min)
                  (let ((ovs (overlays-at pos))
                        (r '()))
                    (while (and (not r) (consp ovs))
                      (if (flyspell-overlay-p (car ovs))
                          (setq r t)
                        (setq ovs (cdr ovs))))
                    (not r)))
        (setq pos (- pos 1)))
      ;; save the current location for next invocation
      (goto-char pos)
      (backward-word)
      (setq flyspell-old-pos-error (point))
      (setq flyspell-old-buffer-error (current-buffer))
      (if (= pos min)
          (message "No more miss-spelled word!"))))
  (defun flyspell-accept-word ()
    "Add the word at point to the file word accepted list."
    (interactive)
    (ispell-add-per-file-word-list (word-at-point))
    (ispell-accept-buffer-local-defs)
    (flyspell-buffer))
  ;; keybindings
  (cl-loop
   for mode in '(org-mode latex-mode mu4e-compose-mode)
   do
   (evil-leader/set-key-for-mode mode
     "oo" 'hydra-flyspell-correct-before-point/body
     "oi" 'hydra-flyspell/body
     "oc" 'helm-flyspell-correct
     "oa" 'flyspell-auto-correct-word
     "ok" 'flyspell-accept-word
     "os" 'flyspell-switch-dictionary
     "ob" 'flyspell-buffer
     "on" 'flyspell-goto-next-error
     "op" 'flyspell-goto-previous-error
     "or" (lambda () (interactive) (ispell-kill-ispell) (ispell-start-process) (flyspell-buffer)))))

(use-package auto-dictionary
  :ensure)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Langtool
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO : Make a functional 'clear file' function for tex files
;; TODO : Clear the git repos (it's a mess)
(use-package langtool
  :init
  (el-get-bundle langtool
    :url "https://github.com/mhayashi1120/Emacs-langtool.git"
    :features master)
  :config
  (setq langtool-java-classpath
        "/usr/share/languagetool:/usr/share/java/languagetool/*")
  (require 'langtool)
  (setq langtool-java-bin "/usr/bin/java")
  (setq langtool-disabled-rules
        '("WHITESPACE_RULE" "HUNSPELL_NO_SUGGEST_RULE"
          "FRENCH_WHITESPACE" "CURRENCY[1]"))
  :bind (:map evil-leader--default-map
              ("ltb" . langtool-check)
              ("ltc" . langtool-check-done)
              ("ltp" . langtool-goto-previous-error)
              ("ltn" . langtool-goto-next-error)
              ("lth" . langtool-show-message-at-point)
              ("lts" . langtool-switch-default-language)
              ("lta" . langtool-correct-buffer)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Grammalecte
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; French grammar checker
(use-package flycheck-grammalecte
  :disabled
  :ensure)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Drag stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package drag-stuff
  :init
  (el-get-bundle drag-stuff
    :url "https://www.github.com/rejeep/drag-stuff.git"
    :features drag-stuff)
  :config
  (drag-stuff-global-mode t)
  ;; perso functions
  (defun duplicate-line-or-region (&optional n)
    "Duplicate current line, or region if active.
With argument N, make N copies."
    (interactive "*p")
    (let ((use-region (use-region-p)))
      (save-excursion
        (let ((text (if use-region        ;Get region if active, otherwise line
                        (buffer-substring (region-beginning) (region-end))
                      (prog1 (thing-at-point 'line)
                        (end-of-line)
                        (if (< 0 (forward-line 1)) ;Go to beginning of next line, or make a new one
                            (newline))))))
          (dotimes (i (abs (or n 1)))     ;Insert N times, or once if not specified
            (insert text))))
      (if use-region nil                  ;Only if we're working with a line (not a region)
        (let ((pos (- (point) (line-beginning-position)))) ;Save column
          (forward-line 1)
          (forward-char pos)))))
  (defun duplicate-and-comment-line-or-region (&optional n)
    "Duplicate and comment current line, or region if active.
With N, make N commented copies."
    (interactive "*p")
    (let ((use-region (use-region-p)))
      (save-excursion
        (let ((text (if use-region        ;Get region if active, otherwise line
                        (buffer-substring (region-beginning) (region-end))
                      (prog1 (thing-at-point 'line)
                        (end-of-line)
                        (if (< 0 (forward-line 1)) ;Go to beginning of next line, or make a new one
                            (newline))))))
          (dotimes (i (abs (or n 1)))     ;Insert N times, or once if not specified
            (insert text))))
      (if use-region
          (comment-region (region-beginning) (region-end))
        (let ((pos (- (point) (line-beginning-position)))) ;Save column
          (message "yop")
          (comment-region (line-beginning-position) (line-end-position))
          (forward-line 1)
          (forward-char pos)))))
  ;; keybinding
  (evil-define-key 'normal drag-stuff-mode-map (kbd "M-j") 'drag-stuff-down)
  (evil-define-key 'normal drag-stuff-mode-map (kbd "M-k") 'drag-stuff-up)
  (evil-define-key 'normal drag-stuff-mode-map (kbd "M-h") 'drag-stuff-left)
  (evil-define-key 'normal drag-stuff-mode-map (kbd "M-l") 'drag-stuff-right)
  (evil-define-key 'normal drag-stuff-mode-map (kbd "C-M-j") 'duplicate-line-or-region)
  (evil-define-key 'normal drag-stuff-mode-map (kbd "C-M-k") 'duplicate-and-comment-line-or-region))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Delight mode (hide minor modes)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package delight
  :ensure
  :config
  (require 'delight)
  (delight '((drag-stuff-mode nil drag-stuff)
             (company-mode nil company)
             (helm-mode nil helm)
             (undo-tree-mode nil undo-tree)
             (highlight-indentation-mode nil highlight-indentation)
             (flyspell-mode nil flyspell)
             (zotelo-minor-mode nil zotelo)
             (yas-minor-mode nil yasnippet)
             (helm-gtags-mode nil helm-gtags)
             (ggtags-mode nil ggtags)
             (abbrev-mode nil abbrev)
             (flymake-mode nil flymake)
             (org-autolist-mode nil org-autolist)
             (reftex-mode nil reftex)
             (evil-org-mode nil evil-org)
             (visual-line-mode nil simple)
             (auto-revert-mode nil autorevert)
             ;; (evil-snipe-local-mode nil evil-snipe)
             (eldoc-mode nil eldoc)
             (auto-dictionary-mode nil auto-dictionary)
             (anaconda-mode nil anaconda-mode)
             (elpy-mode nil elpy)
             (ropemacs-mode nil ropemacs)
             (evil-escape-mode nil evil-escape)
             (mml-mode nil mml)
             (text-scale-mode nil face-remap)
             (volatile-highlights-mode nil t)
             (auto-fill-function nil t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EMMS (music boy !)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package emms
  :ensure
  :init
  (require 'emms-setup)
  (require 'emms-streams)
  :config
  (emms-all)
  (emms-standard)
  (emms-default-players)
  (emms-playing-time-disable-display)
  (add-to-list 'evil-motion-state-modes 'emms-stream-mode)
  (setq emms-stream-default-action "play")
  (setq emms-mode-line-mode-line-function 'emms-get-stream-name)
  (setq emms-mode-line-icon-color "white")
  (setq emms-stream-info-backend 'vlc)
  (setq emms-player-list '(emms-player-vlc-playlist
                           emms-player-vlc))
  (defface emms-modeline-face
    '((t :inherit font-lock-string-face :bold t))
    "Face for the query in the mode-line."
    :group 'emms-mode-line)
  (defun emms-get-stream-name ()
    (interactive)
    (propertize "♬" 'face 'emms-modeline-face))
  (evil-define-key 'motion emms-stream-mode-map (kbd "<RET>") 'emms-stream-play)
  (evil-define-key 'motion emms-stream-mode-map (kbd "e") 'emms-stream-edit-bookmark)
  (evil-define-key 'motion emms-stream-mode-map (kbd "q") 'emms-stream-quit)
  (evil-define-key 'motion emms-stream-mode-map (kbd "a") 'emms-stream-add-bookmark)
  (evil-define-key 'motion emms-stream-mode-map (kbd "d") 'emms-stream-delete-bookmark)
  (evil-define-key 'motion emms-stream-mode-map (kbd "s") 'emms-stream-save-bookmarks-file)
  (evil-define-key 'motion emms-stream-mode-map (kbd "i") 'emms-stream-info-bookmark)
  (evil-define-key 'motion emms-stream-mode-map (kbd "j") 'emms-stream-next-line)
  (evil-define-key 'motion emms-stream-mode-map (kbd "k") 'emms-stream-previous-line)
  :bind (:map evil-leader--default-map
              ("is" . emms-streams)
              ("ix" . emms-stop)
              ("ip" . emms-pause)
              ("ir" . emms-random)
              ("in" . emms-next)
              ("if" . emms-show-all)
              ("ib" . emms-browser)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bibtex mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun bibtex-fill-entries ()
  "Indent and fill all bibtex entry from the current bibtex buffer."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (bibtex-fill-entry)
    (while (= (forward-line) 0)
      (bibtex-skip-to-valid-entry)
      (bibtex-fill-entry))))
(evil-leader/set-key-for-mode 'bibtex-mode (kbd "=")
  'bibtex-fill-entries)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm-bibtex
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package helm-bibtex
  :init
  (el-get-bundle helm-bibtex
    :url "https://www.github.com/tmalsburg/helm-bibtex.git"
    :branch "master"
    :features helm-bibtex)
  :config
  (setq bibtex-completion-bibliography (list (expand-file-name "~/dev/bib-notes/bib.bib"))
        bibtex-completion-notes-path "~/dev/bib-notes/notes.org"
        bibtex-completion-pdf-field "file"
        bibtex-completion-pdf-symbol "●"
        bibtex-completion-notes-symbol "✎"
        bibtex-completion-display-formats
        (quote ((t . "${author:36} ${title:*} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:7}")))
        bibtex-completion-pdf-open-function 'find-file
        helm-bibtex-full-frame nil)
  (add-to-list 'bibtex-completion-fallback-options '("SciHub                                    (web)" . "http://sci-hub.tw/%s") t)
  (add-to-list 'bibtex-completion-fallback-options '("LibGen                                    (web)" .  "http://libgen.io/search.php?req=%s") t)
  (defun helm-bibtex-other-window (&optional arg)
    (interactive)
    "Search BibTeX entries and display it in another window.

With a prefix ARG, the cache is invalidated and the bibliography
reread."
    (let ((bibtex-completion-pdf-open-function 'find-file-other-window))
      (helm-bibtex)))
  ;; Bibtex selection mode map
  (define-key biblio-selection-mode-map "j" 'biblio--selection-next)
  (define-key biblio-selection-mode-map "k" 'biblio--selection-previous)
  (define-key biblio-selection-mode-map "z" 'biblio--selection-browse)
  (define-key biblio-selection-mode-map "Z" 'biblio--selection-browse-direct)
  (define-key biblio-selection-mode-map "y" 'biblio--selection-copy)
  (define-key biblio-selection-mode-map "Y" 'biblio--selection-copy-quit)
  (define-key biblio-selection-mode-map "p" 'biblio--selection-insert)
  (define-key biblio-selection-mode-map "P" 'biblio--selection-insert-quit)
  (define-key biblio-selection-mode-map "x" 'biblio--selection-extended-action)
  (define-key biblio-selection-mode-map "q" 'quit-window)
  :bind (:map evil-leader--default-map
              ("nb" . helm-bibtex)
              ("nB" . helm-bibtex-other-window)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Filter echo area message
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defcustom message-filter-regexp-list
  (list "^Parsing.*(LALR).*$")
  "List of regexp filtered out in minibuffer."
  :type '(repeat regexp))
(defadvice message (around message-filter-by-regexp activate)
  (if (not (ad-get-arg 0))
      ad-do-it
    (let ((formatted-string (apply 'format (ad-get-args 0))))
      (if (and (stringp formatted-string)
               (some (lambda (re)
                       (string-match re formatted-string))
                     message-filter-regexp-list))
          (with-current-buffer "*Messages*"
            (goto-char (point-max)))
        (progn
          (ad-set-args 0 `("%s" ,formatted-string))
          ad-do-it)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Expand selection
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package expand-region
  :ensure
  :demand  ;; needed for latex-hook
  :config
  (setq expand-region-contract-fast-key "S")
  (setq expand-region-reset-fast-key "u")
  (setq expand-region-autocopy-register "s")
  (setq expand-region-guess-python-mode nil)
  (setq expand-region-preferred-python-mode 'python)
  (setq er/try-expand-list '(er/mark-word
                             er/mark-symbol
                             er/mark-symbol-with-prefix
                             er/mark-next-accessor
                             er/mark-method-call
                             er/mark-inside-quotes
                             er/mark-outside-quotes
                             er/mark-inside-pairs
                             er/mark-outside-pairs
                             er/mark-comment
                             er/mark-url
                             er/mark-email
                             er/mark-paragraph))
  (defun er/save-mark-and-expand-region ()
    "Save mark and expand selected region by semantic units."
    (interactive)
    (evil--jumps-push)
    (er/expand-region 1))
  ;; TeX specific
  (defun er/LaTeX-mark-section ()
    (interactive)
    (when (re-search-forward "\\\\\\(sub\\)*section{.*?}$"
                             (line-end-position) t)
      (message "%s" (format "\\\\%ssection"
                            (string-remove-prefix "sub" (match-string 1))))
      (re-search-backward (format "\\\\%ssection"
                                  (string-remove-prefix "sub"
                                                        (match-string 1)))))
    (LaTeX-mark-section))
  (defun er/add-latex-mode-expansions ())
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (print er/try-expand-list)
              (setq-local er/try-expand-list '(er/LaTeX-mark-section
                                               LaTeX-mark-environment
                                               er/mark-LaTeX-inside-environment
                                               er/mark-LaTeX-math
                                               er/mark-word
                                               er/mark-symbol
                                               er/mark-symbol-with-prefix
                                               ;; er/mark-next-accessor
                                               ;; er/mark-method-call
                                               er/mark-inside-quotes
                                               er/mark-outside-quotes
                                               er/mark-inside-pairs
                                               er/mark-outside-pairs
                                               ;; er/mark-comment
                                               ;; er/mark-url
                                               ;; er/mark-email
                                               ;; er/mark-paragraph
                                               ;; er/mark-defun
                                               ))
              (message "After expand-list: %s" er/try-expand-list)
              ))

  :bind (:map evil-normal-state-map
              ("s" . er/save-mark-and-expand-region)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paradox
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package paradox
  :ensure
  :init
  (require 'paradox)
  :config
  (setq paradox-github-token t)
  (evil-define-key 'motion paradox-menu-mode-map
    (kbd "j") 'paradox-next-entry
    (kbd "k") 'paradox-previous-entry
    (kbd "s") 'evil-ret
    (kbd "q") 'paradox-quit-and-close
    (kbd "i") 'package-menu-mark-install
    (kbd "d") 'package-menu-mark-delete
    (kbd "u") 'package-menu-mark-unmark
    (kbd "x") 'paradox-menu-execute
    (kbd "z") 'paradox-menu-visit-homepage)
  :bind (:map evil-leader--default-map
              ("ni" . paradox-list-packages)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Calendar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-leader/set-key "bd" 'calendar)
(setq calendar-week-start-day 1
      calendar-day-name-array ["Dimanche" "Lundi" "Mardi" "Mercredi"
                               "Jeudi" "Vendredi" "Samedi"]
      calendar-day-abbrev-array ["Dim" "Lun" "Mar" "Mer" "Jeu" "Ven" "Sam"]
      calendar-day-header-array ["Dim" "Lun" "Mar" "Mer" "Jeu" "Ven" "Sam"]
      calendar-month-name-array ["Janvier" "Février" "Mars" "Avril" "Mai"
                                 "Juin" "Juillet" "Août" "Septembre"
                                 "Octobre" "Novembre" "Décembre"]
      calendar-month-abbrev-array ["Jan" "Fév" "Mar" "Avr" "Mai"
                                   "Jui" "Jui" "Aoû" "Sep"
                                   "Oct" "Nov" "Déc"]
      calendar-date-style (quote european)
      ;; calendar-iso-date-display-form
      calendar-european-date-display-form
      (quote ((if dayname (concat dayname " "))
              day " " monthname " " year)))
;; (evil-define-key 'motion calendar-mode-map (kbd "j") 'calendar-forward-week)
;; (evil-define-key 'motion calendar-mode-map (kbd "k") 'calendar-backward-week)
;; (evil-define-key 'motion calendar-mode-map (kbd "h") 'calendar-backward-day)
;; (evil-define-key 'motion calendar-mode-map (kbd "l") 'calendar-forward-day)
;; (evil-define-key 'motion calendar-mode-map (kbd "M-h") 'calendar-backward-month)
;; (evil-define-key 'motion calendar-mode-map (kbd "M-l") 'calendar-forward-month)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Markdown mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package markdown-mode
;;   :ensure
;;   :config
;;   (add-hook 'markdown-mode-hook 'adaptive-wrap-prefix-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hydra
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package hydra
  :ensure
  :init
  (require 'hydra)
  (require 'hydra-examples)
  :config
  ;; window resizer
  (defhydra hydra-zoom ()
    "Move splitters"
    ("h" hydra-move-splitter-left "left")
    ("j" hydra-move-splitter-down "down")
    ("k" hydra-move-splitter-up "up")
    ("l" hydra-move-splitter-right "right")
    ("q" nil "quit"))
  (define-key evil-insert-state-map (kbd "C-w r") 'hydra-zoom/body)
  (define-key evil-insert-state-map (kbd "C-w C-r") 'hydra-zoom/body)
  (define-key evil-normal-state-map (kbd "C-w r") 'hydra-zoom/body)
  (define-key evil-normal-state-map (kbd "C-w C-r") 'hydra-zoom/body)
  (define-key evil-motion-state-map (kbd "C-w r") 'hydra-zoom/body)
  (define-key evil-motion-state-map (kbd "C-w C-r") 'hydra-zoom/body)
  (define-key evil-emacs-state-map (kbd "C-w r") 'hydra-zoom/body)
  (define-key evil-emacs-state-map (kbd "C-w C-r") 'hydra-zoom/body)
  ;; flyspell
  (defhydra hydra-flyspell ()
    "flyspell"
    ("j" flyspell-goto-next-error "next")
    ("k" flyspell-goto-previous-error "previous")
    ("c" helm-flyspell-correct "correct")
    ("a" flyspell-auto-correct-word "autocorrect")
    ("s" (lambda () (interactive)
           (flyspell-accept-word)
           (flyspell-goto-next-error)) "buffer save")
    ("u" undo-tree-undo "undo")
    ("r" flyspell-buffer "refresh")
    ("q" nil "quit"))

  (defvar flyspell-initial-pos nil)
  (defvar flyspell-previous-error-word "")
  (defvar flyspell-previous-error-pos nil)
  (defvar flyspell-undo-counter 0)

  (defhydra hydra-flyspell-correct-before-point
    (:body-pre (progn (setq flyspell-initial-pos (- (point-max) (point)))
                      (setq flyspell-undo-counter 1)
                      (flyspell-goto-previous-error)
                      (setq flyspell-previous-error-pos (point))
                      (setq flyspell-previous-error-word (word-at-point))
                      (flyspell-auto-correct-word))
               :post (goto-char (- (point-max) flyspell-initial-pos)))
    "flyspell before point"
    ("o" (lambda () (interactive)
           (flyspell-auto-correct-word)
           (setq flyspell-undo-counter (+ 1 flyspell-undo-counter)))
     "next proposition")
    ("O" (lambda () (interactive)
           (when (< 0 flyspell-undo-counter)
             (undo-tree-undo)
             (setq flyspell-undo-counter (- flyspell-undo-counter 1))
             (goto-char flyspell-previous-error-pos)
             (setq flyspell-auto-correct-region
                   (cons flyspell-previous-error-pos
                         (save-excursion
                           (forward-word)
                           (- (point) flyspell-previous-error-pos))))))
     "undo")
    ("s" (lambda () (interactive)
           (ispell-add-per-file-word-list flyspell-previous-error-word)
           (ispell-accept-buffer-local-defs)
           (flyspell-buffer))
     "buffer save" :exit t)
    ("c" (lambda () (interactive)
           (save-excursion
             (goto-char flyspell-previous-error-pos)
             (let ((repl (read-string
                          (format "Replacement for '%s': " (word-at-point)))))
               (forward-word)
               (let ((end (point)))
                 (backward-word)
                 (kill-ring-save (point) end)
                 (replace-string (current-kill 0) repl nil (point) end)))
             (setq flyspell-auto-correct-region nil)
             (flyspell-buffer)))
     "change" :exit t)
    ("q" nil "quit"))
  (define-key evil-insert-state-map
    (kbd "M-o") 'hydra-flyspell-correct-before-point/body)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tramp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package tramp
  :ensure
  :config
  ;; (eval-after-load 'tramp '(setenv "SHELL" "/bin/sh"))
  (setq tramp-ssh-controlmaster-options ;; needed because of bug ???
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  (setq tramp-verbose 3)
  (setq tramp-terminal-type "dumb")
  (setq tramp-default-method "ssh")
  (add-to-list 'tramp-default-proxies-alist
               '(nil "\\`root\\'" "/ssh:%h:"))
  (add-to-list 'tramp-default-proxies-alist
               '((regexp-quote (system-name)) nil nil))
  (defalias 'exit-tramp 'tramp-cleanup-all-buffers)

  (defun toggle-edit-as-root ()
    "Toggle editing the current buffer as root"
    (interactive)
    (when (not (buffer-file-name))
      (error "No file associated to the current buffer"))
    ;; file edited as root
    (if (string-match "/sudo:root@[^:]*:\\(.*\\)" (buffer-file-name))
        (let ((cur-buf (current-buffer))
              (point (point))
              (filename (match-string 1 (buffer-file-name))))
          (shut-up
            (save-buffer)
            (find-file filename)
            (goto-char point)
            (kill-buffer cur-buf))
          (message "Editing '%s' as %s"
                   (buffer-name)
                    (propertize (user-login-name) 'face 'bold)))
      ;; file is not edited as root
      (let ((cur-buf (current-buffer))
            (point (point))
            (filename (buffer-file-name)))
        (shut-up
          (save-buffer)
          (find-file (format "/sudo::%s" filename))
          (goto-char point)
          (kill-buffer-if-not-modified cur-buf))
        (message "Editing '%s' as %s"
                 (buffer-name)
                 (propertize "root" 'face 'bold)))))
    (evil-leader/set-key "nr" 'toggle-edit-as-root))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm-tramp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package helm-tramp
  :ensure
  :config
  (evil-leader/set-key "zt" 'helm-tramp))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Grep buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-define-key 'normal grep-mode-map (kbd "<tab>") 'compilation-display-error)
(evil-define-key 'normal grep-mode-map (kbd "<SPC>") 'mini)
(evil-define-key 'normal grep-mode-map (kbd "<RET>") 'compile-goto-error)
(evil-define-key 'normal grep-mode-map (kbd "gg") 'beginning-of-buffer)
(evil-define-key 'normal grep-mode-map (kbd "h") 'evil-backward-char)
(evil-define-key 'normal grep-mode-map (kbd "r") 'recompile)
(add-hook 'grep-mode-hook (lambda ()
                            (visual-line-mode -1)
                            (setq truncate-lines t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Git time machine
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package git-timemachine
  :init
  (el-get-bundle git-timemachine
    :url "https://github.com/emacsmirror/git-timemachine.git"
    :branch "master"
    :features git-timemachine)
  (evil-leader/set-key "vt" 'git-timemachine-toggle)
  :config
  (add-hook 'git-timemachine-mode-hook
            (lambda ()
              (evil-define-key 'motion git-timemachine-mode-map
                (kbd "n") 'git-timemachine-show-next-revision
                (kbd "p") 'git-timemachine-show-previous-revision
                (kbd "g") 'git-timemachine-show-nth-revision
                (kbd "q") 'git-timemachine-quit)
              (evil-motion-state))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Gnuplot
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package gnuplot-mode
  :disabled
  :init
  (el-get-bundle gnuplot-mode
    :url "https://www.github.com/bruceravel/gnuplot-mode.git"
    :features gnuplot)
  (require 'gnuplot)
  :config
  (add-hook 'gnuplot-comint-mode-hook 'gnuplot-context-sensitive-mode)
  (add-hook 'gnuplot-mode-hook 'gnuplot-context-sensitive-mode)
  (add-hook 'gnuplot-mode-hook 'font-lock-mode)
  (setq gnuplot-eldoc-mode t)
  (setq gnuplot-keywords-when (quote immediately))
  (setq gnuplot-tab-completion t)
  (define-key gnuplot-comint-mode-map (kbd "<tab>") 'company-complete-common)
  (define-key gnuplot-mode-map (kbd "<tab>") 'company-complete-common)
  ;; Keybinding
  (defun gnuplot-send-region-or-buffer-to-gnuplot () (interactive)
         (if (use-region-p)
             (gnuplot-send-region-to-gnuplot (region-beginning) (region-end))
           (gnuplot-send-buffer-to-gnuplot)))
  (evil-leader/set-key-for-mode 'gnuplot-mode "hd" 'gnuplot-info-at-point)
  (evil-leader/set-key-for-mode 'gnuplot-mode "ee" 'gnuplot-send-region-or-buffer-to-gnuplot)
  (evil-leader/set-key-for-mode 'gnuplot-mode "ll" 'gnuplot-show-gnuplot-buffer)
  (evil-leader/set-key-for-mode 'gnuplot-mode "lk" 'gnuplot-kill-gnuplot-buffer)
  (evil-leader/set-key-for-mode 'gnuplot-mode "ip" 'gnuplot-insert-filename)
  (evil-leader/set-key-for-mode 'gnuplot-mode "io" 'gnuplot-gui-set-options-and-insert)
  (evil-leader/set-key-for-mode 'gnuplot-comint-mode "hd" 'gnuplot-info-at-point)
  (evil-leader/set-key-for-mode 'gnuplot-comint-mode "ip" 'gnuplot-insert-filename)
  (evil-leader/set-key-for-mode 'gnuplot-comint-mode "lk" 'gnuplot-kill-gnuplot-buffer)
  (evil-leader/set-key-for-mode 'gnuplot-comint-mode "io" 'gnuplot-gui-set-options-and-insert))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mu4e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (and (executable-find "mu")
           (file-exists-p (expand-file-name "~/.Mail")))
  (use-package evil-mu4e
    :disabled
    :ensure
    :after mu4e
    :init
    (require 'evil-mu4e))
  (use-package mu4e
    :init
    (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
    (require 'mu4e)
    (el-get-bundle helm-mu
      :url "https://www.github.com/emacs-helm/helm-mu.git"
      :features helm-mu)
    :config
    (setq mu4e-update-interval nil
          mu4e-index-update-in-background t
          mu4e-split-view nil
          mu4e-completing-read-function (quote completing-read)
          mu4e-use-fancy-chars nil
          mu4e-confirm-quit nil
          mu4e-attachment-dir "~/Downloads"
          mu4e-hide-index-messages t
          mu4e-headers-include-related nil
          mu4e-save-multiple-attachments-without-asking t
          ;; Smtpmail
          ;; smtpmail-debug-info t
          ;; smtpmail-queue-mail t
          message-send-mail-function 'smtpmail-send-it
          send-mail-function 'smtpmail-send-it
          ;; ;; Or use nullmailer:
          ;; message-send-mail-function 'message-send-mail-with-sendmail
          ;; send-mail-function 'message-send-mail-with-sendmail
          smtpmail-auth-credentials "~/.authinfo.gpg"
          message-kill-buffer-on-exit t
          ;; html mails
          mu4e-html2text-command 'mu4e-shr2text
          mu4e-view-prefer-html nil
          mu4e-view-show-images t
          mu4e-view-auto-mark-as-read nil
          mu4e-maildir-shortcuts '())
    (when (fboundp 'imagemagick-register-types) (imagemagick-register-types))
    ;; because of bugs
    (add-hook 'mu4e-compose-pre-hook 'mu4e~request-contacts) ;; sometimes mail adress can't complete...
    (add-hook 'mu4e-compose-mode-hook (lambda () (setq-local flyspell-large-region 0))) ;; because of bug in flyspell

    (defun mu4e-view-enter ()
      "Compose a message for contact under point, or browse url under point."
      (interactive)
      (if (get-text-property (point) 'email)
          (mu4e~view-compose-contact)
        (shr-browse-url)))

    (setq mu4e-bookmarks
          (quote
           (("flag:unread AND NOT maildir:\"/these.news\" AND NOT maildir:\"/trash\" AND NOT maildir:\"/these.spam_insa\"" "Main unread messages " 109)
            ("flag:unread AND NOT maildir:\"/trash\"" "Unread messages" 117)
            ("date:today..now AND NOT maildir:\"/trash\"" "Today's messages" 116)
            ("date:7d..now AND NOT maildir:\"/trash\"" "Last 7 days" 119)
            ("mime:image/*" "Messages with images" 112)
            ("maildir:\"/drafts\" AND maildir:\"/Drafts\"" "Drafts" 100))))
    ;; Headers
    (setq mu4e-headers-date-format "%d-%m-%Y %H:%M"
          mu4e-view-show-addresses t
          mu4e-headers-fields (quote ((:human-date . 20) (:flags . 5) (:from-or-to . 30) (:subject))))
    (define-key mu4e-headers-mode-map (kbd "d") 'mu4e-headers-mark-for-trash)
    (add-hook 'mu4e-headers-found-hook (lambda ()
                                         (visual-line-mode -1)
                                         (setq truncate-lines t)))
    ;; View
    (define-key mu4e-view-mode-map (kbd "d") 'mu4e-view-mark-for-trash)
    (add-to-list 'mu4e-view-actions
                 '("ViewInBrowser" . mu4e-action-view-in-browser) t)
    (add-hook 'mu4e-view-mode-hook 'visual-fill-column-mode)
    (add-hook 'mu4e-view-mode-hook (lambda ()
                                     (goto-char (point-min))
                                     (re-search-forward "^$")
                                     (forward-line 1)))
    (add-hook 'mu4e-view-mode-hook 'mu4e-fold-unfold-all-fields)
    ;; Compose
    (add-hook 'mu4e-compose-mode-hook 'flyspell-mode)
    (add-hook 'mu4e-compose-mode-hook 'visual-fill-column-mode)
    ;; Context
    (setq mu4e-contexts
          `(
            ,(make-mu4e-context
              :name "Insa"
              :enter-func nil
              :match-func (lambda (msg) (string-equal "Insa" (mu4e-context-name (mu4e-context-current))))
              :leave-func (lambda () (mu4e~stop))
              :vars '((mu4e-maildir . "~/.Mail/Insa")
                      (mu4e-active-context . nil)
                      (mu4e-sent-folder . "/sent")
                      (mu4e-drafts-folder . "/drafts")
                      (mu4e-trash-folder . "/trash")
                      (mu4e-get-mail-command . "offlineimap -a Insa")
                      (smtpmail-smtp-server . "smtp.insa-lyon.fr")
                      (smtpmail-mail-address . "gaby.launay@insa-lyon.fr")
                      (smtpmail-smtp-user . "glaunay")
                      (smtpmail-stream-type . starttls)
                      (smtpmail-smtp-service . 587)
                      (mu4e-mu-home . "~/.mu-Insa")
                      (user-full-name . "Gaby Launay")
                      (user-mail-address . "gaby.launay@insa-lyon.fr")
                      (mu4e-user-mail-address-list . ("gaby.launay@insa-lyon.fr"))
                      (mu4e-compose-signature . "*Gaby Launay*\nDr. in Fluid Mechanics\nhttps://gabylaunay.github.io")
                      (helm-mu-command-arguments . "--muhome=\"~/.mu-Insa\"")
                      (mu4e-maildir-shortcuts . (("/trash" . 116)
                                                 ("/inbox" . 105)
                                                 ("/these" . 104)
                                                 ("/sent" . 115)))))
            ,(make-mu4e-context
              :name "Old Gmail"
              :enter-func nil
              :match-func (lambda (msg) (string-equal "Old Gmail" (mu4e-context-name (mu4e-context-current))))
              :leave-func (lambda () (mu4e~stop))
              :vars '((mu4e-maildir . "~/.Mail/Gmail")
                      (mu4e-active-context . t)
                      (mu4e-sent-folder . "/sent")
                      (mu4e-drafts-folder . "/drafts")
                      (mu4e-trash-folder . "/trash")
                      (mu4e-get-mail-command . "offlineimap -a Gmail")
                      (smtpmail-smtp-server . "smtp.gmail.com")
                      (smtpmail-mail-address . "gaby.launay@gmail.com")
                      (smtpmail-smtp-user . "gaby.launay")
                      (smtpmail-stream-type . starttls)
                      (smtpmail-smtp-service . 587)
                      (mu4e-mu-home . "~/.mu-Gmail")
                      (user-full-name . "Gaby Launay")
                      (user-mail-address . "gaby.launay@gmail.com")
                      (mu4e-user-mail-address-list . ("gaby.launay@gmail.com"))
                      (mu4e-compose-signature . "*Gaby Launay*")
                      (helm-mu-command-arguments . "--muhome=\"~/.mu-Gmail\"")
                      (mu4e-maildir-shortcuts . (("/trash" . 116)
                                                 ("/inbox" . 105)
                                                 ("/sent" . 115)))))
            ,(make-mu4e-context
              :name "Trash"
              :enter-func nil
              :match-func (lambda (msg) (string-equal "Trash" (mu4e-context-name (mu4e-context-current))))
              :leave-func (lambda () (mu4e~stop))
              :vars '((mu4e-maildir . "~/.Mail/Trash")
                      (mu4e-active-context . t)
                      (mu4e-sent-folder . "/sent")
                      (mu4e-drafts-folder . "/drafts")
                      (mu4e-trash-folder . "/trash")
                      (mu4e-get-mail-command . "offlineimap -a Trash")
                      (smtpmail-smtp-server . "smtp.gmail.com")
                      (smtpmail-mail-address . "gnieheh@gmail.com")
                      (smtpmail-smtp-user . "gnieheh")
                      (smtpmail-stream-type . starttls)
                      (smtpmail-smtp-service . 587)
                      (mu4e-mu-home . "~/.mu-Trash")
                      (user-full-name . "Gnieheh")
                      (user-mail-address . "gnieheh@gmail.com")
                      (mu4e-user-mail-address-list . ("gnieheh@gmail.com"))
                      (mu4e-compose-signature . "")
                      (helm-mu-command-arguments . "--muhome=\"~/.mu-Trash\"")
                      (mu4e-maildir-shortcuts . (("/trash" . 116)
                                                 ("/inbox" . 105)
                                                 ("/sent" . 115)))))
            ,(make-mu4e-context
              :name "GMX"
              :enter-func nil
              :match-func (lambda (msg) (string-equal "GMX" (mu4e-context-name (mu4e-context-current))))
              :leave-func (lambda () (mu4e~stop))
              :vars '((mu4e-maildir . "~/.Mail/GMX")
                      (mu4e-active-context . t)
                      (mu4e-sent-folder . "/sent")
                      (mu4e-drafts-folder . "/drafts")
                      (mu4e-trash-folder . "/trash")
                      (mu4e-get-mail-command . "offlineimap -a GMX")
                      (smtpmail-smtp-server . "mail.gmx.com")
                      (smtpmail-mail-address . "gaby.launay@gmx.com")
                      (smtpmail-smtp-user . "gaby.launay@gmx.com")
                      (smtpmail-stream-type . starttls)
                      (smtpmail-smtp-service . 587)
                      (mu4e-mu-home . "~/.mu-GMX")
                      (user-full-name . "Gaby Launay")
                      (user-mail-address . "gaby.launay@gmx.com")
                      (mu4e-user-mail-address-list . ("gaby.launay@gmx.com"))
                      (mu4e-compose-signature . "*Gaby Launay*\nDr. in Fluid Mechanics\nhttps://gabylaunay.github.io")
                      (helm-mu-command-arguments . "--muhome=\"~/.mu-GMX\"")
                      (mu4e-maildir-shortcuts . (("/trash" . 116)
                                                 ("/inbox" . 105)
                                                 ("/sent" . 115)))))
            ,(make-mu4e-context
              :name "North"
              :enter-func nil
              :match-func (lambda (msg) (string-equal "North" (mu4e-context-name (mu4e-context-current))))
              :leave-func (lambda () (mu4e~stop))
              :vars '((mu4e-maildir . "~/.Mail/North")
                      (mu4e-active-context . t)
                      (mu4e-sent-folder . "/sent")
                      (mu4e-drafts-folder . "/drafts")
                      (mu4e-trash-folder . "/trash")
                      (mu4e-get-mail-command . "offlineimap -a North")
                      (smtpmail-smtp-server . "smtp.office365.com")
                      (smtpmail-mail-address . "gaby.launay@northumbria.ac.uk")
                      (smtpmail-smtp-user . "gaby.launay@northumbria.ac.uk")
                      (smtpmail-stream-type . starttls)
                      (smtpmail-smtp-service . 587)
                      (mu4e-mu-home . "~/.mu-North")
                      (user-full-name . "Gaby Launay")
                      (user-mail-address . "gaby.launay@northumbria.ac.uk")
                      (mu4e-user-mail-address-list . ("gaby.launay@northumbria.ac.uk"))
                      (mu4e-compose-signature . "*Gaby Launay*\nDr. in Fluid Mechanics\nhttps://gabylaunay.github.io")
                      (helm-mu-command-arguments . "--muhome=\"~/.mu-North\"")
                      (mu4e-maildir-shortcuts . (("/trash" . 116)
                                                 ("/inbox" . 105)
                                                 ("/sent" . 115)))))
            ;; ,(make-mu4e-context
            ;;   :name "Server"
            ;;   :enter-func nil
            ;;   :match-func (lambda (msg) (string-equal "Server" (mu4e-context-name (mu4e-context-current))))
            ;;   :leave-func (lambda () (mu4e~stop))
            ;;   :vars '((mu4e-maildir . "~/.Mail/Server")
            ;;           (mu4e-sent-folder . "/sent")
            ;;           (mu4e-drafts-folder . "/Drafts")
            ;;           (mu4e-trash-folder . "/Trash")
            ;;           (mu4e-get-mail-command . "offlineimap -a Server")
            ;;           (mu4e-mu-home . "~/.mu-Server")
            ;;           (user-full-name . "Gaby Launay")
            ;;           (user-mail-address . "glaunay@glcloud.org")
            ;;           (mu4e-user-mail-address-list . ("glaunay@glcloud.org"))
            ;;           (mu4e-compose-signature . "*Gaby Launay*\nDr. in Fluid Mechanics\nhttps://gabylaunay.github.io")
            ;;           (helm-mu-command-arguments . "--muhome=\"~/.mu-Server\"")
            ;;           (mu4e-maildir-shortcuts . (("/trash" . 116)
            ;;                                      ("/inbox" . 105)
            ;;                                      ("/sent" . 115)))))
            ))
    (mu4e-context-switch nil "GMX")
    ;; Better updater and timer

    (defun mu4e-update-all-contexts-sentinel (process event)
      "Mu4e update process sentinel."
      (let* ((buffer (process-buffer process))
             (buffer-name (buffer-name buffer)))
        (with-current-buffer buffer
          (xterm-color-colorize-buffer)
          (goto-char (point-min))
          (while (search-forward "" (point-max) t)
            (replace-match "\n"))
          (goto-char (point-min))
          (when (re-search-forward
                 "\\(ERROR\\|Traceback\\|Error\\|error\\|UID validity problem\\)"
                 nil
                 t)
            (let ((buffer-name (rename-buffer (string-trim buffer-name))))
              (mu4e-message "An error occur while updating a context you should take a look at the buffer '%s'" buffer-name)))))
      t)

    (defun mu4e-update-all-contexts ()
      (interactive)
      (unless mu4e-contexts
        (mu4e-error "No contexts defined"))
      (let ((names-contexts (map 'list (lambda (context)
                                         (cons (mu4e-context-name context)
                                               context))
                                 mu4e-contexts)))
        (cl-loop for name-context in names-contexts do
                 ;; Current context should be updated through mu4e-update-index
                 ;; Because mu4e lock the xapian database
                 (when (not (string= (mu4e-context-name (mu4e-context-current))
                                     (car name-context)))
                   (let* ((name (car name-context))
                          (vars (mu4e-context-vars (cdr name-context)))
                          (activep (alist-get 'mu4e-active-context vars))
                          (maildir (alist-get 'mu4e-maildir vars))
                          (get-mail-command (alist-get
                                             'mu4e-get-mail-command vars))
                          (muhome (alist-get 'mu4e-mu-home vars))
                          (buffer-name (format " *mu4e-update-%s*" name))
                          (buffer (get-buffer buffer-name))
                          (buffer-process (get-buffer-process buffer))
                          (buffer-name-s (string-trim buffer-name))
                          (buffer-s (get-buffer buffer-name-s))
                          (buffer-process-s (get-buffer-process buffer-s)))
                     (when activep
                       ;; reinit output buffers
                       (when (processp buffer-process)
                         (kill-process buffer-process))
                       (when (bufferp buffer)
                         (with-current-buffer buffer
                           (erase-buffer)))
                       (when (processp buffer-process-s)
                         (kill-process buffer-process-s))
                       (when (bufferp buffer-s)
                         (kill-buffer buffer-s))
                       ;; make process
                       (make-process
                        :name buffer-name
                        :buffer buffer-name
                        :command (list "bash" "-c"
                                       (format "%s; mu index --maildir=\"%s\" --muhome=\"%s\""
                                               get-mail-command maildir muhome))
                        :sentinel 'mu4e-update-all-contexts-sentinel))))))
      ;; Update current context
      (mu4e-update-mail-and-index t))

    (defun mu4e-check-connexion (hostname)
      "Check the connexion with the given hostname using ping.

Return t if the connextion seems active."
      (with-temp-buffer " *mu4e-ping*"
                        (let ((exit-mess (call-process "ping" nil t nil hostname "-c" "1")))
                          (= exit-mess 0))))

    (defvar mu4e-update-all-contexts-timer
      (run-with-timer 0 300 'mu4e-update-all-contexts)
      "Timer used to update all mu4e contexts")

    (defun mu4e-switch-context ()
      "Switch to another context, but keep mu4e open if it was."
      (interactive)
      (let ((is-open (string= (buffer-name) "*mu4e-headers*"))
            (old-search mu4e~headers-last-query)
            (old-context (mu4e-context-name mu4e~context-current)))
        (mu4e-context-switch)
        (let ((new-context (mu4e-context-name mu4e~context-current)))
          (when (not (string= new-context old-context))
            (while (get-process mu4e~proc-name)
              (sleep-for 0 100))
            (when is-open
              (mu4e-headers-search old-search))))))

    (defun mu4e-next-context (&optional incr)
      "Switch to the next context"
      (interactive)
      (unless mu4e-contexts
        (mu4e-error "No contexts defined"))
      (let* ((names (map 'list (lambda (context)
                                 (mu4e-context-name context))
                         mu4e-contexts))
             (index (+ (position (mu4e-context-name mu4e~context-current)
                                 names)
                       (or incr 1)))
             (is-open (string= (buffer-name) "*mu4e-headers*"))
             (old-search mu4e~headers-last-query))
        (when (>= index (length names))
          (setq index 0))
        (when (< index 0)
          (setq index (- (length names) 1)))
        (mu4e-mark-handle-when-leaving)
        (message "index: %s" index)
        (message "nmb: %s" (nth index names))
        (mu4e-context-switch nil (nth index names))
        ;; wait for the current mu4e process to end
        (while (get-process mu4e~proc-name)
          (sleep-for 0 100))
        (when is-open
          (mu4e-headers-search old-search)
          (mu4e-message "Switched context to %s" (nth index names)))))

    (defun mu4e-prev-context ()
      "Switch to the previous context."
      (interactive)
      (mu4e-next-context -1))

    (defun mu4e-fold-unfold-all-fields ()
      "Fold or unflod all fields in a view."
      (interactive)
      (save-excursion
        (goto-char (point-min))
        (let* ((beg (point-min))
               (line-beg 1)
               (end (save-excursion (re-search-forward "^$")))
               (line-end (line-number-at-pos end)))
          (goto-char (point-min))
          (while (< (line-number-at-pos (point)) line-end)
            (mu4e~view-header-field-fold)
            (forward-line)))))



    ;; keybindings
    ;;     Main page
    (evil-define-key 'motion mu4e-main-mode-map "q" (lambda () (interactive) (kill-buffer nil))) ;; else, mu4e-quit remote update timer...
    ;;     Header
    (add-to-list 'evil-motion-state-modes 'mu4e-headers-mode)
    (evil-define-key 'motion mu4e-headers-mode-map
      (kbd "r") 'mu4e-headers-mark-for-read
      (kbd "h") 'mu4e-headers-toggle-include-related
      (kbd "q") 'mu4e-quit
      (kbd "M-h") 'mu4e-headers-query-prev
      (kbd "M-l") 'mu4e-headers-query-next
      (kbd "SPC") 'mini
      (kbd "RET") 'mu4e-headers-view-message)
    ;;     View
    (add-to-list 'evil-motion-state-modes 'mu4e-view-mode)
    (evil-define-key 'motion mu4e-view-mode-map
      (kbd "<return>") 'mu4e-view-enter
      (kbd "F") 'mu4e-fold-unfold-all-fields
      (kbd "q") 'mu4e~view-quit-buffer
      (kbd "f") 'mu4e-compose-forward
      (kbd "e") 'evil-forward-word-end
      (kbd "h") 'evil-backward-char
      (kbd "v") 'evil-visual-char
      (kbd "H") 'mu4e-view-toggle-html
      (kbd "z") 'mu4e-view-go-to-url
      (kbd "Z") (lambda () (interactive) (mu4e-view-go-to-url 4))
      (kbd "i") 'mu4e-compose-edit
      (kbd "s") 'mu4e-view-save-attachment
      (kbd "S") 'mu4e-view-save-attachment-multi
      (kbd "o") 'mu4e-view-open-attachment
      (kbd "u") (lambda () (interactive) (mu4e-update-mail-and-index t))
      (kbd "C-j") 'evil-scroll-down-half
      (kbd "C-k") 'evil-scroll-up-half
      (kbd "<tab>") (lambda () (interactive)
                      (let ((name-pos (field-beginning))
                            (value-pos (1+ (field-end))))
                        (if (and name-pos value-pos
                                 (eq (get-text-property name-pos 'field)
                                     'mu4e-header-field-key))
                            (mu4e~view-header-field-fold)
                          (shr-next-link))))
      (kbd "<backtab>") 'shr-previous-link
      (kbd "SPC") 'mini)
    ;;     Compose
    (evil-define-key 'insert mu4e-compose-mode-map
      (kbd "M-a") 'mail-add-attachment)
    (evil-define-key 'normal mu4e-compose-mode-map
      (kbd "M-a") 'mail-add-attachment
      (kbd "q") (lambda () (interactive)
                  (condition-case nil
                      (evil-window-delete)
                    (error (quit-window))))
      (kbd "SPC") 'mini)
    ;;     Evil-leader
    (evil-leader/set-key
      "ab" 'mu4e-switch-context
      "an" 'mu4e-next-context
      "ap" 'mu4e-prev-context
      "ac" 'mu4e-compose-new
      "as" 'mu4e-headers-search
      "aS" 'helm-mu-contacts
      "aa" (lambda () (interactive)
             (mu4e-headers-search-bookmark
              "NOT maildir:\"/trash\""))
      "aU" (lambda () (interactive)
             (mu4e-update-mail-and-index nil))
      "au" (lambda () (interactive)
             (mu4e-headers-search-bookmark
              "flag:unread AND NOT maildir:\"/trash\""))
      "aC" (lambda () (interactive)
             (mu4e-update-mail-and-index t)
             (mu4e-headers-search-bookmark "flag:draft"))
      "at" (lambda () (interactive)
             (mu4e-update-mail-and-index t)
             (mu4e-headers-search-bookmark
              "date:today..now AND NOT maildir:\"/trash\""))
      "aw" (lambda () (interactive)
             (mu4e-update-mail-and-index t)
             (mu4e-headers-search-bookmark
              "date:1w..now AND NOT maildir:\"/trash\"")))))

(use-package mu4e-alert
  :disabled
  :after mu4e
  :ensure
  :config
  (setq mu4e-alert-email-notification-types '(subjects)
        mu4e-alert-interesting-mail-query
        (concat
         "flag:unread"
         " AND NOT flag:trashed"
         " AND NOT maildir:"
         "\"/trash\""))
  (mu4e-alert-set-default-style 'libnotify)
  (mu4e-alert-enable-notifications)
  (defun mu4e-alert-default-grouped-mail-notification-formatter (mail-group all-mails)
    "Customize function to format MAIL-GROUP for notification.

ALL-MAILS are the all the unread emails"
    (let* ((mail-count (length mail-group))
           (total-mails (length all-mails))
           (first-mail (car mail-group))
           (field-value (mu4e-alert--get-group first-mail))
           (title-suffix (format (pcase mu4e-alert-group-by
                                   (`:from "from %s:")
                                   (`:to "to %s:")
                                   (`:maildir "in %s:")
                                   (`:priority "with %s priority:")
                                   (`:flags "with %s flags:"))
                                 field-value))
           (title (format "%s\n" title-suffix)))
      (list :title title
            :body (concat "• "
                          (s-join "\n• "
                                  (mapcar (lambda (mail)
                                            (plist-get mail :subject))
                                          mail-group)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SHR (Simple Html Rendered)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq shr-color-visible-luminance-min 50)
(defadvice shr-color-check (before fix-bg-col compile activate)
  "Don't let shr change background colors."
  ;; (setq bg (face-background 'default))
  (setq bg nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ERC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package erc
  :init
  (require 'erc)
  (require 'tls)
  :config
  (add-to-list 'evil-normal-state-modes 'erc-mode)
  ;; autojoin
  (erc-autojoin-mode t)
  (add-hook 'erc-mode-hook 'visual-fill-column-mode)
  (setq erc-autojoin-timing (quote ident)
        erc-join-buffer 'bury
        erc-autojoin-delay 1
        erc-default-server-buffer-name "irc.freenode.net:6697"
        erc-prompt-for-password nil
        erc-nick "muahah"
        erc-default-server "irc.freenode.net"
        erc-autojoin-channels-alist '((".*\\.freenode.net" "#emacs"
                                       "#discuteavecswan" "#emacs-elpy")))

        ;; erc-autojoin-channels-alist '((".*\\.freenode.net" "#emacs" "#python"
        ;;                                "#archlinux" "#erc" "#emacs-elpy"
        ;;                                "#i3" "#git" "##science" "#qutebrowser"))
  ;; tracking
  (erc-track-mode t)
  (setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "324" "329"
                                  "332" "333" "353" "477"))
  (setq erc-prompt (lambda () (concat "[" (buffer-name) "]>")))
  ;; smart functions for ERC
  (defun erc-start-default-server ()
    "Start the default erc server, or jump to
its buffer if already started."
    (interactive)
    (if (get-buffer erc-default-server-buffer-name) ;; ERC already active?
        (display-buffer erc-default-server-buffer-name)
      (erc-tls :server erc-default-server :port 6697
               :nick erc-nick)))

  (defun erc-goto-server-buffer ()
    "Goto server buffer, if no active server buffer,
create one and display it"
    (interactive)
    (let* ((buff-name (erc-get-active-servers)))
      (if (not buff-name)
          (erc-start-default-server)
        (if (equal (length buff-name) 1)
            (switch-to-buffer (car buff-name) nil)
          (switch-to-buffer (completing-read "Find IRC server: "
                                             buff-name predicate)
                            nil)))))

  (defun erc-goto-channel-buffer ()
    "Goto channel buffer"
    (interactive)
    (let ((predicate (lambda (buff) (interactive) (string-match "#.*" buff)))
          (buff-name (loop for buff in (buffer-list)
                           collect (buffer-name buff))))
      (completing-read "Find IRC channel: " buff-name predicate)))

  (defun erc-get-active-servers ()
    "Return a list of active servers buffers names"
    (interactive)
    (let* ((predicate (lambda (buff) (interactive) (string-match "irc\\.[^.]+\\.[^:]+:[0-9]\\{2,4\\}" buff)))
           (buff-name (loop for buff in (buffer-list)
                            if (funcall predicate (buffer-name buff))
                            collect (buffer-name buff))))
      buff-name))

  (defun erc-quit-and-kill-all ()
    "Quit IRC and killa ll related buffers"
    (interactive)
    (let ((servers (erc-get-active-servers)))
      (while servers
        (setq serv (pop servers))
        (erc-kill-query-buffers (get-buffer-process serv))
        (delete-process (get-buffer-process serv))
        (kill-buffer serv))))

  (defun erc-join-channel-from-outside ()
    "Join a IRC channel from outside ERC"
    (interactive)
    (with-current-buffer erc-default-server-buffer-name
      (call-interactively 'erc-join-channel)))

  ;: start ERC on startup
  (erc-goto-server-buffer)

  :bind (:map evil-leader--default-map
              ("kk" . erc-goto-server-buffer)
              ("ks" . erc-track-switch-buffer)
              ("kj" . erc-join-channel-from-outside)
              ("kc" . erc-goto-channel-buffer)
              ("kq" . erc-quit-and-kill-all)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ag
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ag
  :disabled
  :ensure)
(use-package helm-ag
  :disabled
  :after ag
  :ensure)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Replace-region in buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun replace-region ()
  "Replace occurences of the current region."
  (interactive)
  (if (not (use-region-p))
      (message "No region selected")
    (let* ((original (buffer-substring (region-beginning) (region-end)))
           (replacement (read-string (format "Replace '%s' with : " original)))
           (nmb-repl 0))
      (save-excursion
        (goto-char (point-min))
        (while (search-forward original nil t)
          (setq nmb-repl (+ 1 nmb-repl))
          (replace-match replacement nil t)))
      (message "Replaced %s occurences" nmb-repl))))
(evil-leader/set-key "mr" 'replace-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Clipboard
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ensure that things copied outside emacs remain on the kill ring
(setq save-interprogram-paste-before-kill t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Elfeed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package elfeed-org
  :ensure
  :init
  (require 'elfeed-org)
  :config
  (setq rmh-elfeed-org-tree-id "elfeed")
  (setq rmh-elfeed-org-files (list "~/Nextcloud/feeds/feeds.org"))
  (elfeed-org))

(use-package elfeed
  :ensure
  :after elfeed-org
  :config
  (setq-default elfeed-search-filter "#200 +unread")
  (setq elfeed-db-directory "~/Nextcloud/feeds/db")
  ;; (elfeed-update)
  (push 'elfeed-search-mode evil-motion-state-modes)
  (push 'elfeed-show-mode evil-motion-state-modes)
  (evil-define-key 'motion elfeed-search-mode-map
    (kbd "<return>") 'elfeed-search-show-entry
    (kbd "U") 'elfeed-update
    (kbd "y") 'elfeed-search-yank
    (kbd "z") 'elfeed-search-browse-url
    (kbd "q") 'elfeed-kill-buffer
    (kbd "f") 'elfeed-search-set-filter
    (kbd "u") 'elfeed-search-tag-all-unread
    (kbd "r") 'elfeed-search-untag-all-unread)
  (evil-define-key 'motion elfeed-show-mode-map
    (kbd "z") 'elfeed-show-visit
    (kbd "y") 'elfeed-show-yank
    (kbd "q") 'elfeed-kill-buffer)
  (evil-leader/set-key "zf" 'elfeed))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Grep for
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; functions to help doing things with "notes"
(use-package todos
  :init
  (el-get-bundle todos
    :url "https://www.github.com/galaunay/todos.el.git"
    :features todos)
  :config
  ;; for latex
  (defun search-for-notetoadd ()
    "Display 'notetoadd`"
    (interactive)
    (todos-display-todos "\\\\notetoadd{" "}" "To add :"))
  (defun search-for-notetosay ()
    "Display 'notetosay`"
    (interactive)
    (todos-display-todos "\\\\notetosay{" "}" "To say :"))
  (defun search-for-notetoaddmaybe ()
    "Display 'notetoaddmaybe`"
    (interactive)
    (todos-display-todos "\\\\notetoaddmaybe{" "}" "To add maybe :" ))
  (defun search-for-noteto ()
    "Display all 'noteto*`"
    (interactive)
    (todos-display-todos "\\\\noteto\\(add\\|addmaybe\\|say\\){" "}" "All notes :" ))
  (evil-leader/set-key-for-mode 'latex-mode
    "add" 'search-for-notetoadd
    "adm" 'search-for-notetoaddmaybe
    "ads" 'search-for-notetosay
    "ada" 'search-for-noteto)
  ;; prog
  (defun search-for-todo ()
    "Display 'TODO`"
    (interactive)
    (todos-display-todos "TODO[\s-]*:[\s-]*" "" "To do :" ))
  (defun search-for-todo-in-project ()
    "Display 'TODO`"
    (interactive)
    (todos-display-todos "TODO[\s-]*:[\s-]*" "" "To do :" t))
  (evil-leader/set-key-for-mode 'emacs-lisp-mode
    "ad" 'search-for-todo
    "aD" 'search-for-todo-in-project)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; HTML - PHP - CSS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company-web
  :ensure
  :init
  )
(use-package ac-html-csswatcher
  :ensure
  :disabled
  :config
  (company-web-csswatcher-setup))  ;; doesn't work ??
(use-package helm-css-scss
  :ensure)
(use-package css-eldoc
  :ensure
  :init
  (require 'css-eldoc))
(use-package web-mode
  :ensure
  :after company-web
  :config
  (require 'company-web-html)
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 4
        web-mode-enable-current-column-highlight t)
  (add-hook 'web-mode-hook 'adaptive-wrap-prefix-mode)
  ;; Binsings
  (evil-leader/set-key-for-mode 'web-mode
    (kbd "ic") (lambda () (interactive)
                 (web-mode-element-close)
                 (save-excursion
                   (evil-indent-line
                    (line-beginning-position)
                    (line-end-position))))
    (kbd "mc") 'web-mode-element-clone
    (kbd "de") 'web-mode-element-kill
    (kbd "dE") 'web-mode-element-vanish
    (kbd "me") 'web-mode-element-rename
    (kbd "we") 'web-mode-element-wrap
    (kbd "ve") 'web-mode-dom-errors-show
    (kbd "mn") 'web-mode-dom-normalize
    (kbd "da") 'web-mode-attribute-kill)
  (evil-define-key 'normal web-mode-map
    (kbd "H") 'web-mode-element-parent
    (kbd "L") 'web-mode-element-child
    (kbd "J") 'web-mode-element-next
    (kbd "K") 'web-mode-element-previous)
  ;; completion
  (add-hook 'web-mode-hook (lambda ()
                             (set (make-local-variable 'company-backends)
                                  '(company-web-html company-css)) ; company-web-csswatcher+))
                             (company-mode t)))
  ;; imenu / semantic
  (evil-leader/set-key-for-mode 'web-mode
    (kbd "ns") 'helm-css-scss
    (kbd "nS") 'helm-css-scss)
  ;; css eldoc (very handy)
  (add-hook 'web-mode-hook #'turn-on-css-eldoc)
  (add-hook 'css-mode-hook #'turn-on-css-eldoc))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Zone out
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-leader/set-key "bz" 'zone)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Word statistics
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar word-frequency-table (make-hash-table :test 'equal :size 128))

(defvar word-frequency-buffer "*frequencies*"
  "Buffer where frequencies are displayed.")

(defun word-frequency-incr (word)
  (puthash word (1+ (gethash word word-frequency-table 0)) word-frequency-table))

(defun word-frequency-list (&optional reverse limit)
  "Returns a cons which car is sum of times any word was used
and cdr is a list of (word . count) pairs.  If REVERSE is nil
sorts it starting from the most used word; if it is 'no-sort
the list is not sorted; if it is non-nil and not 'no-sort sorts
it from the least used words.  If LIMIT is positive number
only words which were used more then LIMIT times will be
added.  If it is negative number only words which were used
less then -LIMIT times will be added."
  (let (l (sum 0))
    (maphash
     (cond
      ((or (not (numberp limit)) (= limit 0))
       (lambda (k v) (setq l (cons (cons k v) l) sum (+ sum v))))
      ((= limit -1) (lambda (k v) (setq sum (+ sum v))))
      ((< limit 0)
       (setq limit (- limit))
       (lambda (k v) (setq sum (+ sum v))
         (if (< v limit) (setq l (cons (cons k v) l)))))
      (t
       (lambda (k v) (setq sum (+ sum v))
         (if (> v limit) (setq l (cons (cons k v) l))))))
     word-frequency-table)
    (cons sum
          (cond
           ((equal reverse 'no-sort) l)
           (reverse (sort l (lambda (a b) (< (cdr a) (cdr b)))))
           (t       (sort l (lambda (a b) (> (cdr a) (cdr b)))))))))

(defun word-frequency-string (&optional reverse limit func)
  "Returns formatted string with word usage statistics.

If FUNC is nil each line contains number of times word was
called and the word; if it is t percentage usage is added in
the middle; if it is 'raw each line will contain number an
word separated by single line (with no formatting) otherwise
FUNC must be a function returning a string which will be called
for each entry with three arguments: number of times word was
called, percentage usage and the word.

See `word-frequency-list' for description of REVERSE and LIMIT
arguments."
  (let* ((list (word-frequency-list reverse)) (sum (car list)))
    (mapconcat
     (cond
      ((not func) (lambda (e) (format "%7d  %s\n" (cdr e) (car e))))
      ((equal func t)
       (lambda (e) (format "%7d  %6.2f%%  %03d %s\n"
                           (cdr e)
                           (/ (* 1e2 (cdr e)) sum)
                           (length (car e))
                           (car e))))
      ((equal func 'raw) (lambda (e) (format "%d %s\n" (cdr e) (car e))))
      (t (lambda (e) (funcall func (cdr e) (/ (* 1e2 (cdr e)) sum) (car e)))))
     (cdr list) "")))

(defun word-frequency (&optional where reverse limit func)
  "Formats word usage statistics using
`word-frequency-string' function (see for description of
REVERSE, LIMIT and FUNC arguments) and:
- if WHERE is nil inserts it in th e
  or displays it in echo area if possible; else
- if WHERE is t inserts it in the current buffer; else
- if WHERE is an empty string inserts it into
  `word-frequency-buffer' buffer; else
- inserts it into buffer WHERE.

When called interactively behaves as if WHERE and LIMIT were nil,
FUNC was t and:
- with no prefix argument - REVERSE was nil;
- with universal or positive prefix arument - REVERSE was t;
- with negative prefix argument - REVERSE was 'no-sort."

  (interactive (list nil
                     (cond
                      ((not current-prefix-arg) nil)
                      ((> (prefix-numeric-value current-prefix-arg) 0))
                      (t 'no-sort))
                     nil t))
  (clrhash word-frequency-table)
  (word-frequency-process-buffer)
  (cond
   ((not where)
    (display-message-or-buffer (word-frequency-string reverse limit func)
                               word-frequency-buffer))
   ((equal where t)
    (insert (word-frequency-string reverse limit func)))
   (t
    (display-buffer
     (if (and (stringp where) (string= where ""))
         word-frequency-buffer where)
     (word-frequency-string reverse limit func)))))

(defun word-frequency-process-buffer ()
  (interactive)
  (let ((buffer (current-buffer))
        bounds
        beg
        end
        word)
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "\\<[[:word:]]+\\>" nil t)
        ;;    (while (forward-word 1)
        (word-frequency-incr (downcase (match-string 0)))
        ;;      (setq bounds (bounds-of-thing-at-point 'word))
        ;;      (setq beg (car bounds))
        ;;      (setq end (cdr bounds))
        ;;      (setq word (downcase (buffer-substring-no-properties beg end)))
        ;;      (word-frequency-incr word)
        ))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mastodon
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package mastodon
  :disabled
  :ensure
  :config
  (setq mastodon-instance-url "https://framapiaf.org/")
  (add-to-list 'evil-emacs-state-modes 'mastodon-mode)
  :bind (:map evil-leader--default-map
              ("zm" . mastodon)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil-goggles
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package evil-googles
  :disabled
  :ensure
  :config
  (evil-goggles-mode)
  (require 'diff-mode) ;; load diff-* faces
  ;; (setq evil-goggles-default-face 'highlight)
  (setq evil-goggles-faces-alist `((evil-delete . diff-removed)
                                   (evil-yank . diff-changed)
                                   (evil-paste-after . diff-added)
                                   (evil-paste-before . diff-added))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Break timer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun break--begin-break ()
  "Begin a break and throw a notification when its over."
  (interactive)
  (run-at-time 300 nil 'break--notify-end)
  (message "Beginning a break of 5mn"))

(defun break--notify-end ()
  "Notify the end of the break."
  (notifications-notify
   :app-name "emacs"
   :urgency 'critical
   :body "Break is over boy, go back to work !"))

(defun notify-me-at (mess time)
  "Send a notification at a given time."
  (interactive (list (read-from-minibuffer "Message: ")
                     (read-from-minibuffer "When: ")))
  (run-at-time time nil (lambda (mess)
                          (notifications-notify
                           :app-name "emacs"
                           :urgency 'normal
                           :body mess))
               mess)
  (message "Notification planned at %s" time))

(evil-leader/set-key (kbd "bb") 'break--begin-break)
(evil-leader/set-key (kbd "bn") 'notify-me-at)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Text scale
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-leader/set-key "f+" 'text-scale-increase)
(evil-leader/set-key "f-" 'text-scale-decrease)
(evil-leader/set-key "f=" (lambda () (interactive) (text-scale-set 0)))
(evil-leader/set-key "fs" (lambda () (interactive) (text-scale-adjust 0)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Diff-hl
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package diff-hl
  :ensure
  :disabled
  :config
  (defun toggle-hl-diff ()
    (interactive)
    (if (bound-and-true-p diff-hl-mode)
        (progn
          (diff-hl-mode -1)
          (diff-hl-flydiff-mode -1))
      (diff-hl-mode 1)
      (diff-hl-flydiff-mode 1)))
  :bind (:map evil-leader--default-map
              ("vf" . toggle-hl-diff)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Suggest
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package suggest
  :ensure
  :disabled)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dictionnary
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package define-word
  :ensure
  :config
  (evil-leader/set-key (kbd "td") 'define-word))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Visual fill column
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package visual-fill-column
  :ensure
  :config
  (setq-default visual-fill-column-center-text t
                visual-fill-column-fringes-outside-margins t
                visual-fill-column-width 80)
  ;; (setq split-window-preferred-function
  ;;       'visual-fill-column-split-window-sensibly))
  (add-hook 'visual-fill-column-mode-hook
            (lambda ()
              (setq-local split-window-preferred-function
                          'visual-fill-column-split-window-sensibly)
              (setq-local auto-hscroll-mode nil))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Net tools
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO : Add keybinding to the associated mode
;; (evil-leader/set-key (kbd "zt") 'traceroute)
;; (evil-leader/set-key (kbd "zp") 'ping)
;; (evil-leader/set-key (kbd "zi") 'ifconfig)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Count words occurences
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package word-stats
  :init
  (el-get-bundle word-stats
    :url "https://github.com/galaunay/word-stats.git"
    :features word-stats))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Memory-usage
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package memory-usage
  :ensure
  :config
  (evil-leader/set-key "bm" 'memory-usage))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dos2unix
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun dos2unix ()
  "Convert current buffer to unix coding."
  (interactive)
  (set-buffer-file-coding-system 'unix))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Yaml-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package yaml-mode
  :ensure)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fasd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package fasd
  :ensure
  :config
  (setq fasd-enable-initial-prompt nil)
  (global-fasd-mode 1)  ;; Add visited files to fasd database
  (evil-leader/set-key "nz" 'fasd-find-file))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Howdoi
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package howdoi
  :disabled
  :init
  (el-get-bundle howdoi
    :url "https://github.com/galaunay/howdoi.el.git"
    :features howdoi)
  :config
  (evil-leader/set-key "zo" (lambda (query)
                              (interactive "sQuery: ")
                              (howdoi query t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; camcorder
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package camcorder
  :ensure)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Password manager
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defcustom passmng-passwords-directories '()
  "List of directories where passwords are stored."
  :group 'passmng
  :type '(repeat string))

(defun passmng-get-password (&optional name edit)
  "Ask for a password to get and display it.

NAME is the password name.
If EDIT is non-nil, edit the password, else, just display it."
  (interactive)
  (let* ((dirs (cl-loop for dir in passmng-passwords-directories
                        if (file-exists-p dir)
                        collect dir))
         (files (cl-loop
                 for dir in dirs
                 append (cl-loop
                         for file in (directory-files dir t ".*\\.gpg")
                         collect (list (file-name-base file) file))))
         (file (if name (format "%s.gpg" name) (car (helm-comp-read "Password name: " files))))
         (buffer (find-file-noselect file)))
    (with-current-buffer buffer
      (goto-char (point-min))
      (let ((id (buffer-substring-no-properties (line-beginning-position)
                                                (line-end-position))))
        (forward-line)
        (let ((pass (buffer-substring-no-properties (line-beginning-position)
                                                    (line-end-position))))
          (message "Id: %s" id)
          (kill-new pass)
          (kill-buffer buffer))))))
;; (switch-to-buffer-other-window buffer)
;; (when (not edit)
;;   (passmng-securized-help-mode))))

;; (defun passmng-securized-help-mode ()
;;   "Help-mode, but burying buffer on quit."
;;   (help-mode)
;;   (local-set-key "q" (lambda () (interactive) (quit-window t)))
;;   (evil-local-set-key 'motion "q" (lambda () (interactive) (quit-window t))))

(defun passmng-store-password (name ID password)
  "Store a new password."
  (interactive (list (read-string "Password name: ")
                     (read-string "Password ID: ")
                     (read-passwd "Password: " t)))
  (let* ((dir (if (= (length passmng-passwords-directories) 1)
                  (car passmng-passwords-directories)
                (completing-read "Directory: " passmng-passwords-directories)))
         (file (expand-file-name (concat (file-name-as-directory dir) name)))
         (enc_file (concat file ".gpg"))
         (buffer (find-file-noselect file)))
    (when (file-exists-p enc_file)
      (error "Password name already used"))
    (with-current-buffer buffer
      (insert (format "%s\n%s" ID password))
      (save-buffer))
    (epa-encrypt-file file
                      (epa-select-keys (epg-make-context epa-protocol)
                                       "Select recipients for encryption.
If no one is selected, symmetric encryption will be performed.  "))
    (kill-buffer buffer)
    (delete-file file)))

(defun passmng-edit-or-store-password ()
  "Edit an existing password, or create a new one."
  (interactive)
  (let* ((dirs (cl-loop for dir in passmng-passwords-directories
                        if (file-exists-p dir)
                        collect dir))
         (files (cl-loop
                 for dir in dirs
                 append (cl-loop
                         for file in (directory-files dir t ".*\\.gpg")
                         collect (list (file-name-base file) file))))
         (file (helm-comp-read "Password name: " files)))
    (condition-case nil
        (progn
          (switch-to-buffer-other-window (find-file-noselect (car file)))
          (fundamental-mode))
      (error (passmng-store-password file
                                     (read-string "Password ID: ")
                                     (read-passwd "Password: " t))))))

;; Config
(setq passmng-passwords-directories '("~/dev/pdm"))
(evil-leader/set-key
  "bp" 'passmng-get-password
  "bP" 'passmng-edit-or-store-password)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ID-manager
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package id-manager
  :disabled
  :ensure
  :config
  (setq idm-database-file "~/Perso/pdm/idm-db.gpg"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ansi color
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package xterm-color
  :ensure)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dimmer (highlight current window)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package dimmer
  :disabled
  :ensure
  :init
  (dimmer-activate)
  :config
  (setq dimmer-exclusion-regexp ".*helm.*"
        dimmer-percent 0.2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Align-regex
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ialign
  :init
  (el-get-bundle ialign
    :url "https://github.com/mkcms/interactive-align.git"
    :features ialign)
  :config
  (setq ialign-initial-regexp "\\([[:blank:]]+\\)")
  (evil-leader/set-key "ma" 'ialign-interactive-align))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-wild-notify
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org-wild-notifier
  :disabled
  :ensure
  :config
  (setq org-wild-notifier-alert-time 20
        org-wild-notifier-keyword-whitelist nil
        alert-default-style 'libnotify)
  ;; use high priority notification
  (defun org-wild-notifier--notify (event-msg)
    "Notify about an event using `alert' library.
EVENT-MSG is a string representation of the event."
    (alert event-msg
           :severity 'high
           :title org-wild-notifier-notification-title))
  (org-wild-notifier-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-pandoc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ox-pandoc
  :ensure)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Outlook calendar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package excorporate
  :disabled
  :ensure
  :config
  (setq excorporate-configuration "gaby.launay@outlook.office365.com"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Openscad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package scad-mode
  :ensure
  :config
  (add-hook 'scad-mode-hook (lambda ()
                              (setq c-basic-offset 4)
                              (highlight-indentation-mode)
                              (setq highlight-indentation-offset 4)))
  (defun scad-open-stl-with-blender ()
    "Open the associated stl file with blender"
    (interactive)
    (let* ((filename (buffer-file-name))
           (stlname (format "%s.stl" (file-name-sans-extension filename)))
           (arg (format "import bpy; bpy.ops.import_mesh.stl(filepath='%s')" stlname)))
      (start-process "blender" nil "blender" "--python-expr" arg)))

  (evil-leader/set-key-for-mode 'scad-mode
    "vo" 'scad-open-current-buffer
    "ee" 'scad-preview-export
    "vb" 'scad-open-stl-with-blender))

(use-package scad-preview
  :ensure
  :config
  (setq scad-preview-colorscheme "DeepOcean"
        scad-preview-refresh-delay 1000000  ;; Only refresh manually
        scad-preview-image-size  `( ,(/ (frame-pixel-width) 2)
                                    .
                                    ,(frame-pixel-height))
        scad-preview-window-size (/ (frame-width) 2))
  (defun scad-preview-show ()
    ""
    (interactive)
    (setq scad-preview-image-size  `( ,(/ (frame-pixel-width) 2)
                                      .
                                      ,(frame-pixel-height))
          scad-preview-window-size (/ (frame-width) 2))
    (let ((scad-buff-name "*SCAD Preview*"))
      (delete-other-windows)
      (if scad-preview-mode
          (if (bufferp (get-buffer scad-buff-name))
              (display-buffer scad-buff-name 'display-buffer-pop-up-window)
            (scad-preview-mode)
            (scad-preview-mode))
        (scad-preview-mode)))
    (scad-preview-refresh))

  (defun scad-preview-quit ()
    ""
    (interactive)
    (let ((scad-buff-name "*SCAD Preview*"))
      (when (bufferp (get-buffer scad-buff-name))
        (kill-buffer (get-buffer scad-buff-name)))
      (when scad-preview-mode
        (scad-preview-mode))))

  (evil-leader/set-key-for-mode 'scad-mode
    "vv" 'scad-preview-show
    "vq" 'scad-preview-quit)
  (evil-define-key 'motion scad-preview--image-mode-map
    "k" 'scad-preview-dist-
    "j" 'scad-preview-dist+
    "l" 'scad-preview-rotz-
    "h" 'scad-preview-rotz+
    "q" (lambda () (interactive)
          (bury-buffer)
          (when (window-parent)
            (delete-window)))
    (kbd "C-k") 'scad-preview-rotx+
    (kbd "C-j") 'scad-preview-rotx-))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color Picker
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package webkit-color-picker
  :disabled  ;; Wait for emacs 26'
  :ensure)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Clever parens
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package smartparens
  :ensure
  :disabled
  :config
  (add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode))
(use-package evil-cleverparens
  :ensure
  :disabled
  :after smartparens
  :config
  (setq evil-cleverparens-use-additional-bindings nil
        evil-cleverparens-use-s-and-S nil
        evil-cleverparens-use-additional-movement-keys nil)
  (add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Very large files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package vlf
  :ensure
  :init
  (require 'vlf-setup))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs start up profiler
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package esup
  :disabled
  :ensure)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Minimap
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package minimap
  :ensure
  :config
  (set-face-background 'minimap-active-region-background "#262f33")
  (setq minimap-window-location 'right))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EXWM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package exwm
  :disabled
  :ensure
  :config
  (require 'exwm)
  (require 'exwm-config)
  (exwm-config-default))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Winner mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(winner-mode t)
(define-key global-map (kbd "C-w p") (lambda ()
                                       (interactive)
                                       (winner-undo)
                                       (hydra-winner/body)))
(defhydra hydra-winner ()
  "Windows configurations"
  ("p" winner-undo "Previous")
  ("n" winner-redo "Next")
  ("q" nil "quit"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SBCL (slime)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package slime
  :disabled
  :ensure
  :config
  (load (expand-file-name "/usr/lib/quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "sbcl"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dash
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package helm-dash
  :ensure
  :config
  (setq helm-dash-common-docsets '())
  (add-hook 'LaTeX-mode-hook
            (lambda () (setq helm-dash-docsets '("LaTeX"))))
  (add-hook 'emacs-lisp-mode-hook
            (lambda () (setq helm-dash-docsets '("Emacs Lisp"))))
  (add-hook 'sh-mode-hook
            (lambda () (setq helm-dash-docsets '("Bash"))))
  (add-hook 'python-mode-hook
            (lambda () (setq helm-dash-docsets '("Python 3"
                                                 "NumPy"
                                                 "Matplotlib"
                                                 "SciPy"))))
  (evil-leader/set-key (kbd "zd") 'helm-dash))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Systemd files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package systemd
  :ensure
  :config
  (add-hook 'systemd-mode-hook 'visual-fill-column-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Volatile highlight
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package volatile-highlights
  :ensure
  :config
  ;; support evil
  (vhl/define-extension 'evil 'evil-paste-after 'evil-paste-before
                      'evil-paste-pop 'evil-move)
  (vhl/install-extension 'evil)
  ;; support undo-tree
  (vhl/define-extension 'undo-tree 'undo-tree-yank 'undo-tree-move)
  (vhl/install-extension 'undo-tree))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Browsing init file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun navigate-init-sections ()
  "Goto a specific section of the init.el file."
  (interactive)
  (when (not (string= "init.el" (buffer-name)))
    (find-file (expand-file-name "~/.emacs.d/init.el")))
  (let* ((sections
          (save-excursion
            (goto-char (point-min))
            (cl-loop while (re-search-forward "^;\\{70,80\\}\n;; \\(.*\\)\n;\\{70,80\\}$" nil t)
                     collect (match-string 1))))
         (section (completing-read "Section: " sections)))
    (goto-char (point-min))
    (re-search-forward (concat
                        "^;\\{70,80\\}\n"
                        ";;[[:space:]]*" section "[[:space:]]*\n"
                        ";\\{70,80\\}$")
                       nil t)
    (forward-line -1)
    (beginning-of-line)))
(evil-leader/set-key "gis" 'navigate-init-sections)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fix warning for prompt detection when using jupyter/ipython
;; To PR to python-mode
;; check if something better than split-string exist
(defun python-shell-prompt-detect ()
  "Detect prompts for the current `python-shell-interpreter'.
When prompts can be retrieved successfully from the
`python-shell-interpreter' run with
`python-shell-interpreter-interactive-arg', returns a list of
three elements, where the first two are input prompts and the
last one is an output prompt.  When no prompts can be detected
and `python-shell-prompt-detect-failure-warning' is non-nil,
shows a warning with instructions to avoid hangs and returns nil.
When `python-shell-prompt-detect-enabled' is nil avoids any
detection and just returns nil."
  (when python-shell-prompt-detect-enabled
    (python-shell-with-environment
      (let* ((code (concat
                    "import sys\n"
                    "ps = [getattr(sys, 'ps%s' % i, '') for i in range(1,4)]\n"
                    ;; JSON is built manually for compatibility
                    "ps_json = '\\n[\"%s\", \"%s\", \"%s\"]\\n' % tuple(ps)\n"
                    "print (ps_json)\n"
                    "sys.exit(0)\n"))
             (interpreter python-shell-interpreter)
             (interpreter-arg (split-string python-shell-interpreter-interactive-arg " "))
             (output
              (with-temp-buffer
                ;; TODO: improve error handling by using
                ;; `condition-case' and displaying the error message to
                ;; the user in the no-prompts warning.
                (ignore-errors
                  (let ((code-file (python-shell--save-temp-file code)))
                    ;; Use `process-file' as it is remote-host friendly.
                    (apply
                     'process-file
                     interpreter
                     code-file
                     '(t nil)
                     nil
                     interpreter-arg)
                    ;; Try to cleanup
                    (delete-file code-file)))
                (buffer-string)))
             (prompts
              (catch 'prompts
                (dolist (line (split-string output "\n" t))
                  (let ((res
                         ;; Check if current line is a valid JSON array
                         (and (string= (substring line 0 2) "[\"")
                              (ignore-errors
                                ;; Return prompts as a list, not vector
                                (append (json-read-from-string line) nil)))))
                    ;; The list must contain 3 strings, where the first
                    ;; is the input prompt, the second is the block
                    ;; prompt and the last one is the output prompt.  The
                    ;; input prompt is the only one that can't be empty.
                    (when (and (= (length res) 3)
                               (cl-every #'stringp res)
                               (not (string= (car res) "")))
                      (throw 'prompts res))))
                nil)))
        (when (and (not prompts)
                   python-shell-prompt-detect-failure-warning)
          (lwarn
           '(python python-shell-prompt-regexp)
           :warning
           (concat
            "Python shell prompts cannot be detected.\n"
            "If your emacs session hangs when starting python shells\n"
            "recover with `keyboard-quit' and then try fixing the\n"
            "interactive flag for your interpreter by adjusting the\n"
            "`python-shell-interpreter-interactive-arg' or add regexps\n"
            "matching shell prompts in the directory-local friendly vars:\n"
            "  + `python-shell-prompt-regexp'\n"
            "  + `python-shell-prompt-block-regexp'\n"
            "  + `python-shell-prompt-output-regexp'\n"
            "Or alternatively in:\n"
            "  + `python-shell-prompt-input-regexps'\n"
            "  + `python-shell-prompt-output-regexps'")))
        prompts))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Notify loaded daemon
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (daemonp)
  (load "notifications")
  (notifications-notify
   :app-name "emacs"
   :timeout 2000
   :body "Emacs damon running and ready to go !"))
