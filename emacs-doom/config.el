;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Vagner Rener"
      user-mail-address "vagnerrener@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org~/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; small-hacks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Cedilla in Emacs
;; keyboard - setxkbmap us_intl
;; then start Emacs like so:

;; "LANG=C emacs &"
;; "LANG=C emacs -Q &"

;; or use the scripts:
;; "~/bin/emacsCedilla.sh"
;; "~/bin/emacsVanCedilla"

;; see "~/init_cybertron.md" for mor details

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; abbreviations

;; (setq-default abbrev-mode t)
;; (read-abbrev-file "~/.emacs.d/abbrev_defs")
;; (setq save-abbrevs t)
;; (setq save-abbrevs 'silently)

;; (define-key ctl-x-map "\C-i"
;;   #'endless/ispell-word-then-abbrev)

;; ;; "it remaps to 'C-x TAB'"
;; ;; Because "C-i" is the Stumpwm TM prefix-key

;; (defun endless/simple-get-word ()
;;   (car-safe (save-excursion (ispell-get-word nil))))

;; (defun endless/ispell-word-then-abbrev (p)
;;   "Call `ispell-word', then create an abbrev for it.
;; With prefix P, create local abbrev. Otherwise it will
;; be global.
;; If there's nothing wrong with the word at point, keep
;; looking for a typo until the beginning of buffer. You can
;; skip typos you don't want to fix with `SPC', and you can
;; abort completely with `C-g'. You can edit the abbreviation
;; file with `edit-abbrevs`"
;;   (interactive "P")
;;   (let (bef aft)
;;     (save-excursion
;;       (while (if (setq bef (endless/simple-get-word))
;;                  ;; Word was corrected or used quit.
;;                  (if (ispell-word nil 'quiet)
;;                      nil ; End the loop.
;;                    ;; Also end if we reach `bob'.
;;                    (not (bobp)))
;;                ;; If there's no word at point, keep looking
;;                ;; until `bob'.
;;                (not (bobp)))
;;         (backward-word)
;;         (backward-char))
;;       (setq aft (endless/simple-get-word)))
;;     (if (and aft bef (not (equal aft bef)))
;;         (let ((aft (downcase aft))
;;               (bef (downcase bef)))
;;           (define-abbrev
;;             (if p local-abbrev-table global-abbrev-table)
;;             bef aft)
;;           (message "\"%s\" now expands to \"%s\" %sally"
;;                    bef aft (if p "loc" "glob")))
;;       (user-error "No typo at or before point"))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; all-the-icons

;; (use-package! all-the-icons)

;; (use-package! all-the-icons-dired)

;; (use-package! dired-rainbow)

;; (use-package! all-the-icons-ivy)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; async

;; (use-package! async
;;   :init (dired-async-mode 1))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; amx - a fork of smex

;; (use-package! amx
;;   :config
;;   (amx-mode 1))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; ascii art to unicode

;; (defface aa2u-face '((t . nil))
;;   "Face for aa2u box drawing characters")
;; (advice-add #'aa2u-1c :filter-return
;;             (lambda (str) (propertize str 'face 'aa2u-face)))
;; (defun aa2u-org-brain-buffer ()
;;   (let ((inhibit-read-only t))
;;     (make-local-variable 'face-remapping-alist)
;;     (add-to-list 'face-remapping-alist
;;                  '(aa2u-face . org-brain-wires))
;;     (ignore-errors (aa2u (point-min) (point-max)))))
;; (with-eval-after-load 'org-brain
;;   (add-hook 'org-brain-after-visualize-hook #'aa2u-org-brain-buffer))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO auctex
;; ;; lines 714-860 -> init.el_good

;; ;; how to setup
;; ;; https://emacs.stackexchange.com/questions/37725/defining-custom-latex-class-for-org-mode-export
;; ;; https://orgmode.org/worg/org-tutorials/org-latex-export.html
;; ;; https://github.com/tsdye/org-article

;; (with-eval-after-load 'ox-latex
;;   (add-to-list 'org-latex-classes
;;                '("koma-article"
;;                  "\\documentclass{scrartcl}"
;;                  ("\\section{%s}" . "\\section*{%s}")
;;                  ("\\subsection{%s}" . "\\subsection*{%s}")
;;                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO company - lines : 1101-1190 init.el_good

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; bash

;; (add-hook 'shell-mode-hook 'yas-minor-mode)
;; (add-hook 'shell-mode-hook 'flycheck-mode)
;; (add-hook 'shell-mode-hook 'company-mode)

;; (use-package! company-shell
;;   :config
;;   (require 'company)
;;   (add-hook 'shell-mode-hook 'shell-mode-company-init))

;; (defun shell-mode-company-init ()
;;   (setq-local company-backends '((company-shell
;;                                   company-shell-env
;;                                   company-etags
;;                                   company-dabbrev-code))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; smart-hungry-delete

;; (use-package! smart-hungry-delete
;;   :bind (("<backspace>" . smart-hungry-delete-backward-char)
;;          ("C-d" . smart-hungry-delete-forward-char))
;;   :defer nil ;; dont defer so we can add our functions to hooks
;;   :config (smart-hungry-delete-add-default-hooks)
;;   )

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; close-all-buffers

;; (defun close-all-buffers ()
;;   "Kill all buffers without regard for their origin."
;;   (interactive)
;;   (mapc 'kill-buffer (buffer-list)))
;; (global-set-key (kbd "C-M-s-k") 'close-all-buffers)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO switch-window

;;  ;; (use-package! switch-window
;;  ;;    :config
;;  ;;    (setq switch-window-input-style 'minibuffer)
;;  ;;    (setq switch-window-increase 4)
;;  ;;    (setq switch-window-threshold 2)
;;  ;;    (setq switch-window-shortcut-style 'qwerty)
;;  ;;    (setq switch-window-qwerty-shortcuts
;;  ;;          '("a" "s" "d" "f" "j" "k" "l" "i" "o"))
;;  ;;    :bind
;;  ;; ([remap other-window] . switch-window))

;; (use-package! switch-window
;;   :bind
;;   ;; default C-x o is other-window
;;   ;; default C-x C-o is delete-blank-lines
;;   (("C-x o" . switch-window)
;;    ("C-x C-o" . switch-window))
;;   :config
;;   (setq switch-window-multiple-frames t)
;;   (setq switch-window-shortcut-style 'qwerty)
;;   ;; when Emacs is run as client, the first shortcut does not appear
;;   ;; "x" acts as a dummy; remove first entry if not running server
;;   (setq switch-window-qwerty-shortcuts '("x" "a" "s" "d" "f" "j" "k" "l" ";" "w" "e" "r" "u" "i" "o" "q" "t" "y" "p"))
;;   (setq switch-window-increase 3))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; follow window splits

;; (defun split-and-follow-horizontally ()
;;   (interactive)
;;   (split-window-below)
;;   (balance-windows)
;;   (other-window 1))
;; (global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

;; (defun split-and-follow-vertically ()
;;   (interactive)
;;   (split-window-right)
;;   (balance-windows)
;;   (other-window 1))
;; (global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; battery indicator

;; (use-package! fancy-battery
;;   :config
;;   (setq fancy-battery-show-percentage t)
;;   (setq battery-update-interval 15)
;;   (if window-system
;;       (fancy-battery-mode)
;;     (display-battery-mode)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; symon

;; (use-package! symon
;;   :bind
;;   ("s-h" . symon-mode))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; zapping to char

;; (use-package! zzz-to-char
;;   :bind ("M-z" . zzz-up-to-char))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; kill-ring

;; (setq kill-ring-max 100)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; popup-kill-ring

;; (use-package! popup-kill-ring
;;   :bind ("M-K" . popup-kill-ring))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; persistent scratch buffer

;; ;; (use-package! persistent-scratch
;; ;;   :config
;; ;;   (persistent-scratch-setup-default))

;; ;; a function to recreate the scratch buffer

;; (defun scratch ()
;;   "create a scratch buffer"
;;   (interactive)
;;   (switch-to-buffer-other-window (get-buffer-create "*scratch*"))
;;   (insert initial-scratch-message)
;;   (org-mode))

;; ;; https://alhassy.github.io/init/
;; ;; initial-scratch-message
 (setq initial-scratch-message (concat
                                "#+Title: 'Vagner Rener' @ 'Cypherwarrior"
                                "\n# This buffer is for text that is not saved, and for Lisp evaluation."
                                "\n# To create a file, visit it with 'C-x C-f' e and enter text in its buffer.\n"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; zoom-frm for hycontrol
;; (add-load-path! "~/.emacs.d/local-repo/zoom-frm")
;; (require 'zoom-frm)

;; (define-key ctl-x-map [(control ?+)] 'zoom-in/out)
;; (define-key ctl-x-map [(control ?-)] 'zoom-in/out)
;; (define-key ctl-x-map [(control ?=)] 'zoom-in/out)
;; (define-key ctl-x-map [(control ?0)] 'zoom-in/out)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; theme and theme-looper

 (use-package! theme-looper)

 (use-package! color-theme-modern)

 (use-package! alect-themes)

 ;; Load a nice theme if in GUI
 (when (display-graphic-p)
   (load-theme 'renegade t)
   )

 (global-set-key (kbd "<C-f8>") 'theme-looper-enable-random-theme)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; centered-window
;; (use-package! centered-window)
;; (require 'centered-window)
;; (centered-window-mode 1)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO ask to fix this in Doom github
;; ;; bug-hunter
;; ;; it does not work with packages where it has got "package!"

;; (use-package! bug-hunter)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; portuguese-prefix

;; (set-input-method "portuguese-prefix")

;; (defadvice switch-to-buffer (after activate-input-method activate)
;;   (activate-input-method "portuguese-prefix"))

;; (add-hook 'text-mode-hook
;;           (lambda () (set-input-method "portuguese-prefix")))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; file-path

;; (setq uniquify-buffer-name-style 'reverse)
;; (setq inhibit-default-init t)
;; ;; (setq-default frame-title-format "%b (%f)")
;; (setq-default frame-title-format "-> %f")
;; (global-set-key "\M-n" "\C-u1\C-v")
;; (global-set-key "\M-p" "\C-u1\M-v")

;; ;; brazilian-holidays

;; (load! "~/.emacs.d/local-repo/emacs-brazilian-holidays/brazilian-holidays.el")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Xah-hacks

;; ;; http://ergoemacs.org/emacs/modernization_formfeed.html
;; ;; keys for moving to prev/next code section (Form Feed; ^L)
;; (global-set-key (kbd "<C-M-prior>") 'backward-page) ; Ctrl+Alt+PageUp
;; (global-set-key (kbd "<C-M-next>") 'forward-page)   ; Ctrl+Alt+PageDown
;; (delete-selection-mode 1)
;; (cua-mode -1) ; 1 disables "Ctrl-Alt" in orgmode

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; kill-word improved

;; (defun cypher/kill-inner-word ()
;;   "Kills the entire word your cursor is in. Equivalent to 'ciw' in vim."
;;   (interactive)
;;   (forward-char 1)
;;   (backward-word)
;;   (kill-word 1))
;; (global-set-key (kbd "C-c i w") 'cypher/kill-inner-word)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; copy-word improved

;; (defun cypher/copy-whole-word ()
;;   (interactive)
;;   (save-excursion
;;     (forward-char 1)
;;     (backward-word)
;;     (kill-word 1)
;;     (yank)))
;; (global-set-key (kbd "C-c w c") 'cypher/copy-whole-word)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; copy-line

;; (defun cypher/copy-whole-line ()
;;   "Copies a line without regard for cursor position."
;;   (interactive)
;;   (save-excursion
;;     (kill-new
;;      (buffer-substring
;;       (point-at-bol)
;;       (point-at-eol)))))
;; (global-set-key (kbd "C-c l c") 'cypher/copy-whole-line)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; pretty-mode

;; (when window-system
;;   (use-package! pretty-mode
;;     :config
;;     (global-pretty-mode t)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; rainbow

;; (use-package! rainbow-mode
;;   :init
;;   (add-hook 'prog-mode-hook 'rainbow-mode))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; rainbow delimiters

;; (use-package! rainbow-delimiters
;;   :init
;;   (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (defun cypher-new-empty-buffer ()
;;   "Create a new empty buffer.
;;    New buffer will be named “untitled” or “untitled<2>”, “untitled<3>”, etc.

;;    It returns the buffer (for elisp programing).

;;    URL `http://ergoemacs.org/emacs/emacs_new_empty_buffer.html'
;;    Version 2017-11-01"
;;   (interactive)
;;   (let (($buf (generate-new-buffer "untitled")))
;;     (switch-to-buffer $buf)
;;     (funcall initial-major-mode)
;;     (setq buffer-offer-save t)
;;     $buf
;;     ))

;; (global-set-key (kbd "M-N") 'cypher-new-empty-buffer) ; Alt+N

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-cut-line-or-region
;; (defun cypher-cut-line-or-region ()
;;   "Cut current line, or text selection.
;;    When `universal-argument' is called first, cut whole buffer (respects `narrow-to-region').

;;    URL `http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html'
;;    Version 2015-06-10"
;;   (interactive)
;;   (if current-prefix-arg
;;       (progn ; not using kill-region because we don't want to include previous kill
;;         (kill-new (buffer-string))
;;         (delete-region (point-min) (point-max)))
;;     (progn (if (use-region-p)
;;                (kill-region (region-beginning) (region-end) t)
;;              (kill-region (line-beginning-position) (line-beginning-position 2))))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-copy-line-or-region

;; (defun cypher-copy-line-or-region ()
;;   "Copy current line, or text selection.
;;    When called repeatedly, append copy subsequent lines.
;;    When `universal-argument' is called first, copy whole buffer (respects `narrow-to-region').

;;    URL `http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html'
;;    Version 2018-09-10"
;;   (interactive)
;;   (if current-prefix-arg
;;       (progn
;;         (copy-region-as-kill (point-min) (point-max)))
;;     (if (use-region-p)
;;         (progn
;;           (copy-region-as-kill (region-beginning) (region-end)))
;;       (if (eq last-command this-command)
;;           (if (eobp)
;;               (progn )
;;             (progn
;;               (kill-append "\n" nil)
;;               (kill-append
;;                (buffer-substring-no-properties (line-beginning-position) (line-end-position))
;;                nil)
;;               (progn
;;                 (end-of-line)
;;                 (forward-char))))
;;         (if (eobp)
;;             (if (eq (char-before) 10 )
;;                 (progn )
;;               (progn
;;                 (copy-region-as-kill (line-beginning-position) (line-end-position))
;;                 (end-of-line)))
;;           (progn
;;             (copy-region-as-kill (line-beginning-position) (line-end-position))
;;             (end-of-line)
;;             (forward-char)))))))

;; (global-set-key (kbd "<C-M x>")  'cypher-cut-line-or-region) ; C-Alt x - cut
;; (global-set-key (kbd "<M->")  'cypher-copy-line-or-region) ; Alt->  - copy
;; (global-set-key (kbd "<M-p>") 'yank) ; Alt-p Uppercase - paste


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-copy-all-or-region
;; (defun cypher-copy-all-or-region ()
;;   "Put the whole buffer content to `kill-ring', or text selection if there's one.
;;    Respects `narrow-to-region'.
;;    URL `http://ergoemacs.org/emacs/emacs_copy_cut_all_or_region.html'
;;    Version 2015-08-22"
;;   (interactive)
;;   (if (use-region-p)
;;       (progn
;;         (kill-new (buffer-substring (region-beginning) (region-end)))
;;         (message "Text selection copied."))
;;     (progn
;;       (kill-new (buffer-string))
;;       (message "Buffer content copied."))))

;; (global-set-key (kbd "<M-T>")  'cypher-copy-all-or-region) ; Alt-T Uppercase - copy-all-or-region


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-cut-all-or-region
;; (defun cypher-cut-all-or-region ()
;;   "Cut the whole buffer content to `kill-ring', or text selection if there's one.
;;           Respects `narrow-to-region'.
;;           URL `http://ergoemacs.org/emacs/emacs_copy_cut_all_or_region.html'
;;           Version 2015-08-22"
;;   (interactive)
;;   (if (use-region-p)
;;       (progn
;;         (kill-new (buffer-substring (region-beginning) (region-end)))
;;         (delete-region (region-beginning) (region-end)))
;;     (progn
;;       (kill-new (buffer-string))
;;       (delete-region (point-min) (point-max)))))

;; (global-set-key (kbd "<M-U>")  'cypher-cut-all-or-region) ; Alt-U Uppercase - copy-all-or-region

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-paste-or-paste-previous

;; (defun cypher-paste-or-paste-previous ()
;;   "Paste. When called repeatedly, paste previous.
;; This command calls `yank', and if repeated, call `yank-pop'.
;; When `universal-argument' is called first with a number arg, paste that many times.
;; URL `http://ergoemacs.org/emacs/emacs_paste_or_paste_previous.html'
;; Version 2017-07-25"
;;   (interactive)
;;   (progn
;;     (when (and delete-selection-mode (region-active-p))
;;       (delete-region (region-beginning) (region-end)))
;;     (if current-prefix-arg
;;         (progn
;;           (dotimes ($i (prefix-numeric-value current-prefix-arg))
;;             (yank)))
;;       (if (eq real-last-command this-command)
;;           (yank-pop 1)
;;         (yank)))))

;; (global-set-key (kbd "<C-y>")  'cypher-paste-or-paste-previous)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-show-kill-ring
;; (defun cypher-show-kill-ring ()
;;   "Insert all `kill-ring' content in a new buffer named *copy history*.

;;  URL `http://ergoemacs.org/emacs/emacs_show_kill_ring.html'
;;  Version 2018-10-05"
;;   (interactive)
;;   (let (($buf (generate-new-buffer "*copy history*")))
;;     (progn
;;       (switch-to-buffer $buf)
;;       (funcall 'fundamental-mode)
;;       (setq buffer-offer-save t)
;;       (dolist (x kill-ring )
;;         (insert x "\n\u000cttt\n\n"))
;;       (goto-char (point-min)))
;;     (when (fboundp 'cypher-show-formfeed-as-line)
;;       (cypher-show-formfeed-as-line))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; manipulationg resgisters
;; ;; https://ftp.gnu.org/old-gnu/Manuals/emacs-21.2/html_chapter/emacs_12.html

;; ;; cypher-copy-to-register
;; (defun cypher-copy-to-register-1 ()
;;   ;;   "Copy current line or text selection to register 1.
;;   ;; See also: `xah-paste-from-register-1', `copy-to-register'.
;;   ;; URL `http://ergoemacs.org/emacs/elisp_copy-paste_register_1.html'
;;   ;; Version 2017-01-23"
;;   (interactive)
;;   (let ($p1 $p2)
;;     (if (region-active-p)
;;         (progn (setq $p1 (region-beginning))
;;                (setq $p2 (region-end)))
;;       (progn (setq $p1 (line-beginning-position))
;;              (setq $p2 (line-end-position))))
;;     (copy-to-register ?1 $p1 $p2)
;;     (message "Copied to register 1: 「%s」." (buffer-substring-no-properties $p1 $p2))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-paste-from-resgister
;; (defun cypher-paste-from-register-1 ()
;;   ;;   "Paste text from register 1.
;;   ;; See also: `xah-copy-to-register-1', `insert-register'.
;;   ;; URL `http://ergoemacs.org/emacs/elisp_copy-paste_register_1.html'
;;   ;; Version 2015-12-08"
;;   (interactive)
;;   (when (use-region-p)
;;     (delete-region (region-beginning) (region-end)))
;;   (insert-register ?1 t))

;; (global-set-key (kbd "s-1") 'cypher-copy-to-register-1) ; win-1
;; (global-set-key (kbd "s-2") 'cypher-paste-from-regester-1) ; win-2

;; ;; ;; you can set  files to registers, like so:
;; ;; ;; (set-register ?2 '(file . "~/.emacs.d/init.org"))
;; ;; ;; sets file "init.org" to register 2
;; ;; ;; see the gnu manual link above

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-append-to-register
;; (defun cypher-append-to-register-1 ()
;;   "Append current line or text selection to register 1.
;;  When no selection, append current line with newline char.
;;  See also: `xah-paste-from-register-1', `copy-to-register'.

;;  URL `http://ergoemacs.org/emacs/elisp_copy-paste_register_1.html'
;;  Version 2015-12-08"
;;   (interactive)
;;   (let ($p1 $p2)
;;     (if (region-active-p)
;;         (progn (setq $p1 (region-beginning))
;;                (setq $p2 (region-end)))
;;       (progn (setq $p1 (line-beginning-position))
;;              (setq $p2 (line-end-position))))
;;     (append-to-register ?1 $p1 $p2)
;;     (with-temp-buffer (insert "\n")
;;                       (append-to-register ?1 (point-min) (point-max)))
;;     (message "Appended to register 1: 「%s」." (buffer-substring-no-properties $p1 $p2))))

;; (global-set-key (kbd "M-I") 'cypher-append-to-register-1) ; M-I Uppercase

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-clear-register
;; (defun cypher-clear-register-1 ()
;;   "Clear register 1.
;;    See also: `xah-paste-from-register-1', `copy-to-register'.

;;    URL `http://ergoemacs.org/emacs/elisp_copy-paste_register_1.html'
;;    Version 2015-12-08"
;;   (interactive)
;;   (progn
;;     (copy-to-register ?1 (point-min) (point-min))
;;     (message "Cleared register 1.")))

;; (global-set-key (kbd "M-*") 'cypher-clear-register-1) ; M-*

;; ;; after copy Ctrl+c in Linux X11, you can paste by `yank' in emacs
;; (setq select-enable-clipboard t)

;; ;; after mouse selection in X11, you can paste by `yank' in emacs
;; (setq select-enable-primary t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; avy

;; (use-package avy
;;   :bind
;;   ("M-s" . avy-goto-char))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; mark-multiple

;; (use-package! mark-multiple
;;   :bind ("C-$" . 'mark-next-like-this))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; beacon

;; (use-package! beacon
;;   :defer 10
;;   :diminish beacon-mode
;;   :custom
;;   (beacon-push-mark 10)
;;   :config
;;   (beacon-mode +1))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; dtk

;; (use-package! dtk
;;   :bind (("C-c B" . dtk-bible))
;;   :custom
;;   (dtk-default-module "KJVA")
;;   (dtk-default-module-category "Biblical Texts")
;;   (dtk-word-wrap t))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; TODO diatheke
;; ;; I have to set up the keybindings

;; (use-package! diatheke)
;; (setq max-specpdl-size 5000)
;; (require 'diatheke)

;; (setq diatheke-bible "KJVA -f plain")

;; ;; (setq diatheke-bible "ESV -f plain -o s")

;; ;; you can set the Bible up inside the buffer with
;; ;; (diatheke-set-bible) + C-x e

;; ;; Keybindings already automatically loaded
;; ;; C-c C-b: select a bible translation
;; ;; C-c C-i: insert a passage
;; ;; C-c C-p: search for a phrase
;; ;; C-c C-m: search for multiple words
;; ;; C-c C-r: search by regex

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; sword-to-org

;; (add-load-path! "~/.emacs.d/local-repo/sword-to-org/")
;; (require 'sword-to-org)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; better-shell
;; ;;
;; (use-package! better-shell
;;   :bind (("C-'" . better-shell-shell)
;;          ("C->" . better-shell-remote-open)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;; shell-pop

;; (use-package! shell-pop
;;   :bind (("C-t" . shell-pop))
;;   :config
;;   (setq shell-pop-shell-type (quote ("ehell" "eshell" (lambda nil (eshell)))))
;;   (setq shell-pop-term-shell "eshell")
;;   ;; need to do this manually or not picked up by `shell-pop'
;;   (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; command-log

;; (use-package! command-log-mode
;;   :commands (command-log-mode global-command-log-mode)
;;   :bind ("C-c o" . clm/toggle-command-log-buffer))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-filelist

 (setq cypher-filelist
       '(
         ("init.el" . "~/.doom.d/init.el" )
         ("config.el" . "~/.doom.d/config.el" )
         ("packages.el" . "~/.doom.d/packages.el" )
         ("dotfiles" . "~/.dotfiles/")
         ("Documents" . "~/Documents/" )
         ("org~" . "~/org~/" )
         ("Download" . "~/Downloads/" )
         ("Music" . "~/Music/")
         ("Pictures" . "~/Pictures/" )
         ;; more here
         ) )

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ;; cypher-open-file-fast

 (defun cypher-open-file-fast ()
   "Prompt to open a file from `cypher-filelist'.
 URL 'http://ergoemacs.org/emacs/emacs_hotkey_open_file_fast.html'
 Version 2015-04-23"
   (interactive)
   (let ((ξabbrevCode
          (ido-completing-read "Open:" (mapcar (lambda (ξx) (car ξx)) cypher-filelist))))
     (find-file (cdr (assoc ξabbrevCode cypher-filelist)))))

 (global-set-key (kbd "C-´") 'cypher-open-file-fast)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-hydra

;; (defhydra cypher-hydra-window (global-map "C-c w")
;;   "Commands relating to window manipulation"
;;   ("h" windmove-left "move left")
;;   ("l" windmove-right "move right")
;;   ("j" windmove-down "move down")
;;   ("k" windmove-up "move up")
;;   ("q" delete-window "delete window")
;;   ("Q" kill-buffer-and-window "kill buffer, delete window")
;;   ("H" cypher-move-splitter-left "move splitter left")
;;   ("L" cypher-move-splitter-right "move splitter right")
;;   ("J" cypher-move-splitter-down "move splitter down")
;;   ("K" cypher-move-splitter-up "move splitter up")
;;   ("b" balance-windows)
;;   ("|" cypher-window-toggle-split-direction)
;;   ("s" split-window-below "split window (below)")
;;   ("v" split-window-right "split window (right)")
;;   (";" ace-window "select window" :exit t))

;;   (global-set-key (kbd "C-c i h") 'cypher-hydra-window/body)
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; debian stuff

;; (use-package! debian-el
;;   :defer t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; emacs-w3m
;; ;; (package! w3m) - add this to "packages.el"
;; ;; if needed

;; (use-package! w3m)
;; (require 'w3m-load)
;; ;;   (require 'mime-w3m)

;; ;; if this does not work, modify the file w3m.el itself inside /home/$USER/.emacs.d/elpa/w3m-*

;; (setq w3m-display-inline-images t)
;; (setq w3m-fill-column 80)
;; (setq w3m-default-display-inline-images t)
;; (setq w3m-default-save-directory "~/Downloads")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO eww browser
;; ;; find a keybind to this function

;; (when (fboundp 'eww)
;;   (defun cypher-rename-eww-buffer ()
;;     "Rename `eww-mode' buffer so sites open in new page.
;; URL `http://ergoemacs.org/emacs/emacs_eww_web_browser.html'
;; Version 2017-11-10"
;;     (let (($title (plist-get eww-data :title)))
;;       (when (eq major-mode 'eww-mode )
;;         (if $title
;;             (rename-buffer (concat "eww " $title ) t)
;;           (rename-buffer "eww" t)))))

;;   (add-hook 'eww-after-render-hook 'cypher-rename-eww-buffer))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; default browser
;; ;;  you can change to chormium

;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "firefox")

;; (setq browse-url-browser-function 'w3m-browse-url)
;; (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; ;; optional keyboard short-cut
;; (global-set-key "\C-xm" 'browse-url-at-point)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; eev

;; (use-package! eev)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; emacspeak eloud

;; (use-package! eloud
;;   ;;  :load-path "~/.emacs.d/straight/repos/eloud"
;;   :config
;;   (setq eloud-espeak-path "/usr/bin/espeak"))

;; (require 'eloud)

;; ;; (add-load-path! "~/.emacs.d/straight/repos/eloud/")
;; ;; (eloud-espeak-path "/usr/bin/espeak")
;; ;; (setq eloud-espeak-path "/usr/bin/espeak-ng -ven-gb -s 160")
;; ;; (setq eloud-espeak-path "/usr/bin/espeak -vpt -s 150")

;; ;; if you want to set espeak voice default pitch, you have to
;; ;; edit the file "/usr/lib/x86_64-linux-gnu/espeak-data/voices/en"

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; emacs-reveal

;; (add-load-path! "/home/vagner/.emacs.d/emacs-reveal")

;; ;; (setq oer-reveal-plugins nil)
;; ;; (setq oer-reveal-plugins t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO slime sly - conflict remove
;; ;; How to use sly with slynk-server

;; (if (or (not (memq 'slime-lisp-mode-hook lisp-mode-hook))
;;         noninteractive
;;         (prog1 (y-or-n-p "[sly] SLIME detected in `lisp-mode-hook', which causes keybinding conflicts.
;; Remove it for this Emacs session?")
;;           (warn
;;            "To restore SLIME in this session, customize `lisp-mode-hook'
;; and replace `sly-editing-mode' with `slime-lisp-mode-hook'.")
;;           (remove-hook 'lisp-mode-hook 'slime-lisp-mode-hook)))
;;     (add-hook 'lisp-mode-hook 'sly-editing-mode)
;;   (warn "`sly.el' loaded OK. To use SLY, customize `lisp-mode-hook' and
;; replace `slime-lisp-mode-hook' with `sly-editing-mode'."))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; emms-player

;; (use-package! emms-player-simple-mpv
;;   :after emms
;;   :config
;;   ;; Subpackages
;;   ;;  (use-package! emms-player-simple-mpv-e.g.time-display)
;;   ;;  (use-package! emms-player-simple-mpv-e.g.playlist-fname)
;;   ;;  (use-package! emms-player-simple-mpv-e.g.hydra)
;;   ;;  (use-package! emms-player-simple-mpv)
;;   ;;  (use-package! emms-player-simple-mpv-control-functions)

;;   (define-emms-simple-player-mpv my-mpv '(file url streamlist playlist)
;;     (concat "\\`\\(http[s]?\\|mms\\)://\\|"
;;             (apply #'emms-player-simple-regexp
;;                    "aac" "pls" "m3u"
;;                    emms-player-base-format-list))
;;     "mpv" "--no-terminal" "--force-window=no" "--audio-display=no")

;;   (emms-player-simple-mpv-add-to-converters
;;    'emms-player-my-mpv "." '(playlist)
;;    (lambda (track-name) (format "--playlist=%s" track-name)))

;;   (add-to-list 'emms-player-list 'emms-player-my-mpv))

;; ;; TODO fix this
;; ;;(use-package! emms-mark-ext)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; emms-get-lyrics

;; (use-package! emms)

;; (add-load-path! "~/.emacs.d/local-repo/emms-get-lyrics/")
;; (require 'emms-get-lyrics)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; epg-gpg2

;; (setq epg-gpg-program "/usr/bin/gpg2")
;; (setq epa-file t)
;; (epa-file-enable)
;; (setq epa-file-select-keys nil)
;; (setq epa-pinentry-mode 'loopback)
;; (setq pinentry-start t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; epresent

;; (use-package! epresent)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; free-keys

;; (use-package! free-keys)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; gtklp printer

;; (setq lpr-command "gtklp")
;; (setq ps-lpr-command "gtklp")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; hippie-expand

;; (fset 'my-complete-file-name
;;       (make-hippie-expand-function '(try-complete-file-name-partially
;;                                      try-complete-file-name)))
;; (global-set-key "\M-/" 'my-complete-file-name)
;; (global-set-key "\M-\\" 'comint-dynamic-complete-filename)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; hydra
;; (use-package! hydra)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; image-magick

;; (use-package! eimp)

;; (autoload 'eimp-mode "eimp" "Emacs Image Manipulation Package." t)
;; (add-hook 'image-mode-hook 'eimp-mode)

;; (defun do-org-show-all-inline-images ()
;;   (interactive)
;;   (org-display-inline-images t t))
;; (global-set-key (kbd "C-c C-x C v")
;;                 'do-org-show-all-inline-images)

;; ;; apt install aview
;; (defun asciiview (imagefile)
;;   ;; use asciiview (part of aatools) to render image file as text to buffer
;;   (interactive "fChoose image file: ")
;;   (save-excursion
;;     (with-current-buffer (pop-to-buffer (format "*asciiview %s*" imagefile))
;;       (insert
;;        (car (last (butlast
;;                    (split-string
;;                     (shell-command-to-string
;;                      (format
;;                       "echo q | asciiview -driver stdout -kbddriver stdin %s 2>/dev/null"
;;                       (shell-quote-argument imagefile)))
;;                     "^L")))))
;;       (view-mode))))

;; (autoload 'thumbs "thumbs" "Preview images in a directory." t)

;; ;; then M-x thumbs

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; imaxima

;; (defvar imaxima-fnt-size "Large")
;; (defvar imaxima-use-maxima-mode-flag t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; impatient-mode

;; (use-package! impatient-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; ipp printer

;; (add-load-path! "~/.emacs.d/local-repo/ipp")
;; (require 'ipp)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; jabber

;; (use-package! jabber
;;   :init
;;   ;; My accounts
;;   ;; Make sure the user-xmpp-account gets evaluated
;;   (setq jabber-account-list
;;         `(("vagnerrener@gmail.com" (:connection-type . starttls))))

;;   :config
;;   (progn
;;     ;; Show some info in the modeline
;;     (jabber-mode-line-mode 1)

;;     ;; Configuration variables
;;     (setq
;;      jabber-show-offline-contacts nil
;;      jabber-default-priority 30
;;      jabber-alert-message-hooks (quote
;;                                  (jabber-message-libnotify
;;                                   jabber-message-awesome
;;                                   jabber-message-wave
;;                                   jabber-message-scroll))
;;      jabber-message-alert-same-buffer nil
;;      jabber-roster-show-bindings nil
;;      jabber-auto-reconnect t
;;      jabber-chat-buffer-format "*-chat-%n-*"
;;      jabber-groupchat-buffer-format "*-groupchat-%n-*"
;;      jabber-muc-colorize-foreign t
;;      jabber-muc-colorize-local t
;;      jabber-muc-disable-disco-check t
;;      jabber-muc-private-buffer-format "*-muc-priv-%g-%n-*"
;;      jit-lock-stealth-time 16
;;      jabber-show-resources 'sometimes
;;      jabber-resource-line-format "         %j/%r%S [%p]"
;;      jabber-roster-buffer "*-roster-*"
;;      jabber-roster-line-format "  %u %a %-25n - %S"
;;      jabber-roster-show-title nil
;;      jabber-roster-subscription-display (quote
;;                                          (("none" . "   ")
;;                                           ("from" . "← ")
;;                                           ("to" . " →")
;;                                           ("both" . "←→")))
;;      ;; jabber-socks5-proxies (quote ("proxy.hsdev.com"))
;;      jabber-vcard-avatars-retrieve nil
;;      jabber-muc-disable-disco-check t
;;      jabber-muc-colorize-foreign t
;;      jabber-muc-colorize-local t
;;      jabber-muc-nick-saturation 0.35 ;; empirical value, suitable for my theme
;;      jabber-muc-nick-value 0.75

;;      ;; Make the MUCs
;;      jabber-muc-show-affiliation-changes nil
;;      jabber-muc-show-enter-presence nil
;;      jabber-muc-show-leave-messages nil
;;      jabber-muc-show-role-changes nil
;;      )


;;     ;; C-j is the prefix for all jabber command in the C-x map (so, C-x C-j precede all commands for jabber)
;;     ;; The default C-x map for emacs has a C-j entry which binds it to
;;     ;; dired-jump. This gets in the way of all the keyboard shortcuts for
;;     ;; jabber, so lets re-call the definition here, so we are sure we get
;;     ;; them.


;;     ;; Some face adjustments
;;     (add-hook 'jabber-chat-mode-hook
;;               (lambda ()
;;                 (set-face-attribute 'jabber-chat-prompt-system nil :foreground "dark gray" :weight 'bold))))

;;   :bind
;;   ("C-c C-SPC" . jabber-activity-switch-to))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; linguistic

;; (use-package! linguistic)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; lispy

;; (use-package! lispy)

;; (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

;; (defun conditionally-enable-lispy ()
;;   (when (eq this-command 'eval-expression)
;;     (lispy-mode 1)))

;; (add-hook 'minibuffer-setup-hook 'conditionally-enable-lispy)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cobol

;; (use-package! cobol-mode
;;   :config
;;   (setq auto-mode-alist
;;         (append
;;          '(("\\.cob\\'" . cobol-mode)
;;            ("\\.cbl\\'" . cobol-mode)
;;            ("\\.cpy\\'" . cobol-mode))
;;          auto-mode-alist)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; lorem-ipsum

;; (use-package! lorem-ipsum)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; lyrics
;; (use-package! lyrics)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; mingus
;; (use-package! mingus)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; mplayer-mode

;; (add-load-path! "~/.emacs.d/local-repo/mplayer-mode/")
;; (require 'mplayer-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; oer-reveal
;; (use-package! oer-reveal
;;   :config
;;   (require 'oer-reveal)
;;   (setq oer-reveal-plugins t))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; openwith

;; (use-package! openwith
;;   :config
;;   (setq openwith-associations '(("\\.mp4\\'" "smplayer" (file)))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-mode

;; (setq org-ellipsis " ")
;; (setq org-src-fontify-natively t)
;; (setq org-src-tab-acts-natively t)
;; (setq org-confirm-babel-evaluate nil)
;; (setq org-export-with-smart-quotes t)
;; (setq org-src-window-setup 'current-window)
;; (add-hook 'org-mode-hook 'org-indent-mode)

;; (global-set-key (kbd "C-c '") 'org-edit-src-code)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-agenda

;; ;; (require 'org)
;; ;;       (setq org-directory "~/~org/")
;; ;;       (define-key global-map "\C-cl" 'org-store-link)
;; ;;       (define-key global-map "\C-ca" 'org-agenda)
;; ;;       (setq org-log-done t)

;; (setq org-agenda-files (list "~/org~/appointments.org"
;;                              "~/org~/home.org"
;;                              "~/org~/studies.org"
;;                              "~/org~/work.org"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-babel
;; ;; active Babel languages

;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  (quote
;;   ((vala . t)
;;    (stan . t)
;;    (octave . t)
;;    (shen . t)
;;    (screen . t)
;;    (scheme . t)
;;    ;; (scala . t)
;;    (sass . t)
;;    (picolisp . t)
;;    (perl . t)
;;    (ocaml . t)
;;    (mscgen . t)
;;    (lilypond . t)
;;    (J . t)
;;    (ledger . t)
;;    (io . t)
;;    (hledger . t)
;;    (haskell . t)
;;    (fortran . t)
;;    (forth . t)
;;    (css . t)
;;    (maxima . t)
;;    (matlab . t)
;;    (emacs-lisp . t)
;;    (clojure . t)
;;    (awk . t)
;;    (makefile . t)
;;    (sqlite . t)
;;    (sql . t)
;;    (ruby . t)
;;    (R . t)
;;    (js . t)
;;    (java . t)
;;    (shell . t)
;;    (plantuml . t)
;;    (lisp . t)
;;    (latex . t)
;;    (gnuplot . t)
;;    (dot . t)
;;    (ditaa . t)
;;    (org . t)
;;    (calc . t)
;;    (C . t)
;;    (asymptote . t)
;;    (python . t)
;;    (emacs-lisp . t))))

;; (setq org-confirm-babel-evaluate nil)
;; (setq org-export-use-babel t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-brain

;; (defun org-brain-insert-resource-icon (link)
;;   "Insert an icon, based on content of org-mode LINK."
;;   (insert (format "%s "
;;                   (cond ((string-prefix-p "http" link)
;;                          (cond ((string-match "wikipedia\\.org" link)
;;                                 (all-the-icons-faicon "wikipedia-w"))
;;                                ((string-match "github\\.com" link)
;;                                 (all-the-icons-octicon "mark-github"))
;;                                ((string-match "vimeo\\.com" link)
;;                                 (all-the-icons-faicon "vimeo"))
;;                                ((string-match "youtube\\.com" link)
;;                                 (all-the-icons-faicon "youtube"))
;;                                (t
;;                                 (all-the-icons-faicon "globe"))))
;;                         ((string-prefix-p "brain:" link)
;;                          (all-the-icons-fileicon "brain"))
;;                         (t
;;                          (all-the-icons-icon-for-file link))))))

;; (add-hook 'org-brain-after-resource-button-functions #'org-brain-insert-resource-icon)

;; (use-package! org-brain)
;; (setq org-brain-path "~/org~/brain")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; For Evil users

;; (with-eval-after-load 'evil
;;   (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
;; (setq org-id-track-globally t)
;; (setq org-brain-file-entries-use-title nil)
;; (setq org-id-locations-file "~/org~/brain/.org-id-locations")
;; ;; (push '("b" "Brain" plain (function org-brain-goto-end)
;; ;;     "* %i%?")
;; ;;    org-capture-templates)
;; (setq org-brain-visualize-default-choices 'all)
;; (setq org-brain-title-max-length 12)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-bullets

;; (use-package! org-bullets)
;; (org-bullets-mode 1)
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Ox-hugo

;; (use-package! ox-hugo
;;   :after ox)

;; (require 'ox-hugo)
;; (require 'org-hugo-auto-export-mode)

;; ;;  (use-package org-capture
;; ;;    straight t nil
;; ;;    :config
;; ;;     (defun org-hugo-new-subtree-post-capture-template ()
;; ;; ;;      "Returns `org-capture' template string for new Hugo post.
;; ;; ;;    See `org-capture-templates' for more information."

;; ;;      (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
;; ;; 	 (fname (org-hugo-slug title)))
;; ;;        (mapconcat #'identity
;; ;; 	       `(,(concat "* TODO " title)
;; ;; 		 ":PROPERTIES:"
;; ;; 		 ,(concat ":EXPORT_HUGO_BUNDLE: " fname)
;; ;; 		 ":EXPORT_FILE_NAME: index"
;; ;; 		 ":END:"
;; ;; 		 "%?\n")                ;Place the cursor here finally
;; ;; 	       "\n")))
;; ;;    (add-to-list 'org-capture-templates
;; ;; 	     '("o"                ;`org-capture' binding + o
;; ;; 	       "Post"
;; ;; 	       entry
;; ;; 	       ;; It is assumed that below file is present in `org-directory'
;; ;; 	       ;; and that it has an "Ideas" heading. It can even be a
;; ;; 	       ;; symlink pointing to the actual location of all-posts.org!
;; ;; 	       (file+olp+datetree (concat org-directory "~/org~/blog/content/posts/my-post.org")
;; ;; "* TODO %^{Description}  %^g\n%?\nAdded: %U")
;; ;; 	       (function org-hugo-new-subtree-post-capture-template))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; easy-hugo
;; ;; (use-package! easy-hugo
;; ;;   :custom
;; ;;   (easy-hugo-basedir "~/Personal/devel/zzamboni.org/zzamboni.org/")
;; ;;   (easy-hugo-url "http://zzamboni.org/")
;; ;;   (easy-hugo-previewtime "300")
;; ;;   ;;(define-key global-map (kbd "C-c C-e") 'easy-hugo)
;; ;;   )

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Org-cliplink

;; (use-package! org-cliplink)

;; (defun org-brain-cliplink-resource ()
;;   "Add a URL from the clipboard as an org-brain resource.
;; Suggest the URL title as a description for resource."
;;   (interactive)
;;   (let ((url (org-cliplink-clipboard-content)))
;;     (org-brain-add-resource
;;      url
;;      (org-cliplink-retrieve-title-synchronously url)
;;      t)))

;; ;; TODO fix this keybind
;; ;; (global-set-key (kbd "M-x p i") 'org-cliplink)

;; ;; (define-key org-brain-visualize-mode-map (kbd "L") #'org-brain-cliplink-resource)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-download

;; (use-package! org-download
;;   :config
;;   ;; add support to dired
;;   (add-hook 'dired-mode-hook 'org-download-enable))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-drill

;; (use-package! org-drill)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-drill-table

;; (use-package! org-drill-table)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-chef

;; (use-package! org-chef)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-evil

;; ;; (use-package! org-evil)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org hydra

;; (defhydra hydra-org-state ()
;;   ;; basic navigation
;;   ("i" org-cycle)
;;   ("I" org-shifttab)
;;   ("h" org-up-element)
;;   ("l" org-down-element)
;;   ("j" org-forward-element)
;;   ("k" org-backward-element)
;;   ;; navigating links
;;   ("n" org-next-link)
;;   ("p" org-previous-link)
;;   ("o" org-open-at-point)
;;   ;; navigation blocks
;;   ("N" org-next-block)
;;   ("P" org-previous-block)
;;   ;; updates
;;   ("." org-ctrl-c-ctrl-c)
;;   ("*" org-ctrl-c-star)
;;   ("-" org-ctrl-c-minus)
;;   ;; change todo state
;;   ("H" org-shiftleft)
;;   ("L" org-shiftright)
;;   ("J" org-shiftdown)
;;   ("K" org-shiftup)
;;   ("t" org-todo))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-journal
;; ;; https://github.com/bastibe/org-journal

;; (use-package! org-journal)

;; (customize-set-variable 'org-journal-dir "~/org~/journal/")
;; (customize-set-variable 'org-journal-date-format "%A, %d %B %Y")

;; (customize-set-variable 'org-journal-enable-agenda-integration t)
;; (customize-set-variable 'org-journal-carryover-items nil)
;; (customize-set-variable 'org-journal-enable-agenda-integration t)

;; (setq org-journal-enable-agenda-integration t
;;       org-icalendar-store-UID t
;;       org-icalendar-include-todo "all"
;;       org-icalendar-combined-agenda-file "~/org~/org-journal.ics")

;; (global-set-key (kbd "C-c C-v") 'org-journal-search)
;; (global-set-key (kbd "C-c C-g") 'org-journal-open-next-entry)
;; (global-set-key (kbd "C-c C-h") 'org-journal-open-previous-entry)
;; (global-set-key (kbd "C-c j") 'org-journal-new-entry)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-mac-link

;; (add-hook 'org-mode-hook (lambda ()
;;                            (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-mind-map

;; (use-package! org-mind-map
;;   :init
;;   (require 'ox-org))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-super-agenda

;; (use-package! org-super-agenda
;;   :after org-agenda
;;   :config
;;   (org-super-agenda-mode)

;;   (setq
;;    org-super-agenda-header-separator ""
;;    org-super-agenda-unmatched-name "Other"
;;    org-super-agenda-groups
;;    '(
;;      ;; Each group has an implicit OR operator between its selectors.
;;      (:name "Today"  ; Optionally specify section name
;;       :time-grid t  ; Items that appear on the time grid.
;;       :todo "TODAY"   ; Items that have this todo keyword.
;;       )
;;      (:name "Work"
;;       :category "work"
;;       :tag "work"
;;       )
;;      (:name "High Priority"
;;       :priority "A"
;;       :order 1
;;       )
;;      (:name "Physical"
;;       :category "physical"
;;       :tag "physical"
;;       :order 2
;;       )
;;      (:name "Shopping List"
;;       :category "shopping"
;;       :tag "shopping"
;;       :order 3
;;       )
;;      (:name "Cleaning"
;;       :category "cleaning"
;;       :tag "cleaning"
;;       :order 4
;;       )
;;      (:name "Hygiene"
;;       :category "hygiene"
;;       :tag "hygiene"
;;       :order 5
;;       )
;;      (:name "Health"
;;       :category "health"
;;       :tag "health"
;;       :order 6
;;       )
;;      (:name "Financial"
;;       :category "financial"
;;       :tag "financial"
;;       :order 7
;;       )

;;      ;; After the last group, the agenda will display items that didn't
;;      ;; match any of these groups, with the default order position of 99

;;      (:name "Tech"
;;       :category "tech"
;;       :tag "tech"
;;       :order 180
;;       )
;;      (:name "To Read"
;;       :category "read"
;;       :tag "read"
;;       :order 181
;;       )
;;      (:name "To Watch"
;;       :category "watch"
;;       :tag "watch"
;;       :order 182
;;       )
;;      (:todo "WAITING" :order 190)
;;      ;; (:name "Low priority"
;;      ;;        :priority "C"
;;      ;;        :order 200)
;;      )))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-present

;; (use-package! org-present
;;   :config
;;   (setq org-present-text-scale 15)
;;   (add-hook 'org-present-mode-hook
;;             (defun org-present/start ()
;;               (org-present-big)
;;               (org-present-read-only)))
;;   (add-hook 'org-present-mode-quit-hook
;;             (defun org-present/start ()
;;               (org-present-small)
;;               (org-present-read-write))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-present-remote

;; (use-package! org-present-remote)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; fakir

;; (use-package! fakir)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-protocol

;; (require 'org-protocol)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-recur
;; ;; Recurring org-mode tasks.

;; (use-package! org-recur
;;   :after org
;;   :bind (
;;          :map org-recur-mode-map

;;          ("C-c d" . org-recur-finish)
;;          ("C-c 0" . org-recur-schedule-today)
;;          ("C-c 1" . org-recur-schedule-1)
;;          ("C-c 2" . org-recur-schedule-2)

;;          :map org-recur-agenda-mode-map

;;          ;; Rebind the 'd' key in org-agenda (default: `org-agenda-day-view').
;;          ("d" . org-recur-finish)
;;          ("0" . org-recur-schedule-today)
;;          ("1" . org-recur-schedule-1)
;;          ("2" . org-recur-schedule-2)
;;          ("C-c d" . org-recur-finish)
;;          ("C-c 0" . org-recur-schedule-today)
;;          ("C-c 1" . org-recur-schedule-1)
;;          ("C-c 2" . org-recur-schedule-2)
;;          )
;;   :hook ((org-mode . org-recur-mode)
;;          (org-agenda-mode . org-recur-agenda-mode))
;;   :demand t
;;   :config
;;   (defun org-recur-schedule-1 ()
;;     (interactive)
;;     (org-recur-schedule-date "|+1|"))
;;   (defun org-recur-schedule-2 ()
;;     (interactive)
;;     (org-recur-schedule-date "|+2|"))

;;   (setq org-recur-finish-done t
;;         org-recur-finish-archive t)
;;   )

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-refile

;; (setq org-refile-targets '((nil :maxlevel . 9)
;;                            (org-agenda-files :maxlevel . 9)))
;; (setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
;; (setq org-refile-use-outline-path t)                  ; Show full paths for refiling

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-re-reveal
;; ;;
;; (use-package! org-re-reveal
;;   :config
;;   (setq org-re-reveal-root "file:/home/vagner/reveal-slides/reveal.js")
;;   (require 'org-re-reveal)
;;   ;;     (setq oer-reveal-plugins t)
;;   (setq org-re-reveal-hlevel 2))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-re-reveal-ref
;; ;;
;; (use-package! org-re-reveal-ref
;;   :config
;;   (require 'org-re-reveal-ref))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-reveal
;; ;; Note: give the ABSOLUTE PATH to reveal.js
;; ;; Otherwise it will not work

;; ;; this work only with internet connection
;; ;; (setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
;; ;; (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")

;; ;; this work without internet connection
;; ;; (setq org-reveal-root "file:/home/vagner/reveal-slides/reveal.js")

;; ;; if it does not load, do:
;; ;; Alt-x load-library RET ox-reveal
;; ;;
;; ;; ox-reveal

;; (use-package! ox-reveal
;;   :after  org
;;   :custom
;;   (org-reveal-root "file:/home/vagner/reveal-slides/reveal.js"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; htmlize
;; ;;
;; (use-package! htmlize
;;   :after  ox-reveal
;;   :config
;;   (setq org-reveal-hlevel 2)
;;   (setq org-reveal-mathjax t))

;; ;; To load Org-reveal, type “Alt-x load-library”, then type “ox-reveal”.
;; ;; ~/reveal-slides/reveal.js$ npm start - you have to start the server
;; ;; for viewing your slides and using the remote control
;; ;; Now you can export this manual into Reveal.js presentation by typing “C-c C-e R B”.
;; ;; Open the generated “Readme.html” in your browser and enjoy the cool slides.
;; ;;

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-tree-slide

;; (use-package! org-tree-slide
;;   :config
;;   (add-hook 'org-tree-slide-mode-hook
;;             (lambda ()
;;               (if org-tree-slide-mode
;;                   ;; When mode is enabled
;;                   (progn (setq wolfe--enable-transient-map t)
;;                          (wolfe/org-tree-set-transient-map))
;;                 ;; When mode is disabled
;;                 (setq wolfe--enable-transient-map nil)))))

;; (defun wolfe/org-tree-set-transient-map ()
;;   (interactive)
;;   (if wolfe--enable-transient-map
;;       (let ((map (make-sparse-keymap)))
;;         (define-key map (kbd "<right>") 'org-tree-slide-move-next-tree)
;;         (define-key map (kbd "<left>")  'org-tree-slide-move-previous-tree)
;;         (define-key map (kbd "<up>")    'org-tree-slide-content)
;;         (define-key map (kbd "<down>")  'org-tree-slide-display-header-toggle)
;;         (set-transient-map map nil 'wolfe/org-tree-set-transient-map))
;;     (makeunbound wolfe--enable-transient-map)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; ox-pandoc

;; (use-package! ox-pandoc)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; ox-spectacle

;; (use-package! ox-spectacle)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; pastbin

;; (use-package! debpaste)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; ix

;; (use-package! ix)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; pdf-tools
;; (use-package! pdf-tools
;;   :config
;;   (pdf-tools-install)
;;   (add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1))))

;; ;; (add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-pdfview
;; ;; you have to disable linum-mode for
;; ;; this to work without lagging

;; (use-package! org-pdfview)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; persistent-soft

;; (use-package! persistent-soft
;;   :config
;;   (persistent-soft-store 'hundred 100 "mydatastore")
;;   (persistent-soft-fetch 'hundred "mydatastore")    ; 100
;;   (persistent-soft-fetch 'thousand "mydatastore"))   ; nil

;; ;; quit and restart Emacs

;; (persistent-soft-fetch 'hundred "mydatastore")    ; 100

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; perspective

;; (use-package! perspective)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; php-mode
;; (use-package! php-mode)

;; (use-package! ac-php)

;; (use-package! phpunit
;;   :config
;;   (setq phpunit-configuration-file "phpnit.xml")
;;   (setq phpunit-root-directory "./"))

;; (use-package! php-auto-yasnippets)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; php-ext
;; (setq php-ext-path "~/.emacs.d/local-repo/php-ext/")
;; (load (concat php-ext-path "php-ext.el"))

;; ;; (add-load-path! "~/.emacs.d/local-repo/php-ext")
;; ;; (require 'php-ext)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO plantuml

;; (setq org-plantuml-jar-path "/usr/share/plantuml/plantuml.jar")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; poetry
;; ;; It is not the same poetry package for writing poetry
;; ;; it is an interface for python poetry package tool

;; (use-package! poetry)

;; ;; This is the poetry-rhyme for writing poetry
;; ;; you need to install the rhyme cli
;; ;; you have to install "~/Downloand/rhyme_4_poetry.el

;; (add-load-path! "~/.emacs.d/local-repo/poetry")
;; (require 'poetry)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; *poly-markdown
;; (use-package! poly-markdown
;;   :config
;;   (add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; powerline

;; (use-package! powerline)

;; (require 'powerline)
;; (powerline-default-theme)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; prolog
;; (autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
;; (autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
;; (autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
;; (setq prolog-system 'swi)
;; (setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
;;                                 ("\\.m$" . mercury-mode))
;;                               auto-mode-alist))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; python

;; (use-package! python)

;; (setq python-shell-interpreter "/usr/bin/python3")

;; (use-package! evil-python-movement)

;; ;;  Only spaces - python indentation

;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (setq indent-tabs-mode nil)
;;             (setq python-indent-offset 4)
;;             (setq tab-width 4))
;;           (untabify (point-min) (point-max)))

;; (use-package! pydoc)

;; (use-package! helm-pydoc)

;; ;; Only tabs - python indentation

;; ;; (add-hook 'python-mode-hook
;; ;;          (lambda ()
;; ;;            (setq indent-tabs-mode t)
;; ;;            (setq python-indent 3)
;; ;;            (setq tab-width 3))
;; ;;          (tabify (point-min) (point-max)))

;; ;; You can start a jupyter-src block with:

;; (use-package! jupyter
;;   :defer t
;;   :init
;;   (setq org-babel-default-header-args:jupyter-python '((:async . "yes")
;;                                                        (:session . "py")
;;                                                        (:kernel . "python3"))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; re-builder

;; (use-package! re-builder
;;   :config
;;   (setq reb-re-syntax 'string))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; restart-emacs

;; (use-package! restart-emacs)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; ripgrep

;; (use-package! ripgrep)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; rust

;; (use-package! rust-mode
;;   :config
;;   (setq rust-format-on-save t)
;;   (add-hook 'rust-mode-hook
;;             (lambda () (setq indent-tabs-mode nil)))
;;   (add-hook 'rust-mode-hook
;;             (lambda ()
;;               (local-set-key (kbd "C-c <tab>") #'rust-format-buffer))))

;; (require 'rust-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package! cargo
;;   :config
;;   (setq racer-cmd "~/.cargo/bin/cargo") ;; cargo binaries PATH
;;   (add-hook 'rust-mode-hook 'cargo-minor-mode))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; racer-rust

;; (use-package! racer
;;   :config
;;   (setq racer-cmd "~/.cargo/bin/racer") ;; rustup binaries PATH
;;   (setq racer-rust-src-path "~/rust/src") ;; Rust  source code PATH
;;   (add-hook 'rust-mode-hook #'racer-mode)
;;   (add-hook 'racer-mode-hook #'eldoc-mode)
;;   )

;; (use-package! flycheck-rust
;;   :config
;;   (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; (setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "~/.cargo/bin")))
;; (setq exec-path (append exec-path (list (expand-file-name "~/.cargo/bin"))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; save-place

;; (require 'saveplace)
;; (save-place-mode 1)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; simple-mpc

;; (use-package! simple-mpc)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; synonyms and thesaurus

;; (use-package! synonyms
;;   ;; :disabled
;;   :init
;;   :config
;;   (setq synonyms-file "~/thesaurus/mthesaur.txt")
;;   (setq synonyms-file "~/thesaurus/brazilian-synonyms.txt")
;;   (setq synonyms-cache-file "~/thesaurus/thes.cache")
;;   (global-set-key (kbd "C-*") 'synonyms))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; powerthesaurus

;; (use-package! powerthesaurus
;;   :config
;;   (defun powerthesaurus-lookup-word-at-point ()
;;     "Find the word at point synonyms at powerthesaurus.org."
;;     (interactive)
;;     (if (region-active-p)
;;         (powerthesaurus-lookup-word (region-beginning) (region-end))
;;       (save-mark-and-excursion
;;         (when (not (looking-at "\\<"))
;;           (backward-word))
;;         (set-mark (point))
;;         (forward-word)
;;         (activate-mark)
;;         (powerthesaurus-lookup-word (region-beginning) (region-end)))))
;;   (global-set-key (kbd "C-M-x") 'powerthesaurus-lookup-word-at-point)
;;   (global-set-key (kbd "C-M-y") 'powerthesaurus-lookup-word))

;; ;;  (evil-leader/set-key "s" 'powerthesaurus-lookup-word-at-point)
;; ;;  (evil-leader/set-key "S" 'powerthesaurus-lookup-word))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; telega
;; ;;this telega is not from elpa repo
;; ;;it is in /home/vagner/emacs.d/straight/repos/telega.el
;; ;;just delete its directory if it complains about the server

;; ;; (use-package telega
;; ;;  :straight t
;; ;;  :bind
;; ;;   (:map telega-msg-button-map
;; ;;     ("j" . nil)
;; ;;     ("k" . nil)
;; ;;     ("h" . nil)
;; ;;     ("l" . nil))
;; ;;     :custom (telega-notifications-mode t))

;; ;;this telega is from melpa repo
;; ;;it is in /home/vagner/emacs.d/straight/repos/telega.el
;; ;;just delete its directory if it complains about the server

;; (use-package telega
;;   :bind
;;   (:map telega-msg-button-map
;;    ("j" . nil)
;;    ("k" . nil)
;;    ("h" . nil)
;;    ("l" . nil))
;;   :custom (telega-notifications-mode t))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; text-scale
;; ;; (global-set-key (kbd "C-M-=") 'default-text-scale-increase)
;; ;; (global-set-key (kbd "C-M--") 'default-text-scale-decrease)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; theme-magic

;; ;;     (package! theme-magic)

;; ;;   (require 'theme-magic)
;; ;;   (theme-magic-export-theme-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; time in modeline

;; (setq display-time-default-load-average nil)
;; (setq display-time-interval 1)
;; (setq display-time-format "%d|%m-%a|%r")
;; (display-time-mode +1)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; tiny-tools

;; (add-load-path! "~/.emacs.d/local-repo/tiny-tools")
;; (add-load-path! "~/.emacs.d/local-repo/tiny-tools/lisp/tiny")
;; (add-load-path! "~/.emacs.d/local-repo/tiny-tools/lisp/other")

;; (require 'tinyurl)
;; (tinyurl-mode 1)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; toggle-truncate-lines
;; (setq truncate-partial-width-windows 1)
;; (setq truncate-lines 1)
;; (global-set-key (kbd "C-x t") 'toggle-truncate-lines)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; ob-translate

;; (use-package! ob-translate
;;   :config
;;   (define-key org-mode-map (kbd "C-c C-v e") 'org-babel-execute-src-block))

;; ;; https://orgmode.org/manual/Evaluating-code-blocks.html#DOCF142
;; ;; I don't want to execute code blocks with C-c C-c
;; (setq org-babel-no-eval-on-ctrl-c-ctrl-c t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; google-translate

;; (use-package! google-translate
;;   :config
;;   (bind-keys*
;;    ("C-c t" . google-translate-at-point)
;;    ("C-c T" . google-translate-at-point-reverse)))

;; (defun google-translate--get-b-d1 ()
;;   (list 432928 274893998))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO javaScript

;; (use-package! js2-mode
;;   :interpreter (("node" . js2-mode))
;;   :bind (:map js2-mode-map ("C-c C-p" . js2-print-json-path))
;;   :mode "\\.\\(js\\|json\\)$"
;;   :config
;;   (add-hook 'js-mode-hook 'js2-minor-mode)
;;   (setq js2-basic-offset 2
;;         js2-highlight-level 3
;;         js2-mode-show-parse-errors nil
;;         js2-mode-show-strict-warnings nil))

;; (use-package! js2-refactor
;;   :defer t
;;   :diminish js2-refactor-mode
;;   :commands js2-refactor-mode
;;   :ensure t
;;   :init
;;   (add-hook 'js2-mode-hook #'js2-refactor-mode)
;;   :config
;;   (js2r-add-keybindings-with-prefix "C-c C-m"))

;; (use-package! ac-js2
;;   :defer t
;;   :ensure t
;;   :init
;;   (add-hook 'js2-mode-hook 'ac-js2-mode)
;;   (setq ac-js2-evaluate-calls t))

;; ;; from here test
;; ;; https://github.com/swank-js/swank-js#user-content-installation
;; ;; sudo nmp install -g npm
;; ;; sudo npm install -g swank-js

;; (global-set-key [f5] 'slime-js-reload)
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (slime-js-minor-mode 1)))

;; (add-hook 'css-mode-hook
;;           (lambda ()
;;             (define-key css-mode-map "\M-\C-x" 'slime-js-refresh-css)
;;             (define-key css-mode-map "\C-c\C-r" 'slime-js-embed-css)))

;; ;; sudo nmp install -g npm
;; ;; sudo npm install -g indium

;; (use-package! indium
;;   :config
;;   (setq indium-chrome-executable "chromium"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO trident - lisp2javascript

;; ;; (add-to-list 'auto-mode-alist (cons "\\.paren\\'" 'lisp-mode))
;; ;; (add-hook 'lisp-mode-hook
;; ;; 	  #'(lambda ()
;; ;; 	      (when (and buffer-file-name
;; ;; 			 (string-match-p "\\.paren\\>" buffer-file-name))
;; ;; 		(unless (slime-connected-p)
;; ;; 		  (save-excursion (slime)))
;; ;; 		(trident-mode +1))))

;; ;;     ;; (use-package :parenscript)

;; ;;     ;; issue this command in the REPl:
;; ;;     ;; (ql:quickload :parenscript)
;; ;;     ;; Then you can use "trident-expand-buffer"
;; ;;     ;; etc...

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; virtualenwrapper

;; (use-package! virtualenvwrapper
;;   :config
;;   (venv-initialize-interactive-shells)
;;   (venv-initialize-eshell))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; visual-regexp-steroids

;; (use-package! visual-regexp)
;; (use-package! visual-regexp-steroids)

;; (define-key global-map (kbd "C-c r") 'vr/replace)
;; (define-key global-map (kbd "C-c q") 'vr/query-replace)
;; ;; if you use multiple-cursors, this is for you:
;; (define-key global-map (kbd "C-c m") 'vr/mc-mark)
;; ;; to use visual-regexp-steroids's isearch instead of the built-in regexp isearch, also include the following lines:
;; (define-key esc-map (kbd "C-r") 'vr/isearch-backward) ;; C-M-r
;; (define-key esc-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; web-mode

;; (use-package! web-mode
;;   :mode
;;   ("\\.phtml\\'" "\\.tpl\\.php\\'" "\\.[agj]sp\\'" "\\.as[cp]x\\'"
;;    "\\.erb\\'" "\\.mustache\\'" "\\.djhtml\\'" "\\.html?\\'")

;;   :init
;;   (setq web-mode-markup-indent-offset 2
;;         web-mode-code-indent-offset 2
;;         web-mode-css-indent-offset 2

;;         web-mode-enable-auto-pairing t
;;         web-mode-enable-auto-expanding t
;;         web-mode-enable-css-colorization t)

;;   :config
;;   ;; Template
;;   (setq web-mode-engines-alist
;;         '(("php"    . "\\.phtml\\'")
;;           ("blade"  . "\\.blade\\."))
;;         )

;;   )

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; web-beautify

;; (use-package! web-beautify
;;   :commands (web-beautify-css
;;              web-beautify-css-buffer
;;              web-beautify-html
;;              web-beautify-html-buffer
;;              web-beautify-js
;;              web-beautify-js-buffer))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; web-completion-data

;; (use-package! web-completion-data)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; web-mode-edit-element

;; (use-package! web-mode-edit-element)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; youtube-dl

;; (add-load-path! "~/.emacs.d/local-repo/youtube-dl-emacs")
;; (require 'youtube-dl)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; hyperspec-lookup

;; (global-set-key "\C-cH" 'hyperspec-lookup)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; ecb

;; (use-package! ecb)

;; ;; (require 'ecb)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cedet

;; (semantic-mode 1)
;; (require 'semantic/ia)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; camcorder

;; (use-package! camcorder)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; orca
;; ;; (require 'orca)

;; (setq orca-handler-list
;;       '((orca-handler-match-url
;;          "https://www.reddit.com/emacs/"
;;          "~/Dropbox/org/wiki/emacs.org"
;;          "Reddit")
;;         (orca-handler-match-url
;;          "https://emacs.stackexchange.com/"
;;          "~/Dropbox/org/wiki/emacs.org"
;;          "\\* Questions")
;;         (orca-handler-current-buffer
;;          "\\* Tasks")
;;         (orca-handler-file
;;          "~/Dropbox/org/ent.org"
;;          "\\* Articles")))

;; ;; (defcustom orca-handler-list
;; ;;   :type '(repeat
;; ;;           (choice
;; ;;            (list
;; ;;             :tag "Current buffer"
;; ;;             (const orca-handler-current-buffer)
;; ;;             (string :tag "Heading"))
;; ;;            (list
;; ;;             :tag "URL matching regex"
;; ;;             (const orca-handler-match-url)
;; ;;             (string :tag "URL")
;; ;;             (string :tag "File")
;; ;;             (string :tag "Heading"))
;; ;;            (list
;; ;;             :tag "Default"
;; ;;             (const orca-handler-file)
;; ;;             (string :tag "File")
;; ;;             (string :tag "Heading")))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-capture
;; ;; This thing has to be placed in this line - 2470
;; ;; https://cestlaz.github.io/posts/using-emacs-24-capture-2/
;; ;; This function pops up Capture templates options in a new emacs frame
;; ;; You have to bound it to a desktop key to make it pops up wherever you
;; ;; need

;; (defun org-capture-popup ()
;;   "Create a new frame and run `org-capture'."
;;   (interactive)
;;   (select-frame (make-frame '((org-capture-popup . t))))
;;   (delete-other-windows)
;;   (cl-letf (((symbol-function 'switch-to-buffer-other-window) #'switch-to-buffer))
;;     (condition-case err
;;         (org-capture)
;;       ;; `org-capture' signals (error "Abort") when "q" is typed, so
;;       ;; delete the newly-created frame in this scenario.
;;       (error (when (equal err '(error "Abort"))
;;                (delete-frame))))))

;; (defadvice org-capture-finalize (after my-delete-capture-frame activate)
;;   "Delete the frame after `capture-finalize'."
;;   (when (frame-parameter nil 'org-capture-popup)
;;     (delete-frame)))

;; (defadvice org-capture-destroy (after my-delete-capture-frame activate)
;;   "Delete the frame after `capture-destroy'."
;;   (when (frame-parameter nil 'org-capture-popup)
;;     (delete-frame)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Capture templates start from here

;; (global-set-key (kbd "C-c c") 'org-capture)

;; (setq org-capture-templates

;;       '(

;;         ("a" "Appointments" entry (file+headline "~/org~/my-appointments.org" "Calendar")
;;          "* APPT %^{Description} %^g\n%?\nAdded: %U")

;;         ("b" "Books" entry (file+headline "~/org~/books.org" "books to read")
;;          "* TODO %\\1 - %\\2%?\n%U\n:PROPERTIES:\n:NAME: %^{NAME}\n:TITLE: %^{TITLE}\n:END:\n")

;;         ;; you have to set up a template for this
;;         ;; ("c" "Contacts" entry (file+headline "~/org~/contacts.org" "Contacts"), my/org-contacts-template :empty-lines 1)

;;         ("d" "Dreams" entry (file+olp+datetree "~/org~/my-dreams.org") "* %^{Description} %^g %?\nAdded: %U")

;;         ("e" "Cookbook" entry (file "~/org~/cookbook.org")
;;          "%(org-chef-get-recipe-from-url)"
;;          :empty-lines 1)

;;         ("f" "Manual Cookbook" entry (file "~/org~/cookbook.org")
;;          "* %^{Recipe title: }\n  :PROPERTIES:\n  :source-url:\n  :servings:\n  :prep-time:\n  :cook-time:\n  :ready-in:\n  :END:\n** Ingredients\n   %?\n** Directions\n\n")

;;         ("j" "Journal" entry (file+olp+datetree "~/org~/journal.org") "* %?\nEntered on %U\n  %i\n  %a")

;;         ("k" "Cliplink capture" entry (file "")
;;          "* TODO %(org-cliplink-capture) \n  SCHEDULED: %t\n" :empty-lines 1)

;;         ("l" "Log Time" entry (file+olp+datetree "~/org~/timelog.org") "** %U - %^{Activity}  :TIME:")

;;         ("m" "Brain" entry (function org-brain-goto-end) "* %i%?" :empty-lines 1)

;;         ("n" "Notes" entry (file+olp+datetree "~/org~/my-notes.org") "* %^{Description} %^g %?\nAdded: %U")

;;         ;; you have to set hugo up for this
;;         ;; ("o" "Posts" (file+olp+datetree "~/org~/my-post.org") "* TODO %^{Description} %^g\n%?\nAdded: %U")

;;         ("t" "Tasks" entry (file+olp+datetree "~/org~/tasks.org")
;;          "* TODO %^{Description} %^g\n%?\nAdded: %U")

;;         ;; example is in:
;;         ;; ~/.emacs.d/elpa/org-plus-contrib-20190520/org-contacts.el
;;         ("c" "Contacts" entry (file "~/org~/contacts.org")
;;          "* %(org-contacts-template-name)

;;      :PROPERTIES:
;;      :WEBADDRESS:
;;      :EMAIL:
;;      :PHONE:
;;      :FAX:
;;      :MOBILE:
;;      :BIRTHDAY:
;;      :ADDRESS:
;;      :NAME:
;;      :NICKNAME:
;;      :ALIAS:
;;      :ICON:
;;      :IGNORE:
;;      :NOTE:
;;      :END:")

;;         ("w" "Website" plain (function org-website-clipper) "* %a\n%T\n" :immediate-finish t)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-capture with w3m or eww

;; ;; org-eww and org-w3m should be in your org distribution, but see
;; ;; note below on patch level of org-eww.
;; ;; NOTE: perhaps you will need to comment next line if you get an error
;; ;; and emacs stops building itself
;; ;;(require 'org-eww)
;; ;;(require 'org-w3m)

;; (defvar org-website-page-archive-file "~/org~/capture.org")
;; (defun org-website-clipper ()
;;   "When capturing a website page, go to the right place in capture file,
;;    but do sneaky things. Because it's a w3m or eww page, we go
;;    ahead and insert the fixed-up page content, as I don't see a
;;    good way to do that from an org-capture template alone. Requires
;;    Emacs 25 and the 2017-02-12 or later patched version of org-eww.el."
;;   (interactive)

;;   ;; Check for acceptable major mode (w3m or eww) and set up a couple of
;;   ;; browser specific values. Error if unknown mode.

;;   (cond
;;    ((eq major-mode 'w3m-mode)
;;     (org-w3m-copy-for-org-mode))
;;    ((eq major-mode 'eww-mode)
;;     (org-eww-copy-for-org-mode))
;;    (t
;;     (error "Not valid -- must be in w3m or eww mode")))

;;   ;; Check if we have a full path to the archive file.
;;   ;; Create any missing directories.

;;   (unless (file-exists-p org-website-page-archive-file)
;;     (let ((dir (file-name-directory org-website-page-archive-file)))
;;       (unless (file-exists-p dir)
;;         (make-directory dir))))

;;   ;; Open the archive file and yank in the content.
;;   ;; Headers are fixed up later by org-capture.

;;   (find-file org-website-page-archive-file)
;;   (goto-char (point-max))
;;   ;; Leave a blank line for org-capture to fill in
;;   ;; with a timestamp, URL, etc.
;;   (insert "\n\n")
;;   ;; Insert the web content but keep our place.
;;   (save-excursion (yank))
;;   ;; Don't keep the page info on the kill ring.
;;   ;; Also fix the yank pointer.
;;   (setq kill-ring (cdr kill-ring))
;;   (setq kill-ring-yank-pointer kill-ring)
;;   ;; Final repositioning.
;;   (forward-line -1))

;; ;; This thing has to be placed in this from
;; ;; about lines 2470 up to 2624

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-roam

;; (use-package! org-roam
;;   :hook
;;   (after-init . org-roam-mode)
;;   :custom
;;   (org-roam-directory "~/org~/deft-notes")
;;   :bind (:map org-roam-mode-map
;;          (("C-c n l" . org-roam)
;;           ("C-c n f" . org-roam-find-file)
;;           ("C-c n g" . org-roam-graph-show))
;;          :map org-mode-map
;;          (("C-c n i" . org-roam-insert)))
;;   :config
;;   (require 'org-roam-protocol))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-roam-bibtex

;; (use-package! org-roam-bibtex)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; company-org-roam

;; (use-package! company-org-roam)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-roam-server

;; (use-package! org-roam-server)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; deft

;; (use-package! deft
;;   ;; :ensure t  ;;do not use ensure!
;;   :custom
;;   (deft-directory "~/org~/deft-notes")
;;   (deft-extensions '("org" "md"))
;;   (deft-recursive t)
;;   (deft-use-filename-as-title t)
;;   (deft-filter-only-filenames t)
;;   ;; (deft-auto-save-interval 30.0)
;;   (deft-file-limit 200))

;; (setq deft-auto-save-interval 15.0)

;; (defun cypher/deft-open-other ()
;;   (interactive)
;;   (deft-open-file-other-window t))

;; (defun cypher/deft-open-preview ()
;;   (interactive)
;;   (deft-open-file-other-window))

;; (with-eval-after-load 'deft
;;   (define-key deft-mode-map
;;     (kbd "<tab>") 'cypher/deft-open-preview)
;;   (define-key deft-mode-map
;;     (kbd "<s-return>") 'cypher/deft-open-other)
;;   (define-key deft-mode-map
;;     (kbd "s-j") 'evil-next-line)
;;   (define-key deft-mode-map (kbd "s-k") 'evil-previous-line))

;; (setq deft-strip-summary-regexp
;;       (concat "\\("
;;               "[\n\t]" ;; blank
;;               "\\|^#\\+[a-zA-Z_]+:.*$" ;;org-mode metadata
;;               "\\)"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO zetteldeft

;; ;; https://www.eliasstorms.net/zetteldeft/

;; ;; You have to install "zetteldeft"
;; ;; through "package-list-packages" until it is in the repo

;; ;; (zetteldeft-set-classic-keybindings)

;; (use-package! zetteldeft
;;   ;; :ensure t   ;;do not use ensure!
;;   :after  deft
;;   :config
;;   (zetteldeft-set-classic-keybindings)
;;   (setq deft-new-file-format zetteldeft-id-format))

;; (defun zetteldeft-generate-id ()
;;   "Generate an ID in the format of `zetteldeft-id-format'."
;;   (format-time-string zetteldeft-id-format))

;; (require 'zetteldeft)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; nov for epubs

;; (use-package! nov)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; elpher

;; (use-package! elpher)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; kotlin

;; (use-package! kotlin-mode)

;; (use-package! flycheck-kotlin)

;; (use-package! ob-kotlin)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; type-tutor

;; (add-load-path! "~/.emacs.d/local-repo/type-tutor")
;; (require 'type-tutor)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO Latex skeletons

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; haskell-mode

;; ;; (use-package! haskell-mode)

;; (use-package! flycheck-haskell)

;; (use-package! ac-haskell-process)

;; (use-package! haskell-emacs)

;; (use-package! haskell-emacs-base)

;; (use-package! haskell-emacs-text)

;; (use-package! hindent)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO engine-mode - fix it!

;; ;; (use-package! engine-mode
;; ;;   :config (engine-mode t))

;; ;;   (defengine amazon
;; ;;     "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s")

;; ;;   (defengine duckduckgo
;; ;;     "https://duckduckgo.com/?q=%s"
;; ;;     :keybinding "d")

;; ;;   (defengine github
;; ;;     "https://github.com/search?ref=simplesearch&q=%s")

;; ;;   (defengine google
;; ;;     "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
;; ;;     :keybinding "g")

;; ;;   (defengine google-images
;; ;;     "http://www.google.com/images?hl=en&source=hp&biw=1440&bih=795&gbv=2&aq=f&aqi=&aql=&oq=&q=%s")

;; ;;   (defengine google-maps
;; ;;     "http://maps.google.com/maps?q=%s"
;; ;;     :docstring "Mappin' it up.")

;; ;;   (defengine project-gutenberg
;; ;;     "http://www.gutenberg.org/ebooks/search/?query=%s")

;; ;;   (defengine rfcs
;; ;;     "http://pretty-rfc.herokuapp.com/search?q=%s")

;; ;;   (defengine stack-overflow
;; ;;     "https://stackoverflow.com/search?q=%s")

;; ;;   (defengine twitter
;; ;;     "https://twitter.com/search?q=%s")

;; ;;   (defengine wikipedia
;; ;;     "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
;; ;;     :keybinding "w"
;; ;;     :docstring "Searchin' the wikis.")

;; ;;   (defengine wiktionary
;; ;;     "https://www.wikipedia.org/search-redirect.php?family=wiktionary&language=en&go=Go&search=%s")

;; ;;   (defengine wolfram-alpha
;; ;;     "http://www.wolframalpha.com/input/?i=%s")

;; ;;   (defengine youtube
;; ;;     "http://www.youtube.com/results?aq=f&oq=&search_query=%s")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO emamux - if needed
;; ;; (package! emamux) - add this to "packages.el"

;; ;; (use-package! emamux
;; ;;   :defer t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; emmet-mode - if needed
;; ;; (package! emmet) - add this to "packages.el"

;; (use-package! emmet-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO chezmoi - for dotfiles management
;; ;; if needed

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO tramp - if needed
;; ;; (package! tramp) - add this to "packages.el"

;; ;; (use-package! tramp
;; ;;       :init
;; ;;       (setq tramp-default-method "ssh")
;; ;;       (setq password-cache-expiry nil)
;; ;;       :config
;; ;;       ;; (add-to-list 'tramp-remote-path "~/")
;; ;;       (eval-after-load 'tramp '(setenv "SHELL" "/bin/bash")))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO circe - for IRC - if needed
;; ;; (package! circe) - add this to "packages.el"
;; ;; see lines: 1048-1080 of init.el_good

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO company-emoji - if needed
;; ;; (package! company-emoji) - add this to "packages.el"
;; ;; see lines: 1090-1215 of init.el_good

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Dired plus
;; ;; (add-load-path! "~/.emacs.d/local-repo/dired+")
;; ;; (require 'dired+)

;; ;; (setq dired-dwim-target t)
;; ;; ;; Hide details by default
;; ;; (add-hook 'dired-mode-hook 'dired-hide-details-mode)
;; ;; ;; Not spawn endless amount of dired buffers
;; ;; (with-eval-after-load 'dired
;; ;;   (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; dtrt-indent
;; (use-package! dtrt-indent
;;   :diminish t
;;   :config
;;   (dtrt-indent-mode +1))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; emacs-wget

;; (add-load-path! "/usr/local/share/emacs/site-lisp/emacs-wget")

;; (require 'w3m-wget)
;; (load "w3m-wget")
;; (autoload 'wget "wget" "wget interface for Emacs." t)
;; (autoload 'wget-web-page "wget" "wget interface to download whole web page." t)
;; (autoload 'w3-wget "w3-wget" "wget interface for Emacs/W3." t)
;; (setq wget-process-buffer nil)
;; (setq wget-command "/usr/bin/wget")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; eyebrowse
;; (use-package! eyebrowse
;;   :config
;;   (progn
;;     (define-key eyebrowse-mode-map (kbd "M-1") 'eyebrowse-switch-to-window-config-1)
;;     (define-key eyebrowse-mode-map (kbd "M-2") 'eyebrowse-switch-to-window-config-2)
;;     (define-key eyebrowse-mode-map (kbd "M-3") 'eyebrowse-switch-to-window-config-3)
;;     (define-key eyebrowse-mode-map (kbd "M-4") 'eyebrowse-switch-to-window-config-4)
;;     (define-key eyebrowse-mode-map (kbd "M-5") 'eyebrowse-switch-to-window-config-5)

;;     (eyebrowse-mode t)
;;     (setq eyebrowse-new-workspace t)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; flyspell

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-toggle-letter-case
;; (defun cypher-toggle-letter-case ()
;;   "Toggle the letter case of current word or text selection.
;;                        Always cycle in this order: Init Caps, ALL CAPS, all lower.

;;                        URL `http://ergoemacs.org/emacs/modernization_upcase-word.html'
;;                        Version 2017-04-19"
;;   (interactive)
;;   (let (
;;         (deactivate-mark nil)
;;         $p1 $p2)
;;     (if (use-region-p)
;;         (setq $p1 (region-beginning)
;;               $p2 (region-end))
;;       (save-excursion
;;         (skip-chars-backward "[:alnum:]-_")
;;         (setq $p1 (point))
;;         (skip-chars-forward "[:alnum:]-_")
;;         (setq $p2 (point))))
;;     (when (not (eq last-command this-command))
;;       (put this-command 'state 0))
;;     (cond
;;      ((equal 0 (get this-command 'state))
;;       (upcase-initials-region $p1 $p2)
;;       (put this-command 'state 1))
;;      ((equal 1  (get this-command 'state))
;;       (upcase-region $p1 $p2)
;;       (put this-command 'state 2))
;;      ((equal 2 (get this-command 'state))
;;       (downcase-region $p1 $p2)
;;       (put this-command 'state 0)))))

;; (global-set-key (kbd "C-0") 'cypher-toggle-letter-case)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-toggle-previous-letter-case
;; (defun cypher-toggle-previous-letter-case ()
;;   "Toggle the letter case of the letter to the left of cursor.
;;                      URL `http://ergoemacs.org/emacs/modernization_upcase-word.html'
;;                      Version 2015-12-22"
;;   (interactive)
;;   (let ((case-fold-search nil))
;;     (left-char 1)
;;     (cond
;;      ((looking-at "[[:lower:]]") (upcase-region (point) (1+ (point))))
;;      ((looking-at "[[:upper:]]") (downcase-region (point) (1+ (point)))))
;;     (right-char)))

;; (global-set-key (kbd "C-s-0") 'cypher-toggle-previous-letter-case)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-select-line
;; (defun cypher-select-line ()
;;   "Select current line. If region is active, extend selection downward by line.
;;                  URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
;;                  Version 2017-11-01"
;;   (interactive)
;;   (if (region-active-p)
;;       (progn
;;         (forward-line 1)
;;         (end-of-line))
;;     (progn
;;       (end-of-line)
;;       (set-mark (line-beginning-position)))))

;; (global-set-key (kbd "M-L") 'cypher-select-line)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-select-text-in-quote
;; (defun cypher-select-text-in-quote ()
;;   "Select text between the nearest left and right delimiters.
;;                Delimiters here includes the following chars: \"<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕（）
;;                This command select between any bracket chars, not the inner text of a bracket. For example, if text is

;;                 (a(b)c▮)

;;                 the selected char is “c”, not “a(b)c”.

;;                URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
;;                Version 2016-12-18"
;;   (interactive)
;;   (let (
;;         ($skipChars
;;          (if (boundp 'cypher-brackets)
;;              (concat "^\"" cypher-brackets)
;;            "^\"<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕（）"))
;;         $pos
;;         )
;;     (skip-chars-backward $skipChars)
;;     (setq $pos (point))
;;     (skip-chars-forward $skipChars)
;;     (set-mark $pos)))

;; (global-set-key (kbd "M-Q") 'cypher-select-text-in-quote)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-select-block
;; (defun cypher-select-block ()
;;   "Select the current/next block of text between blank lines.
;;            If region is active, extend selection downward by block.

;;            URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
;;            Version 2017-11-01"
;;   (interactive)
;;   (if (region-active-p)
;;       (re-search-forward "\n[ \t]*\n" nil "move")
;;     (progn
;;       (skip-chars-forward " \n\t")
;;       (when (re-search-backward "\n[ \t]*\n" nil "move")
;;         (re-search-forward "\n[ \t]*\n"))
;;       (push-mark (point) t t)
;;       (re-search-forward "\n[ \t]*\n" nil "move"))))

;; (global-set-key (kbd "M-B") 'cypher-select-block)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-extend-selection
;; (defun cypher-extend-selection ()
;;   (interactive)
;;   (if (region-active-p)
;;       (progn
;;         (let (($rb (region-beginning)) ($re (region-end)))
;;           (goto-char $rb)
;;           (cond
;;            ((looking-at "\\s(")
;;             (if (eq (nth 0 (syntax-ppss)) 0)
;;                 (progn
;;                   (message "left bracket, depth 0.")
;;                   (end-of-line) ; select current line
;;                   (set-mark (line-beginning-position)))
;;               (progn
;;                 (message "left bracket, depth not 0")
;;                 (up-list -1 t t)
;;                 (mark-sexp))))
;;            ((eq $rb (line-beginning-position))
;;             (progn
;;               (goto-char $rb)
;;               (let (($firstLineEndPos (line-end-position)))
;;                 (cond
;;                  ((eq $re $firstLineEndPos)
;;                   (progn
;;                     (message "exactly 1 line. extend to next whole line." )
;;                     (forward-line 1)
;;                     (end-of-line)))
;;                  ((< $re $firstLineEndPos)
;;                   (progn
;;                     (message "less than 1 line. complete the line." )
;;                     (end-of-line)))
;;                  ((> $re $firstLineEndPos)
;;                   (progn
;;                     (message "beginning of line, but end is greater than 1st end of line" )
;;                     (goto-char $re)
;;                     (if (eq (point) (line-end-position))
;;                         (progn
;;                           (message "exactly multiple lines" )
;;                           (forward-line 1)
;;                           (end-of-line))
;;                       (progn
;;                         (message "multiple lines but end is not eol. make it so" )
;;                         (goto-char $re)
;;                         (end-of-line)))))
;;                  (t (error "logic error 42946" ))))))
;;            ((and (> (point) (line-beginning-position)) (<= (point) (line-end-position)))
;;             (progn
;;               (message "less than 1 line" )
;;               (end-of-line) ; select current line
;;               (set-mark (line-beginning-position))))
;;            (t (message "last resort" ) nil))))
;;     (progn
;;       (cond
;;        ((looking-at "\\s(")
;;         (message "left bracket")
;;         (mark-sexp)) ; left bracket
;;        ((looking-at "\\s)")
;;         (message "right bracket")
;;         (backward-up-list) (mark-sexp))
;;        ((looking-at "\\s\"")
;;         (message "string quote")
;;         (mark-sexp)) ; string quote
;;        ((and (eq (point) (line-beginning-position)) (not (looking-at "\n")))
;;         (message "beginning of line and not empty")
;;         (end-of-line)
;;         (set-mark (line-beginning-position)))
;;        ((or (looking-back "\\s_" 1) (looking-back "\\sw" 1))
;;         (message "left is word or symbol")
;;         (skip-syntax-backward "_w" )
;;         ;; (re-search-backward "^\\(\\sw\\|\\s_\\)" nil t)
;;         (mark-sexp))
;;        ((and (looking-at "\\s ") (looking-back "\\s " 1))
;;         (message "left and right both space" )
;;         (skip-chars-backward "\\s " ) (set-mark (point))
;;         (skip-chars-forward "\\s "))
;;        ((and (looking-at "\n") (looking-back "\n" 1))
;;         (message "left and right both newline")
;;         (skip-chars-forward "\n")
;;         (set-mark (point))
;;         (re-search-forward "\n[ \t]*\n")) ; between blank lines, select next text block
;;        (t (message "just mark sexp" )
;;           (mark-sexp))
;;        ;;
;;        ))))

;; (global-set-key (kbd "M-E") 'cypher-extend-selection)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO cypher-brackets
;; ;; find a keybind for this function
;; (defvar cypher-brackets nil "string of left/right brackets pairs.")
;; (setq cypher-brackets "()[]{}<>（）［］｛｝⦅⦆〚〛⦃⦄“”‘’‹›«»「」〈〉《》【】〔〕⦗⦘『』〖〗〘〙｢｣⟦⟧⟨⟩⟪⟫⟮⟯⟬⟭⌈⌉⌊⌋⦇⦈⦉⦊❛❜❝❞❨❩❪❫❴❵❬❭❮❯❰❱❲❳〈〉⦑⦒⧼⧽﹙﹚﹛﹜﹝﹞⁽⁾₍₎⦋⦌⦍⦎⦏⦐⁅⁆⸢⸣⸤⸥⟅⟆⦓⦔⦕⦖⸦⸧⸨⸩｟｠⧘⧙⧚⧛⸜⸝⸌⸍⸂⸃⸄⸅⸉⸊᚛᚜༺༻༼༽⏜⏝⎴⎵⏞⏟⏠⏡﹁﹂﹃﹄︹︺︻︼︗︘︿﹀︽︾﹇﹈︷︸")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO cypher-left-brackets
;; ;; find a keybind for this function
;; (defvar cypher-left-brackets '("(" "{" "[" "<" "〔" "【" "〖" "〈" "《" "「" "『" "“" "‘" "‹" "«" )
;;   "List of left bracket chars.")
;; (progn
;;   ;; make cypher-left-brackets based on cypher-brackets
;;   (setq cypher-left-brackets '())
;;   (dotimes ($x (- (length cypher-brackets) 1))
;;     (when (= (% $x 2) 0)
;;       (push (char-to-string (elt cypher-brackets $x))
;;             cypher-left-brackets)))
;;   (setq cypher-left-brackets (reverse cypher-left-brackets)))

;; (defvar cypher-right-brackets '(")" "]" "}" ">" "〕" "】" "〗" "〉" "》" "」" "』" "”" "’" "›" "»")
;;   "list of right bracket chars.")
;; (progn
;;   (setq cypher-right-brackets '())
;;   (dotimes ($x (- (length cypher-brackets) 1))
;;     (when (= (% $x 2) 1)
;;       (push (char-to-string (elt cypher-brackets $x))
;;             cypher-right-brackets)))
;;   (setq cypher-right-brackets (reverse cypher-right-brackets)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO cypher-backward-left-bracket
;; ;; find a keybind for this function
;; (defun cypher-backward-left-bracket ()
;;   "Move cursor to the previous occurrence of left bracket.
;;     The list of brackets to jump to is defined by `cypher-left-brackets'.
;;     URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
;;     Version 2015-10-01"
;;   (interactive)
;;   (re-search-backward (regexp-opt cypher-left-brackets) nil t))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO cypher-forward-right-bracket
;; ;; find a keybind for this function
;; (defun cypher-forward-right-bracket ()
;;   "Move cursor to the next occurrence of right bracket.
;;     The list of brackets to jump to is defined by `cypher-right-brackets'.
;;     URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
;;     Version 2015-10-01"
;;   (interactive)
;;   (re-search-forward (regexp-opt cypher-right-brackets) nil t))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO cypher-goto-matching-bracket
;; ;; find a keybind for this function
;; (defun cypher-goto-matching-bracket ()
;;   "Move cursor to the matching bracket.
;;   If cursor is not on a bracket, call `backward-up-list'.
;;   The list of brackets to jump to is defined by `cypher-left-brackets' and `cypher-right-brackets'.
;;   URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
;;   Version 2016-11-22"
;;   (interactive)
;;   (if (nth 3 (syntax-ppss))
;;       (backward-up-list 1 'ESCAPE-STRINGS 'NO-SYNTAX-CROSSING)
;;     (cond
;;      ((eq (char-after) ?\") (forward-sexp))
;;      ((eq (char-before) ?\") (backward-sexp ))
;;      ((looking-at (regexp-opt cypher-left-brackets))
;;       (forward-sexp))
;;      ((looking-back (regexp-opt cypher-right-brackets) (max (- (point) 1) 1))
;;       (backward-sexp))
;;      (t (backward-up-list 1 'ESCAPE-STRINGS 'NO-SYNTAX-CROSSING)))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO cypher-forward-quote-smart
;; ;; find a keybind for this function
;; (defun cypher-forward-quote-smart ()
;;   "Move cursor to the current or next string quote.
;;   Place cursor at the position after the left quote.
;;   Repeated call will find the next string.
;;   URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
;;   Version 2016-11-22"
;;   (interactive)
;;   (let (($pos (point)))
;;     (if (nth 3 (syntax-ppss))
;;         (progn
;;           (backward-up-list 1 'ESCAPE-STRINGS 'NO-SYNTAX-CROSSING)
;;           (forward-sexp)
;;           (re-search-forward "\\\"" nil t))
;;       (progn (re-search-forward "\\\"" nil t)))
;;     (when (<= (point) $pos)
;;       (progn (re-search-forward "\\\"" nil t)))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO cypher-backward-quote
;; ;; find a keybind for this function
;; (defun cypher-backward-quote ()
;;   "Move cursor to the previous occurrence of \".
;;   If there are consecutive quotes of the same char, keep moving until none.
;;   Returns `t' if found, else `nil'.
;;   URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
;;   Version 2016-07-23"
;;   (interactive)
;;   (if (re-search-backward "\\\"+" nil t)
;;       (when (char-before) ; isn't nil, at beginning of buffer
;;         (while (char-equal (char-before) (char-after))
;;           (left-char)
;;           t))
;;     (progn
;;       (message "No more quotes before cursor.")
;;       nil)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;  TODO cypher-change-bracket-pairs
;; ;;  find a keybind for this function
;; (defun cypher-change-bracket-pairs ( @from-chars @to-chars)
;;   "Change bracket pairs from one type to another.

;; For example, change all parenthesis () to square brackets [].

;; Works on selected text, or current text block.

;; When called in lisp program, @from-chars or @to-chars is a string of bracket pair. eg \"(paren)\",  \"[bracket]\", etc.
;; The first and last characters are used.
;; If the string contains “,2”, then the first 2 chars and last 2 chars are used, for example  \"[[bracket,2]]\".
;; If @to-chars is equal to string “none”, the brackets are deleted.

;;  If the string has length greater than 2, the rest are ignored.

;; URL `http://ergoemacs.org/emacs/elisp_change_brackets.html'
;; Version 2018-03-31"
;;   (interactive
;;    (let (($bracketsList
;;           '("(paren)"
;;             "{brace}"
;;             "[square]"
;;             "<greater>"
;;             "`emacs'"
;;             "`markdown`"
;;             "~tilde~"
;;             "=equal="
;;             "\"ascii quote\""
;;             "[[double square,2]]"
;;             "“curly quote”"
;;             "‘single quote’"
;;             "‹angle quote›"
;;             "«double angle quote»"
;;             "「corner」"
;;             "『white corner』"
;;             "【LENTICULAR】"
;;             "〖white LENTICULAR〗"
;;             "〈angle bracket〉"
;;             "《double angle bracket》"
;;             "〔TORTOISE〕"
;;             "⦅white paren⦆"
;;             "〚white square〛"
;;             "⦃white curly bracket⦄"
;;             "〈angle bracket〉"
;;             "⦑ANGLE BRACKET WITH DOT⦒"
;;             "⧼CURVED ANGLE BRACKET⧽"
;;             "⟦math square⟧"
;;             "⟨math angle⟩"
;;             "⟪math DOUBLE ANGLE BRACKET⟫"
;;             "⟮math FLATTENED PARENTHESIS⟯"
;;             "⟬math WHITE TORTOISE SHELL BRACKET⟭"
;;             "❛HEAVY SINGLE QUOTATION MARK ORNAMENT❜"
;;             "❝HEAVY DOUBLE TURNED COMMA QUOTATION MARK ORNAMENT❞"
;;             "❨MEDIUM LEFT PARENTHESIS ORNAMENT❩"
;;             "❪MEDIUM FLATTENED LEFT PARENTHESIS ORNAMENT❫"
;;             "❴MEDIUM LEFT CURLY BRACKET ORNAMENT❵"
;;             "❬MEDIUM LEFT-POINTING ANGLE BRACKET ORNAMENT❭"
;;             "❮HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT❯"
;;             "❰HEAVY LEFT-POINTING ANGLE BRACKET ORNAMENT❱"
;;             "none"
;;             )))
;;      (list
;;       (ido-completing-read "Replace this:" $bracketsList )
;;       (ido-completing-read "To:" $bracketsList ))))
;;   (let ( $p1 $p2 )
;;     (if (use-region-p)
;;         (progn
;;           (setq $p1 (region-beginning))
;;           (setq $p2 (region-end)))
;;       (save-excursion
;;         (if (re-search-backward "\n[ \t]*\n" nil "move")
;;             (progn (re-search-forward "\n[ \t]*\n")
;;                    (setq $p1 (point)))
;;           (setq $p1 (point)))
;;         (if (re-search-forward "\n[ \t]*\n" nil "move")
;;             (progn (re-search-backward "\n[ \t]*\n")
;;                    (setq $p2 (point)))
;;           (setq $p2 (point)))))
;;     (save-excursion
;;       (save-restriction
;;         (narrow-to-region $p1 $p2)
;;         (let ( (case-fold-search nil)
;;                $fromLeft
;;                $fromRight
;;                $toLeft
;;                $toRight)
;;           (cond
;;            ((string-match ",2" @from-chars  )
;;             (progn
;;               (setq $fromLeft (substring @from-chars 0 2))
;;               (setq $fromRight (substring @from-chars -2))))
;;            (t
;;             (progn
;;               (setq $fromLeft (substring @from-chars 0 1))
;;               (setq $fromRight (substring @from-chars -1)))))
;;           (cond
;;            ((string-match ",2" @to-chars)
;;             (progn
;;               (setq $toLeft (substring @to-chars 0 2))
;;               (setq $toRight (substring @to-chars -2))))
;;            ((string-match "none" @to-chars)
;;             (progn
;;               (setq $toLeft "")
;;               (setq $toRight "")))
;;            (t
;;             (progn
;;               (setq $toLeft (substring @to-chars 0 1))
;;               (setq $toRight (substring @to-chars -1)))))
;;           (cond
;;            ((string-match "markdown" @from-chars)
;;             (progn
;;               (goto-char (point-min))
;;               (while
;;                   (re-search-forward "`\\([^`]+?\\)`" nil t)
;;                 (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
;;                 (replace-match (concat $toLeft "\\1" $toRight ) "FIXEDCASE" ))))
;;            ((string-match "tilde" @from-chars)
;;             (progn
;;               (goto-char (point-min))
;;               (while
;;                   (re-search-forward "~\\([^~]+?\\)~" nil t)
;;                 (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
;;                 (replace-match (concat $toLeft "\\1" $toRight ) "FIXEDCASE" ))))
;;            ((string-match "ascii quote" @from-chars)
;;             (progn
;;               (goto-char (point-min))
;;               (while
;;                   (re-search-forward "\"\\([^\"]+?\\)\"" nil t)
;;                 (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
;;                 (replace-match (concat $toLeft "\\1" $toRight ) "FIXEDCASE" ))))
;;            ((string-match "equal" @from-chars)
;;             (progn
;;               (goto-char (point-min))
;;               (while
;;                   (re-search-forward "=\\([^=]+?\\)=" nil t)
;;                 (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
;;                 (replace-match (concat $toLeft "\\1" $toRight ) "FIXEDCASE" ))))
;;            (t (progn
;;                 (progn
;;                   (goto-char (point-min))
;;                   (while (search-forward $fromLeft nil t)
;;                     (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
;;                     (replace-match $toLeft "FIXEDCASE" "LITERAL")))
;;                 (progn
;;                   (goto-char (point-min))
;;                   (while (search-forward $fromRight nil t)
;;                     (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
;;                     (replace-match $toRight "FIXEDCASE" "LITERAL")))))))))))

;; ;; TODO
;; ;; cypher-change-bracket-pairs
;; ;; find a keybind for this function

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; flyspell-mode
;; (defun my-turn-spell-checking-on ()
;;   "Turn flyspell-mode on."
;;   (flyspell-mode 1))

;; (add-hook 'text-mode-hook 'my-turn-spell-checking-on)

;; ;; enable flyspell in text mode (and derived modes)
;; ;; (add-hook 'text-mode-hook 'flyspell-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; genealogy

;; (add-load-path! "~/.emacs.d/local-repo/gedcom")

;; (autoload 'gedcom-mode "gedcom")
;; (setq auto-mode-alist (cons '("\\.ged$" . gedcom-mode) auto-mode-alist))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; ggtags

;; (use-package! ggtags
;;   :config
;;   (add-hook 'c-mode-common-hook
;;             (lambda ()
;;               (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'php-mode 'web-mode)
;;                 (ggtags-mode 1)))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; gitlab

;; (use-package! gitlab)
;; (setq gitlab-host "https://gitlab.com"
;;       gitlab-token-id "")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package! magit
;;   :config
;;   (setq magit-push-always-verify nil)
;;   (setq git-commit-summary-max-length 50)
;;   :bind
;;   ("M-g" . magit-status))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; indent lisp

;; (setq org-src-tab-acts-natively t)

;; (defun my/org-cleanup ()
;;   (interactive)
;;   (org-edit-special)
;;   (indent-buffer)
;;   (org-edit-src-exit))

;; (defun indent-buffer ()
;;   (interactive)
;;   (indent-region (point-min) (point-max)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; linum-relative

;; ;; (use-package! linum-relative
;; ;;   :init
;; ;;   (setq linum-format 'linum-relative)
;; ;;   :config
;; ;;   (setq linum-relative-current-symbol ""))

;; ;; (straight-use-package 'linum)

;; ;; (setq linum-relative-current-symbol "")

;; ;; (linum-relative-global-mode)
;; ;; (eval-after-load "linum"
;; ;;   '(set-face-attribute 'linum nil :height 100))

;; ;; (global-undo-tree-mode)

;; ; (defun linum-update-window-scale-fix (win)
;; ;;   "fix linum for scaled text"
;; ;;   (set-window-margins win
;; ;;                       (ceiling (* (if (boundp 'text-scale-mode-step)
;; ;;                                       (expt text-scale-mode-step
;; ;;                                             text-scale-mode-amount) 1)
;; ;;                                   (if (car (window-margins))
;; ;;                                       (car (window-margins)) 1)
;; ;;                                   ))))
;; ;; (advice-add #'linum-update-window :after #'linum-update-window-scale-fix)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; message-mode
;; ;; colorizing multiply-quoted lines

;; (add-hook 'message-mode-hook
;;           (lambda ()
;;             (font-lock-add-keywords nil
;;                                     '(("^[ \t]*>[ \t]*>[ \t]*>.*$"
;;                                        (0 'message-multiply-quoted-text-face))
;;                                       ("^[ \t]*>[ \t]*>.*$"
;;                                        (0 'message-double-quoted-text-face))))))

;; ;; email address
;; (setq user-mail-address "vagnerrener@gmail.com"
;;       user-full-name "Vagner Rener")

;; ;; add Cc and Bcc headers to the message buffer
;; (setq message-default-mail-headers "Cc: \nBcc: \n")

;; ;; postponed message is put in the following draft file
;; (setq message-auto-save-directory "~/Mail/drafts")

;; ;; send the current buffer to a email list address

;; (defun message-send-current-buffer ()
;;   (interactive (list (ido-completing-read "To: " known-email-addresses)))
;;   (let ((orig-buffer (current-buffer)))

;;     (message-goto-body)
;;     (insert (with-current-buffer(set-buffer orig-buffer)
;;                             (buffer-substring (point-min) (point-max))))
;;     (message-send-and-exit)))

;; ;; attach the content of a folder to a message

;; (defun message-attach-all-files-from-folder(&optional disposition dir-to-attach)
;;   "create the mml code to attach all files found in a given directory"
;;   (interactive)

;;   (if (eq disposition nil)
;;       (setq disposition (completing-read "Enter default disposition to use: " '(("attachment" 1) ("inline" 2)) nil t)))

;;   (if (eq dir-to-attach nil)
;;       (setq dir-to-attach (read-directory-name "Select a folder to attach: ")))

;;   (if (not (string-match "/$" dir-to-attach))
;;       (setq dir-to-attach (concat dir-to-attach "/")))

;;   (dolist (file (directory-files dir-to-attach))
;;     (when (and (not (string= "." file)) (not (string= ".." file)))
;;       (let (full-file-path mime-type)
;;         (setq full-file-path (concat dir-to-attach file))
;;         (if (file-readable-p full-file-path)
;;             (if (file-directory-p full-file-path)
;;                 (message-attach-all-files-from-folder disposition full-file-path)

;;               (setq mime-type (substring (shell-command-to-string (concat "file --mime-type --brief " (shell-quote-argument (expand-file-name full-file-path)))) 0 -1))
;;               (insert-string (concat "<#part type=\"" mime-type "\" filename=\"" full-file-path "\" disposition=" disposition ">\n"))))))))

;; ;; shortcuts

;; ;; C-x m	brings a message buffer
;; ;; C-h m	browse the full list
;; ;; C-c C-c	send the message and exit the message buffer
;; ;; C-c C-a	add an attachment
;; ;; C-c C-k	cancel the message
;; ;; C-c C-d	postpone the message
;; ;; C-c C-s	send the message but don't exit the message buffer
;; ;; C-c C-b	go to the start of the message
;; ;; C-c C-z	kill text from point until end of buffer

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; more niceties

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Mouse scrolling

;; (setq mouse-wheel-scroll-amount '(1)
;;       mouse-wheel-progressive-speed nil
;;       scroll-conservatively 101
;;       hscroll-margin 1
;;       hscroll-step 1
;;       scroll-preserve-screen-position t)

;; ;; gtk-tooltipos
;; (setq x-gtk-use-system-tooltips nil
;; 	    use-dialog-box nil)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Desktop mode
;; ;; (desktop-save-mode t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Save minibuffer history.

;; (savehist-mode 1)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Each file in a new window.
;; ;; (setq pop-up-frames t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Disk space is cheap. Save lots. (c) Sacha Chua
;; ;; Backups

;; (setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
;;       delete-old-versions -1
;;       version-control t
;;       vc-make-backup-files t
;;       auto-save-list-file-prefix "~/.emacs.d/autosave/"
;;       auto-save-file-name-transforms '((".*" "~/.emacs.d/autosave/" t))
;;       undo-tree-auto-save-history t
;;       undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo/")))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; But don't create stupid lockfiles

;; (setq create-lockfiles nil)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; History

;; (setq savehist-file "~/.emacs.d/history"
;;       history-length t
;;       history-delete-duplicates t
;;       savehist-save-minibuffer-history 1
;;       savehist-additional-variables
;;       '(kill-ring
;;         search-ring
;;         regexp-search-ring)
;;       recentf-max-saved-items 50)
;; (savehist-mode 1)
;; (recentf-mode 1)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Which-key
;; ;; C-x to access it

;; (use-package! which-key
;;   :config
;;   (which-key-mode t))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO diminishing-modes

;; (use-package! diminish
;;   :init
;;   (diminish 'which-key-mode)
;;   (diminish 'linum-mode)
;;   (diminish 'linum-relative-mode)
;;   (diminish 'hungry-delete-mode)
;;   (diminish 'visual-line-mode)
;;   (diminish 'subword-mode)
;;   (diminish 'beacon-mode)
;;   (diminish 'centered-window-mode)
;;   (diminish 'irony-mode)
;;   (diminish 'page-break-lines-mode)
;;   (diminish 'auto-revert-mode)
;;   (diminish 'rainbow-delimiters-mode)
;;   (diminish 'rainbow-mode)
;;   (diminish 'yas-minor-mode)
;;   (diminish 'flycheck-mode)
;;   (diminish 'helm-mode)
;;   (diminish 'abbrev-mode)
;;   (diminish 'text-scale-mode)
;;   (diminish 'eldoc-mode)
;;   (diminish 'undo-tree-mode)
;;   (diminish 'auto-fill-mode)
;;   (diminish 'org-indent-mode)
;;   (diminish 'company-mode)
;;   (diminish 'flycheck-mode)
;;   (diminish 'flyspell-mode))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; mu4e - email client

;; (use-package! mu4e)

;; (global-set-key (kbd "C-<f10>") 'mu4e)

;; ;; default
;; (setq mu4e-root-maildir "~/gmail/")
;; (setq mu4e-sent-folder "/Sent")
;; ;; (setq mu4e-drafts-folder "/Drafts")
;; (setq mu4e-trash-folder   "/Junk")
;; (setq mu4e-trash-folder  "/Queue")
;; (setq mu4e-inbox-folder  "/Inbox")

;; ;; setup some handy shortcuts
;; ;; you can quickly switch to your Inbox -- press ``ji''
;; ;; then, when you want archive some messages, move them to
;; ;; the 'All Mail' folder by pressing ``ma''.

;; (setq mu4e-maildir-shortcuts
;;       '( ("/Inbox"               . ?i)
;;          ;; ("/Drafts"              . ?d)
;;          ("/Junk"                . ?j)
;;          ("/Sent"                . ?s)
;;          ("/Queue"               . ?q)))

;; ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
;; (setq mu4e-sent-messages-behavior 'delete)

;; ;; allow for updating mail using 'U' in the main view:
;; ;; (setq mu4e-get-mail-command "offlineimap")
;; ;; (setq mu4e-get-mail-command "mbsync ~/gmail")

;; (setq mu4e-get-mail-command "mbsync -aV ~/gmail")

;; ;; something about ourselves

;; (setq
;;  user-mail-address "vagnerrener@gmail.com"
;;  user-full-name  "Vagner Rener"
;;  message-signature
;;  (concat
;;   ;;"任文山 (Ren Wenshan)\n"
;;   ;;"Email: renws1990@gmail.com\n"
;;   ;;"Blog: wenshanren.org\n"
;;   ;;"Douban: www.douban.com/people/renws"
;;   "\n"))

;; ;; sending mail -- replace USERNAME with your gmail username
;; ;; also, make sure the gnutls command line utils are installed
;; ;; package 'gnutls-bin' in Debian/Ubuntu

;; (require 'smtpmail)
;; ;; for sending a message, just hit "C-c C-s"

;; (setq message-send-mail-function 'smtpmail-send-it
;;       starttls-use-gnutls t
;;       smtpmail-stream-type 'starttls
;;       smtpmail-starttls-credentials
;;       '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-auth-credentials
;;       (expand-file-name "~/.authinfo.gpg")
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587
;;       smtpmail-debug-info t)

;; ;; don't keep message buffers around
;; (setq message-kill-buffer-on-exit t)

;; ;; https://github.com/bandresen/mu4e-send-delay

;; (add-load-path! "~/.emacs.d/elpa/mu4e-send-delay")

;; ;; Recommended settings

;; ;; Assigning the scheduled enabled send to C-c C-c

;; (add-hook 'mu4e-main-mode-hook (lambda ()
;;                                  (define-key mu4e-compose-mode-map
;;                                    (kbd "C-c C-c") 'mu4e-send-delay-send-and-exit)))

;; ;; Now you can C-c C-c every mail
;; ;; Defaults

;; ;; mu4e-send-delay-default-delay is set to “3m”
;; ;; mu4e-send-delay-timer is set to every 2 minutes
;; ;; mu4e-send-delay-include-header-in-draft is true
;; ;; mu4e-send-strip-header-before-send is true

;; (setq mu4e-org-contacts-file  "~/org~/contacts.org")

;; (add-hook 'mu4e-compose-mode-hook (lambda () (use-hard-newlines -1)))

;; ;; I want my format=flowed thank you very much
;; ;; mu4e sets up visual-line-mode and also fill (M-q) to do the right thing
;; ;; each paragraph is a single long line; at sending, emacs will add the
;; ;; special line continuation characters.
;; (setq mu4e-compose-format-flowed t)

;; ;; every new email composition gets its own frame! (window)
;; (setq mu4e-compose-in-new-frame t)

;; ;; give me ISO(ish) format date-time stamps in the header list
;; (setq mu4e-headers-date-format "%d-%m-%Y %H:%M")

;; ;; show full addresses in view message (instead of just names)
;; ;; toggle per name with M-RET
;; (setq mu4e-view-show-addresses 't)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package! multiple-cursors
;;   :bind
;;   (("C->" . mc/mark-next-like-this)
;;    ("C-<" . mc/mark-previous-like-this)
;;    ("C-M->" . mc/unmark-next-like-this)
;;    ("C-M-<" . mc/unmark-previous-like-this)
;;    ("C-*" . mc/mark-all-like-this))
;;   :init
;;   (bind-keys :prefix-map mc-map
;;              :prefix "C-x m"
;;              ("C-a" . mc/edit-beginnings-of-lines)
;;              ("C-e" . mc/edit-ends-of-lines)
;;              ("C-m" mc/mark-all-dwim)
;;              ("a" . mc/mark-all-like-this)
;;              ("d" . mc/mark-all-symbols-like-this-in-defun)
;;              ("h" . mc-hide-unmatched-lines-mode)
;;              ("i" . mc/insert-numbers)
;;              ("l" . mc/edit-lines)
;;              ("r" . mc/reverse-regions)
;;              ("s" . mc/sort-regions)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; my-save-word

;; (global-set-key (kbd "<f5>") 'my-save-word)
;; (defun my-save-word ()
;;   (interactive)
;;   (let ((current-location (point))
;;         (word (flyspell-get-word)))
;;     (when (consp word)
;;       (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; networking

;; (use-package! net-utils
;;   :bind
;;   (:map mode-specific-map
;;    :prefix-map net-utils-prefix-map
;;    :prefix "n"
;;    ("p" . ping)
;;    ("i" . ifconfig)
;;    ("w" . iwconfig)
;;    ("n" . netstat)
;;    ("p" . ping)
;;    ("a" . arp)
;;    ("r" . route)
;;    ("h" . nslookup-host)
;;    ("d" . dig)
;;    ("s" . smbclient)
;;    ("t" . traceroute)))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO slime-swank
;; ;; if needed - lines: 4152 - 4207
;; ;; init.el_good

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (emmet-mode slime jabber ivy-rtags helm-rtags helm-projectile helm-ag flycheck-rtags company-rtags ac-rtags zetteldeft telega switch-window simple-mpc shell-pop ripgrep persp-projectile persp-mode-projectile-bridge org-re-reveal-ref org-present-remote mark-multiple engine-mode emms-mark-ext eloud dtk debian-el command-log-mode better-shell beacon avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
