;; [[file:init.org::*straight][straight:1]]
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
;; straight:1 ends here

;; [[file:init.org::*use-package][use-package:1]]
(defun cypher/use-package-if-prehook (name _keyword pred rest state)
    (unless pred (error "predicated failed; skipping package")))

  (advice-add 'use-package-handler/:if :before 'cypher/use-package-if-prehook)

  (use-package f
    :ensure t)  ;; this will force use package keyword ":ensure" when using "use-package" 

;; https://zzamboni.org/post/my-emacs-configuration-with-commentary/

   (customize-set-variable 'use-package-always-defer t)
;; use-package:1 ends here

;; [[file:init.org::*speed up Emacs][speed up Emacs:1]]
(setq gc-cons-threshold (* 100 1024 1024))
;; speed up Emacs:1 ends here

;; [[file:init.org::*brazilian-holidays][brazilian-holidays:1]]
(load "~/.emacs.d/local-repo/emacs-brazilian-holidays/brazilian-holidays.el")
;; brazilian-holidays:1 ends here

;; [[file:init.org::*file path][file path:1]]
(setq uniquify-buffer-name-style 'reverse)
(setq inhibit-default-init t)
;; (setq-default frame-title-format "%b (%f)")
(setq-default frame-title-format "-> %f")
(global-set-key "\M-n" "\C-u1\C-v")
(global-set-key "\M-p" "\C-u1\M-v")
;; file path:1 ends here

;; [[file:init.org::*portuguese-prefix][portuguese-prefix:1]]
(set-input-method "portuguese-prefix")

(defadvice switch-to-buffer (after activate-input-method activate)
(activate-input-method "portuguese-prefix"))

(add-hook 'text-mode-hook
  (lambda () (set-input-method "portuguese-prefix")))
;; portuguese-prefix:1 ends here

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; small-hacks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; warnings - level
;; default
;; (setq warning-minimum-level :warning)
;; minimum
(setq warning-minimum-level :emergency)

;; Cedilla in Emacs
;; keyboard - setxkbmap us_intl
;; then start Emacs like so:

;; "LANG=C emacs &"
;; "LANG=C emacs -Q &"

;; or use the scripts:
;; "~/bin/emacsCedilla.sh"
;; "~/bin/emacsVanCedilla"

;; see "~/init_cybertron.md" for mor details

;; comint for folder/directory/file completion
;; M-x comint-mode
;; M-TAB	show the options for completion

(require 'iso-transl)
;; (global-set-key (kbd "<dead-acute> c") "ç")
;; (global-set-key (kbd "<dead-acute> c") "ç")

;; (global-set-key (kbd "<dead-acute> c") (insert "ç"))
;; (global-set-key (kbd "<dead-acute> C") (insert "Ç"))

(global-set-key (kbd "C-, c") (lambda () (interactive) (insert "ç")))
(global-set-key (kbd "C-, C") (lambda () (interactive) (insert "Ç")))

;; or

;; C-x 8 , c
;; C-x 8 , C

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Hebrew fonts

(set-fontset-font "fontset-default" 'hebrew (font-spec :family "Ezra SIL" :size 30))
;; (set-fontset-font "fontset-default" 'hebrew (font-spec :family "SBL Hebrew" :size 35))
;; (set-fontset-font "fontset-default" 'hebrew (font-spec :family "Dejavu Sans Mono" :size 30))

;; TODO Greek fonts

(set-fontset-font "fontset-default" 'greek (font-spec :family "Code2000" :size 25))
;; (set-fontset-font "fontset-default" 'greek (font-spec :family "Liberation Mono" :size 25))
;; (set-fontset-font "fontset-default" 'greek (font-spec :family "Dejavu Sans Mono" :size 25))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; electric-cursor

(add-to-list 'load-path "~/.emacs.d/local-repo/electric-cursor")
(require 'electric-cursor)
(electric-cursor-mode +1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; pulse-highlight-search

(defun cypher/pulse-highlight-current-line (&rest args)
 "Briefly highlight the currant line."
 (pulse-momentary-highlight-one-line (point)))

(advice-add 'evil-search-next :after
 #'cypher/pulse-highlight-current-line)

(advice-add 'evil-search-previous :after
 #'cypher/pulse-highlight-current-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [[file:init.org::*scratch org-mode][scratch org-mode:1]]
;;  (setq initial-major-mode 'org-mode)
    (setq initial-major-mode 'fundamental-mode)
;; scratch org-mode:1 ends here

;; [[file:init.org::*small-configs][small-configs:1]]
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.50")
 '(initial-frame-alist '((fullscreen . maximized))))
                                      ;; for customizing the face (fonts), do:
                                      ;; M-x customize-face RET default RET    
                                      ;; (setq inhibit-startup-screen t)
                                      ;; (set-default-font "Source Code Pro" t)
                                      ;; you have to install /usr/share/fonts/adobe_pro/ 
                                      (set-face-attribute 'default nil :height 105)
                                      (visual-line-mode 1)
                                      (global-visual-line-mode 1)
                                   ;; (load-theme 'misterioso)
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
                                 (menu-bar-mode                  -1) ; Menu bar can be accessed with F10
                                 (prefer-coding-system      'utf-8) ; Always prefer UTF-8
                                 (scroll-bar-mode               -1) ; And no scroll bar either
                                 (show-paren-mode                1) ; Highlight matching parenthesis
                                 (tool-bar-mode                 -1) ; No tool bar, please
                                 (setq create-lockfiles nil)        ; do not save '#' lockfiles

                                 ;; Xah-hacks
                                 ;; http://ergoemacs.org/emacs/modernization_formfeed.html
                                 ;; keys for moving to prev/next code section (Form Feed; ^L)
                                 (global-set-key (kbd "<C-M-prior>") 'backward-page) ; Ctrl+Alt+PageUp
                                 (global-set-key (kbd "<C-M-next>") 'forward-page)   ; Ctrl+Alt+PageDown
                                 (delete-selection-mode 1)
                                 (cua-mode -1) ; 1 disables "Ctrl-Alt" in orgmode

                                 (defun cypher-new-empty-buffer ()
                                   "Create a new empty buffer.
                                 New buffer will be named “untitled” or “untitled<2>”, “untitled<3>”, etc.

                                 It returns the buffer (for elisp programing).

                                 URL `http://ergoemacs.org/emacs/emacs_new_empty_buffer.html'
                                 Version 2017-11-01"
                                   (interactive)
                                   (let (($buf (generate-new-buffer "untitled")))
                                     (switch-to-buffer $buf)
                                     (funcall initial-major-mode)
                                     (setq buffer-offer-save t)
                                     $buf
                                     ))

                                 (global-set-key (kbd "M-N") 'cypher-new-empty-buffer) ; Alt+N

                                 ;; cypher-cut-line-or-region
                                 (defun cypher-cut-line-or-region ()
                                   "Cut current line, or text selection.
                                 When `universal-argument' is called first, cut whole buffer (respects `narrow-to-region').

                                 URL `http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html'
                                 Version 2015-06-10"
                                   (interactive)
                                   (if current-prefix-arg
                                       (progn ; not using kill-region because we don't want to include previous kill
                                         (kill-new (buffer-string))
                                         (delete-region (point-min) (point-max)))
                                     (progn (if (use-region-p)
                                                (kill-region (region-beginning) (region-end) t)
                                              (kill-region (line-beginning-position) (line-beginning-position 2))))))

                                 ;; cypher-copy-line-or-region
                                 (defun cypher-copy-line-or-region ()
                                   "Copy current line, or text selection.
                                 When called repeatedly, append copy subsequent lines.
                                 When `universal-argument' is called first, copy whole buffer (respects `narrow-to-region').

                                 URL `http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html'
                                 Version 2018-09-10"
                                   (interactive)
                                   (if current-prefix-arg
                                       (progn
                                         (copy-region-as-kill (point-min) (point-max)))
                                     (if (use-region-p)
                                         (progn
                                           (copy-region-as-kill (region-beginning) (region-end)))
                                       (if (eq last-command this-command)
                                           (if (eobp)
                                               (progn )
                                             (progn
                                               (kill-append "\n" nil)
                                               (kill-append
                                                (buffer-substring-no-properties (line-beginning-position) (line-end-position))
                                                nil)
                                               (progn
                                                 (end-of-line)
                                                 (forward-char))))
                                         (if (eobp)
                                             (if (eq (char-before) 10 )
                                                 (progn )
                                               (progn
                                                 (copy-region-as-kill (line-beginning-position) (line-end-position))
                                                 (end-of-line)))
                                           (progn
                                             (copy-region-as-kill (line-beginning-position) (line-end-position))
                                             (end-of-line)
                                             (forward-char)))))))

                                 (global-set-key (kbd "<C-M x>")  'cypher-cut-line-or-region) ; C-Alt x - cut  
                                 (global-set-key (kbd "<M->")  'cypher-copy-line-or-region) ; Alt->  - copy 
                                 (global-set-key (kbd "<M-p>") 'yank) ; Alt-p Uppercase - paste

                                 ;; cypher-copy-all-or-region
                                 (defun cypher-copy-all-or-region ()
                                   "Put the whole buffer content to `kill-ring', or text selection if there's one.
                                 Respects `narrow-to-region'.
                                 URL `http://ergoemacs.org/emacs/emacs_copy_cut_all_or_region.html'
                                 Version 2015-08-22"
                                   (interactive)
                                   (if (use-region-p)
                                       (progn
                                         (kill-new (buffer-substring (region-beginning) (region-end)))
                                         (message "Text selection copied."))
                                     (progn
                                       (kill-new (buffer-string))
                                       (message "Buffer content copied."))))

                                 (global-set-key (kbd "<M-T>")  'cypher-copy-all-or-region) ; Alt-T Uppercase - copy-all-or-region 

                              ;; cypher-cut-all-or-region
                              (defun cypher-cut-all-or-region ()
                                "Cut the whole buffer content to `kill-ring', or text selection if there's one.
                              Respects `narrow-to-region'.
                              URL `http://ergoemacs.org/emacs/emacs_copy_cut_all_or_region.html'
                              Version 2015-08-22"
                                (interactive)
                                (if (use-region-p)
                                    (progn
                                      (kill-new (buffer-substring (region-beginning) (region-end)))
                                      (delete-region (region-beginning) (region-end)))
                                  (progn
                                    (kill-new (buffer-string))
                                    (delete-region (point-min) (point-max)))))

                              (global-set-key (kbd "<M-U>")  'cypher-cut-all-or-region) ; Alt-U Uppercase - copy-all-or-region 

                           ;; cypher-paste-or-paste-previous
                           (defun xah-paste-or-paste-previous ()
                             "Paste. When called repeatedly, paste previous.
                           This command calls `yank', and if repeated, call `yank-pop'.

                           When `universal-argument' is called first with a number arg, paste that many times.

                           URL `http://ergoemacs.org/emacs/emacs_paste_or_paste_previous.html'
                           Version 2017-07-25"
                             (interactive)
                             (progn
                               (when (and delete-selection-mode (region-active-p))
                                 (delete-region (region-beginning) (region-end)))
                               (if current-prefix-arg
                                   (progn
                                     (dotimes ($i (prefix-numeric-value current-prefix-arg))
                                       (yank)))
                                 (if (eq real-last-command this-command)
                                     (yank-pop 1)
                                   (yank)))))

                        (global-set-key (kbd "<C-y>")  'cypher-paste-or-paste-previous) ; cypher-paste-or-paste-previous

                   ;; cypher-show-kill-ring
                  (defun cypher-show-kill-ring ()
                    "Insert all `kill-ring' content in a new buffer named *copy history*.

                  URL `http://ergoemacs.org/emacs/emacs_show_kill_ring.html'
                  Version 2018-10-05"
                    (interactive)
                    (let (($buf (generate-new-buffer "*copy history*")))
                      (progn
                        (switch-to-buffer $buf)
                        (funcall 'fundamental-mode)
                        (setq buffer-offer-save t)
                        (dolist (x kill-ring )
                          (insert x "\n\u000cttt\n\n"))
                        (goto-char (point-min)))
                      (when (fboundp 'cypher-show-formfeed-as-line)
                        (cypher-show-formfeed-as-line))))

               ;; manipulationg resgisters
               ;; https://ftp.gnu.org/old-gnu/Manuals/emacs-21.2/html_chapter/emacs_12.html

                  ;; cypher-copy-to-register
                  (defun cypher-copy-to-register-1 ()
                 ;;   "Copy current line or text selection to register 1.
                 ;; See also: `xah-paste-from-register-1', `copy-to-register'.
                 ;; URL `http://ergoemacs.org/emacs/elisp_copy-paste_register_1.html'
                 ;; Version 2017-01-23"
                    (interactive)
                    (let ($p1 $p2)
                      (if (region-active-p)
                          (progn (setq $p1 (region-beginning))
                                 (setq $p2 (region-end)))
                        (progn (setq $p1 (line-beginning-position))
                               (setq $p2 (line-end-position))))
                      (copy-to-register ?1 $p1 $p2)
                      (message "Copied to register 1: 「%s」." (buffer-substring-no-properties $p1 $p2))))

                  ;; cypher-paste-from-resgister 
                  (defun cypher-paste-from-register-1 ()
                 ;;   "Paste text from register 1.
                 ;; See also: `xah-copy-to-register-1', `insert-register'.
                 ;; URL `http://ergoemacs.org/emacs/elisp_copy-paste_register_1.html'
                 ;; Version 2015-12-08"
                    (interactive)
                    (when (use-region-p)
                      (delete-region (region-beginning) (region-end)))
                    (insert-register ?1 t))

                  (global-set-key (kbd "s-1") 'cypher-copy-to-register-1) ; win-1
                  (global-set-key (kbd "s-2") 'cypher-paste-from-regester-1) ; win-2

                 ;; ;; you can set  files to registers, like so:
                 ;; ;; (set-register ?2 '(file . "~/.emacs.d/init.org"))
                 ;; ;; sets file "init.org" to register 2
                 ;; ;; see the gnu manual link above

         ;; cypher-append-to-register
         (defun cypher-append-to-register-1 ()
           "Append current line or text selection to register 1.
         When no selection, append current line with newline char.
         See also: `xah-paste-from-register-1', `copy-to-register'.

         URL `http://ergoemacs.org/emacs/elisp_copy-paste_register_1.html'
         Version 2015-12-08"
           (interactive)
           (let ($p1 $p2)
             (if (region-active-p)
                 (progn (setq $p1 (region-beginning))
                        (setq $p2 (region-end)))
               (progn (setq $p1 (line-beginning-position))
                      (setq $p2 (line-end-position))))
             (append-to-register ?1 $p1 $p2)
             (with-temp-buffer (insert "\n")
                               (append-to-register ?1 (point-min) (point-max)))
             (message "Appended to register 1: 「%s」." (buffer-substring-no-properties $p1 $p2))))

      (global-set-key (kbd "M-I") 'cypher-append-to-register-1) ; M-I Uppercase 

   ;; cypher-clear-register
   (defun cypher-clear-register-1 ()
     "Clear register 1.
   See also: `xah-paste-from-register-1', `copy-to-register'.

   URL `http://ergoemacs.org/emacs/elisp_copy-paste_register_1.html'
   Version 2015-12-08"
     (interactive)
     (progn
       (copy-to-register ?1 (point-min) (point-min))
       (message "Cleared register 1.")))

      (global-set-key (kbd "M-*") 'cypher-clear-register-1) ; M-*

;; after copy Ctrl+c in Linux X11, you can paste by `yank' in emacs
(setq x-select-enable-clipboard t)

;; after mouse selection in X11, you can paste by `yank' in emacs
(setq x-select-enable-primary t)
;; small-configs:1 ends here

;; [[file:init.org::*emacs-mode-line-mode][emacs-mode-line-mode:1]]
(use-package hide-mode-line
   :ensure t
;;   :config
;;    (setq ewal-use-built-in-always-p t)
;;    (setq ewal-use-built-in-on-failure-p t)
;;    (setq ewal-evil-cursors-obey-evil-p t)
;;    (setq ewal-built-in-palette "sexy-material")
;;    (setq eval-json-file "~/.cache/wal/colors.json")
)
;; emacs-mode-line-mode:1 ends here

;; [[file:init.org::*ewal][ewal:1]]
;;  (use-package ewal
;;   :ensure t
;;   :config
;;    (setq ewal-use-built-in-always-p t)
;;    (setq ewal-use-built-in-on-failure-p t)
;;    (setq ewal-evil-cursors-obey-evil-p t)
;;    (setq ewal-built-in-palette "sexy-material")
;;    (setq eval-json-file "~/.cache/wal/colors.json"))
;; ewal:1 ends here

;; [[file:init.org::*smart-hungry-delete][smart-hungry-delete:1]]
(use-package smart-hungry-delete
  :ensure t
  :bind (("<backspace>" . smart-hungry-delete-backward-char)
		 ("C-d" . smart-hungry-delete-forward-char))
  :defer nil ;; dont defer so we can add our functions to hooks 
  :config (smart-hungry-delete-add-default-hooks)
  )
;; smart-hungry-delete:1 ends here

;; [[file:init.org::*always murder current buffer][always murder current buffer:1]]
(defun kill-current-buffer ()
  "Kills the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)
;; always murder current buffer:1 ends here

;; [[file:init.org::*kill it now][kill it now:1]]
;; (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
;; kill it now:1 ends here

;; [[file:init.org::*ibuffer][ibuffer:1]]
(global-set-key (kbd "C-x b") 'ibuffer)
;; ibuffer:1 ends here

;; [[file:init.org::*expert-mode][expert-mode:1]]
(setq ibuffer-expert t)
;; expert-mode:1 ends here

;; [[file:init.org::*close-all-buffers][close-all-buffers:1]]
(defun close-all-buffers ()
  "Kill all buffers without regard for their origin."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key (kbd "C-M-s-k") 'close-all-buffers)
;; close-all-buffers:1 ends here

;; [[file:init.org::*switch-window][switch-window:1]]
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
;; switch-window:1 ends here

;; [[file:init.org::*follow window splits][follow window splits:1]]
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
;; follow window splits:1 ends here

;; [[file:init.org::*battery indicator][battery indicator:1]]
(use-package fancy-battery
  :ensure t
  :config
    (setq fancy-battery-show-percentage t)
    (setq battery-update-interval 15)
    (if window-system
      (fancy-battery-mode)
      (display-battery-mode)))
;; battery indicator:1 ends here

;; [[file:init.org::*symon][symon:1]]
(use-package symon
  :ensure t
  :bind
  ("s-h" . symon-mode))
;; symon:1 ends here

;; [[file:init.org::*mark-multiple][mark-multiple:1]]
(use-package mark-multiple
  :ensure t
  :bind ("C-$" . 'mark-next-like-this))
;; mark-multiple:1 ends here

;; [[file:init.org::*kill-word improved][kill-word improved:1]]
(defun cypher/kill-inner-word ()
  "Kills the entire word your cursor is in. Equivalent to 'ciw' in vim."
  (interactive)
  (forward-char 1)
  (backward-word)
  (kill-word 1))
(global-set-key (kbd "C-c i w") 'cypher/kill-inner-word)
;; kill-word improved:1 ends here

;; [[file:init.org::*copy-word improved][copy-word improved:1]]
(defun cypher/copy-whole-word ()
  (interactive)
  (save-excursion
    (forward-char 1)
    (backward-word)
    (kill-word 1)
    (yank)))
(global-set-key (kbd "C-c w c") 'cypher/copy-whole-word)
;; copy-word improved:1 ends here

;; [[file:init.org::*copy-line][copy-line:1]]
(defun cypher/copy-whole-line ()
  "Copies a line without regard for cursor position."
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))))
(global-set-key (kbd "C-c l c") 'cypher/copy-whole-line)
;; copy-line:1 ends here

;; [[file:init.org::*kill-line][kill-line:1]]
(global-set-key (kbd "C-c l k") 'kill-whole-line)
;; kill-line:1 ends here

;; [[file:init.org::*pretty-mode][pretty-mode:1]]
(when window-system
      (use-package pretty-mode
      :ensure t
      :config
      (global-pretty-mode t)))
;; pretty-mode:1 ends here

;; [[file:init.org::*rainbow][rainbow:1]]
(use-package rainbow-mode
 :ensure t
 :init
  (add-hook 'prog-mode-hook 'rainbow-mode))
;; rainbow:1 ends here

;; [[file:init.org::*rainbow delimiters][rainbow delimiters:1]]
(use-package rainbow-delimiters
  :ensure t
  :init
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
;; rainbow delimiters:1 ends here

;; [[file:init.org::*zapping to char][zapping to char:1]]
(use-package zzz-to-char
  :ensure t
  :bind ("M-z" . zzz-up-to-char))
;; zapping to char:1 ends here

;; [[file:init.org::*kill-ring][kill-ring:1]]
(setq kill-ring-max 100)
;; kill-ring:1 ends here

;; [[file:init.org::*popup-kill-ring][popup-kill-ring:1]]
(use-package popup-kill-ring
  :ensure t
  :bind ("M-K" . popup-kill-ring))
;; popup-kill-ring:1 ends here

;; [[file:init.org::*persistent scratch buffer][persistent scratch buffer:1]]
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
 "#+Title: 'achylles' @ 'Cypher"
    "\n# This buffer is for text that is not saved, and for Lisp evaluation."
    "\n# To create a file, visit it with 'C-x C-f' e and enter text in its buffer.\n"))
;; persistent scratch buffer:1 ends here

;; [[file:init.org::*theme and theme-looper][theme and theme-looper:1]]
;;  (dolist (pkgname '(theme-looper
  ;;  alect-themes
  ;;  base16-theme
  ;;  color-theme-modern
  ;;  doom-themes
  ;;  moe-theme
  ;;  ))
  ;;   (straight-use-package pkgname))

(use-package theme-looper
 :ensure t)
(use-package color-theme-modern
 :ensure t)
(use-package alect-themes 
 :ensure t)
(use-package base16-theme 
 :ensure t)
(use-package doom-themes
 :ensure t)

;; Load a nice theme if in GUI
  (when (display-graphic-p)
  ;; (load-theme 'renegade t)
    (load-theme 'subdued t))

  (global-set-key (kbd "<C-f8>") 'theme-looper-enable-random-theme)
;; theme and theme-looper:1 ends here

;; [[file:init.org::*centered-window][centered-window:1]]
(use-package centered-window
 :ensure t)
(require 'centered-window)
(centered-window-mode 1)
;; centered-window:1 ends here

;; [[file:init.org::*wrap lines][wrap lines:1]]
;; Wrap lines without breaking the last word
(add-hook 'org-mode-hook #'toggle-word-wrap)
;; wrap lines:1 ends here

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [[file:init.org::*vterm][vterm:1]]
 (use-package vterm
    :ensure t)

 (use-package vterm-toggle
    :ensure t)

;; C-{
(global-set-key [67108987] 'vterm-send-up)

;; C-}
(global-set-key [67108989] 'vterm-send-down)
;; vterm:1 ends here

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [[file:init.org::*eev][eev:1]]
;; http://angg.twu.net/#eev
;; to start eev, run
;; M-e M-J find-eejumps
;; M-x eev-beginner
;; M-2 M-J eev keybindings

(use-package eev
  :ensure t)

(require 'eev-load)
(eev-mode 1)
(require 'vterm)

;; Original definitions, from:
;; ;; (find-eev "eepitch.el" "eepitch-shell")
;; (defun eepitch-shell  () (interactive) (eepitch '(shell)))
;; (defun eepitch-shell2 () (interactive) (eepitch '(shell "*shell 2*")))
;; (defun eepitch-shell3 () (interactive) (eepitch '(shell "*shell 3*")))

;; See: (find-eev "eepitch.el" "eepitch-vterm")
(defun eepitch-shell  () (interactive) (eepitch-vterm))
(defun eepitch-shell2 () (interactive) (eepitch-vterm "shell 2"))
(defun eepitch-shell3 () (interactive) (eepitch-vterm "shell 3"))
;; eev:1 ends here

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; orgmode font-colors export

;; How to change the color of some words in Beamer using Org-mode
;; https://emacs.stackexchange.com/questions/41470/how-to-change-the-color-of-some-words-in-beamer-using-org-mode

;; As a complement to @Timm answer, you can define a macro instead of having to write:

;; @@latex:{\color{green}@@This@@latex:}@@

;; every time.

;; This is slightly more readable and less verbose. Here is a working example (to export to PDF).

;; #+LATEX_HEADER: \usepackage{color}
;; #+MACRO: color @@latex:{\color{$1}@@$2@@latex:}@@

;; {{{color(red,this text is red)}}} and {{{color(green,this one is green)}}}.

;; Beamer offers the \alert{} command precisely for that purpose, e.g:

;; This is \alert{important}

;; Most often, the text given as argument is typeset in red, less often just in bold, depending on the theme.

;; If the default behavior does not fit your need, you can change it with:

;; \setbeamercolor{alerted text}{fg=red}

;; (add-load-path! "~/.emacs.d/local-repo/org-colored-text")
;; (add-load-path! "~/.emacs.d/local-repo/ov")

;; (add-to-list 'load-path "~/.emacs.d/local-repo/org-colored-text/")
(add-to-list 'load-path "~/.emacs.d/local-repo/ov/")

;; (require 'org-colored-text)
 (require 'ov)

;; Taken and adapted from org-colored-text

;; (org-add-link-type
;;  "color"
;;  (lambda (path)
;;    "No follow action.")
;;  (lambda (color description backend)
;;    (cond
;;     ((eq backend 'latex)                  ; added by TL
;;      (format "{\\color{%s}%s}" color description)) ; added by TL
;;     ((eq backend 'html)
;;      (let ((rgb (assoc color color-name-rgb-alist))
;;            r g b)
;;        (if rgb
;;            (progn
;;              (setq r (* 255 (/ (nth 1 rgb) 65535.0))
;;                    g (* 255 (/ (nth 2 rgb) 65535.0))
;;                    b (* 255 (/ (nth 3 rgb) 65535.0)))
;;              (format "<span style=\"color: rgb(%s,%s,%s)\">%s</span>"
;;                      (truncate r) (truncate g) (truncate b)
;;                      (or description color)))
;;          (format "No Color RGB for %s" color)))))))

;; https://stackoverflow.com/questions/45580169/changing-color-of-text-in-html-export-from-org-mode/45581002

;; You can use macros, like so:
;;
;; If you are annoyed by macros. Then add the following to your Emacs config,

;; (require 'ov)

;; (org-add-link-type
;;  "color"
;;  (lambda (path)
;;    (message (concat "color "
;;                     (progn (add-text-properties
;;                             0 (length path)
;;                             (list 'face `((t (:foreground ,path))))
;;                             path) path))))
;;  (lambda (path desc format)
;;    (cond
;;     ((eq format 'html)
;;      (format "<span style=\"color:%s;\">%s</span>" path desc))
;;     ((eq format 'latex)
;;      (format "{\\color{%s}%s}" path desc)))))

;; example in an org file

;; This is [[color:green][green text]]
;; This is [[color:red][red]]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [[file:init.org::*abbreviations][abbreviations:1]]
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
;; abbreviations:1 ends here

;; [[file:init.org::*all-the-icons][all-the-icons:1]]
(use-package all-the-icons
 :straight t)

(use-package all-the-icons-dired
 :straight t)

(use-package dired-rainbow
 :straight t)

(use-package all-the-icons-ivy
 :straight t)
;; all-the-icons:1 ends here

;; [[file:init.org::*async][async:1]]
(use-package async
  :ensure t
  :init (dired-async-mode 1))
;; async:1 ends here

;; [[file:init.org::*amx - a fork of smex][amx - a fork of smex:1]]
(use-package amx
 :straight t
 :config
  (amx-mode 1))
;; amx - a fork of smex:1 ends here

;; [[file:init.org::*ascii art to unicode][ascii art to unicode:1]]
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
;; ascii art to unicode:1 ends here

;; [[file:init.org::*auctex][auctex:1]]
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; how to setup
;; https://emacs.stackexchange.com/questions/37725/defining-custom-latex-class-for-org-mode-export
;; https://orgmode.org/worg/org-tutorials/org-latex-export.html
;; https://github.com/tsdye/org-article

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
          '("koma-article"
             "\\documentclass{scrartcl}"
             ("\\section{%s}" . "\\section*{%s}")
             ("\\subsection{%s}" . "\\subsection*{%s}")
             ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
             ("\\paragraph{%s}" . "\\paragraph*{%s}")
             ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
;; auctex:1 ends here

;; [[file:init.org::*avy][avy:1]]
(use-package avy
  :ensure t
  :bind
    ("M-s" . avy-goto-char))
;; avy:1 ends here

;; [[file:init.org::*bash][bash:1]]
(add-hook 'shell-mode-hook 'yas-minor-mode)
  (add-hook 'shell-mode-hook 'flycheck-mode)
  (add-hook 'shell-mode-hook 'company-mode)

  (use-package company-shell
    :ensure t
    :config
      (require 'company)
      (add-hook 'shell-mode-hook 'shell-mode-company-init))

;; company-backends is used for setting the completions you 
;; want or need

  (defun shell-mode-company-init ()
    (setq-local company-backends '((company-shell
                                    company-shell-env
                                    company-etags
                          company-dabbrev-code))))
;; bash:1 ends here

;; [[file:init.org::*bbdb-database][bbdb-database:1]]
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
;; bbdb-database:1 ends here

;; [[file:init.org::*beacon][beacon:1]]
(use-package beacon
  :straight t
  :defer 10
  :diminish beacon-mode
  :custom
  (beacon-push-mark 10)
  :config
  (beacon-mode +1))
;; beacon:1 ends here

;; [[file:init.org::*tramp][tramp:1]]
;; TODO
;; (use-package tramp
;;      :init
;;      (setq tramp-default-method "ssh")
;;      (setq password-cache-expiry nil)
;;      :config
;;      ;; (add-to-list 'tramp-remote-path "~/")
;;      (eval-after-load 'tramp '(setenv "SHELL" "/bin/bash")))
;; tramp:1 ends here

;; [[file:init.org::*better-shell][better-shell:1]]
(use-package better-shell
:straight t
:bind (("C-'" . better-shell-shell)
("C-|" . better-shell-remote-open)))
;; better-shell:1 ends here

;; [[file:init.org::*diatheke][diatheke:1]]
(straight-use-package 'diatheke)
(setq max-specpdl-size 5000)
(require 'diatheke)

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
;; diatheke:1 ends here

;; [[file:init.org::*dtk][dtk:1]]
(use-package dtk
  :bind (("C-c B" . dtk-bible))
  :custom
  (dtk-default-module "KJVA")
  (dtk-default-module-category "Biblical Texts")
  (dtk-word-wrap t))
;; dtk:1 ends here

;; [[file:init.org::*sword-to-org][sword-to-org:1]]
(add-to-list 'load-path "~/.emacs.d/local-repo/sword-to-org/")
(require 'sword-to-org)
;; sword-to-org:1 ends here

;; [[file:init.org::*bidi][bidi:1]]
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
;; bidi:1 ends here

;; [[file:init.org::*Ox-hugo][Ox-hugo:1]]
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
;; 	       (file+olp+datetree (concat org-directory "~/org/blog/content/posts/my-post.org")
;; "* TODO %^{Description}  %^g\n%?\nAdded: %U")
;; 	       (function org-hugo-new-subtree-post-capture-template))))
;; Ox-hugo:1 ends here

;; [[file:init.org::*easy-hugo][easy-hugo:1]]
;; (use-package easy-hugo
;;   :custom
;;   (easy-hugo-basedir "~/Personal/devel/zzamboni.org/zzamboni.org/")
;;   (easy-hugo-url "http://zzamboni.org/")
;;   (easy-hugo-previewtime "300")
;;   ;;(define-key global-map (kbd "C-c C-e") 'easy-hugo)
;;   )
;; easy-hugo:1 ends here

;; [[file:init.org::*bug-hunter][bug-hunter:1]]
(straight-use-package 'bug-hunter)
;; bug-hunter:1 ends here

;; [[file:init.org::*circe][circe:1]]
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
;; circe:1 ends here

;; [[file:init.org::*cobol][cobol:1]]
(use-package cobol-mode
 :ensure t
 :config
 (setq auto-mode-alist
    (append
     '(("\\.cob\\'" . cobol-mode)
       ("\\.cbl\\'" . cobol-mode)
       ("\\.cpy\\'" . cobol-mode))
     auto-mode-alist)))
;; cobol:1 ends here

;; [[file:init.org::*command-log][command-log:1]]
(use-package command-log-mode
   :ensure t
   :commands (command-log-mode global-command-log-mode)
   :bind ("C-c o" . clm/toggle-command-log-buffer))
;; command-log:1 ends here

;; [[file:init.org::*company][company:1]]
(straight-use-package 'company)
       (require 'company)
       (add-hook 'after-init-hook 'global-company-mode)
       (setq company-minimum-prefix-length 2)
       (setq company-idle-delay 0.1)

       ;; company upper-case or down-case completion
       ;; (setq company-dabbrev-downcase nil)
       (setq company-dabbrev-downcase t)

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
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white")))))

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

  ;; company-backends is used for setting the completions you 
  ;; want or need

(setq company-backends '(;;company-cpp
                         ;;company-ctag
                         company-dabbrev
                         company-dabbrev-code
                         company-elisp 
                         company-files 
                         company-gtags
                         company-ispell
                         company-keywords
                         ;;company-lisp
                         ;; company-ropemacs
                           ))
;; company:1 ends here

;; [[file:init.org::*company-emoji][company-emoji:1]]
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
;; company-emoji:1 ends here

;; [[file:init.org::*counsel - ivy - swiper][counsel - ivy - swiper:1]]
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
:init
(if (fboundp 'swiper-isearch)
    (bind-key "C-s" #'swiper-isearch)
    (bind-key "C-s" #'swiper))
:bind (
    ;; ("C-s" . swiper)
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
;; counsel - ivy - swiper:1 ends here

;; [[file:init.org::*cypher-filelist][cypher-filelist:1]]
(defvar cypher-filelist nil "alist for files i need to open frequently. Key is a short abbrev string, Value is file path string.")

(setq cypher-filelist
      '(
	("init.el" . "~/.emacs.d/init.el" )
	("init.org" . "~/.emacs.d/init.org")
	("dotfiles" . "~/.dotfiles/")
	("Documents" . "~/Documents/" )
	("org" . "~/org/" )
	("Download" . "~/Downloads/" )
	("Music" . "~/Music/")
	("Pictures" . "~/Pictures/" )
	;; more here
	) )

(defun cypher-open-file-fast ()
  "Prompt to open a file from `cypher-filelist'.
URL 'http://ergoemacs.org/emacs/emacs_hotkey_open_file_fast.html'
Version 2015-04-23"
  (interactive)
  (let ((ξabbrevCode
	 (ido-completing-read "Open:" (mapcar (lambda (ξx) (car ξx)) cypher-filelist))))
    (find-file (cdr (assoc ξabbrevCode cypher-filelist)))))

(global-set-key (kbd "C-´") 'cypher-open-file-fast)
;; cypher-filelist:1 ends here

;; [[file:init.org::*cypher hydra][cypher hydra:1]]
(defhydra cypher-hydra-window (global-map "C-c w")
       "Commands relating to window manipulation"
       ("h" windmove-left "move left")
       ("l" windmove-right "move right")
       ("j" windmove-down "move down")
       ("k" windmove-up "move up")
       ("q" delete-window "delete window")
       ("Q" kill-buffer-and-window "kill buffer, delete window")
       ("H" cypher-move-splitter-left "move splitter left")
       ("L" cypher-move-splitter-right "move splitter right")
       ("J" cypher-move-splitter-down "move splitter down")
       ("K" cypher-move-splitter-up "move splitter up")
       ("b" balance-windows)
       ("|" cypher-window-toggle-split-direction)
       ("s" split-window-below "split window (below)")
       ("v" split-window-right "split window (right)")
       (";" ace-window "select window" :exit t))
;; cypher hydra:1 ends here

;; [[file:init.org::*debian stuff][debian stuff:1]]
(use-package debian-el
  :straight t
  :defer t)
;; debian stuff:1 ends here

;; [[file:init.org::*default browser][default browser:1]]

;; default browser
;;  you can change to chormium
;;  set default browser with
;;  sudo update-alternatives --config x-www-browser
;;  sudo xfce4-settings-manager
;;  Default applications, internet, Debian Sensible Browser
;;  or specify it manually - qutebrowser
;;  this overwrites bellow configuration

(setq browse-url-browser-function 'browse-url-generic
      ;; browse-url-generic-program "chromium"
      ;; browse-url-generic-program "firefox"
      ;; browse-url-generic-program "waterfox"
      browse-url-generic-program "qutebrowser"
      )

 ;; (setq browse-url-browser-function 'w3m-browse-url)
 ;; (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)

 ;; optional keyboard short-cut
    (global-set-key "\C-xm" 'browse-url-at-point)
;; default browser:1 ends here

;; [[file:init.org::*dh tools][dh tools:1]]

;; dh tools:1 ends here

;; [[file:init.org::*diminishing modes][diminishing modes:1]]
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
;; diminishing modes:1 ends here

;; [[file:init.org::*Dired][Dired:1]]
;; (add-to-list 'load-path "~/.emacs.d/local-repo/dired+")
;; (require 'dired+)

(setq dired-dwim-target t)
;; Hide details by default
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
;; Not spawn endless amount of dired buffers
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;; Dired:1 ends here

;; [[file:init.org::*dtrt-indent][dtrt-indent:1]]
(use-package dtrt-indent
  :straight t
  :diminish t
  :config
  (dtrt-indent-mode +1))
;; dtrt-indent:1 ends here

;; [[file:init.org::*elisp][elisp:1]]
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
    ;; (use-package erefactor
    ;;   :straight t
    ;;   :defer t)

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
;;   :custom
;;   (dash-enable-fontlock t)
)

 (use-package dash-functional
   :straight t
 ;;  :custom
 ;;  (dash-enable-fontlock t)
)
;; elisp:1 ends here

;;;;;;;;;;;;;;;

;; scheme
;; apt-get install mit-scheme geiser guile-3.0

(setq geiser-default-implementation 'guile)

;;;;;;;;;;;;;;;

;; [[file:init.org::*emacros][emacros:1]]

;; emacros:1 ends here

;; [[file:init.org::*emacspeak eloud][emacspeak eloud:1]]
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
;; emacspeak eloud:1 ends here

;; [[file:init.org::*emacs-reveal][emacs-reveal:1]]
(add-to-list 'load-path "/home/lea/.emacs.d/elpa/emacs-reveal")

;; (setq oer-reveal-plugins nil)
;; (setq oer-reveal-plugins t)
;; emacs-reveal:1 ends here

;; [[file:init.org::*emacs server][emacs server:1]]
;; (load "server")
;;  (unless (server-running-p)
;;  (server-start))
;; emacs server:1 ends here

;; [[file:init.org::*emacs-w3m][emacs-w3m:1]]
(use-package w3m
  :ensure t)
  (require 'w3m-load)
;;(require 'mime-w3m)
;; if this does not work, modify the file w3m.el itself inside /home/$USER/.emacs.d/elpa/w3m-*
     (setq w3m-display-inline-images t) 
     (setq w3m-fill-column 80) 
     (setq w3m-default-display-inline-images t) 
     (setq w3m-default-save-directory "~/Downloads/w3m_stuff")

  (define-key global-map (kbd "C-c C--") 'w3m-search)
;; emacs-w3m:1 ends here

;; [[file:init.org::*emacs-wget][emacs-wget:1]]
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

;; [[file:init.org::*emamux][emamux:1]]
(use-package emamux
  :straight t
  :defer t)
;; emamux:1 ends here

;; [[file:init.org::*emmet-mode][emmet-mode:1]]
(use-package emmet-mode 
:straight t)
;; emmet-mode:1 ends here

;; [[file:init.org::*emms-get-lyrics][emms-get-lyrics:1]]
(use-package emms
 :straight t)

(add-to-list 'load-path "~/.emacs.d/local-repo/emms-get-lyrics/")
(require 'emms-get-lyrics)
;; emms-get-lyrics:1 ends here

;; [[file:init.org::*emms-player][emms-player:1]]
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
;; emms-player:1 ends here

;; [[file:init.org::*engine-mode][engine-mode:1]]
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
;; engine-mode:1 ends here

;; [[file:init.org::*epg-gpg2][epg-gpg2:1]]
(setq epg-gpg-program "/usr/bin/gpg2")
(setq epa-file t)
(epa-file-enable)
(setq epa-file-select-keys nil)
(setq epa-pinentry-mode 'loopback)
(setq pinentry-start t)
;; epg-gpg2:1 ends here

;; [[file:init.org::*epresent][epresent:1]]
(use-package epresent
   :straight t)

;;  (evil-define-key 'normal epresent-mode-map "j" 'scroll-down)
;;  (evil-define-key 'normal epresent-mode-map "k" 'scroll-up)
;;  (evil-define-key 'normal epresent-mode-map "p" 'epresent-previous-page)
 ;; (evil-define-key 'normal epresent-mode-map "n" 'epresent-next-page)
  ;; continue with other wanted bindings here...
;; epresent:1 ends here

;; [[file:init.org::*erc][erc:1]]
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
;; erc:1 ends here

;; [[file:init.org::*eshell][eshell:1]]
(add-to-list 'load-path "~/.emacs.d/local-repo/init-eshell")

(require 'eshell)
(require 'em-smart)
(add-hook 'eshell-mode-hook 'eshell-smart-initialize)
(require 'esh-module) ; require modules
(add-to-list 'eshell-modules-list 'eshell-tramp)
;; eshell:1 ends here

;; [[file:init.org::*tab on console][tab on console:1]]
;; put this before "require evil" and "evil-mode 1"
(setq evil-want-keybinding nil)
 ;; (setq evil-want-C-i-jump nil)
   (unless (display-graphic-p) (setq evil-want-C-i-jump nil))
    
;; (when evil-want-C-i-jump
  ;; (define-key evil-motion-state-map (kbd "C-i") 'evil-jump-forward))
;; tab on console:1 ends here

;; [[file:init.org::*evil-mode][evil-mode:1]]
(straight-use-package 'evil)
(require 'evil)
(evil-mode 1)
;; evil-mode:1 ends here

;; [[file:init.org::*evil-leader][evil-leader:1]]
(use-package evil-leader
 :ensure t
 :config
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key 
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer))

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
;; evil-leader:1 ends here

;; [[file:init.org::*evil-collection][evil-collection:1]]
(straight-use-package 'evil-collection)
;; (evil-collection-init t)
;; evil-collection:1 ends here

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (setq evil-collection-mode-list '(dired))
  (evil-collection-init))

;; evil-collection:1 ends here

;; [[file:init.org::*evil-macro keys][evil-macro keys:1]]
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
;; evil-macro keys:1 ends here

;; [[file:init.org::*evil-org][evil-org:1]]
(use-package org-evil
 :ensure t)
(require 'org-evil)
;; evil-org:1 ends here

;; [[file:init.org::*eyebrowse][eyebrowse:1]]
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
;; eyebrowse:1 ends here

;; [[file:init.org::*eww][eww:1]]
(when (fboundp 'eww)
       (defun cypher-rename-eww-buffer ()
         "Rename `eww-mode' buffer so sites open in new page.
     URL `http://ergoemacs.org/emacs/emacs_eww_web_browser.html'
     Version 2017-11-10"
         (let (($title (plist-get eww-data :title)))
           (when (eq major-mode 'eww-mode )
             (if $title
                 (rename-buffer (concat "eww " $title ) t)
               (rename-buffer "eww" t)))))

       (add-hook 'eww-after-render-hook 'cypher-rename-eww-buffer))

(define-key global-map (kbd "C-c C-=") 'eww)

(use-package browse-url
  :after eww
  :config
  (setq browse-url-browser-function 'eww-browse-url))
;; eww:1 ends here

;; [[file:init.org::*flyspell][flyspell:1]]

;; ;; https://simpleit.rocks/lisp/emacs/writing-in-emacs-checking-spelling-style-and-grammar/

;; (global-set-key [f6] 'spell-checker)
;; (global-set-key [f7] 'ispell-buffer)

;; (require 'ispell)
;; (require 'flyspell)

;; (defun spell-checker ()
;;   "spell checker (on/off) with selectable dictionary"
;;   (interactive)
;;   (if flyspell-mode
;;       (flyspell-mode-off)
;;     (progn
;;       (flyspell-mode)
;;       (ispell-change-dictionary
;;        (completing-read
;;         "Use new dictionary (RET for *default*): "
;;         (and (fboundp 'ispell-valid-dictionary-list)
;;              (mapcar 'list (ispell-valid-dictionary-list)))
;;         nil t))
;;       )))

;; ;; elisp-index-search
;; ;; Kevin Rodgers 〔kevin.d.rodg…@gmail.com〕, 2008-10-09
;; (defadvice elisp-index-search (before interactive-default activate)
;;   "Provide the symbol at point as the default when reading TOPIC interactively."
;;   (interactive
;;    (let ((symbol-at-point (thing-at-point 'symbol)))
;;      (list (read-string (if symbol-at-point
;;                             (format "Topic (%s): " symbol-at-point)
;;                           (format "Topic: "))
;;                         nil nil symbol-at-point)))))

;; ;; fix for describe-major-mode
;; (defun describe-major-mode ()
;;   "Show doc string for current major-mode."
;;   ;; code by Kevin Rodgers. 2009-02-25
;;   (interactive)
;;   (describe-function major-mode))

;; (global-set-key (kbd "C-h m") 'describe-major-mode)

;; (load!  "~/.emacs.d/local-repo/pp-c-l/pp-c-l.el")
;; (pretty-control-l-mode 1)

;; (after! flyspell (require 'flyspell-lazy) (flyspell-lazy-mode 1))
;; It works!  It works!  After two hours of slogging, it works!

;; hunspell

(if (file-exists-p "/usr/bin/hunspell")
    (progn
      (setq ispell-program-name "hunspell")
      (eval-after-load "ispell"
        '(progn (defun ispell-get-coding-system () 'utf-8)))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; apt-get install wordnet verbiste verbiste-gtk lookup lookup-el
;; in the terminal call it with "wn"
;; wordnet, wordnut, wordnik, verbiste
;; helm-wordnet and helm-wordnut

(use-package wordnut
  :ensure t)
(use-package wordnik
  :ensure t)
(use-package helm-wordnet
  :ensure t)

;; helm-wordnut
;; https://github.com/emacs-helm/helm-wordnut

(straight-use-package
  '(helm-wordnut :host github :repo "emacs-helm/helm-wordnut"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; languagetool or langtool
;; you have to stop the server after checking the buffer/file
;; https://github.com/mhayashi1120/Emacs-langtool
;; Note: you have to "M-x ispell-change-dictionary" and then
;; invoke langtool

(setq langtool-language-tool-jar "/opt/LanguageTool-5.0/languagetool-commandline.jar")

(global-set-key "\C-x4b" 'langtool-check-buffer)
(global-set-key "\C-x4c" 'langtool-check)
(global-set-key "\C-x4d" 'langtool-check-done)
(global-set-key "\C-x4f" 'langtool-correct-buffer)
(global-set-key "\C-x4l" 'langtool-switch-default-language)
(global-set-key "\C-x4m" 'langtool-show-message-at-point)
(global-set-key "\C-x4n" 'langtool-goto-next-error)
(global-set-key "\C-x4p" 'langtool-goto-previous-error)
(global-set-key "\C-x4q" 'langtool-server-stop)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; cypher-toggle-letter-case

(defun cypher-toggle-letter-case ()
 "Toggle the letter case of current word or text selection.
  Always cycle in this order: Init Caps, ALL CAPS, all lower.

  URL `http://ergoemacs.org/emacs/modernization_upcase-word.html'
  Version 2017-04-19"
  (interactive)
  (let (
  (deactivate-mark nil)
   $p1 $p2)
  (if (use-region-p)
  (setq $p1 (region-beginning)
   $p2 (region-end))
  (save-excursion
  (skip-chars-backward "[:alnum:]-_")
  (setq $p1 (point))
  (skip-chars-forward "[:alnum:]-_")
  (setq $p2 (point))))
  (when (not (eq last-command this-command))
  (put this-command 'state 0))
  (cond
  ((equal 0 (get this-command 'state))
   (upcase-initials-region $p1 $p2)
   (put this-command 'state 1))
  ((equal 1  (get this-command 'state))
  (upcase-region $p1 $p2)
  (put this-command 'state 2))
  ((equal 2 (get this-command 'state))
  (downcase-region $p1 $p2)
  (put this-command 'state 0)))))

   (global-set-key (kbd "C-0") 'cypher-toggle-letter-case)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun cypher-toggle-previous-letter-case ()
 "Toggle the letter case of the letter to the left of cursor.
  URL `http://ergoemacs.org/emacs/modernization_upcase-word.html'
  Version 2015-12-22"
  (interactive)
  (let ((case-fold-search nil))
  (left-char 1)
  (cond
  ((looking-at "[[:lower:]]") (upcase-region (point) (1+ (point))))
  ((looking-at "[[:upper:]]") (downcase-region (point) (1+ (point)))))
  (right-char)))

  (global-set-key (kbd "C-s-0") 'cypher-toggle-previous-letter-case)

  ;; cypher-select-line
     (defun cypher-select-line ()
   "Select current line. If region is active, extend selection downward by line.
    URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
    Version 2017-11-01"
    (interactive)
    (if (region-active-p)
    (progn
    (forward-line 1)
    (end-of-line))
    (progn
    (end-of-line)
    (set-mark (line-beginning-position)))))

    (global-set-key (kbd "M-L") 'cypher-select-line)

    ;; cypher-select-text-in-quote
      (defun cypher-select-text-in-quote ()
      "Select text between the nearest left and right delimiters.
       Delimiters here includes the following chars: \"<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕（）
       This command select between any bracket chars, not the inner text of a bracket. For example, if text is

 (a(b)c▮)

 the selected char is “c”, not “a(b)c”.

 URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
 Version 2016-12-18"
 (interactive)
 (let (
 ($skipChars
 (if (boundp 'cypher-brackets)
 (concat "^\"" cypher-brackets)
                          "^\"<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕（）"))
         $pos
             )
         (skip-chars-backward $skipChars)
         (setq $pos (point))
 (skip-chars-forward $skipChars)
 (set-mark $pos)))

 (global-set-key (kbd "M-Q") 'cypher-select-text-in-quote)

;; cypher-select-block
(defun cypher-select-block ()
"Select the current/next block of text between blank lines.
 If region is active, extend selection downward by block.

 URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
 Version 2017-11-01"
(interactive)
(if (region-active-p)
(re-search-forward "\n[ \t]*\n" nil "move")
(progn
(skip-chars-forward " \n\t")
(when (re-search-backward "\n[ \t]*\n" nil "move")
  (re-search-forward "\n[ \t]*\n"))
(push-mark (point) t t)
(re-search-forward "\n[ \t]*\n" nil "move"))))

(global-set-key (kbd "M-B") 'cypher-select-block)

 ;; cypher-extend-selection
 (defun xah-extend-selection ()
 (interactive)
 (if (region-active-p)
 (progn
 (let (($rb (region-beginning)) ($re (region-end)))
 (goto-char $rb)
 (cond
 ((looking-at "\\s(")
 (if (eq (nth 0 (syntax-ppss)) 0)
 (progn
 (message "left bracket, depth 0.")
 (end-of-line) ; select current line
 (set-mark (line-beginning-position)))
 (progn
 (message "left bracket, depth not 0")
 (up-list -1 t t)
 (mark-sexp))))
 ((eq $rb (line-beginning-position))
 (progn
 (goto-char $rb)
 (let (($firstLineEndPos (line-end-position)))
(cond
 ((eq $re $firstLineEndPos)
 (progn
 (message "exactly 1 line. extend to next whole line." )
 (forward-line 1)
 (end-of-line)))
 ((< $re $firstLineEndPos)
 (progn
 (message "less than 1 line. complete the line." )
 (end-of-line)))
 ((> $re $firstLineEndPos)
 (progn
 (message "beginning of line, but end is greater than 1st end of line" )
 (goto-char $re)
 (if (eq (point) (line-end-position))
 (progn
 (message "exactly multiple lines" )
 (forward-line 1)
 (end-of-line))
 (progn
 (message "multiple lines but end is not eol. make it so" )
 (goto-char $re)
 (end-of-line)))))
 (t (error "logic error 42946" ))))))
 ((and (> (point) (line-beginning-position)) (<= (point) (line-end-position)))
 (progn
 (message "less than 1 line" )
 (end-of-line) ; select current line
 (set-mark (line-beginning-position))))
 (t (message "last resort" ) nil))))
 (progn
 (cond
 ((looking-at "\\s(")
 (message "left bracket")
 (mark-sexp)) ; left bracket
 ((looking-at "\\s)")
 (message "right bracket")
 (backward-up-list) (mark-sexp))
 ((looking-at "\\s\"")
 (message "string quote")
 (mark-sexp)) ; string quote
 ((and (eq (point) (line-beginning-position)) (not (looking-at "\n")))
 (message "beginning of line and not empty")
 (end-of-line)
 (set-mark (line-beginning-position)))
((or (looking-back "\\s_" 1) (looking-back "\\sw" 1))
 (message "left is word or symbol")
 (skip-syntax-backward "_w" )
 ;; (re-search-backward "^\\(\\sw\\|\\s_\\)" nil t)
 (mark-sexp))
((and (looking-at "\\s ") (looking-back "\\s " 1))
 (message "left and right both space" )
 (skip-chars-backward "\\s " ) (set-mark (point))
 (skip-chars-forward "\\s "))
((and (looking-at "\n") (looking-back "\n" 1))
 (message "left and right both newline")
 (skip-chars-forward "\n")
 (set-mark (point))
 (re-search-forward "\n[ \t]*\n")) ; between blank lines, select next text block
(t (message "just mark sexp" )
     (mark-sexp))
;;
))))

(global-set-key (kbd "M-E") 'cypher-extend-selection)

 ;; cypher-brackets 
 (defvar cypher-brackets nil "string of left/right brackets pairs.")
 (setq cypher-brackets "()[]{}<>（）［］｛｝⦅⦆〚〛⦃⦄“”‘’‹›«»「」〈〉《》【】〔〕⦗⦘『』〖〗〘〙｢｣⟦⟧⟨⟩⟪⟫⟮⟯⟬⟭⌈⌉⌊⌋⦇⦈⦉⦊❛❜❝❞❨❩❪❫❴❵❬❭❮❯❰❱❲❳〈〉⦑⦒⧼⧽﹙﹚﹛﹜﹝﹞⁽⁾₍₎⦋⦌⦍⦎⦏⦐⁅⁆⸢⸣⸤⸥⟅⟆⦓⦔⦕⦖⸦⸧⸨⸩｟｠⧘⧙⧚⧛⸜⸝⸌⸍⸂⸃⸄⸅⸉⸊᚛᚜༺༻༼༽⏜⏝⎴⎵⏞⏟⏠⏡﹁﹂﹃﹄︹︺︻︼︗︘︿﹀︽︾﹇﹈︷︸")

 ;; cypher-left-brackets
(defvar cypher-left-brackets '("(" "{" "[" "<" "〔" "【" "〖" "〈" "《" "「" "『" "“" "‘" "‹" "«" )
   "List of left bracket chars.")
 (progn
 ;; make cypher-left-brackets based on cypher-brackets
 (setq cypher-left-brackets '())
 (dotimes ($x (- (length cypher-brackets) 1))
 (when (= (% $x 2) 0)
 (push (char-to-string (elt cypher-brackets $x))
  cypher-left-brackets)))
 (setq cypher-left-brackets (reverse cypher-left-brackets)))

 (defvar cypher-right-brackets '(")" "]" "}" ">" "〕" "】" "〗" "〉" "》" "」" "』" "”" "’" "›" "»")
        "list of right bracket chars.")
 (progn
 (setq cypher-right-brackets '())
 (dotimes ($x (- (length cypher-brackets) 1))
 (when (= (% $x 2) 1)
 (push (char-to-string (elt cypher-brackets $x))
  cypher-right-brackets)))
 (setq cypher-right-brackets (reverse cypher-right-brackets)))

 ;; cypher-backward-left-bracket
 (defun cypher-backward-left-bracket ()
 "Move cursor to the previous occurrence of left bracket.
  The list of brackets to jump to is defined by `cypher-left-brackets'.
  URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
 Version 2015-10-01"
   (interactive)
   (re-search-backward (regexp-opt cypher-left-brackets) nil t))

 ;; cypher-forward-right-bracket
 (defun cypher-forward-right-bracket ()
   "Move cursor to the next occurrence of right bracket.
 The list of brackets to jump to is defined by `cypher-right-brackets'.
 URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
    Version 2015-10-01"
 (interactive)
 (re-search-forward (regexp-opt cypher-right-brackets) nil t))

  ;; cypher-goto-matching-bracket
  (defun cypher-goto-matching-bracket ()
    "Move cursor to the matching bracket.
  If cursor is not on a bracket, call `backward-up-list'.
  The list of brackets to jump to is defined by `cypher-left-brackets' and `cypher-right-brackets'.
  URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
  Version 2016-11-22"
  (interactive)
  (if (nth 3 (syntax-ppss))
  (backward-up-list 1 'ESCAPE-STRINGS 'NO-SYNTAX-CROSSING)
(cond
 ((eq (char-after) ?\") (forward-sexp))
 ((eq (char-before) ?\") (backward-sexp ))
 ((looking-at (regexp-opt cypher-left-brackets))
  (forward-sexp))
 ((looking-back (regexp-opt cypher-right-brackets) (max (- (point) 1) 1))
 (backward-sexp))
 (t (backward-up-list 1 'ESCAPE-STRINGS 'NO-SYNTAX-CROSSING)))))

 ;; cypher-forward-quote-smart
  (defun cypher-forward-quote-smart ()
  "Move cursor to the current or next string quote.
  Place cursor at the position after the left quote.
  Repeated call will find the next string.
  URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
  Version 2016-11-22"
    (interactive)
    (let (($pos (point)))
      (if (nth 3 (syntax-ppss))
 (progn
   (backward-up-list 1 'ESCAPE-STRINGS 'NO-SYNTAX-CROSSING)
   (forward-sexp)
   (re-search-forward "\\\"" nil t))
   (progn (re-search-forward "\\\"" nil t)))
   (when (<= (point) $pos)
   (progn (re-search-forward "\\\"" nil t)))))

  ;; cypher-backward-quote 
  (defun cypher-backward-quote ()
    "Move cursor to the previous occurrence of \".
  If there are consecutive quotes of the same char, keep moving until none.
  Returns `t' if found, else `nil'.
  URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
  Version 2016-07-23"
    (interactive)
    (if (re-search-backward "\\\"+" nil t)
   (when (char-before) ; isn't nil, at beginning of buffer
     (while (char-equal (char-before) (char-after))
       (left-char)
       t))
 (progn
   (message "No more quotes before cursor.")
   nil))) 

 ;; cypher-change-bracket-pairs
(defun cypher-change-bracket-pairs ( @from-chars @to-chars)
  "Change bracket pairs from one type to another.

For example, change all parenthesis () to square brackets [].

Works on selected text, or current text block.

When called in lisp program, @from-chars or @to-chars is a string of bracket pair. eg \"(paren)\",  \"[bracket]\", etc.
The first and last characters are used.
If the string contains “,2”, then the first 2 chars and last 2 chars are used, for example  \"[[bracket,2]]\".
If @to-chars is equal to string “none”, the brackets are deleted.

 If the string has length greater than 2, the rest are ignored.

URL `http://ergoemacs.org/emacs/elisp_change_brackets.html'
Version 2018-03-31"
  (interactive
   (let (($bracketsList
          '("(paren)"
            "{brace}"
            "[square]"
            "<greater>"
            "`emacs'"
            "`markdown`"
            "~tilde~"
            "=equal="
            "\"ascii quote\""
            "[[double square,2]]"
            "“curly quote”"
            "‘single quote’"
            "‹angle quote›"
            "«double angle quote»"
            "「corner」"
            "『white corner』"
            "【LENTICULAR】"
            "〖white LENTICULAR〗"
            "〈angle bracket〉"
            "《double angle bracket》"
            "〔TORTOISE〕"
            "⦅white paren⦆"
            "〚white square〛"
            "⦃white curly bracket⦄"
            "〈angle bracket〉"
            "⦑ANGLE BRACKET WITH DOT⦒"
            "⧼CURVED ANGLE BRACKET⧽"
            "⟦math square⟧"
            "⟨math angle⟩"
            "⟪math DOUBLE ANGLE BRACKET⟫"
            "⟮math FLATTENED PARENTHESIS⟯"
            "⟬math WHITE TORTOISE SHELL BRACKET⟭"
            "❛HEAVY SINGLE QUOTATION MARK ORNAMENT❜"
            "❝HEAVY DOUBLE TURNED COMMA QUOTATION MARK ORNAMENT❞"
            "❨MEDIUM LEFT PARENTHESIS ORNAMENT❩"
            "❪MEDIUM FLATTENED LEFT PARENTHESIS ORNAMENT❫"
            "❴MEDIUM LEFT CURLY BRACKET ORNAMENT❵"
            "❬MEDIUM LEFT-POINTING ANGLE BRACKET ORNAMENT❭"
            "❮HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT❯"
            "❰HEAVY LEFT-POINTING ANGLE BRACKET ORNAMENT❱"
            "none"
            )))
     (list
      (ido-completing-read "Replace this:" $bracketsList )
      (ido-completing-read "To:" $bracketsList ))))
  (let ( $p1 $p2 )
    (if (use-region-p)
        (progn
          (setq $p1 (region-beginning))
          (setq $p2 (region-end)))
      (save-excursion
        (if (re-search-backward "\n[ \t]*\n" nil "move")
            (progn (re-search-forward "\n[ \t]*\n")
                   (setq $p1 (point)))
          (setq $p1 (point)))
        (if (re-search-forward "\n[ \t]*\n" nil "move")
            (progn (re-search-backward "\n[ \t]*\n")
                   (setq $p2 (point)))
          (setq $p2 (point)))))
    (save-excursion
      (save-restriction
        (narrow-to-region $p1 $p2)
        (let ( (case-fold-search nil)
               $fromLeft
               $fromRight
               $toLeft
               $toRight)
          (cond
           ((string-match ",2" @from-chars  )
            (progn
              (setq $fromLeft (substring @from-chars 0 2))
              (setq $fromRight (substring @from-chars -2))))
           (t
            (progn
              (setq $fromLeft (substring @from-chars 0 1))
              (setq $fromRight (substring @from-chars -1)))))
          (cond
           ((string-match ",2" @to-chars)
            (progn
              (setq $toLeft (substring @to-chars 0 2))
              (setq $toRight (substring @to-chars -2))))
           ((string-match "none" @to-chars)
            (progn
              (setq $toLeft "")
              (setq $toRight "")))
           (t
            (progn
              (setq $toLeft (substring @to-chars 0 1))
              (setq $toRight (substring @to-chars -1)))))
          (cond
           ((string-match "markdown" @from-chars)
            (progn
              (goto-char (point-min))
              (while
                  (re-search-forward "`\\([^`]+?\\)`" nil t)
                (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
                (replace-match (concat $toLeft "\\1" $toRight ) "FIXEDCASE" ))))
           ((string-match "tilde" @from-chars)
            (progn
              (goto-char (point-min))
              (while
                  (re-search-forward "~\\([^~]+?\\)~" nil t)
                (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
                (replace-match (concat $toLeft "\\1" $toRight ) "FIXEDCASE" ))))
           ((string-match "ascii quote" @from-chars)
            (progn
              (goto-char (point-min))
              (while
                  (re-search-forward "\"\\([^\"]+?\\)\"" nil t)
                (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
                (replace-match (concat $toLeft "\\1" $toRight ) "FIXEDCASE" ))))
           ((string-match "equal" @from-chars)
            (progn
              (goto-char (point-min))
              (while
                  (re-search-forward "=\\([^=]+?\\)=" nil t)
                (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
                (replace-match (concat $toLeft "\\1" $toRight ) "FIXEDCASE" ))))
           (t (progn
                (progn
                  (goto-char (point-min))
                  (while (search-forward $fromLeft nil t)
                    (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
                    (replace-match $toLeft "FIXEDCASE" "LITERAL")))
                (progn
                  (goto-char (point-min))
                  (while (search-forward $fromRight nil t)
                    (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
                    (replace-match $toRight "FIXEDCASE" "LITERAL")))))))))))
;; flyspell:1 ends here

;; [[file:init.org::*flyspell][flyspell:1]]
(defun my-turn-spell-checking-on ()
  "Turn flyspell-mode on."
  (flyspell-mode 1))

(add-hook 'text-mode-hook 'my-turn-spell-checking-on)

 ;; enable flyspell in text mode (and derived modes)
 ;; (add-hook 'text-mode-hook 'flyspell-mode)
;; flyspell:1 ends here

;; [[file:init.org::*free-keys][free-keys:1]]
(straight-use-package 'free-keys)
;; free-keys:1 ends here

;; [[file:init.org::*genealogy][genealogy:1]]
(add-to-list 'load-path "~/.emacs.d/local-repo/gedcom")

(autoload 'gedcom-mode "gedcom")
(setq auto-mode-alist (cons '("\\.ged$" . gedcom-mode) auto-mode-alist))
;; genealogy:1 ends here

;; [[file:init.org::*ggtags][ggtags:1]]
(use-package ggtags
:straight t
:config 
 (add-hook 'c-mode-common-hook
      (lambda ()
	(when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'php-mode 'web-mode)
	  (ggtags-mode 1)))))
;; ggtags:1 ends here

;; [[file:init.org::*gitlab][gitlab:1]]
(use-package gitlab
 :straight t)
   (setq gitlab-host "https://gitlab.com"
	 gitlab-token-id "")
;; gitlab:1 ends here

;; [[file:init.org::*gnutls-fix-bug][gnutls-fix-bug:1]]
;;   (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3/")
;;     (setq gnutls-verify-error t)
;;     (setq tls-checktrust t)

;;     (toggle-debug-on-error)
;; gnutls-fix-bug:1 ends here

;; [[file:init.org::*grasp][grasp:1]]

;; grasp:1 ends here

;; [[file:init.org::*gtklp printer app][gtklp printer app:1]]
(setq lpr-command "gtklp")
(setq ps-lpr-command "gtklp")
;; gtklp printer app:1 ends here

;; [[file:init.org::*helm][helm:1]]
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
;; helm:1 ends here

;; [[file:init.org::*helm-deft][helm-deft:1]]
(straight-use-package '(helm-deft :type git
                                  :host github
                                  :repo "dfeich/helm-deft"))

(require 'helm-deft)
(setq helm-deft-extension "org")
(setq helm-deft-dir-list '(
                           "~/org/"
                           "~/Documents/"
                           ))
;; helm-deft:1 ends here

;; [[file:init.org::*helm-mu][helm-mu:1]]
(use-package helm-mu
  :straight t)
;; helm-mu:1 ends here

;; [[file:init.org::*hippie-expand][hippie-expand:1]]
(fset 'my-complete-file-name
   (make-hippie-expand-function '(try-complete-file-name-partially
					try-complete-file-name)))
   (global-set-key "\M-/" 'my-complete-file-name)
   (global-set-key "\M-\\" 'comint-dynamic-complete-filename)
;; hippie-expand:1 ends here

;; [[file:init.org::*hydra][hydra:1]]
(straight-use-package 'hydra)
;; hydra:1 ends here

;; [[file:init.org::*hyperbole][hyperbole:1]]
;; (unless (package-installed-p 'hyperbole)
;;   (package-refresh-contents)	
;;   (package-install 'hyperbole))
;; (require 'hyperbole)
;; hyperbole:1 ends here

;; [[file:init.org::*icicles][icicles:1]]
;; (require 'icicles)
;; (icy-mode 1)
;; icicles:1 ends here

;; [[file:init.org::*image-magick][image-magick:1]]
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
;; image-magick:1 ends here

;; [[file:init.org::*imaxima][imaxima:1]]
(defvar imaxima-fnt-size "Large")
(defvar imaxima-use-maxima-mode-flag t)
;; imaxima:1 ends here

;; [[file:init.org::*impatient-mode][impatient-mode:1]]
(use-package impatient-mode 
:straight t)
;; impatient-mode:1 ends here

;; [[file:init.org::*indent lisp][indent lisp:1]]
(setq org-src-tab-acts-natively t)

  (defun my/org-cleanup ()
  (interactive)
  (org-edit-special)
  (indent-buffer)
  (org-edit-src-exit))

  (defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))
;; indent lisp:1 ends here

;; [[file:init.org::*init.el][init.el:1]]
(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file)
  (rotate-frame-clockwise))

(global-set-key (kbd "C-c I") 'find-user-init-file)
;; init.el:1 ends here

;; [[file:init.org::*ipp printer][ipp printer:1]]
(add-to-list 'load-path "~/.emacs.d/local-repo/ipp")
(require 'ipp)
;; ipp printer:1 ends here

;; [[file:init.org::*jabber][jabber:1]]
;;  (use-package jabber 
;;  :straight t)

;; http://www.totherme.org/configs/gds.html#orgheadline87
;; https://mrblog.nl/emacs/config.html

  (use-package jabber
   :init
   ;; My accounts
   ;; Make sure the user-xmpp-account gets evaluated
   (setq jabber-account-list
         `(("vagnerrener@gmail.com" (:connection-type . starttls))))

   :config
   (progn
     ;; Show some info in the modeline
     (jabber-mode-line-mode 1)

     ;; Configuration variables
     (setq
      jabber-show-offline-contacts nil
      jabber-default-priority 30
      jabber-alert-message-hooks (quote
                                  (jabber-message-libnotify
                                   jabber-message-echo
                                   jabber-message-awesome
                                   jabber-message-wave
                                   jabber-message-scroll))
      jabber-message-alert-same-buffer nil
      jabber-roster-show-bindings nil
      jabber-auto-reconnect t
      jabber-chat-buffer-format "*-chat-%n-*"
      jabber-groupchat-buffer-format "*-groupchat-%n-*"
      jabber-muc-colorize-foreign t
      jabber-muc-colorize-local t
      jabber-muc-disable-disco-check t
      jabber-muc-private-buffer-format "*-muc-priv-%g-%n-*"
      jit-lock-stealth-time 16
      jabber-show-resources 'sometimes
      jabber-resource-line-format "         %j/%r%S [%p]"
      jabber-roster-buffer "*-roster-*"
      jabber-roster-line-format "  %u %a %-25n - %S"
      jabber-roster-show-title nil
      jabber-roster-subscription-display (quote
                                          (("none" . "   ")
                                           ("from" . "← ")
                                           ("to" . " →")
                                           ("both" . "←→")))
      ;; jabber-socks5-proxies (quote ("proxy.hsdev.com"))
      jabber-vcard-avatars-retrieve nil
      jabber-muc-disable-disco-check t
      jabber-muc-colorize-foreign t
      jabber-muc-colorize-local t
      jabber-muc-nick-saturation 0.35 ;; empirical value, suitable for my theme
      jabber-muc-nick-value 0.75

      ;; Make the MUCs
      jabber-muc-show-affiliation-changes nil
      jabber-muc-show-enter-presence nil
      jabber-muc-show-leave-messages nil
      jabber-muc-show-role-changes nil
      )


     ;; C-j is the prefix for all jabber command in the C-x map (so, C-x C-j precede all commands for jabber)
     ;; The default C-x map for emacs has a C-j entry which binds it to
     ;; dired-jump. This gets in the way of all the keyboard shortcuts for
     ;; jabber, so lets re-call the definition here, so we are sure we get
     ;; them.

     (bind-key "C-j" jabber-global-keymap ctl-x-map)

     ;; Do not steal my focus in the mini buffer
     ;; Message alert hooks
     (define-jabber-alert echo "Show a message in the echo area"
       (lambda (msg)
         (unless (minibuffer-prompt)
           (message "%s" msg))))

     ;; Some face adjustments
     (add-hook 'jabber-chat-mode-hook
               (lambda ()
                 (set-face-attribute 'jabber-chat-prompt-system nil :foreground "dark gray" :weight 'bold))))

   :bind
   ("C-c C-SPC" . jabber-activity-switch-to))
;; jabber:1 ends here

;; [[file:init.org::*key-chords][key-chords:1]]
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
;; key-chords:1 ends here

;; [[file:init.org::*linguistic][linguistic:1]]
(use-package linguistic 
 :straight t)
;; linguistic:1 ends here

;; [[file:init.org::*linum][linum:1]]
;;   (line-number-mode -1)
;;   (linum-mode -1)

;; (use-package linum-relative
;;   :ensure t
;;   :disabled
;;   :init
;;   (setq linum-format 'linum-relative)
;;   :config
;;   (setq linum-relative-current-symbol ""))

;;    (use-package linum
;;     :ensure t
;;     :disabled)

;;    (setq linum-relative-current-symbol "")

;;    (linum-relative-global-mode)
;;    (eval-after-load "linum"
;;      '(set-face-attribute 'linum nil :height 100))

;;    (global-undo-tree-mode)

;;    (defun linum-update-window-scale-fix (win)
;;      "fix linum for scaled text"
;;      (set-window-margins win
;;                       (ceiling (* (if (boundp 'text-scale-mode-step)
;;                                       (expt text-scale-mode-step
;;                                             text-scale-mode-amount) 1)
;;                                   (if (car (window-margins))
;;                                       (car (window-margins)) 1)
;;                                   ))))
;;   (advice-add #'linum-update-window :after #'linum-update-window-scale-fix)
;; linum:1 ends here

;; [[file:init.org::*lispy][lispy:1]]
(use-package lispy
   :straight t)

  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

  (defun conditionally-enable-lispy ()
    (when (eq this-command 'eval-expression)
      (lispy-mode 1)))

  (add-hook 'minibuffer-setup-hook 'conditionally-enable-lispy)
;; lispy:1 ends here

;; [[file:init.org::*lorem-ipsum][lorem-ipsum:1]]
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
;; lorem-ipsum:1 ends here

;; [[file:init.org::*lyrics][lyrics:1]]
(use-package lyrics
 :straight t)
;; lyrics:1 ends here

;; [[file:init.org::*magit][magit:1]]
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
;; magit:1 ends here

;; [[file:init.org::*memacs][memacs:1]]

;; memacs:1 ends here

;; [[file:init.org::*memrise][memrise:1]]
;; (use-package memrise
;;   :quelpa (memrise
;; 	   :fetcher github
;; 	   :repo "SavchenkoValeriy/memrise.el"))

;; (setq memrise-sync-requests t)
;; memrise:1 ends here

;; [[file:init.org::*message-mode][message-mode:1]]
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
        user-full-name "Léa GdS")

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
;; message-mode:1 ends here

;; [[file:init.org::*mingus][mingus:1]]
(use-package mingus
 :straight t)
;; mingus:1 ends here

;; [[file:init.org::*more niceties][more niceties:1]]
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
;; more niceties:1 ends here

;; [[file:init.org::*more stuff][more stuff:1]]
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
;; more stuff:1 ends here

;; [[file:init.org::*mplayer-mode][mplayer-mode:1]]
(add-to-list 'load-path "~/.emacs.d/local-repo/mplayer-mode/")
(require 'mplayer-mode)
;; mplayer-mode:1 ends here

;; [[file:init.org::*mu4e][mu4e:1]]
(straight-use-package 'mu4e)
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e/")

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

         (setq mu4e~get-mail-password-regexp
               "^Password (gmail): $")

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
         ;; smtpmail-auth-credentials
         ;; (expand-file-name "~/.authinfo.gpg")
         smtpmail-default-smtp-server "smtp.gmail.com"
         smtpmail-smtp-server "smtp.gmail.com"
         smtpmail-smtp-service 587
         smtpmail-debug-info t)

       (setq mu4e-view-fields '(:from :to :cc :bc :subject :tags :attachments :send-delay))

       (setq mu4e~get-mail-password-regexp
            "^Enter passphrase: $")

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

       (setq mu4e-org-contacts-file  "~/org/contacts.org")

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

;; [[file:init.org::*multilple-cursors][multilple-cursors:1]]
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
;; multilple-cursors:1 ends here

;; [[file:init.org::*my-save-word][my-save-word:1]]
(global-set-key (kbd "<f5>") 'my-save-word)
     (defun my-save-word ()
    (interactive)
    (let ((current-location (point))
	   (word (flyspell-get-word)))
      (when (consp word)    
	(flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))
;; my-save-word:1 ends here

;; [[file:init.org::*networking][networking:1]]
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
;; networking:1 ends here

;; [[file:init.org::*oauth2][oauth2:1]]
;;  (straight-use-package 'oauth2)

;;    (use-package oauth2 
;;	   :config
;;	(eval-when-compile
;;	     (defvar oauth--token-data ())))
;; oauth2:1 ends here

;; [[file:init.org::*oer-reveal][oer-reveal:1]]
(use-package oer-reveal
 :straight t
 :config
   (require 'oer-reveal) 
   (setq oer-reveal-plugins t))


;; openwith

;; (use-package openwith
;;   :straight t
;;   :config
;; (setq openwith-associations '(("\\.mp4\\'" "smplayer" (file)))))

(use-package openwith
  ;; do NOT enable this mode in telega!
  ;; you will blow your laptop up!
  :straight t
  :config
  (setq openwith-associations
        '(("\\.mkv\\'"  "mpv" (file))
          ("\\.mp4\\'"  "mpv" (file))
          ("\\.ogv\\'"  "mpv" (file))
          ("\\.jpg\\'" "feh" (file))
          ("\\.jpeg\\'" "feh" (file))
          ("\\.png\\'" "feh" (file))
          ;; ("\\.org\\'" "gvim" (file))
          ;; great heresy
          ))
 )


;; orca

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


;; org-mode

(setq org-ellipsis " ")
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-export-with-smart-quotes t)
(setq org-src-window-setup 'current-window)
(add-hook 'org-mode-hook 'org-indent-mode)

;; PDFs visited in Org-mode are opened in Evince (and not in the default choice) https://stackoverflow.com/a/8836108/789593
;; you can choose "evince", instead of "okular"
(add-hook 'org-mode-hook
      '(lambda ()
         (delete '("\\.pdf\\'" . default) org-file-apps)
         (add-to-list 'org-file-apps '("\\.pdf\\'" . "okular %s"))))

(global-set-key (kbd "C-c '") 'org-edit-src-code)
;; org-mode:1 ends here

;; [[file:init.org::*org-agenda][org-agenda:1]]
;; (require 'org)
;;       (setq org-directory "~/~org/")
;;       (define-key global-map "\C-cl" 'org-store-link)
;;       (define-key global-map "\C-ca" 'org-agenda)
;;       (setq org-log-done t)
         (setq org-log-done 'time)

(setq org-agenda-files (list "~/org/appointments.org"
			     "~/org/home.org"
			     "~/org/studies.org"
			     "~/org/work.org"))
;; org-agenda:1 ends here

;; [[file:init.org::*org-babel][org-babel:1]]
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
   (lua . t)
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
;; org-babel:1 ends here

;; [[file:init.org::*org-brain][org-brain:1]]
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
  (setq org-brain-path "~/org/brain")

  ;; For Evil users
  (with-eval-after-load 'evil
    (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
  (setq org-id-track-globally t)
  (setq org-brain-file-entries-use-title nil)
  (setq org-id-locations-file "~/org/brain/.org-id-locations")
  ;; (push '("b" "Brain" plain (function org-brain-goto-end)
  ;;     "* %i%?")
  ;; 	   org-capture-templates)
  (setq org-brain-visualize-default-choices 'all)
  (setq org-brain-title-max-length 12)
;; org-brain:1 ends here

;; [[file:init.org::*org-superstar][org-superstar:1]]
;;    (use-package org-superstar         ;; supersedes `org-bullets' - line 2232
;;    :ensure t
;;    ;;:after org
;;    :config
;;    (setq org-superstar-remove-leading-stars t)
;;    (setq org-superstar-headline-bullets-list
;;          '("🞛" "⁖" "◉" "○" "▷"))
;;    (setq org-superstar-item-bullet-alist
;;          '((?+ . ?•)
;;            (?* . ?➤)
;;            (?- . ?–))))

;;    (org-superstar-mo de 1)

;; (org-bullets-mode t)

;; ;; org-bullets - disabled
;;     (straight-use-package 'org-bullets)
;;     (org-bullets-mode 0)
;;     (add-hook 'org-mode-hook (lambda () (org-bullets-mode 0)))

 ;; org-superstar

    (straight-use-package 'org-superstar)
    (org-superstar-mode 1)
    (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
    (setq org-superstar-remove-leading-stars t)
    (setq org-superstar-headline-bullets-list
         '("🞛" "⁖" "◉" "○" "▷"))
    (setq org-superstar-item-bullet-alist
         '((?+ . ?•)
           (?* . ?➤)
           (?- . ?–)))
;; org-superstar:1 ends here

;; [[file:init.org::*org-capture][org-capture:1]]
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

(defcustom org-contacts-email-property "EMAIL"
  "Name of the property for contact email address."
  :type 'string
  :group 'org-contacts)

(defun org-contacts-gnus-get-name-email ()
  "Get name and email address from Gnus message."
  (if (gnus-alive-p)
      (gnus-with-article-headers
        (mail-extract-address-components
         (or (mail-fetch-field "From") "")))))

(defun org-contacts-template-name (&optional return-value)
  "Try to return the contact name for a template.
If not found return RETURN-VALUE or something that would ask the user."
  (or (car (org-contacts-gnus-get-name-email))
      return-value
      "%^{Name}"))

(defun org-contacts-template-email (&optional return-value)
  "Try to return the contact email for a template.
If not found return RETURN-VALUE or something that would ask the user."
  (or (cadr (org-contacts-gnus-get-name-email))
      return-value
      (concat "%^{" org-contacts-email-property "}p")))


(global-set-key (kbd "C-c c") 'org-capture)

(setq org-capture-templates

      '(

        ("a" "Appointments" entry (file+headline "~/org/my-appointments.org" "Calendar")
         "* APPT %^{Description} %^g\n%?\nAdded: %U")

        ("b" "Books" entry (file+headline "~/org/books.org" "books to read")
         "* TODO %\\1 - %\\2%?\n%U\n:PROPERTIES:\n:NAME: %^{NAME}\n:TITLE: %^{TITLE}\n:END:\n")

        ;; you have to set up a template for this
        ;; ("c" "Contacts" entry (file+headline "~/org/contacts.org" "Contacts"), my/org-contacts-template :empty-lines 1)

        ("d" "Dreams" entry (file+olp+datetree "~/org/my-dreams.org") "* %^{Description} %^g %?\nAdded: %U")

        ("e" "Cookbook" entry (file "~/org/cookbook.org")
         "%(org-chef-get-recipe-from-url)"
         :empty-lines 1)

        ("f" "Manual Cookbook" entry (file "~/org/cookbook.org")
         "* %^{Recipe title: }\n  :PROPERTIES:\n  :source-url:\n  :servings:\n  :prep-time:\n  :cook-time:\n  :ready-in:\n  :END:\n** Ingredients\n   %?\n** Directions\n\n")

        ("j" "Journal" entry (file+olp+datetree "~/org/journal.org") "* %?\nEntered on %U\n  %i\n  %a")

        ("k" "Cliplink capture" entry (file "")
         "* TODO %(org-cliplink-capture) \n  SCHEDULED: %t\n" :empty-lines 1)

        ("l" "Log Time" entry (file+olp+datetree "~/org/timelog.org") "** %U - %^{Activity}  :TIME:")

        ("m" "Brain" entry (function org-brain-goto-end) "* %i%?" :empty-lines 1)

        ("n" "Notes" entry (file+olp+datetree "~/org/my-notes.org") "* %^{Description} %^g %?\nAdded: %U")

        ;; you have to set hugo up for this
        ;; ("o" "Posts" (file+olp+datetree "~/org/my-post.org") "* TODO %^{Description} %^g\n%?\nAdded: %U")

        ("t" "Tasks" entry (file+olp+datetree "~/org/tasks.org")
         "* TODO %^{Description} %^g\n%?\nAdded: %U")

        ;; example is in:
        ;; ~/.emacs.d/elpa/org-plus-contrib-20190520/org-contacts.el
        ("c" "Contacts" entry (file "~/org/contacts.org")
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
;; org-capture:1 ends here

;; [[file:init.org::*org-capture with w3m or eww][org-capture with w3m or eww:1]]
;; org-eww and org-w3m should be in your org distribution, but see
;; note below on patch level of org-eww.
;; NOTE: perhaps you will need to comment next line if you get an error
;; and emacs stops building itself
;; (require 'org-eww)
;; (require 'org-w3m)
(defvar org-website-page-archive-file "~/org/capture.org")
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
;; org-capture with w3m or eww:1 ends here

;; [[file:init.org::*org-chef][org-chef:1]]
(use-package org-chef
  :straight t)
;; org-chef:1 ends here

;; [[file:init.org::*Org-cliplink][Org-cliplink:1]]
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
;; Org-cliplink:1 ends here

;; [[file:init.org::*org-download][org-download:1]]
(use-package org-download
    :ensure t
    :config
    ;; add support to dired
    (add-hook 'dired-mode-hook 'org-download-enable))

;;  Now we need to add .dir-locals.el to our project root directory, create a file
;;  called .dir-locals.el with following contents


;; ((nil
;;   .
;;   ((eval
;;     .
;;     (progn

;;       ;; make drag-and-drop image save in the same name folder as org file
;;       ;; ex: `aa-bb-cc.org' then save image test.png to `aa-bb-cc/test.png'
;;       (defun my-org-download-method (link)
;;         (let ((filename
;;                (file-name-nondirectory
;;                 (car (url-path-and-query
;;                       (url-generic-parse-url link)))))
;;               (dirname (file-name-sans-extension (buffer-name)) ))
;;           ;; if directory not exist, create it
;;           (unless (file-exists-p dirname)
;;             (make-directory dirname))
;;           ;; return the path to save the download files
;;           (expand-file-name filename dirname)))

;;       ;; only modify `org-download-method' in this project
;;       (setq-local org-download-method 'my-org-download-method)

;;       )))))
;; org-download:1 ends here

;; [[file:init.org::*org-drill][org-drill:1]]
(use-package org-drill
  :straight t)
;; org-drill:1 ends here

;; [[file:init.org::*org-drill-table][org-drill-table:1]]
(use-package org-drill-table
  :straight t)
;; org-drill-table:1 ends here

;; [[file:init.org::*org-evil][org-evil:1]]
(straight-use-package 'org-evil)
;; org-evil:1 ends here

;; [[file:init.org::*org hydra][org hydra:1]]
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
;; org hydra:1 ends here

;; [[file:init.org::*org-journal][org-journal:1]]
;; https://github.com/bastibe/org-journal

(use-package org-journal
 :ensure t)

(require 'org-journal)

    (customize-set-variable 'org-journal-dir "~/org/journal/")
    (customize-set-variable 'org-journal-date-format "%A, %d %B %Y")

    (customize-set-variable 'org-journal-enable-agenda-integration t)
    (customize-set-variable 'org-journal-carryover-items nil)
    (customize-set-variable 'org-journal-enable-agenda-integration t)

(setq org-journal-enable-agenda-integration t
      org-icalendar-store-UID t
      org-icalendar-include-todo "all"
      org-icalendar-combined-agenda-file "~/org/org-journal.ics")

(global-set-key (kbd "C-c C-v") 'org-journal-search)
(global-set-key (kbd "C-c C-g") 'org-journal-open-next-entry)
(global-set-key (kbd "C-c C-h") 'org-journal-open-previous-entry)
(global-set-key (kbd "C-c j") 'org-journal-new-entry)
;; org-journal:1 ends here

;; [[file:init.org::*org-mac-link][org-mac-link:1]]
(add-hook 'org-mode-hook (lambda () 
  (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link)))
;; org-mac-link:1 ends here

;; [[file:init.org::*org-mind-map][org-mind-map:1]]
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
;; org-mind-map:1 ends here

;; [[file:init.org::*org-super-agenda][org-super-agenda:1]]
(use-package org-super-agenda
  :after org-agenda
  :config
  (org-super-agenda-mode)

  (setq
   org-super-agenda-header-separator ""
   org-super-agenda-unmatched-name "Other"
   org-super-agenda-groups
   '(
     ;; Each group has an implicit OR operator between its selectors.
     (:name "Today"  ; Optionally specify section name
            :time-grid t  ; Items that appear on the time grid.
            :todo "TODAY"   ; Items that have this todo keyword.
            )
     (:name "Work"
            :category "work"
            :tag "work"
            )
     (:name "High Priority"
            :priority "A"
            :order 1
            )
     (:name "Physical"
            :category "physical"
            :tag "physical"
            :order 2
            )
     (:name "Shopping List"
            :category "shopping"
            :tag "shopping"
            :order 3
            )
     (:name "Cleaning"
            :category "cleaning"
            :tag "cleaning"
            :order 4
            )
     (:name "Hygiene"
            :category "hygiene"
            :tag "hygiene"
            :order 5
            )
     (:name "Health"
            :category "health"
            :tag "health"
            :order 6
            )
     (:name "Financial"
            :category "financial"
            :tag "financial"
            :order 7
            )

     ;; After the last group, the agenda will display items that didn't
     ;; match any of these groups, with the default order position of 99

     (:name "Tech"
            :category "tech"
            :tag "tech"
            :order 180
            )
     (:name "To Read"
            :category "read"
            :tag "read"
            :order 181
            )
     (:name "To Watch"
            :category "watch"
            :tag "watch"
            :order 182
            )
     (:todo "WAITING" :order 190)
     ;; (:name "Low priority"
     ;;        :priority "C"
     ;;        :order 200)
     )))
;; org-super-agenda:1 ends here

;; [[file:init.org::*org-present][org-present:1]]
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
;; org-present:1 ends here

;; [[file:init.org::*org-present-remote][org-present-remote:1]]
(use-package org-present-remote
 :straight t)

(use-package fakir
 :straight t)
;; org-present-remote:1 ends here

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; olivetti-mode

  ;; (use-package! olivetti
  ;;   :bind ("C-$" . olivetti-mode)
  ;;   :config
  ;;   (olivetti-mode 1))

;; https://protesilaos.com/dotemacs/#h:7591160f-052a-4d24-8a12-0f7f2e1d5ecd

(use-package olivetti
  :ensure t
  :diminish
  :config
  (setq olivetti-body-width 0.7)
  (setq olivetti-minimum-body-width 80)
  (setq olivetti-recall-visual-line-mode-entry-state t)

  (define-minor-mode cypher/olivetti-mode
    "Toggle buffer-local `olivetti-mode' with additional parameters.

Fringes are disabled.  The modeline is hidden, except for
`prog-mode' buffers (see `cypher/mode-line-hidden-mode').  The
default typeface is set to a proportionately spaced family,
except for programming modes (see `cypher/variable-pitch-mode').
The cursor becomes a blinking bar, per `cypher/cursor-type-mode'."
    :init-value nil
    :global nil
    (if cypher/olivetti-mode
        (progn
          (olivetti-mode 1)
          (set-window-fringes (selected-window) 0 0)
          (cypher/variable-pitch-mode 1)
          (cypher/cursor-type-mode 1)
          (unless (derived-mode-p 'prog-mode)
            (cypher/mode-line-hidden-mode 1)))
      (olivetti-mode -1)
      (set-window-fringes (selected-window) nil) ; Use default width
      (cypher/variable-pitch-mode -1)
      (cypher/cursor-type-mode -1)
      (unless (derived-mode-p 'prog-mode)
        (cypher/mode-line-hidden-mode -1))))
  ;; :bind ("C-c o" . cypher/olivetti-mode)
  :bind ("C-$" . cypher/olivetti-mode)
  )

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; emacs package

(use-package emacs
 :ensure t
  :defines (cypher/font-set-fonts-hook
            cypher/font-monospaced-fonts-list
            cypher/font-fonts-line-spacing-alist
            cypher/font-fonts-bold-weight-alist)
  :functions (cypher/font-adjustment
              cypher/font-line-spacing
              cypher/font-bold-face
              cypher/font-fonts-per-monitor)
  :commands (cypher/font-set-face-attribute
             cypher/font-set-fonts
             cypher/font-set-font-size-family
             cypher/font-fonts-dwim)
  :config
  (setq x-underline-at-descent-line t)

  (defvar cypher/font-set-fonts-hook nil
    "Hook that is called after setting fonts.
See, for example, `cypher/font-set-fonts'.")

  ;; NOTE: "Hack" and "Iosevka Comfy" are my personal builds of Hack and
  ;; Iosevka respectively:
  ;; These fonts are in my Downloads folder
  ;; fonts_for_devs
  ;; 1. https://gitlab.com/protesilaos/hack-font-mod
  ;; 2. https://gitlab.com/protesilaos/iosevka-comfy
  (defconst cypher/font-sizes-families-alist
    '(("pocket" . (105 "Hack" "DejaVu Sans"))
      ("laptop" . (110 "Hack" "Inter"))
      ("desktop" . (130 "Hack" "Inter"))
      ("reader" . (110 "Iosevka Comfy" "Source Sans Pro"))
      ("presentation" . (190 "Iosevka Comfy" "Source Sans Pro")))
    "Alist of desired typefaces and their point sizes.

Each association consists of a display type mapped to a point
size, followed by monospaced and proportionately spaced font
names.  The monospaced typeface is meant to be applied to the
`default' and `fixed-pitch' faces.  The proportionately spaced
font is intended for the `variable-pitch' face.")

  (defun cypher/font-set-face-attribute (face family)
    "Set FACE font to FAMILY."
    (set-face-attribute `,face nil :family (format "%s" family)))

  (defun cypher/font-set-fonts (&optional points font-mono font-var)
    "Set default font size using presets.

POINTS is the font's height.  FONT-MONO should be a monospaced
typeface, due to the alignment requirements of the `fixed-pitch'
face.  FONT-VAR could be a proportionately spaced typeface or
even a monospaced one, since the `variable-pitch' it applies to
is not supposed to be spacing-sensitive.  Both families must be
represented as a string holding the family's name."
    (interactive)
    (if window-system
        (let* ((data cypher/font-sizes-families-alist)
               (displays (mapcar #'car data))
               (choice (or points
                           (completing-read "Pick display size: " displays nil t)))
               (size (or points
                         (nth 1 (assoc `,choice data))))
               (mono (or font-mono
                         (if (member choice displays)
                             (nth 2 (assoc `,choice data))
                           nil)))
               (var (or font-var
                        (if (member choice displays)
                            (nth 3 (assoc `,choice data))
                          nil)))
               (adjust (nth 4 (assoc `,choice data))))
          (set-face-attribute 'default nil :family mono :height size)
          (cypher/font-set-face-attribute 'fixed-pitch mono)
          (cypher/font-set-face-attribute 'variable-pitch var)
          (run-hooks 'cypher/font-set-fonts-hook))
      (user-error "Not running a graphical Emacs.  Cannot set fonts.")))

  (defvar cypher/font-monospaced-fonts-list
    '("Iosevka Comfy" "Hack" "Source Code Pro"
      "Ubuntu Mono" "Fantasque Sans Mono")
    "List of typefaces for coding.
See `cypher/font-set-font-size-family' for how this is used
code-wise.")

  (defun cypher/font-set-font-size-family ()
    "Set point size and main typeface.
This command is intended for testing various font families at
some common point sizes.

See `cypher/font-set-fonts' for the function I would normally use
or `cypher/font-fonts-dwim' which just wraps this one with that."
    (interactive)
    (if window-system
        (let* ((fonts cypher/font-monospaced-fonts-list)
               (font (completing-read "Select main font: " fonts nil t))
               (nums (list 130 140 150 160))
               (sizes (mapcar 'number-to-string nums))
               (size (completing-read "Select or insert number: " sizes nil))
               (var (face-attribute 'variable-pitch :family)))
          (set-face-attribute 'default nil :family font :height (string-to-number size))
          (set-face-attribute 'fixed-pitch nil :family font)
          (cypher/font-set-face-attribute 'variable-pitch var)
          (run-hooks 'cypher/font-set-fonts-hook))
      (user-error "Not running a graphical Emacs.  Cannot set fonts.")))

  (defun cypher/font-fonts-dwim (&optional arg)
    "Set fonts interactively.
This is just a wrapper around `cypher/font-set-fonts' and
`cypher/font-set-font-size-family', whose sole purpose is to
economise on dedicated key bindings."
    (interactive "P")
    (if arg
        (cypher/font-set-font-size-family)
      (cypher/font-set-fonts)))

  (defvar cypher/font-fonts-line-spacing-alist
    '(("Source Code Pro" . 1)
      ("Ubuntu Mono" . 2))
    "Font families in need of extra `line-spacing'.
See `cypher/font-line-spacing' for how this is used.")

  (defvar cypher/font-fonts-bold-weight-alist
    '(("Source Code Pro" . semibold))
    "Font families in need of a different weight for `bold'.
See `cypher/font-bold-face' for how this is used.")

  (defmacro cypher/font-adjustment (fn doc alist cond1 cond2)
    "Macro for functions that employ `cypher/font-switch-fonts-hook'.
NAME is the name of the resulting function.  DOC is its
docstring.  ALIST is an assosiation list of cons cells.  COND1
and COND2 is the body of an `if' statement's 'if' and 'then' part
respectively."
    `(defun ,fn ()
       ,doc
       (let* ((data ,alist)
              (fonts (mapcar #'car data))
              (font (face-attribute 'default :family))
              (x (cdr (assoc font data))))
         (if (member font fonts)
             ,cond1
           ,cond2))))

  (cypher/font-adjustment
   cypher/font-line-spacing
   "Determine desirable `line-spacing', based on font family."
   cypher/font-fonts-line-spacing-alist
   (setq-default line-spacing `,x)
   (setq-default line-spacing nil))

  ;; XXX: This will not work with every theme, but only those that
  ;; inherit the `bold' face instead of specifying a weight property.
  ;; The intent is to configure this once and have it propagate wherever
  ;; a heavier weight is displayed.  My Modus themes handle this
  ;; properly.
  (cypher/font-adjustment
   cypher/font-bold-face
   "Determine weight for the `bold' face, based on font family."
   cypher/font-fonts-bold-weight-alist
   (set-face-attribute 'bold nil :weight `,x)
   (set-face-attribute 'bold nil :weight 'bold))

  (defun cypher/font-fonts-per-monitor ()
    "Use font settings based on screen size.
Meant to be used at some early initialisation stage, such as with
`after-init-hook'."
    (when window-system
      (let* ((display (if (<= (display-pixel-width) 1366)
                          "laptop"
                        "desktop"))
             (data cypher/font-sizes-families-alist)
             (size (cadr (assoc `,display data)))
             (mono (nth 2 (assoc `,display data)))
             (var (nth 3 (assoc `,display data))))
        (set-face-attribute 'default nil :family mono :height size)
        (cypher/font-set-face-attribute 'fixed-pitch mono)
        (cypher/font-set-face-attribute 'variable-pitch var))
      (run-hooks 'cypher/font-switch-fonts-hook)))

  :hook ((after-init-hook . cypher/font-fonts-per-monitor)
         (cypher/font-set-fonts-hook . cypher/font-line-spacing)
         (cypher/font-set-fonts-hook . cypher/font-bold-face)
         ;; See theme section for this hook
         (cypher/modus-theme-after-load-hook . cypher/font-bold-face))
  ;; Awkward key because I do not need it very often.  Maybe once a day.
  ;; The "C-c f" is used elsewhere.
  :bind ("C-c F" . cypher/font-fonts-dwim))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package emacs
  :ensure t
  :commands cypher/mode-line-hidden-mode
  :config
  (setq mode-line-percent-position '(-3 "%p"))
  (setq mode-line-defining-kbd-macro
        (propertize " Macro" 'face 'mode-line-emphasis))
  (setq-default mode-line-format
                '("%e"
                  mode-line-front-space
                  mode-line-mule-info
                  mode-line-client
                  mode-line-modified
                  mode-line-remote
                  mode-line-frame-identification
                  mode-line-buffer-identification
                  "  "
                  mode-line-position
                  (vc-mode vc-mode)
                  " "
                  mode-line-modes
                  " "
                  mode-line-misc-info
                  mode-line-end-spaces))

  (define-minor-mode cypher/mode-line-hidden-mode
    "Toggle modeline visibility in the current buffer."
    :init-value nil
    :global nil
    (if cypher/mode-line-hidden-mode
        (setq-local mode-line-format nil)
      (kill-local-variable 'mode-line-format)
      (force-mode-line-update))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Presentation-mode
;; you can disable modeline for presentation
;; mode with
;; M-x modeline-mode

;; https://protesilaos.com/dotemacs/#h:5571e3b2-1593-4c9c-82f4-ed5f50f69f11

;; cypher/org-presentation-mode
;; for presentation, call:
;; M-x cypher/org-presentation-mode
;; M-x cypher/font-set-fonts
;; M-x cypher/mode-line-hidden-mode
;; M-x hide-mode-line-mode
;; M-x global-hide-mode-line-mode

(use-package org-tree-slide
  :ensure t
  :after org
  :commands cypher/org-presentation-mode
  :config
  (setq org-tree-slide-breadcrumbs nil)
  (setq doom-modeline-mode -1)
  (setq org-tree-slide-header nil)
  (setq org-tree-slide-slide-in-effect nil)
  (setq org-tree-slide-heading-emphasis nil)
  (setq org-tree-slide-cursor-init t)
  (setq org-tree-slide-modeline-display nil)
  (setq org-tree-slide-skip-done nil)
  (setq org-tree-slide-skip-comments t)
  (setq org-tree-slide-fold-subtrees-skipped t)
  (setq org-tree-slide-skip-outline-level 8)
  (setq org-tree-slide-never-touch-face t)
  (setq org-tree-slide-activate-message
        (propertize "Presentation mode ON" 'face 'success))
  (setq org-tree-slide-deactivate-message
        (propertize "Presentation mode OFF" 'face 'error))

  (define-minor-mode cypher/org-presentation-mode
    "Parameters for plain text presentations with `org-mode'."
    :init-value nil
    :global nil
    (if cypher/org-presentation-mode
        (progn
          (unless (eq major-mode 'org-mode)
            (user-error "Not in an Org buffer"))
          (org-tree-slide-mode 1)
          (cypher/olivetti-mode 1)
          (org-superstar-mode 1)
          (org-indent-mode 1))
      (org-tree-slide-mode -1)
      (cypher/olivetti-mode -1)
      (org-superstar-mode -1)
      (org-indent-mode -1)))

  :bind (("C-c P" . cypher/org-presentation-mode)
         :map org-tree-slide-mode-map
         ("<C-down>" . org-tree-slide-display-header-toggle)
         ("<C-right>" . org-tree-slide-move-next-tree)
         ("<C-left>" . org-tree-slide-move-previous-tree)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [[file:init.org::*org-protocol][org-protocol:1]]
(require 'org-protocol)
;; org-protocol:1 ends here

;; [[file:init.org::*org-recur][org-recur:1]]
;; Recurring org-mode tasks.

(use-package org-recur
  :after org
  :bind (
         :map org-recur-mode-map

         ("C-c d" . org-recur-finish)
         ("C-c 0" . org-recur-schedule-today)
         ("C-c 1" . org-recur-schedule-1)
         ("C-c 2" . org-recur-schedule-2)

         :map org-recur-agenda-mode-map

         ;; Rebind the 'd' key in org-agenda (default: `org-agenda-day-view').
         ("d" . org-recur-finish)
         ("0" . org-recur-schedule-today)
         ("1" . org-recur-schedule-1)
         ("2" . org-recur-schedule-2)
         ("C-c d" . org-recur-finish)
         ("C-c 0" . org-recur-schedule-today)
         ("C-c 1" . org-recur-schedule-1)
         ("C-c 2" . org-recur-schedule-2)
         )
  :hook ((org-mode . org-recur-mode)
         (org-agenda-mode . org-recur-agenda-mode))
  :demand t
  :config
  (defun org-recur-schedule-1 ()
    (interactive)
    (org-recur-schedule-date "|+1|"))
  (defun org-recur-schedule-2 ()
    (interactive)
    (org-recur-schedule-date "|+2|"))

  (setq org-recur-finish-done t
        org-recur-finish-archive t)
  )
;; org-recur:1 ends here

;; [[file:init.org::*org-refile][org-refile:1]]
(setq org-refile-targets '((nil :maxlevel . 9)
                                (org-agenda-files :maxlevel . 9)))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling
;; org-refile:1 ends here

;; [[file:init.org::*org-re-reveal][org-re-reveal:1]]
(use-package org-re-reveal 
   :straight t
   :config
     (setq org-re-reveal-root "file:/home/lea/reveal-slides/reveal.js")
     (require 'org-re-reveal)
;;     (setq oer-reveal-plugins t)
     (setq org-re-reveal-hlevel 2))
;; org-re-reveal:1 ends here

;; [[file:init.org::*org-re-reveal-ref][org-re-reveal-ref:1]]
(use-package org-re-reveal-ref
 :straight t
 :config
   (require 'org-re-reveal-ref))
;; org-re-reveal-ref:1 ends here

;; [[file:init.org::*org-reveal][org-reveal:1]]
;; Note: give the ABSOLUTE PATH to reveal.js
;; Otherwise it will not work

;; this work only with internet connection
;; (setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
;; (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")

;; this work without internet connection
;; (setq org-reveal-root "file:/home/lea/reveal-slides/reveal.js")

;; if it does not load, do:
;; Alt-x load-library RET ox-reveal
;; Alt-x load-library RET ox-re-reveal
;; Alt-x load-library RET ox-pandoc

 (use-package ox-reveal
  :straight t
  :after org
  :custom
  (org-reveal-root "file:/home/lea/reveal-slides/reveal.js"))

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
;; org-reveal:1 ends here

;; [[file:init.org::*org-super-agenda][org-super-agenda:1]]
;; Display groups in org-agenda to make things a bit more organized.

(use-package org-super-agenda
  :after org-agenda
  :config
  (org-super-agenda-mode)
  (setq
   org-super-agenda-header-separator ""
   org-super-agenda-unmatched-name "Other"
   org-super-agenda-groups
   '(
     ;; Each group has an implicit OR operator between its selectors.
     (:name "Cleaning"
            :category "cleaning"
            :tag "cleaning"
            :order 4
            )
     (:name "Financial"
            :category "financial"
            :tag "financial"
            :order 7
            )
     (:name "Health"
            :category "health"
            :tag "health"
            :order 6
            )
     (:name "High Priority"
            :priority "A"
            :order 1
            )
     (:name "Hygiene"
            :category "hygiene"
            :tag "hygiene"
            :order 5
            )
     (:name "Physical"
            :category "physical"
            :tag "physical"
            :order 2
            )
     (:name "Shopping List"
            :category "shopping"
            :tag "shopping"
            :order 3
            )
     (:name "Today"  ; Optionally specify section name
            :time-grid t  ; Items that appear on the time grid.
            :todo "TODAY"   ; Items that have this todo keyword.
            )
     (:name "Work"
            :category "work"
            :tag "work"
            )
     ;; After the last group, the agenda will display items that didn't
     ;; match any of these groups, with the default order position of 99
     (:name "To Read"
            :category "read"
            :tag "read"
            :order 181
            )
     (:name "Tech"
            :category "tech"
            :tag "tech"
            :order 180
            )
     (:name "To Watch"
            :category "watch"
            :tag "watch"
            :order 182
            )
     (:todo "WAITING" :order 190)
     ;; (:name "Low priority"
     ;;        :priority "C"
     ;;        :order 200)
     )))
;; org-super-agenda:1 ends here

;; [[file:init.org::*org-tree-slide][org-tree-slide:1]]
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
;; org-tree-slide:1 ends here

;; [[file:init.org::*origami][origami:1]]
;; (use-package origami
;; :straight t)
;; origami:1 ends here

;; [[file:init.org::*ox-pandoc][ox-pandoc:1]]
(use-package ox-pandoc 
	   :straight t)
;; ox-pandoc:1 ends here

;; [[file:init.org::*ox-spectacle][ox-spectacle:1]]
(use-package ox-spectacle
      :straight t)
;; ox-spectacle:1 ends here

;; [[file:init.org::*pastbin][pastbin:1]]
(straight-use-package 'debpaste)
(straight-use-package 'ix)
;; pastbin:1 ends here

;; [[file:init.org::*pdf-tools][pdf-tools:1]]
(use-package pdf-tools
  :straight t
  :config
  (pdf-tools-install)
  (add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1))))

 ;; (add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))

(use-package org-pdfview
  :straight t)
;; pdf-tools:1 ends here

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; doc-view
(setq doc-view-continuous t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [[file:init.org::*persistent-soft][persistent-soft:1]]
(use-package persistent-soft
  :straight t
  :config
(persistent-soft-store 'hundred 100 "mydatastore")
(persistent-soft-fetch 'hundred "mydatastore")    ; 100
(persistent-soft-fetch 'thousand "mydatastore"))   ; nil

;; quit and restart Emacs

(persistent-soft-fetch 'hundred "mydatastore")    ; 100
;; persistent-soft:1 ends here

;; [[file:init.org::*perspective][perspective:1]]
(use-package perspective
  :straight t)
;; perspective:1 ends here

;; [[file:init.org::*php-ext][php-ext:1]]
(setq php-ext-path "~/.emacs.d/local-repo/php-ext/")
(load (concat php-ext-path "php-ext.el"))

   ;; (add-to-list 'load-path "~/.emacs.d/local-repo/php-ext")
   ;; (require 'php-ext)
;; php-ext:1 ends here

;; [[file:init.org::*php-mode][php-mode:1]]
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
;; php-mode:1 ends here

;; [[file:init.org::*plantuml][plantuml:1]]
(setq org-plantuml-jar-path "/usr/share/plantuml/plantuml.jar")

  (dolist (pkgname '(plantuml-mode
flycheck-plantuml))
  (straight-use-package pkgname))
;; plantuml:1 ends here

;; [[file:init.org::*poetry][poetry:1]]
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
;; poetry:1 ends here

;; [[file:init.org::*poly-markdown][poly-markdown:1]]
(use-package poly-markdown
  :straight t
  :config 
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode)))
;; poly-markdown:1 ends here

;; [[file:init.org::*powerline][powerline:1]]
(use-package powerline 
    :straight t)

(require 'powerline)
(powerline-default-theme)

  ;; (powerline-center-theme)
  ;; (setq powerline-center-default-separator 'wave))
;; powerline:1 ends here

;; [[file:init.org::*prolog][prolog:1]]
(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
(setq prolog-system 'swi)
(setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
				("\\.m$" . mercury-mode))
			       auto-mode-alist))
;; prolog:1 ends here

;; [[file:init.org::*python][python:1]]
(use-package python 
   :ensure t)

       (setq python-shell-interpreter "/usr/bin/python3")

(use-package evil-python-movement
  :ensure t)

  ;;  Only spaces - python indentation

(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq python-indent 3)
        (setq tab-width 3))
        (untabify (point-min) (point-max)))

   (use-package pydoc
   :ensure t)

   (use-package helm-pydoc
    :ensure t)

;; Only tabs - python indentation

;; (add-hook 'python-mode-hook
;;          (lambda ()
;;            (setq indent-tabs-mode t)
;;            (setq python-indent 3)
;;            (setq tab-width 3))
;;          (tabify (point-min) (point-max)))

;; You can start a jupyter-src block with:

(use-package jupyter
  :ensure t
  :defer t
  :init
  (setq org-babel-default-header-args:jupyter-python '((:async . "yes")
(:session . "py")
(:kernel . "python3"))))
;; python:1 ends here

;; [[file:init.org::*elpy][elpy:1]]

;; elpy:1 ends here

;; [[file:init.org::*quelpa][quelpa:1]]
;; (use-package quelpa-use-package
;;     :straight t
;;     :init
;;    (setq quelpa-update-melpa-p nil))
;; quelpa:1 ends here

;; [[file:init.org::*re-builder][re-builder:1]]
(use-package re-builder
 :straight t
 :config
 (setq reb-re-syntax 'string))
;; re-builder:1 ends here

;; [[file:init.org::*restart-emacs][restart-emacs:1]]
(use-package restart-emacs
  :ensure t)
;; restart-emacs:1 ends here

;; [[file:init.org::*ripgrep][ripgrep:1]]
(use-package ripgrep
  :straight t)
;; ripgrep:1 ends here

;; [[file:init.org::*rust][rust:1]]
(use-package rust-mode
       :ensure t
       :config
       (setq rust-format-on-save t)
       (add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
       (add-hook 'rust-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c <tab>") #'rust-format-buffer))))

(require 'rust-mode)

(defun indent-buffer ()
  "Indent current buffer according to major mode."
  (interactive)
  (indent-region (point-min) (point-max)))

(use-package cargo
 :ensure t
 :config
(setq racer-cmd "~/.cargo/bin/cargo") ;; cargo binaries PATH
(add-hook 'rust-mode-hook 'cargo-minor-mode))

;; https://github.com/racer-rust/emacs-racer
(use-package racer
 :ensure t
 :config
 (setq racer-cmd "~/.cargo/bin/racer") ;; rustup binaries PATH
 (setq racer-rust-src-path "~/rust/src") ;; Rust  source code PATH
 (add-hook 'rust-mode-hook #'racer-mode)
 (add-hook 'racer-mode-hook #'eldoc-mode)
 )

(use-package flycheck-rust
 :ensure t
 :config
 (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "~/.cargo/bin")))
(setq exec-path (append exec-path (list (expand-file-name "~/.cargo/bin"))))
;; rust:1 ends here

;; [[file:init.org::*save-place][save-place:1]]
(require 'saveplace)
(save-place-mode 1)
;; save-place:1 ends here

;; [[file:init.org::*scheme][scheme:1]]

;; scheme:1 ends here

;; [[file:init.org::*scimax][scimax:1]]

;; scimax:1 ends here

;; [[file:init.org::*shackle-rules][shackle-rules:1]]
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
;; shackle-rules:1 ends here

;; [[file:init.org::*shell-pop][shell-pop:1]]
(use-package shell-pop
:straight t
  :bind (("C-t" . shell-pop))
  :config
  (setq shell-pop-shell-type (quote ("ehell" "eshell" (lambda nil (eshell)))))
  (setq shell-pop-term-shell "eshell")
  ;; need to do this manually or not picked up by `shell-pop'
  (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type))
;; shell-pop:1 ends here

;; [[file:init.org::*simple-mpc][simple-mpc:1]]
(use-package simple-mpc
 :straight t)
;; simple-mpc:1 ends here

;; [[file:init.org::*slime swank][slime swank:1]]
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

(use-package elisp-slime-nav
  :ensure t)
;; slime swank:1 ends here

;; [[file:init.org::*smartparens][smartparens:1]]
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
;; smartparens:1 ends here

;; [[file:init.org::*smex][smex:1]]
;;    (global-set-key (kbd "M-x") 'smex)
;;    (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; smex:1 ends here

;; [[file:init.org::*sudo-editing][sudo-editing:1]]
(use-package sudo-edit
  :ensure t
  :bind
    ("s-e" . sudo-edit))
;; sudo-editing:1 ends here

;; [[file:init.org::*synonyms and thesaurus][synonyms and thesaurus:1]]
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
;; synonyms and thesaurus:1 ends here

;; telega

;;this telega is not from elpa repo
  ;;it is in /home/lea/emacs.d/straight/repos/telega.el
  ;;just delete its directory if it complains about the server

  ;; (use-package telega
  ;;  :straight t
  ;;  :bind 
  ;;   (:map telega-msg-button-map
  ;;     ("j" . nil)
  ;;     ("k" . nil)
  ;;     ("h" . nil)
  ;;     ("l" . nil))
  ;;     :custom (telega-notifications-mode t))

  ;;this telega is from melpa repo
  ;;it is in /home/lea/emacs.d/straight/repos/telega.el
  ;;just delete its directory if it complains about the server

;;
(use-package telega
   :ensure t
   :bind 
    (:map telega-msg-button-map
      ("j" . nil)
      ("k" . nil)
      ("h" . nil)
      ("l" . nil))
:custom
  (telega-notifications-mode t)
  (telega-cache-dir (expand-file-name
                     "~/Downloads/telega_stuff"))
  )

;; (require 'telega-stories)
  ;;   (telega-stories-mode 1)
    ;; "Emacs Stories" rootview
    ;; (define-key telega-root-mode-map (kbd "v e") 'telega-view-emacs-stories)

;;
;;(straight-use-package 'telega
;;   :custom
;;   (telega-notifications-mode t)
;;   (telega-cache-dir (expand-file-name
;;                      "~/Downloads/telega_stuff"))
;;   :config
;;   (map :map telega-msg-button-map
;;        "k" #'evil-previous-line
;;        "h" #'evil-backward-char
;;        "l" #'evil-forward-char
;;        "e" #'evil-forward-word-end
;;        "c" #'telega-msg-edit)
;;  (map :leader "G" telega-prefix-map)
;;  (map :map telega-prefix-map
;;        :leader
;;        :prefix "G"
;;        :desc "View folders" "F" #'telega-view-folders
;;        :desc "Kill telega" "k" #'telega-kill)
;;  (map :mode telega-chat-mode
;;        :map telega-chat-mode-map
;;        :localleader
;;        :desc "Filter" "/" #'telega-chatbuf-filter
;;        :desc "Describe" "?" #'telega-chatbuf-describe
;;        :desc "Attach from clipboard" "p" #'telega-chatbuf-attach-clipboard
;;        :desc "Attach" "a" #'telega-chatbuf-attach
;;        :desc "Attach File" "f" #'telega-chatbuf-attach-fille
;;        :desc "Filter cancel" "c" #'telega-chatbuf-filter-cancel
;;        :desc "Cancel aux" "k" #'telega-chatbuf-cancel-aux
;;        :desc "Filter search" "s" #'telega-chatbuf-filter-search)
;;  )
;;

;; its already in company-backend list
;; (setq telega-emoji-company-backend 'telega-company-emoji)

(defun cypher-telega-chat-mode ()
  (set (make-local-variable 'company-backends)
       (append (list telega-emoji-company-backend
                   'telega-company-username
                   'telega-company-hashtag)
             (when (telega-chat-bot-p telega-chatbuf--chat)
               '(telega-company-botcmd))))
  (company-mode 1))

(add-hook 'telega-chat-mode-hook 'cypher-telega-chat-mode)

;; it is already set up - see above
;; (telega-notifications-mode 1)

(add-hook 'telega-load-hook 'telega-mode-line-mode)
(add-hook 'telega-open-file-hook 'telega-edit-file-mode)
;; (add-hook 'telega-load-hook 'global-telega-url-shorten-mode)


;; *text-scale

(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)
;; text-scale:1 ends here

;; [[file:init.org::*theme-magic][theme-magic:1]]
;;     (use-package theme-magic
;;      :ensure t)

;;   (require 'theme-magic)
;;   (theme-magic-export-theme-mode)
;; theme-magic:1 ends here

;; [[file:init.org::*time in modeline][time in modeline:1]]
(setq display-time-default-load-average nil)
(setq display-time-interval 1)
(setq display-time-format "%d|%m-%a|%r")
(display-time-mode +1)
;; time in modeline:1 ends here

;; [[file:init.org::*tiny-tools][tiny-tools:1]]
(add-to-list 'load-path "~/.emacs.d/local-repo/tiny-tools")
 (add-to-list 'load-path "~/.emacs.d/local-repo/tiny-tools/lisp/tiny")
            (add-to-list 'load-path "~/.emacs.d/local-repo/tiny-tools/lisp/other")

(require 'tinyurl)
(tinyurl-mode 1)
;; tiny-tools:1 ends here

;; [[file:init.org::*toggle-truncate-lines][toggle-truncate-lines:1]]
(setq truncate-partial-width-windows 1)
(setq truncate-lines 1)
(global-set-key (kbd "C-x t") 'toggle-truncate-lines)
;; toggle-truncate-lines:1 ends here

;; [[file:init.org::*ob-translate][ob-translate:1]]
(use-package ob-translate
       :straight t)
      (define-key org-mode-map (kbd "C-c C-v e") 'org-babel-execute-src-block)

;; https://orgmode.org/manual/Evaluating-code-blocks.html#DOCF142
;; I don't want to execute code blocks with C-c C-c
(setq org-babel-no-eval-on-ctrl-c-ctrl-c t)
;; ob-translate:1 ends here

;; [[file:init.org::*google-translate][google-translate:1]]
(use-package google-translate
:straight t
:config
  (bind-keys*
  ("C-c t" . google-translate-at-point)
  ("C-c T" . google-translate-at-point-reverse)))

(defun google-translate--search-tkk ()
  "Search TKK." (list 430675 2721866130))
(setq google-translate-backend-method 'curl)

  ;; (defun google-translate--get-b-d1 ()
  ;; (list 432928 274893998))

;; google-translate:1 ends here

;; [[file:init.org::*treemacs][treemacs:1]]

;; treemacs:1 ends here

;; [[file:init.org::*javascript][javascript:1]]
(use-package js2-mode
    :ensure t
    :interpreter (("node" . js2-mode))
    :bind (:map js2-mode-map ("C-c C-p" . js2-print-json-path))
    :mode "\\.\\(js\\|json\\)$"
    :config
    (add-hook 'js-mode-hook 'js2-minor-mode)
    (setq js2-basic-offset 2
          js2-highlight-level 3
          js2-mode-show-parse-errors nil
          js2-mode-show-strict-warnings nil))

  (use-package js2-refactor
    :defer t
    :diminish js2-refactor-mode
    :commands js2-refactor-mode
    :ensure t
    :init
    (add-hook 'js2-mode-hook #'js2-refactor-mode)
    :config
    (js2r-add-keybindings-with-prefix "C-c C-m"))

  (use-package ac-js2
    :defer t
    :ensure t
    :init
    (add-hook 'js2-mode-hook 'ac-js2-mode)
    (setq ac-js2-evaluate-calls t))

  ;; from here test
  ;; https://github.com/swank-js/swank-js#user-content-installation
  ;; sudo nmp install -g npm 
  ;; sudo npm install -g swank-js

  (global-set-key [f5] 'slime-js-reload)
  (add-hook 'js2-mode-hook
            (lambda ()
              (slime-js-minor-mode 1)))

  (add-hook 'css-mode-hook
            (lambda ()
              (define-key css-mode-map "\M-\C-x" 'slime-js-refresh-css)
              (define-key css-mode-map "\C-c\C-r" 'slime-js-embed-css)))

 ;; sudo nmp install -g npm 
 ;; sudo npm install -g indium

(use-package indium
 :ensure t
 :config
 (setq indium-chrome-executable "chromium"))
;; javascript:1 ends here

;; [[file:init.org::*trident - lisp2javascript][trident - lisp2javascript:1]]
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
;; trident - lisp2javascript:1 ends here

;; [[file:init.org::*Unicode-fonts][Unicode-fonts:1]]
(use-package unicode-fonts
 :straight t
 :config
 (unicode-fonts-setup))
;; Unicode-fonts:1 ends here

;; [[file:init.org::*virtualenvwrapper][virtualenvwrapper:1]]
(use-package virtualenvwrapper
:straight t
:config
(venv-initialize-interactive-shells)
(venv-initialize-eshell))
;; virtualenvwrapper:1 ends here

;; [[file:init.org::*visual-regexp-steroids][visual-regexp-steroids:1]]
;; (add-to-list 'load-path "~/.emacs.d/elpa/visual-regexp-20170301.116/")
;; (add-to-list 'load-path "~/.emacs.d/elpa/visual-regexp-steroids-20170222.253")

(use-package visual-regexp
 :ensure t)
(use-package visual-regexp-steroids
 :ensure t)

(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
;; if you use multiple-cursors, this is for you:
(define-key global-map (kbd "C-c m") 'vr/mc-mark)
;; to use visual-regexp-steroids's isearch instead of the built-in regexp isearch, also include the following lines:
(define-key esc-map (kbd "C-r") 'vr/isearch-backward) ;; C-M-r
(define-key esc-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s
;; visual-regexp-steroids:1 ends here

;; [[file:init.org::*wanderlust email-client][wanderlust email-client:1]]
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
;; wanderlust email-client:1 ends here

;; [[file:init.org::*web-mode][web-mode:1]]
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
;; web-mode:1 ends here

;; [[file:init.org::*wgrep][wgrep:1]]
(use-package wgrep
 :straight t)
;; wgrep:1 ends here

;; [[file:init.org::*winner-mode][winner-mode:1]]
(when (fboundp 'winner-mode)
     (winner-mode 1))
;; winner-mode:1 ends here

;; [[file:init.org::*yasnippets][yasnippets:1]]
(dolist (pkgname '(snippet
yasnippet
yasnippet-snippets
yasnippet-classic-snippets))
  (straight-use-package pkgname))

  (yas-global-mode 1)
;; yasnippets:1 ends here

;; [[file:init.org::*youtube-dl][youtube-dl:1]]
(add-to-list 'load-path "~/.emacs.d/local-repo/youtube-dl-emacs")
(require 'youtube-dl)
;; youtube-dl:1 ends here

;; [[file:init.org::*zoom-frm for hycontrol][zoom-frm for hycontrol:1]]
;; (add-to-list 'load-path "~/.emacs.d/local-repo/zoom-frm")
;; (require 'zoom-frm)

;; (define-key ctl-x-map [(control ?+)] 'zoom-in/out)
;; (define-key ctl-x-map [(control ?-)] 'zoom-in/out)
;; (define-key ctl-x-map [(control ?=)] 'zoom-in/out)
;; (define-key ctl-x-map [(control ?0)] 'zoom-in/out)
;; zoom-frm for hycontrol:1 ends here

;; [[file:init.org::*zoom-frm for hycontrol][zoom-frm for hycontrol:2]]
(use-package restart-emacs
 :ensure t)
;; zoom-frm for hycontrol:2 ends here

;; [[file:init.org::*hyperspec-lookup][hyperspec-lookup:1]]
(global-set-key "\C-cH" 'hyperspec-lookup)
;; hyperspec-lookup:1 ends here

;; [[file:init.org::*ecb][ecb:1]]
;; (straight-use-package 'ecb)
;; (require 'ecb))
;; ecb:1 ends here

;; [[file:init.org::*cedet][cedet:1]]
(semantic-mode 1)
(require 'semantic/ia)
;; cedet:1 ends here

;; [[file:init.org::*camcorder][camcorder:1]]
(use-package camcorder
   :ensure t)
;; camcorder:1 ends here

;; [[file:init.org::*org-roam][org-roam:1]]
;; M-x org-roam-node-find
;; visit or create a new buffer

(use-package org-roam
    :ensure t
    :init 
    (setq org-roam-v2-ack t)
;;    :hook 
;;    (after-init . org-roam-mode)
    :custom
    (org-roam-directory "~/org/deft-notes")
    :bind (:map org-roam-mode-map
                (("C-c n l" . org-roam)
                 ("C-c n f" . org-roam-find-file)
                 ("C-c n g" . org-roam-show-graph))
                :map org-mode-map
                (("C-c n i" . org-roam-insert)))
    :config
    (require 'org-roam-protocol))


  (use-package org-roam-bibtex
    :ensure t)

  (use-package company-org-roam
    :ensure t)

;; org-roam-server

;; you also have to install org-protocol
;; https://www.orgroam.com/manual/Installation-_00281_0029.html#Installation-_00281_0029

;; (require 'org-roam-protocol)

;; (unless (server-running-p)
;   (org-roam-server-mode)
;;   ;; 
;;   )

;; (use-package org-roam-server)

(use-package org-roam-server
  :after org-roam
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8078
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "webm" "mp3" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20)
  (defun org-roam-server-open ()
    "Ensure the server is active, then open the roam graph."
    (interactive)
    ;; (org-roam-server-mode 1)
    (browse-url-xdg-open (format "http://localhost:%d" org-roam-server-port))))
;; org-roam:1 ends here

;; org-noter

(use-package org-noter
  :ensure t
  :after (:any org pdf-view)
  :config
  (setq
   ;; The WM can handle splits
   org-noter-notes-window-location 'other-frame
   ;; Please stop opening frames
   org-noter-always-create-frame nil
   ;; I want to see the whole file
   org-noter-hide-other nil
   ;; Everything is relative to deft-notes
   org-noter-notes-search-path '("~/org/deft-notes")
   )
  )

(setq orb-preformat-keywords
      '("citekey" "title" "url" "author-or-editor" "keywords" "file")
      orb-process-file-keyword t
      orb-file-field-extensions '("pdf"))

(setq orb-templates
      '(("r" "ref" plain (function org-roam-capture--get-point)
         ""
         :file-name "${citekey}"
         :head "#+TITLE: ${citekey}: ${title}\n#+ROAM_KEY: ${ref}

- tags ::
- keywords :: ${keywords}

* ${title}
:PROPERTIES:
:Custom_ID: ${citekey}
:URL: ${url}
:AUTHOR: ${author-or-editor}
:NOTER_DOCUMENT: ${file}  ; <== special file keyword: if more than one filename
:NOTER_PAGE:              ;     is available, the user will be prompted to choose
:END:")))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-pdftools
;; org-noter-pdf-tools

(use-package org-pdftools
  :ensure t
  :hook (org-mode . org-pdftools-setup-link))

(use-package org-noter-pdftools
  :ensure t
  :after (:any org org-noter pdf-view)
  :config
  ;; Add a function to ensure precise note is inserted
  (defun org-noter-pdftools-insert-precise-note (&optional toggle-no-questions)
    (interactive "P")
    (org-noter--with-valid-session
     (let ((org-noter-insert-note-no-questions (if toggle-no-questions
                                                   (not org-noter-insert-note-no-questions)
                                                 org-noter-insert-note-no-questions))
           (org-pdftools-use-isearch-link t)
           (org-pdftools-use-freestyle-annot t))
       (org-noter-insert-note (org-noter--get-precise-info)))))

  ;; fix https://github.com/weirdNox/org-noter/pull/93/commits/f8349ae7575e599f375de1be6be2d0d5de4e6cbf
  (defun org-noter-set-start-location (&optional arg)
    "When opening a session with this document, go to the current location.
With a prefix ARG, remove start location."
    (interactive "P")
    (org-noter--with-valid-session
     (let ((inhibit-read-only t)
           (ast (org-noter--parse-root))
           (location (org-noter--doc-approx-location (when (called-interactively-p 'any) 'interactive))))
       (with-current-buffer (org-noter--session-notes-buffer session)
         (org-with-wide-buffer
          (goto-char (org-element-property :begin ast))
          (if arg
              (org-entry-delete nil org-noter-property-note-location)
            (org-entry-put nil org-noter-property-note-location
                           (org-noter--pretty-print-location location))))))))
  (with-eval-after-load 'pdf-annot
    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))

;; how to use
;; call M-x pdf-view-mode and then, M-x org-noter
;; in a ".pdf" file

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; notdeft

;; TODO nodeft and xapian
  ;; https://dotdoom.rgoswami.me/config.html
  ;; https://github.com/hasu/notdeft
  ;;
  ;; (add-load-path! "~/.emacs.d/local-repo/notdeft")
  ;; (load! "notdeft-example")

  ;; https://www.gtrun.org/post/config/#package-dot-el
  ;; https://git.jeremydormitzer.com/jdormit/dotfiles/
  ;; notdeft documentation
  ;; https://tero.hasu.is/notdeft/#org468dfc8
  ;;
  ;; comment this package in config.el and packages.el
  ;; when you update/upgrade Emacs. Otherwise it will
  ;; yell an error

  ;; you have to "M-x notdeft" to get the notdeft-keybindings

  ;; (set-evil-initial-state! 'notdeft-mode 'emacs)

  ;; (add-hook 'notmuch-mode-hook #'evil-emacs-state)

(straight-use-package
  '(notdeft :type git
            :host github
            :repo "hasu/notdeft"
            :branch "devel"))

;; (add-to-list 'load-path "~/_emacs.d_Orig/local-repo/notdeft")
;; (add-to-list 'load-path "~/_emacs.d_Orig/local-repo/notdeft/extras")
;; (load "notdeft-example")

  (add-hook 'notdeft-mode-hook #'evil-emacs-state)

 ;; (use-package notdeft
 ;;   :ensure t
 ;;   :config

    (setq notdeft-extension "org")
    (setq notdeft-secondary-extensions '("org" "md" "txt"))
    (setq notdeft-directories '("~/org/deft-notes"
                                "~/anki_flashcards"
                                ))

 ;;   )

  ;;  (load "notdeft-example")
      (require 'notdeft-org)
      ;; (require 'notdeft-global)

      ;; (set-evil-initial-state! 'notdeft-mode 'emacs)
      ;; (set-evil-initial-state! 'notdeft-mode-map 'emacs)


;; notdeft file time-stamping

;;  (setq notdeft-notename-function
;;        (lambda (title)
;;          (concat
;;           (format-time-string "%Y-%m-%d-%H%M")
;;           " "
;;           title)))


(setq notdeft-new-file-data-function
        (lambda (dir notename ext data title)
          (cons
           (notdeft-make-filename
            (or notename
                (let ((ts (format-time-string "%Y-%m-%d-%H%M")))
                  (if title
                      (concat ts " " title)
                    ts)))
            ext dir)
           (or data
               (when title
                 (concat "#+TITLE: " title "\n\n"))))))

;; notdeft hydra

(add-to-list 'load-path "~/.emacs.d/local-repo/notdeft/extras/")

(autoload 'notdeft-global-hydra/body "notdeft-global-hydra" nil t)
(global-set-key [f6] 'notdeft-global-hydra/body)

(autoload 'notdeft-mode-hydra/body "notdeft-mode-hydra")
(eval-after-load "notdeft"
  '(define-key notdeft-mode-map (kbd "C-c h") 'notdeft-mode-hydra/body))

;; notdeft:1 ends here

;; [[file:init.org::*deft][deft:1]]
(use-package deft
  :ensure t
  :custom
   (deft-directory "~/org/deft-notes")
   (deft-extensions '("org" "md"))
   (deft-recursive t)
   (deft-use-filename-as-title t)
   (deft-filter-only-filenames t)
   ;; (deft-auto-save-interval 30.0)
   (deft-file-limit 200))

   (setq deft-auto-save-interval 15.0)

 ;;  :config
;;   (setq deft-directory "~/org/deft-notes")
;;   (setq deft-extensions '("org" "md"))
;;   (setq deft-recursive t)
;;   (setq deft-use-filename-as-title t)
;;   (setq deft-filter-only-filenames t)
;;   (setq deft-auto-save-interval 30.0)
;;   (setq deft-file-limit 200))


(defun cypher/deft-open-other ()
(interactive)
(deft-open-file-other-window t))

(defun cypher/deft-open-preview ()
  (interactive)
  (deft-open-file-other-window))

(with-eval-after-load 'deft
  (define-key deft-mode-map
    (kbd "<tab>") 'cypher/deft-open-preview)
  (define-key deft-mode-map
    (kbd "<s-return>") 'cypher/deft-open-other)
  (define-key deft-mode-map
    (kbd "s-j") 'evil-next-line)
  (define-key deft-mode-map (kbd "s-k") 'evil-previous-line))

(setq deft-strip-summary-regexp
      (concat "\\("
              "[\n\t]" ;; blank
              "\\|^#\\+[a-zA-Z_]+:.*$" ;;org-mode metadata
              "\\)"))
;; deft:1 ends here

;; [[file:init.org::*zetteldeft][zetteldeft:1]]
;;   (add-to-list 'load-path "~/.emacs.d/elpa/zetteldeft-20200501.935")
  ;;  (require 'zetteldeft)
  ;;  (zetteldeft-set-classic-keybindings)

  (use-package zetteldeft
    :ensure t
    :after deft
    :config
    (zetteldeft-set-classic-keybindings)
    (setq deft-new-file-format zetteldeft-id-format))

;;  (defun zetteldeft-generate-id ()
;;    "Generate an ID in the format of `zetteldeft-id-format'."
;;    (format-time-string zetteldeft-id-format))

  (require 'zetteldeft)
  ;; (zetteldeft-set-classic-keybindings)
;; zetteldeft:1 ends here

;; [[file:init.org::*nov for epubs][nov for epubs:1]]
(use-package nov
 :ensure t)
;; nov for epubs:1 ends here

;; [[file:init.org::*elpher][elpher:1]]
(use-package elpher
 :ensure t)
;; elpher:1 ends here

;; [[file:init.org::*ed-mode][ed-mode:1]]

;; ed-mode:1 ends here

;; [[file:init.org::*kotlin][kotlin:1]]
(use-package kotlin-mode
 :ensure t)

(use-package flycheck-kotlin
 :ensure t)

(use-package ob-kotlin
 :ensure t)
;; kotlin:1 ends here

;; [[file:init.org::*type-tutor][type-tutor:1]]
(add-to-list 'load-path "~/.emacs.d/local-repo/type-tutor")
(require 'type-tutor)
;; type-tutor:1 ends here

;; [[file:init.org::*Latex skeletons][Latex skeletons:1]]

;; Latex skeletons:1 ends here

;; [[file:init.org::*haskell-mode][haskell-mode:1]]
(use-package haskell-mode
     :ensure t)

(use-package haskell-snippets
     :ensure t)

(use-package flycheck-haskell
     :ensure t)

(use-package ac-haskell-process
     :ensure t)

(use-package haskell-emacs
     :ensure t)

(use-package haskell-emacs-base
     :ensure t)

(use-package haskell-emacs-text
     :ensure t)

(use-package hindent
     :ensure t)
;; haskell-mode:1 ends here

;; [[file:init.org::*slectric-mode][slectric-mode:1]]
(use-package selectric-mode
  :ensure t)
;; slectric-mode:1 ends here

;; emacs-chess

(use-package chess 
  :ensure t)

;; eaf - emacs application framework

;; (use-package eaf
;;   :load-path "~/.emacs.d/local-repo/eaf"
;;   :custom
;;   (eaf-find-alternate-file-in-dired t)
;;   :config
;;   (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key take_photo "p" eaf-camera-keybinding))

;; if you want to use eaf, do this:
;; enable the next two lines, if you want to use eaf
;; (add-to-list 'load-path "~/.emacs.d/local-repo/eaf")
;; (setq eaf-find-alternate-file-in-dired t)

;; (setq eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;; (setq eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;; (setq eaf-bind-key take_photo "p" eaf-camera-keybinding)

;; and enable this line as well
;; (require 'eaf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [[file:init.org::*chezmoi][chezmoi:1]]

;; chezmoi:1 ends here

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ledger-mode
;; apt install ledger
;; https://www.ledger-cli.org/3.0/doc/ledger-mode.html
;; https://orgmode.org/worg/org-tutorials/weaving-a-budget.html
;; https://orgmode.org/worg/org-contrib/babel/languages/ob-doc-ledger.html

(use-package flycheck-ledger
  :ensure t)

(use-package ledger-mode
  :ensure t
  :init
  (setq ledger-clear-whole-transactions 1)
  (add-hook 'ledger-mode-hook #'flycheck-mode)
  ;; :config
  ;; (add-to-list 'evil-emacs-state-mode 'ledger-report-mode)
  :commands (ledger-mode)
  :mode ("\\.dat\\'"
         "\\.ledger\\'"))

(eval-after-load 'flycheck
  '(require 'flycheck-ledger))

(use-package evil-ledger
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; memes
(add-to-list 'load-path
	     "~/.emacs.d/local-repo/meme")
(require 'meme)
(autoload 'meme "meme.el" "Create a meme from a collection" t)
(autoload 'meme-file "meme.el" "Create a meme from a file" t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; cowsay
;; https://github.com/lassik/emacs-cowsay/

(use-package cowsay
:ensure t
:config
(setq cowsay-directories '("/usr/share/cowsay/cows")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; cowsayx-sclock

(defun cypher/cowsayx-sclock (in-minutes message)
  (interactive "nSet the time from now - min.: \nsWhat: ")
  (run-at-time (* in-minutes 60)
               nil
               (lambda ()
                 (message "%S" message)
                 (shell-command (format "xcowsay %s" (shell-quote-argument message))))))

(global-set-key [67108897] 'cowsayx-sclock)
;; C-!

;; (global-set-key [67108897] 'call-xcowsay)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; eaf functions
;; browse-url-xdg-open functions

;; biblehub

(defun cypher/biblehub ()
  "Open BIBLEHUB for exegesis."
  (interactive)
  ;; (eaf-open-browser "https://www.biblehub.com")
  (browse-url-xdg-open "https://www.biblehub.com")
  )

(define-key evil-normal-state-map (kbd "SPC cn") #'cowsayx-sclock)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; blueletterbible

(defun cypher/blueletterbible()
  "Open BLUELETTERBIBLE for exegesis."
  (interactive)
  ;; (eaf-open-browser "https://www.blueletterbible.org")
  (browse-url-xdg-open "https://www.blueletterbible.org")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; bibleref

(defun cypher/bibleref()
  "Open BIBLEREF for Bible-online commentary."
  (interactive)
  ;; (eaf-open-browser "https://www.bibleref.com")
  (
   browse-url-xdg-open  "https://www.bibleref.com"
   )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; gotquestions

(defun cypher/gotquestions()
  "Open GOTQUESTIONS for exegesis."
  (interactive)
  ;; (eaf-open-browser "https://www.gotquestions.org")
  (
   browse-url-xdg-open  "https://www.gotquestions.org"
   )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; forvo dictionary

(defun cypher/forvo()
  "Open FORVO for searching words."
  (interactive)
  ;; (eaf-open-browser "https://www.forvo.com")
  (browse-url-xdg-open "https://www.forvo.com")
  )

;; youdao-dictionary for Chinese
;; https://github.com/xuchunyang/youdao-dictionary.el

(setq url-automatic-caching t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; google-no-maps
;; Real maps and not google fake ones

(defun cypher/google-no-maps()
  "Open Google-no-maps for searching real maps."
  (interactive)
  ;; (eaf-open-browser "https://www.davidrumsey.com")
  (browse-url-xdg-open "https://www.davidrumsey.com")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; stepbible

(defun cypher/step-bible()
  "Open STEPBIBLE for exegesis."
  (interactive)
  ;; (eaf-open-browser "https://www.stepbible.org")
  (browse-url-xdg-open "https://www.stepbible.org")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; shoutcast radio stations

(defun cypher/shoutcast()
  "Open SHOUTCAST for searching radio stations."
  (interactive)
  ;; (eaf-open-browser "https://directory.shoutcast.com/Search")
  (browse-url-xdg-open "https://directory.shoutcast.com/Search")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; icecast radio stations

(defun cypher/icecast ()
  (interactive)
  "Open ICECAST for radio stations."
  ;; (eaf-open-browser "http://dir.xiph.org/search")
  (browse-url-xdg-open "http://dir.xiph.org/search")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; programming idioms

(defun cypher/idioms-prog ()
  (interactive)
  "Open IDIOMS-PROG."
  ;; (eaf-open-browser "https://programming-idioms.org")
  (browse-url-xdg-open "https://programming-idioms.org")
  )

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; transparency
;; https://www.pygopar.com/setting-emacs-transparency
;; 70 x 20 is good

(defun set-transparency (onfocus notfocus)
  "Set the transparency for emacs. Values are from 0 - 100"
  (interactive "nOn Focus: \nnOn Unfocus: ")
  (set-frame-parameter (selected-frame) 'alpha (list onfocus notfocus)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; consult

(use-package consult
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO empv - mpv player
;; https://github.com/isamert/empv.el

(add-to-list 'load-path "~/.emacs.d/local-repo/empv.el")
(load-file "~/.emacs.d/local-repo/empv.el/consult-empv.el")

(setq empv-invidious-instance
      "https://invidious.exonip.de/api/v1"
      ;; "https://vid.puffyan.us/api/v1" -> good
      ;; "https://invidious.kavin.rocks/api/v1" -> no-good
      ;; "https://invidious.tube/api/v1"
      ;; "https://yewtu.be/api/v1"
      ;; "https://invidious.048596.xyz/api/v1"
      ;; "https://some-invidious-instance.com/api/v1"
      )

 (require 'empv)
 (require 'consult-empv)

 (add-to-list 'empv-mpv-args "--ytdl-format=best")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ytel - youtube-watch
;; https://github.com/gRastello/ytel
;; https://api.invidious.io/ - instances

(use-package ytel
 :ensure t)

(defvar invidious-instances-url
      "https://api.invidious.io/instances.json?pretty=1&sort_by=health")

(defun ytel-instances-fetch-json ()
  "Fetch list of invidious instances as json, sorted by health."
  (let
      ((url-request-method "GET")
       (url-request-extra-headers
        '(("Accept" . "application/json"))))
    (with-current-buffer
        (url-retrieve-synchronously invidious-instances-url)
      (goto-char (point-min))
      (re-search-forward "^$")
      (let* ((json-object-type 'alist)
             (json-array-type 'list)
             (json-key-type 'string))
        (json-read)))))

(defun ytel-instances-alist-from-json ()
  "Make the json of invidious instances into an alist."
  (let ((jsonlist (ytel-instances-fetch-json))
        (inst ()))
    (while jsonlist
      (push (concat "https://" (caar jsonlist)) inst)
      (setq jsonlist (cdr jsonlist)))
    (nreverse inst)))

(defun ytel-choose-instance ()
  "Prompt user to choose an invidious instance to use."
  (interactive)
  (setq ytel-invidious-api-url
        (or (condition-case nil
                (completing-read "Using instance: "
                                 (subseq (ytel-instances-alist-from-json) 0 11) nil "confirm" "https://") ; "healthiest" 12 instances; no require match
              (error nil))
            "https://invidious.tube"))) ; fallback

;; default fallback "https://invidious.synopyta.org"

 (defun ytel-watch ()
   "Stream video at point in mpv."
   (interactive)
   (let* ((video (ytel-get-current-video))
      	 (id    (ytel-video-id video)))
     (start-process "ytel mpv" nil
 		   "mpv"
 		   (concat "https://www.youtube.com/watch?v=" id))
     "--ytdl-format=bestvideo[height<=?720]+bestaudio/best")
   (message "Starting streaming..."))

;; (define-key ytel-mode-map "y" #'ytel-watch)

;; youtube-comments

;; https://github.com/xFA25E/ytel-show
;; (use-package! ytel-show
;;   :after ytel
;;   :bind (:map ytel-mode-map ("RET" . ytel-show))
;;   )


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Lua

(use-package lua-mode
               :ensure t)

(add-to-list 'load-path "~/.emacs.d/local-repo/lua")
(require 'ob-lua)

(defun cypher/org-macro-luadoc-code (func &optional section desc)
  (org-link-make-string
   (concat "https://www.lua.org/manual/5.4/manual.html#"
           (cypher/org-if-str func section))
   (cypher/org-if-str func desc)))

(defun cypher/org-macro-luafun-code (func &optional desc)
  (org-link-make-string
   (concat "https://www.lua.org/manual/5.4/manual.html#"
           (concat "pdf-" func))
   (cypher/org-if-str (concat "=" func "()=") desc)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [[file:init.org::*People with great emacs configs][People with great emacs configs:1]]

;; People with great emacs configs:1 ends here

;; [[file:init.org::*Org-mode tutorials][Org-mode tutorials:1]]

;; Org-mode tutorials:1 ends here

;; [[file:init.org::*byte-compile-warnings][byte-compile-warnings:1]]
;; cl-lib
(with-no-warnings (require 'cl-lib)
                  (setq byte-compile-warnings '(cl-functions
                                                free-vars unsolved callargs redefine obsolete macro
                                                noruntime interactive-only)))
;; byte-compile-warnings:1 ends here
(put 'dired-find-alternate-file 'disabled nil)
