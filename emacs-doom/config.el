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
;; (setq doom-theme 'doom-one)

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

;; TODO emacs-anywhere

;; https://github.com/zachcurry/emacs-anywhere

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; doom-modeline
;; you can disable doom-modeline for presentation
;; mode with
;; M-x doom-modeline-mode

(doom-modeline-mode 0)
;; (doom-modeline-mode 1)

(setq doom-modeline-height 0)

(let ((faces '(mode-line
                   mode-line-buffer-id
                   mode-line-emphasis
                   mode-line-highlight
                   mode-line-inactive)))
         (mapc
          (lambda (face) (set-face-attribute face nil :font "DejaVu Sans Mono-10"))
          faces))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO no-easy-keys

(add-load-path! "~/.emacs.d/local-repo/no-easy-keys")
(require 'no-easy-keys)
(no-easy-keys 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Emacs visual

(setq initial-frame-alist (quote ((fullscreen . maximized))))

(visual-line-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)  ;; Make "yes/no" prompts "y/n"
(setq confirm-kill-processes nil)
;; (fset 'yes-or-no-p 'y-or-n-p)
(setq org-confirm-babel-evaluate nil)  ;; do not ask permission to evaluate

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ;; abbreviations

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; https://tecosaur.github.io/emacs-config/config.html

;;  major mode
;;  org-mode instead of fundamental mode

;; (setq-default major-mode 'org-mode)

   (setq org-log-done 'time)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; line-numbers

(setq display-line-numbers-type 'relative)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; mouse

 (map! :n [mouse-8] #'better-jumper-jump-backward
       :n [mouse-9] #'better-jumper-jump-forward)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! frame-mode
  :commands cypher/cursor-type-mode
  :config
  (setq-default cursor-type 'box)
  (setq-default cursor-in-non-selected-windows '(bar . 2))
  (setq-default blink-cursor-blinks 50)
  (setq-default blink-cursor-interval nil) ; 0.75 would be my choice
  (setq-default blink-cursor-delay 0.2)

  (blink-cursor-mode -1)

  (define-minor-mode cypher/cursor-type-mode
    "Toggle between static block and pulsing bar cursor."
    :init-value nil
    :global t
    (if cypher/cursor-type-mode
        (progn
          (setq-local blink-cursor-interval 0.75
                      cursor-type '(bar . 2)
                      cursor-in-non-selected-windows 'hollow)
          (blink-cursor-mode 1))
      (dolist (local '(blink-cursor-interval
                       cursor-type
                       cursor-in-non-selected-windows))
        (kill-local-variable `,local))
      (blink-cursor-mode -1))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Mouse avoidance mode

(use-package! avoid
  :config
  (setq mouse-avoidance-banish-position
        '((frame-or-window . frame)
          (side . right)
          (side-pos . 0)
          (top-or-bottom . top)
          (top-or-bottom-pos . 0)))

  (mouse-avoidance-mode 'animate))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; emacs package

(use-package! emacs
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
      ("reader" . (160 "Iosevka Comfy" "Source Sans Pro"))
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

(use-package! emacs
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

;; window title

(setq frame-title-format
      '(""
        (:eval
         (if (s-contains-p org-roam-directory (or buffer-file-name ""))
             (replace-regexp-in-string ".*/[0-9]*-?" "🢔 " buffer-file-name)
           "%b"))
        (:eval
         (let ((project-name (projectile-project-name)))
           (unless (string= "-" project-name)
             (format (if (buffer-modified-p)  " ◉ %s" "  ●  %s") project-name))))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; re-builder
;; https://www.masteringemacs.org/article/re-builder-interactive-regexp-builder

(require 're-builder)
(setq reb-re-syntax 'string)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; counsel and ivy

;; split and ask for buffer name

(setq evil-vsplit-window-right t
      evil-split-window-below t)

(use-package! counsel)
(use-package! counsel-fd)

(use-package! ivy-hydra)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-buffer))

 (setq +ivy-buffer-preview t)

 (setq ivy-read-action-function #'ivy-hydra-read-action)

(setq ivy-sort-max-size 50000)

;; rotate windown

(map! :map evil-window-map
      "SPC" #'rotate-layout)

(after! evil (evil-escape-mode nil))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; font-face
;; you have to install jetbrains,
;; ibm-plex and overpass fonts. Then, run:
;; fc-cache -f -v

;; (setq doom-font (font-spec :family "JetBrains Mono" :size 16)
;;       doom-big-font (font-spec :family "JetBrains Mono" :size 26)
;;       doom-variable-pitch-font (font-spec :family "Overpass" :size 16)
;;       doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))

(use-package! face-remap
  :diminish buffer-face-mode            ; the actual mode
  :commands cypher/variable-pitch-mode
  :config
  (define-minor-mode cypher/variable-pitch-mode
    "Toggle `variable-pitch-mode', except for `prog-mode'."
    :init-value nil
    :global nil
    (if cypher/variable-pitch-mode
        (unless (derived-mode-p 'prog-mode)
          (variable-pitch-mode 1))
      (variable-pitch-mode -1))))

(set-face-attribute 'default nil :font "Hack-12")
(set-face-attribute 'fixed-pitch nil :font "Hack-12")
(set-face-attribute 'variable-pitch nil :font "FiraGO-14")

(dolist (face '(default fixed-pitch))
  (set-face-attribute `,face nil :font "Hack-12"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; utf-8 hide from the modeline

(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook! 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; info-colors

(use-package! info-colors)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-msg

(use-package! org-msg)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO splash-screen
;; I need to ask tecosaur for the blackhole.svg image

;; (defvar fancy-splash-image-template
;;   (expand-file-name "misc/splash-images/blackhole-lines-template.svg" doom-private-dir)
;;   "Default template svg used for the splash image, with substitutions from ")
;; (defvar fancy-splash-image-nil
;;   (expand-file-name "misc/splash-images/transparent-pixel.png" doom-private-dir)
;;   "An image to use at minimum size, usually a transparent pixel")

;; (setq fancy-splash-sizes
;;   `((:height 500 :min-height 50 :padding (0 . 4) :template ,(expand-file-name "misc/splash-images/blackhole-lines-0.svg" doom-private-dir))
;;     (:height 440 :min-height 42 :padding (1 . 4) :template ,(expand-file-name "misc/splash-images/blackhole-lines-0.svg" doom-private-dir))
;;     (:height 400 :min-height 38 :padding (1 . 4) :template ,(expand-file-name "misc/splash-images/blackhole-lines-1.svg" doom-private-dir))
;;     (:height 350 :min-height 36 :padding (1 . 3) :template ,(expand-file-name "misc/splash-images/blackhole-lines-2.svg" doom-private-dir))
;;     (:height 300 :min-height 34 :padding (1 . 3) :template ,(expand-file-name "misc/splash-images/blackhole-lines-3.svg" doom-private-dir))
;;     (:height 250 :min-height 32 :padding (1 . 2) :template ,(expand-file-name "misc/splash-images/blackhole-lines-4.svg" doom-private-dir))
;;     (:height 200 :min-height 30 :padding (1 . 2) :template ,(expand-file-name "misc/splash-images/blackhole-lines-5.svg" doom-private-dir))
;;     (:height 100 :min-height 24 :padding (1 . 2) :template ,(expand-file-name "misc/splash-images/emacs-e-template.svg" doom-private-dir))
;;     (:height 0   :min-height 0  :padding (0 . 0) :file ,fancy-splash-image-nil)))

;; (defvar fancy-splash-sizes
;;   `((:height 500 :min-height 50 :padding (0 . 2))
;;     (:height 440 :min-height 42 :padding (1 . 4))
;;     (:height 330 :min-height 35 :padding (1 . 3))
;;     (:height 200 :min-height 30 :padding (1 . 2))
;;     (:height 0   :min-height 0  :padding (0 . 0) :file ,fancy-splash-image-nil))
;;   "list of plists with the following properties
;;   :height the height of the image
;;   :min-height minimum `frame-height' for image
;;   :padding `+doom-dashboard-banner-padding' to apply
;;   :template non-default template file
;;   :file file to use instead of template")

;; (defvar fancy-splash-template-colours
;;   '(("$colour1" . keywords) ("$colour2" . type) ("$colour3" . base5) ("$colour4" . base8))
;;   "list of colour-replacement alists of the form (\"$placeholder\" . 'theme-colour) which applied the template")

;; (unless (file-exists-p (expand-file-name "theme-splashes" doom-cache-dir))
;;   (make-directory (expand-file-name "theme-splashes" doom-cache-dir) t))

;; (defun fancy-splash-filename (theme-name height)
;;   (expand-file-name (concat (file-name-as-directory "theme-splashes")
;;                             (symbol-name doom-theme)
;;                             "-" (number-to-string height) ".svg")
;;                     doom-cache-dir))

;; (defun fancy-splash-clear-cache ()
;;   "Delete all cached fancy splash images"
;;   (interactive)
;;   (delete-directory (expand-file-name "theme-splashes" doom-cache-dir) t)
;;   (message "Cache cleared!"))

;; (defun fancy-splash-generate-image (template height)
;;   "Read TEMPLATE and create an image if HEIGHT with colour substitutions as  ;described by `fancy-splash-template-colours' for the current theme"
;;     (with-temp-buffer
;;       (insert-file-contents template)
;;       (re-search-forward "$height" nil t)
;;       (replace-match (number-to-string height) nil nil)
;;       (dolist (substitution fancy-splash-template-colours)
;;         (beginning-of-buffer)
;;         (while (re-search-forward (car substitution) nil t)
;;           (replace-match (doom-color (cdr substitution)) nil nil)))
;;       (write-region nil nil
;;                     (fancy-splash-filename (symbol-name doom-theme) height) nil nil)))

;; (defun fancy-splash-generate-images ()
;;   "Perform `fancy-splash-generate-image' in bulk"
;;   (dolist (size fancy-splash-sizes)
;;     (unless (plist-get size :file)
;;       (fancy-splash-generate-image (or (plist-get size :file)
;;                                        (plist-get size :template)
;;                                        fancy-splash-image-template)
;;                                    (plist-get size :height)))))

;; (defun ensure-theme-splash-images-exist (&optional height)
;;   (unless (file-exists-p (fancy-splash-filename
;;                           (symbol-name doom-theme)
;;                           (or height
;;                               (plist-get (car fancy-splash-sizes) :height))))
;;     (fancy-splash-generate-images)))

;; (defun get-appropriate-splash ()
;;   (let ((height (frame-height)))
;;     (cl-some (lambda (size) (when (>= height (plist-get size :min-height)) size))
;;              fancy-splash-sizes)))

;; (setq fancy-splash-last-size nil)
;; (setq fancy-splash-last-theme nil)
;; (defun set-appropriate-splash (&optional frame)
;;   (let ((appropriate-image (get-appropriate-splash)))
;;     (unless (and (equal appropriate-image fancy-splash-last-size)
;;                  (equal doom-theme fancy-splash-last-theme)))
;;     (unless (plist-get appropriate-image :file)
;;       (ensure-theme-splash-images-exist (plist-get appropriate-image :height)))
;;     (setq fancy-splash-image
;;           (or (plist-get appropriate-image :file)
;;               (fancy-splash-filename (symbol-name doom-theme) (plist-get appropriate-image :height))))
;;     (setq +doom-dashboard-banner-padding (plist-get appropriate-image :padding))
;;     (setq fancy-splash-last-size appropriate-image)
;;     (setq fancy-splash-last-theme doom-theme)
;;     (+doom-dashboard-reload)))

;; (add-hook! 'window-size-change-functions #'set-appropriate-splash)
;; (add-hook! 'doom-load-theme-hook #'set-appropriate-splash)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; all-the-icons

(use-package! dired-rainbow)

(use-package! all-the-icons)
(use-package! all-the-icons-ivy)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; async

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
;;   (add-hook! 'org-brain-after-visualize-hook #'aa2u-org-brain-buffer))
;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; snippets and yasnippets

(use-package! doom-snippets
  :after yasnippet)
; AndreaCrotti
(use-package! yasnippet-snippets
  :after yasnippet)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO company - lines : 1101-1190 init.el_good

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (unpin! company)
;; uncomment the above line if you want to upgrade
;; company
;; then issue:  ./doom sync

;; (after! company
;;   (setq company-idle-delay 0.1
;;         company-minimum-prefix-length 3)
;;   (setq company-show-numbers t))

(add-hook! 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 3)
(setq company-idle-delay 0.1)
(setq company-dabbrev-downcase nil)

;; (defun company-ac-setup ()
;;   "Sets up `company-mode' to behave similarly to `auto-complete-mode'."
;;   (setq company-require-match nil)
;;   (setq company-auto-commit #'my-company-visible-and-explicit-action-p)
;;   (setq company-frontends '(company-echo-metadata-frontend
;;                             company-pseudo-tooltip-unless-just-one-frontend-with-delay
;;                             company-preview-frontend)))

;; (company-ac-setup)

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
                            company-preview-frontend)))

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; bash

(add-hook! 'shell-mode-hook 'yas-minor-mode)
;; (add-hook! 'shell-mode-hook 'flycheck-mode)
(add-hook! 'shell-mode-hook 'company-mode)

(use-package! company-shell
  :config
  (require 'company)
  (add-hook 'shell-mode-hook 'shell-mode-company-init))

;; company-backend
;; company-backends is used for setting the completions you 
;; want or need

(defun shell-mode-company-init ()
  (setq-local company-backends '((company-shell
                                  company-shell-env
                                  company-etags
                                  company-dabbrev-code))))


(setq company-backends '(company-dabbrev
                         ;; company-dabbrev-code
                         company-elisp
                         company-files
                         ;; company-etags
                         company-gtags
                         company-ispell
                         company-keywords
                         ;; company-shell
                         ;; company-shell-env
                         telega-company-emoji))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ispell for suggesting
;; English words from the dictionary
;; it is good for writing English texts
;; But not for other languages

;; (set-company-backend! '(text-mode
;;                         markdown-mode
;;                         gfm-mode)
;;   '(:seperate company-ispell
;;               company-files
;;               company-yasnippet))

(setq yas-triggers-in-field t)

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

(defun close-all-buffers ()
  "Kill all buffers without regard for their origin."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key (kbd "C-M-s-k") 'close-all-buffers)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO switch-window

(use-package! switch-window
  :bind
  ;; default C-x o is other-window
  ;; default C-x C-o is delete-blank-lines
  (("C-x o" . switch-window)
   ("C-x C-o" . switch-window))
  :config
  (setq switch-window-multiple-frames t)
  (setq switch-window-shortcut-style 'qwerty)
  ;; when Emacs is run as client, the first shortcut does not appear
  ;; "x" acts as a dummy; remove first entry if not running server
  (setq switch-window-qwerty-shortcuts '("x" "a" "s" "d" "f" "j" "k" "l" ";" "w" "e" "r" "u" "i" "o" "q" "t" "y" "p"))
  (setq switch-window-increase 3))

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

;; a function to recreate the scratch buffer

(defun scratch-recreate ()
  "create a scratch buffer"
  (interactive)
  (switch-to-buffer-other-window (get-buffer-create "*scratch*"))
  (insert initial-scratch-message)
  (org-mode))

;; ;; https://alhassy.github.io/init/
;; ;; initial-scratch-message
 (setq initial-scratch-message (concat
                                "#+Title: 'lupus' @ 'Cypher'"
                                "\n# This buffer is for text that is not saved, and for Lisp evaluation."
                                "\n# To create a file, visit it with 'C-x C-f' e and enter text in its buffer.\n"))

(define-key evil-normal-state-map (kbd "SPC b c") #'scratch-recreate)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; zoom-frm for hycontrol
 ;; (add-load-path! "~/.emacs.d/local-repo/zoom-frm")
 ;; (require 'zoom-frm)

 ;; (define-key ctl-x-map [(control ?+)] 'zoom-in/out)
 ;; (define-key ctl-x-map [(control ?-)] 'zoom-in/out)
 ;; (define-key ctl-x-map [(control ?=)] 'zoom-in/out)
 ;; (define-key ctl-x-map [(control ?0)] 'zoom-in/out)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ;; theme and theme-looper

 (use-package! theme-looper)
 (use-package! color-theme-modern)
 (use-package! alect-themes)
 (use-package! base16-theme)
 (use-package! modus-operandi-theme)
 (use-package! modus-vivendi-theme)

;; This is the default GUI theme in doom
;; change it accordingly
;; Load a nice theme if in GUI
(when (display-graphic-p)
  ;; (load-theme 'doom-vibrant t)
  (load-theme 'manoj-dark t)
  )

;; you can load-theme manually
;; just eval them

;; (load-theme 'modus-vivendi)
;; (load-theme 'modus-operandi)

 (global-set-key (kbd "<C-f8>") 'theme-looper-enable-random-theme)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; centered-window
 (use-package! centered-window)
 (centered-window-mode 1)
;; (require 'centered-window)

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

;; (add-hook! 'text-mode-hook
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

(load! "~/.emacs.d/local-repo/emacs-brazilian-holidays/brazilian-holidays.el")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Xah-hacks

;; ;; http://ergoemacs.org/emacs/modernization_formfeed.html
;; ;; keys for moving to prev/next code section (Form Feed; ^L)
;; (global-set-key (kbd "<C-M-prior>") 'backward-page) ; Ctrl+Alt+PageUp
;; (global-set-key (kbd "<C-M-next>") 'forward-page)   ; Ctrl+Alt+PageDown
;; (delete-selection-mode 1)
;; (cua-mode -1) ; 1 disables "Ctrl-Alt" in orgmode

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; kill-word improved

(defun cypher/kill-inner-word ()
  "Kills the entire word your cursor is in. Equivalent to 'ciw' in vim."
  (interactive)
  (forward-char 1)
  (backward-word)
  (kill-word 1))
(global-set-key (kbd "\C-cw i") 'cypher/kill-inner-word)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; copy-word improved

(defun cypher/copy-whole-word ()
  (interactive)
  (save-excursion
    (forward-char 1)
    (backward-word)
    (kill-word 1)
    (yank)))
(global-set-key (kbd "\C-c w c") 'cypher/copy-whole-word)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; copy-line

(defun cypher/copy-whole-line ()
  "Copies a line without regard for cursor position."
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))))
(global-set-key (kbd "C-c l c") 'cypher/copy-whole-line)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; pretty-mode

;; (when window-system
;;   (use-package! pretty-mode
;;     :config
;;     (global-pretty-mode t)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; rainbow

(use-package! rainbow-mode
  :init
  (add-hook 'prog-mode-hook 'rainbow-mode))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; rainbow delimiters

(use-package! rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; TODO using ido
;;
;; Lisp:idomenu.el by GeorgBrandl lets
;; you use Ido with imenu.
;; Alternatively, add the following
;; command to your init file:
;; https://www.emacswiki.org/emacs/ImenuMode

    (defun ido-goto-symbol (&optional symbol-list)
      "Refresh imenu and jump to a place in the buffer using Ido."
      (interactive)
      (unless (featurep 'imenu)
        (require 'imenu nil t))
      (cond
       ((not symbol-list)
        (let ((ido-mode ido-mode)
              (ido-enable-flex-matching
               (if (boundp 'ido-enable-flex-matching)
                   ido-enable-flex-matching t))
              name-and-pos symbol-names position)
          (unless ido-mode
            (ido-mode 1)
            (setq ido-enable-flex-matching t))
          (while (progn
                   (imenu--cleanup)
                   (setq imenu--index-alist nil)
                   (ido-goto-symbol (imenu--make-index-alist))
                   (setq selected-symbol
                         (ido-completing-read "Symbol? " symbol-names))
                   (string= (car imenu--rescan-item) selected-symbol)))
          (unless (and (boundp 'mark-active) mark-active)
            (push-mark nil t nil))
          (setq position (cdr (assoc selected-symbol name-and-pos)))
          (cond
           ((overlayp position)
            (goto-char (overlay-start position)))
           (t
            (goto-char position)))))
       ((listp symbol-list)
        (dolist (symbol symbol-list)
          (let (name position)
            (cond
             ((and (listp symbol) (imenu--subalist-p symbol))
              (ido-goto-symbol symbol))
             ((listp symbol)
              (setq name (car symbol))
              (setq position (cdr symbol)))
             ((stringp symbol)
              (setq name symbol)
              (setq position
                    (get-text-property 1 'org-imenu-marker symbol))))
            (unless (or (null position) (null name)
                        (string= (car imenu--rescan-item) name))
              (add-to-list 'symbol-names name)
              (add-to-list 'name-and-pos (cons name position))))))))

    (global-set-key "\C-ci" 'ido-goto-symbol) ; or any key you see fit

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ido-find-file-in-tag-files
;; https://www.masteringemacs.org/article/effective-editing-movement
;;
(require 'etags)
(defun ido-find-tag ()
  "Find a tag using ido"
  (interactive)
  (tags-completion-table)
  (let (tag-names)
    (mapc (lambda (x)
        (unless (integerp x)
          (push (prin1-to-string x t) tag-names)))
      tags-completion-table)
    (find-tag (ido-completing-read "Tag: " tag-names))))

(defun ido-find-file-in-tag-files ()
  (interactive)
  (save-excursion
    (let ((enable-recursive-minibuffers t))
      (visit-tags-table-buffer))
    (find-file
     (expand-file-name
      (ido-completing-read
       "Project file: " (tags-table-files) nil t)))))

(global-set-key [remap find-tag] 'ido-find-tag)
(global-set-key (kbd "\C-ct") 'ido-find-file-in-tag-files)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! smartscan
  :config
  (smartscan-mode 1))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; cypher-new-empty-buffer

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; cypher-cut-line-or-region

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; cypher-paste-or-paste-previous

(defun cypher-paste-or-paste-previous ()
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

(global-set-key (kbd "<C-y>")  'cypher-paste-or-paste-previous)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; you can set  files to registers, like so:
;; (set-register ?2 '(file . "~/.emacs.d/init.org"))
;; sets file "init.org" to register 2
;; see the gnu manual link above

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
(setq select-enable-clipboard t)

;; after mouse selection in X11, you can paste by `yank' in emacs
(setq select-enable-primary t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; avy

(use-package avy
  :config
  (setq avy-all-windows t)
  :bind
  ("M-s" . avy-goto-char))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package! visible-mark)

;; (set-face-background 'region nil)
;;  (setq show-paren-priority -1)
 ;; (setq show-paren-priority 999)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; mark-multiple

;; (use-package! mark-multiple
;;   :bind ("C-$" . 'mark-next-like-this))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; beacon

(use-package! beacon
  :defer 10
  :diminish beacon-mode
  :custom
  (beacon-push-mark 10)
  :config
  (beacon-mode +1))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; dtk

(use-package! dtk
  :bind (("C-c B" . dtk-bible))
  :custom
  (dtk-default-module "KJVA")
  (dtk-default-module-category "Biblical Texts")
  (dtk-word-wrap t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO diatheke
;; I have to set up the keybindings

(use-package! diatheke)
(setq max-specpdl-size 10000)
;; (setq max-lisp-eval-depth 10000)
(require 'diatheke)

;; you can the Bible and its options
;; per buffer and eval it, like so :
  (setq diatheke-bible "MKJV -f plain")
;; (setq diatheke-bible "KJVA -f plain")
;; (setq diatheke-bible "WLC -f plain -o v")
;; (setq diatheke-bible "ESV -f plain -o s")

;; ;; you can set the Bible up inside the buffer with
;; ;; (diatheke-set-bible) + C-x e

;; ;; Keybindings already automatically loaded
;; ;; C-c C-b: select a bible translation
;; ;; C-c C-i: insert a passage
;; ;; C-c C-p: search for a phrase
;; ;; C-c C-m: search for multiple words
;; ;; C-c C-r: search by regex

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; sword-to-org

(add-load-path! "~/.emacs.d/local-repo/sword-to-org/")
(require 'sword-to-org)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; better-shell
;;
(use-package! better-shell
  :bind (("C-'" . better-shell-shell)
         ("C->" . better-shell-remote-open)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; shell-pop

(use-package! shell-pop
  :bind (("C-t" . shell-pop))
  :config
  (setq shell-pop-shell-type (quote ("ehell" "eshell" (lambda nil (eshell)))))
  (setq shell-pop-term-shell "eshell")
  ;; need to do this manually or not picked up by `shell-pop'
  (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; eshell

;; To make ~eshell-up~ searches case sensitive:
(setq eshell-up-ignore-case nil)
;; To print the matching parent directory before changing to it:
(setq eshell-up-print-parent-dir t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; command-log
;; you have to M-x command-log-mode

(use-package! command-log-mode
  :commands (command-log-mode global-command-log-mode)
  :bind ("C-c o" . clm/toggle-command-log-buffer))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ;; cypher-filelist

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

 ;; cypher-hydra

 (defhydra cypher-hydra-window (global-map "C-x w")
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

   (global-set-key (kbd "C-x h") 'cypher-hydra-window/body)

 ;; C-x is a prefix key

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; debian stuff

(use-package! debian-el
  :defer t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; emacs-w3m
;; This is a good w3m config
;; https://www.emacswiki.org/emacs/init-w3m.el#searchlang
;;
;; (package! w3m) - add this to "packages.el"
;; if needed

 (use-package! w3m)
 (add-load-path! "~/.emacs.d/.local/straight/repos/emacs-w3m")
 (add-load-path! "~/.emacs.d/local-repo/mime-w3m")
 (add-load-path! "~/.emacs.d/local-repo/w3m-load")
 (require 'w3m-load)
 ;; (require 'mime-w3m)

;; if this does not work, modify the file w3m.el itself inside /home/$USER/.emacs.d/elpa/w3m-*

(setq w3m-fill-column 80)
(setq w3m-default-save-directory "~/Downloads/w3m_stuff")
;; (setq w3m-display-inline-images t)
 (setq w3m-default-display-inline-images t)
;; (setq w3m-default-display-inline-images nil)
 (setq w3m-toggle-inline-images-permanently t)

(define-key evil-normal-state-map (kbd "SPC w3") #'w3m-search)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! eww
  :commands (eww
             eww-browse-url
             eww-search-words
             eww-open-in-new-buffer
             eww-open-file
             cypher/eww-visit-history)
  :config
  (setq eww-restore-desktop t)
  (setq eww-header-line-format "%u")

  (defun cypher/eww-visit-history ()
    "Revisit `eww' history using completion."
    (interactive)
    (let ((history eww-prompt-history))
      (icomplete-vertical-do ()
        (eww
         (completing-read "Visit website from history: " history nil t)))))

  (defvar cypher/eww-global-map
    (let ((map (make-sparse-keymap)))
      (define-key map "s" 'eww-search-words)
      (define-key map "o" 'eww-open-in-new-buffer)
      (define-key map "f" 'eww-open-file)
      (define-key map "w" 'cypher/eww-visit-history)
      map)
    "Key map to scope `eww' bindings for global usage.
The idea is to bind this to a prefix key, so that its defined
keys follow the pattern of <PREFIX> <KEY>.")
  :bind-keymap ("C-x w" . cypher/eww-global-map))

(use-package! browse-url
  :after eww
  :config
  (setq browse-url-browser-function 'eww-browse-url))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO eww browser
;; find a keybind to this function
;; cypher-rename-eww-buffer

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

  (add-hook! 'eww-after-render-hook 'cypher-rename-eww-buffer))

;; (global-set-key (kbd "leader e") 'eww-search-words)

(setq eww-search-prefix "https://lite.duckduckgo.com/?q=")
(define-key evil-normal-state-map (kbd "SPC ew") #'eww)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; default browser
;;  you can change to chormium

(setq browse-url-browser-function 'browse-url-generic
;; browse-url-generic-program "chromium"
;; browse-url-generic-program "firefox"
   browse-url-generic-program "waterfox"
)

(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
(global-set-key "\C-xm" 'browse-url-at-point)
(global-set-key "\C-xg" 'browse-url-xdg-open)
(global-set-key "\C-xj" 'w3m-browse-url)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; eev

;; http://angg.twu.net/#eev
;; to start eev, run
;; M-e M-J find-eejumps
;; M-x eev-beginner
;; M-2 M-J eev keybindings

(use-package! eev)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; emacspeak eloud

(use-package! eloud
  ;;  :load-path "~/.emacs.d/straight/repos/eloud"
  :config
  (setq eloud-espeak-path "/usr/bin/espeak"))

(require 'eloud)

;; (add-load-path! "~/.emacs.d/straight/repos/eloud/")
;; (eloud-espeak-path "/usr/bin/espeak")
;; (setq eloud-espeak-path "/usr/bin/espeak-ng -ven-gb -s 160")
;; (setq eloud-espeak-path "/usr/bin/espeak -ven-gb -s 160")
;; (setq eloud-espeak-path "/usr/bin/espeak -vpt -s 150")

;; if you want to set espeak voice default pitch, you have to
;; edit the file "/usr/lib/x86_64-linux-gnu/espeak-data/voices/en"

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; emacs-reveal

(add-load-path! "/home/vagner/.emacs.d/emacs-reveal")

;; (setq oer-reveal-plugins nil)
   (setq oer-reveal-plugins t)

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
;;     (add-hook! 'lisp-mode-hook 'sly-editing-mode)
;;   (warn "`sly.el' loaded OK. To use SLY, customize `lisp-mode-hook' and
;; replace `slime-lisp-mode-hook' with `sly-editing-mode'."))

;; install:
;; sly-quicklisp
;; sly-repl-ansi-color
;; with "package-install"

;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; emms-get-lyrics

(use-package! emms)

(setq emms-source-file-default-directory "~/Music/songs")
(add-load-path! "~/.emacs.d/local-repo/emms-get-lyrics/")
(require 'emms-get-lyrics)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; emms-player

(use-package! emms-player-simple-mpv
  :after emms
  :config
  ;; Subpackages
  ;;  (use-package! emms-player-simple-mpv-e.g.time-display)
  ;;  (use-package! emms-player-simple-mpv-e.g.playlist-fname)
  ;;  (use-package! emms-player-simple-mpv-e.g.hydra)
  ;;  (use-package! emms-player-simple-mpv)
  ;;  (use-package! emms-player-simple-mpv-control-functions)

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

;; ;; TODO fix this
;; ;;(use-package! emms-mark-ext)

;; ;; epg-gpg2

;; (setq epg-gpg-program "/usr/bin/gpg2")
;; (setq epa-file t)
;; (epa-file-enable)
;; (setq epa-file-select-keys nil)
;; (setq epa-pinentry-mode 'loopback)
;; (setq pinentry-start t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; epresent

(use-package! epresent)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Presentation-mode
;; you can disable doom-modeline for presentation
;; mode with
;; M-x doom-modeline-mode

;; https://protesilaos.com/dotemacs/#h:5571e3b2-1593-4c9c-82f4-ed5f50f69f11

(use-package! org-superstar         ;; supersedes `org-bullets' - line 2232
  ;; :ensure
  :after org
  :config
  (setq org-superstar-remove-leading-stars t)
  (setq org-superstar-headline-bullets-list
        '("🞛" "⁖" "◉" "○" "▷"))
  (setq org-superstar-item-bullet-alist
        '((?+ . ?•)
          (?* . ?➤)
          (?- . ?–))))

;; (org-superstar-mode 1)
;; (org-superstar-mode -1)

;; (org-bullets-mode t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; free-keys

(use-package! free-keys)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; gtklp printer

 (setq lpr-command "gtklp")
 (setq ps-lpr-command "gtklp")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; hippie-expand

(fset 'my-complete-file-name
      (make-hippie-expand-function '(try-complete-file-name-partially
                                     try-complete-file-name)))
(global-set-key "\M-/" 'my-complete-file-name)
(global-set-key "\M-\\" 'comint-dynamic-complete-filename)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; hydra
;; (use-package! hydra)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; image-magick

(use-package! eimp)

(autoload 'eimp-mode "eimp" "Emacs Image Manipulation Package." t)
(add-hook! 'image-mode-hook 'eimp-mode)

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

;; (autoload 'thumbs "thumbs" "Preview images in a directory." t)

;; ;; then M-x thumbs

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; imaxima

;; (defvar imaxima-fnt-size "Large")
;; (defvar imaxima-use-maxima-mode-flag t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO maxima
;; https://gitlab.com/sasanidas/maxima

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; impatient-mode

;; (use-package! impatient-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; ipp printer

;; (add-load-path! "~/.emacs.d/local-repo/ipp")
;; (require 'ipp)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; jabber
;; http://emacs-jabber.sourceforge.net

(add-load-path!  "/usr/share/emacs/site-lisp/elpa/jabber-0.8.92")
(require 'jabber)

(use-package! jabber
  :init
  ;; My accounts
  ;; Make sure the user-xmpp-account gets evaluated

 (setq jabber-account-list
    '(("vagnerrener@gmail.com"
       (:network-server . "talk.google.com")
       (:connection-type . starttls))))

 (setq auth-sources
    '((:source "~/.authinfo.gpg")))

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
                                  jabber-message-awesome
                                  jabber-message-wave
                                  jabber-message-scroll))
     jabber-message-alert-same-buffer nil
     jabber-roster-show-bindings t
     jabber-auto-reconnect t
     jabber-chat-buffer-format "*-chat-%n-*"
     jabber-groupchat-buffer-format "*-groupchat-%n-*"
     jabber-muc-colorize-foreign t
     jabber-muc-colorize-local t
     jabber-muc-disable-disco-check t
     jabber-muc-private-buffer-format "*-muc-priv-%g-%n-*"
     ;; jit-lock-stealth-time 16
     jabber-show-resources 'sometimes
     jabber-resource-line-format "         %j/%r%S [%p]"
     jabber-roster-buffer "*-Jabber-*"
     jabber-roster-line-format "  %u %a %-25n - %S"
     jabber-roster-show-title t
     jabber-roster-subscription-display (quote
                                         (("none" . "   ")
                                          ("from" . "← ")
                                          ("to" . " →")
                                          ("both" . "←→")))
     ;; jabber-socks5-proxies (quote ("proxy.hsdev.com"))
     jabber-vcard-avatars-retrieve t   ;; this retrieves people's avatars
     jabber-vcard-avatars-publish  t   ;; this is for my avatar
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


    ;; Some face adjustments
    (add-hook! 'jabber-chat-mode-hook
              (lambda ()
                (set-face-attribute 'jabber-chat-prompt-system nil :foreground "dark gray" :weight 'bold))))

  :bind
  ("C-c C-SPC" . jabber-activity-switch-to))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; linguistic

;; (use-package! linguistic)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; DONE lispy
;; ;; It is already enabled in doom "init.el"

;; (use-package! lispy)

;; (add-hook! 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

;; (defun conditionally-enable-lispy ()
;;   (when (eq this-command 'eval-expression)
;;     (lispy-mode 1)))

;; (add-hook! 'minibuffer-setup-hook 'conditionally-enable-lispy)

(use-package! eros)
(define-key evil-normal-state-map (kbd "C-M-x") #'eros-eval-defun)

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

;; lorem-ipsum

(use-package! lorem-ipsum
  :config
  (setq lorem-ipsum-use-default-bindings t))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; lyrics
;; (use-package! lyrics)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; mingus
;; if mpd does not get connect,
;; just issue "mpd" in the shell
;;
(use-package! mingus)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; mplayer-mode

(add-load-path! "~/.emacs.d/local-repo/mplayer-mode/")
(require 'mplayer-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; oer-reveal

(use-package! oer-reveal
  :config
  (require 'oer-reveal)
  (setq oer-reveal-plugins t))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; openwith

;; (use-package! openwith
;;   :config
;;   (setq openwith-associations '(("\\.mp4\\'" "smplayer" (file)))))

(use-package! openwith
  ;; do NOT enable this mode in telega!
  ;; you will blow your laptop up!
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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-mode

;; (setq org-ellipsis " ")
;; (setq org-src-fontify-natively t)
;; (setq org-src-tab-acts-natively t)
;; (setq org-confirm-babel-evaluate nil)
;; (setq org-export-with-smart-quotes t)
;; (setq org-src-window-setup 'current-window)
;; (add-hook! 'org-mode-hook 'org-indent-mode)

;; (global-set-key (kbd "C-c '") 'org-edit-src-code)

;; PDFs visited in Org-mode are opened in Evince (and not in the default choice) https://stackoverflow.com/a/8836108/789593
;; you can choose "evince", instead of "okular"
(add-hook 'org-mode-hook
      '(lambda ()
         (delete '("\\.pdf\\'" . default) org-file-apps)
         (add-to-list 'org-file-apps '("\\.pdf\\'" . "okular %s"))))

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

;; org-babel
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
   (ml . t)
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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; DONE it is already installed from init.el
;;       by deffault in
;;       :lang org

;; (use-package! org-plus-contrib)

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

;; (add-hook! 'org-brain-after-resource-button-functions #'org-brain-insert-resource-icon)

;; (use-package! org-brain)
;; (setq org-brain-path "~/org~/brain")


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; cypher/org-presentation-mode
;; for presentation, call:
;; M-x cypher/org-presentation-mode
;; M-x cypher/font-set-fonts

(use-package! org-tree-slide
              ;; :ensure
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
;; see org-superstar
;; line 2254

;; (use-package! org-bullets)
;; (org-bullets-mode 1)
;; (add-hook! 'org-mode-hook (lambda () (org-bullets-mode 1)))

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

 (use-package! org-cliplink)

 (defun org-brain-cliplink-resource ()
   "Add a URL from the clipboard as an org-brain resource.
 Suggest the URL title as a description for resource."
   (interactive)
   (let ((url (org-cliplink-clipboard-content)))
     (org-brain-add-resource
      url
      (org-cliplink-retrieve-title-synchronously url)
      t)))

 ;; TODO fix this keybind
 ;; (global-set-key (kbd "M-x p i") 'org-cliplink)

;; ;; (define-key org-brain-visualize-mode-map (kbd "L") #'org-brain-cliplink-resource)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-download

 (use-package! org-download
  :config
;;   ;; add support to dired
;;   (add-hook 'dired-mode-hook 'org-download-enable)
   )

(after! org-download
  (setq org-download-screenshot-method
        "xclip -selection clipboard -t image/png -o > %s"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-drill

 (use-package! org-drill)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-drill-table

 (use-package! org-drill-table)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; anki-editor

 (use-package! anki-editor)

;; This package can be used as a dictionary as well
(use-package! anki-vocabulary)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-chef

 (use-package! org-chef)

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

(use-package! org-journal)

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-mac-link

;; (add-hook! 'org-mode-hook (lambda ()
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

(use-package! org-present
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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-present-remote

;; (use-package! org-present-remote)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; fakir

;; (use-package! fakir)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-recur
;; Recurring org-mode tasks.

(use-package! org-recur
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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-refile

(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-re-reveal
;;
(use-package! org-re-reveal
  :config
  (setq org-re-reveal-root "file:/home/vagner/reveal-slides/reveal.js")
  (require 'org-re-reveal)
  ;;     (setq oer-reveal-plugins t)
  (setq org-re-reveal-hlevel 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-re-reveal-ref
;;
(use-package! org-re-reveal-ref
  :config
  (require 'org-re-reveal-ref))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-reveal
;; Note: give the ABSOLUTE PATH to reveal.js
;; Otherwise it will not work

;; this work only with internet connection
;; (setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
;; (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")

;; this work without internet connection
 (setq org-reveal-root "file:/home/vagner/reveal-slides/reveal.js")

;; if it does not load, do:
;; Alt-x load-library RET ox-reveal
;;
;; ox-reveal

(use-package! ox-reveal
  :after  org
  :custom
  (org-reveal-root "file:/home/vagner/reveal-slides/reveal.js"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; htmlize
;; ;;
(use-package! htmlize
  :after  ox-reveal
  :config
  (setq org-reveal-hlevel 2)
  (setq org-reveal-mathjax t))

;; To load Org-reveal, type “Alt-x load-library”, then type “ox-reveal”.
;; ~/reveal-slides/reveal.js$ npm start - you have to start the server
;; for viewing your slides and using the remote control
;; Now you can export this manual into Reveal.js presentation by typing “C-c C-e R B”.
;; Open the generated “Readme.html” in your browser and enjoy the cool slides.
;;

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; ox-pandoc

(use-package! ox-pandoc)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ox-spectacle

(use-package! ox-spectacle)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; simpleclip and webpaste

(use-package! simpleclip)

;; ;; pastebin

;; (use-package! debpaste
;;  :bind ("M-p" . debpaste-command-map)
;;    :config
;;   (setq debpaste-user-name 'Achylles))

;;   (global-set-key (kbd "M-D") 'debpaste-command-map)

(use-package! webpaste
  ;; :bind (("C-c C-p C-b" . webpaste-paste-buffer)
  ;;        ("C-c C-p C-r" . webpaste-paste-region)
  ;;        ("C-c C-p C-p" . webpaste-paste-buffer-or-region))
  )

(global-set-key (kbd "\C-c \C-p \C-b") 'webpaste-paste-buffer)
(global-set-key (kbd "C-c C-p \C-r") 'webpaste-paste-region)
(global-set-key (kbd "\C-c \C-p \C-p") 'webpaste-paste-buffer-or-region)

(setq webpaste-paste-raw-text t)
(setq webpaste-provider-priority
      '("dpaste.com" "dpaste.org"))
(setq webpaste-open-in-browser t)

(add-hook! 'webpaste-return-url-hook
  (lambda (url)
    (message "Copied URL to clipboard: %S" url)
    (simpleclip-set-contents url)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; ix

;; (use-package! ix)

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

(setq org-plantuml-jar-path "/usr/share/plantuml/plantuml.jar")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; poetry
;; ;; It is not the same poetry package for writing poetry
;; ;; it is an interface for python poetry package tool

(use-package! poetry)

;; This is the poetry-rhyme for writing poetry
;; you need to install the rhyme cli
;; you have to install "~/Downloand/rhyme_4_poetry.el

(add-load-path! "~/.emacs.d/local-repo/poetry")
(require 'poetry)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; markdown-mode
;; sudo apt install markdown grip

;; (add-hook! (gfm-mode markdown-mode) #'mixed-pitch-mode)
(add-hook! (gfm-mode markdown-mode) #'visual-line-mode #'turn-off-auto-fill)

;; (custom-set-faces!
;;   '(markdown-header-face-1 :height 1.25 :weight extra-bold :inherit markdown-header-face)
;;   '(markdown-header-face-2 :height 1.15 :weight bold       :inherit markdown-header-face)
;;   '(markdown-header-face-3 :height 1.08 :weight bold       :inherit markdown-header-face)
;;   '(markdown-header-face-4 :height 1.00 :weight bold       :inherit markdown-header-face)
;;   '(markdown-header-face-5 :height 0.90 :weight bold       :inherit markdown-header-face)
;;   '(markdown-header-face-6 :height 0.75 :weight extra-bold :inherit markdown-header-face))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; markdown-preview
;; sudo apt install markdown grip
;; Using Emacs 59 - Markdown
;; Mike Zamansky

(use-package! grip-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; poly-markdown

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

;; (add-hook! 'python-mode-hook
;;           (lambda ()
;;             (setq indent-tabs-mode nil)
;;             (setq python-indent-offset 4)
;;             (setq tab-width 4))
;;           (untabify (point-min) (point-max)))

;; (use-package! pydoc)

;; (use-package! helm-pydoc)

;; ;; Only tabs - python indentation

;; ;; (add-hook! 'python-mode-hook
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

;; Ocaml - tuareg and utop
;; https://github.com/ocaml-community/utop

(use-package! utop
  :init
  (autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
  (add-hook 'tuareg-mode-hook 'utop-minor-mode)
  )

(setq  tuareg-if-then-else-indent 4)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; re-builder

;; (use-package! re-builder
;;   :config
;;   (setq reb-re-syntax 'string))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; restart-emacs

(use-package! restart-emacs)

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

(use-package! simple-mpc)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; synonyms and thesaurus

(use-package! synonyms
  ;; :disabled
  :init
  :config
  (setq synonyms-file "~/thesaurus/mthesaur.txt")
  (setq synonyms-file "~/thesaurus/brazilian-synonyms.txt")
  (setq synonyms-cache-file "~/thesaurus/thes.cache")
  (global-set-key (kbd "C-*") 'synonyms))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; powerthesaurus

;; (use-package! powerthesaurus
;;   :config

;;  (defun powerthesaurus-lookup-word-at-point ()
;;    "Find the word at point synonyms at powerthesaurus.org."
;;    (interactive)
;;    (if (region-active-p)
;;        (powerthesaurus-lookup-word (region-beginning) (region-end))
;;      (save-mark-and-excursion
;;        (when (not (looking-at "\\<"))
;;          (backward-word))
;;        (set-mark (point))
;;        (forward-word)
;;        (activate-mark)
;;        (powerthesaurus-lookup-word (region-beginning) (region-end)))))

;;   (global-set-key (kbd "C-M-x") 'powerthesaurus-lookup-word-at-point)
;;   (global-set-key (kbd "C-M-y") 'powerthesaurus-lookup-word))

;;   (evil-leader/set-key "s" 'powerthesaurus-lookup-word-at-point)
;;   (evil-leader/set-key "S" 'powerthesaurus-lookup-word))

;;   (define-key evil-normal-state-map (kbd "SPC sw") #'powerthesaurus-lookup-word)
;;   (define-key evil-normal-state-map (kbd "SPC sW") #'powerthesaurus-lookup-word-at-point)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; synosaurus

(use-package! synosaurus
  :config
  (define-key evil-normal-state-map (kbd "SPC sx") #'synosaurus-choose-and-replace)
  (define-key evil-normal-state-map (kbd "SPC sq") #'synosaurus-lookup)
  (define-key evil-normal-state-map (kbd "SPC sw") #'synosaurus-choose-and-insert))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; telega
;; ;; https://github.com/zevlg/telega.el
;; ;; this telega is not from elpa repo
;; ;; it is in /home/vagner/emacs.d/straight/repos/telega.el
;; ;; just delete its directory if it complains about the server

;; (use-package! telega
;;   :bind
;;   (:map telega-msg-button-map
;;    ("j" . nil)
;;    ("k" . nil)
;;    ("h" . nil)
;;    ("l" . nil))
;;   :custom
;;   (telega-notifications-mode t)
;;   (telega-cache-dir (expand-file-name
;;                      "~/Downloads/telega_stuff")))

(use-package! telega
   :custom
   (telega-notifications-mode t)
   (telega-cache-dir (expand-file-name
                      "~/Downloads/telega_stuff"))
  :config
  (map! :map telega-msg-button-map
        "k" #'evil-previous-line
        "h" #'evil-backward-char
        "l" #'evil-forward-char
        "e" #'evil-forward-word-end
        "c" #'telega-msg-edit)
  (map! :leader "G" telega-prefix-map)
  (map! :map telega-prefix-map
        :leader
        :prefix "G"
        :desc "View folders" "F" #'telega-view-folders
        :desc "Kill telega" "k" #'telega-kill)
  (map! :mode telega-chat-mode
        :map telega-chat-mode-map
        :localleader
        :desc "Filter" "/" #'telega-chatbuf-filter
        :desc "Describe" "?" #'telega-chatbuf-describe
        :desc "Attach from clipboard" "p" #'telega-chatbuf-attach-clipboard
        :desc "Attach" "a" #'telega-chatbuf-attach
        :desc "Attach File" "f" #'telega-chatbuf-attach-fille
        :desc "Filter cancel" "c" #'telega-chatbuf-filter-cancel
        :desc "Cancel aux" "k" #'telega-chatbuf-cancel-aux
        :desc "Filter search" "s" #'telega-chatbuf-filter-search)
  )

;; Example of configuring :bind-keyes
;; Farlado ;;
;;
;; (use-package telega    :custom    (telega-notifications-m...
;;    but to explain how to use use-package's :bind:

;;          (use-package company
;;            :ensure t
;;            :defer t
;;            :custom ((company-idle-delay 0.75)
;;                     (company-minimum-prefix-length 3))
;;            :hook (after-init . global-company-mode)
;;            :bind (:map company-active-map
;;                   ("M-n" . nil)
;;                   ("M-p" . nil)
;;                   ("C-n" . company-select-next)
;;                   ("C-p" . company-select-previous)
;;                   ("SPC" . company-abort)))

  ;; (add-hook! 'telega-root-mode-hook
  ;;   (openwith-mode (if telega-root-mode -1 +1)))
  ;; (add-hook! 'telega-chat-mode-hook
  ;; (openwith-mode (if telega-chat-mode -1 +1)))

;; ;;this telega is from melpa repo
;; https://github.com/zevlg/telega.el
;; ;;it is in /home/vagner/straight/repos/telega.el
;; ;;just delete its directory if it complains about the server

;; (use-package! telega
;;   (:fetcher github
;;    :repo "zevlg/telega.el"
;;    :branch "master"
;;    :files (:defaults "etc" "server" "Makefile"))


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

;; if this one is enabled, it will mess all my emacs-doom configuration
;; so, do not enable this!
;; (add-hook! 'text-mode-hook 'org-mode-hook 'telega-chat-mode-hook 'flyspell-mode)

;; https://www.tenderisthebyte.com/blog/2019/06/09/spell-checking-emacs/
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(add-hook 'telega-load-hook 'telega-mode-line-mode)
(add-hook 'telega-open-file-hook 'telega-edit-file-mode)
(add-hook 'telega-load-hook 'global-telega-url-shorten-mode)

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

(setq display-time-default-load-average nil)
(setq display-time-interval 1)
(setq display-time-format "%d|%m-%a|%r")
(display-time-mode +1)

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

;; ob-translate
;; the snippet is
;; <sbobt - then press Enter
;; translate :src pt :dest ar,el,he (etc...)

(use-package! ob-translate
  :config
  (define-key org-mode-map (kbd "C-c C-v e") 'org-babel-execute-src-block))

;; https://orgmode.org/manual/Evaluating-code-blocks.html#DOCF142
;; I don't want to execute code blocks with C-c C-c

(setq org-babel-no-eval-on-ctrl-c-ctrl-c t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; google-translate

(use-package! google-translate
  :config
  (bind-keys*
   ("C-c t" . google-translate-at-point)
   ("C-c T" . google-translate-at-point-reverse)))

(defun google-translate--get-b-d1 ()
  (list 432928 274893998))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; text-translator

;; (add-load-path! "~/.emacs.d/local-repo/text-translator")
;; (require 'text-translator)

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
;; (add-hook! 'js2-mode-hook
;;           (lambda ()
;;             (slime-js-minor-mode 1)))

;; (add-hook! 'css-mode-hook
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
;; ;; (add-hook! 'lisp-mode-hook
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

(add-load-path! "~/.emacs.d/local-repo/youtube-dl-emacs")
(require 'youtube-dl)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; hyperspec-lookup

(global-set-key "\C-cH" 'hyperspec-lookup)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; ecb

;; (use-package! ecb)
;; (require 'ecb)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cedet

(semantic-mode 1)
(require 'semantic/ia)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; camcorder

(use-package! camcorder)

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

;; org-capture
;; This thing has to be placed in this line - 2470
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

        ("a" "Appointments" entry (file+headline "~/org~/my-appointments.org" "Calendar")
         "* APPT %^{Description} %^g\n%?\nAdded: %U")

        ("b" "Books" entry (file+headline "~/org~/books.org" "books to read")
         "* TODO %\\1 - %\\2%?\n%U\n:PROPERTIES:\n:NAME: %^{NAME}\n:TITLE: %^{TITLE}\n:END:\n")

        ;; you have to set up a template for this
        ;; ("c" "Contacts" entry (file+headline "~/org~/contacts.org" "Contacts"), my/org-contacts-template :empty-lines 1)

        ("d" "Dreams" entry (file+olp+datetree "~/org~/my-dreams.org") "* %^{Description} %^g %?\nAdded: %U")

        ("e" "Cookbook" entry (file "~/org~/cookbook.org")
         "%(org-chef-get-recipe-from-url)"
         :empty-lines 1)

        ("f" "Manual Cookbook" entry (file "~/org~/cookbook.org")
         "* %^{Recipe title: }\n  :PROPERTIES:\n  :source-url:\n  :servings:\n  :prep-time:\n  :cook-time:\n  :ready-in:\n  :END:\n** Ingredients\n   %?\n** Directions\n\n")

        ("j" "Journal" entry (file+olp+datetree "~/org~/journal.org") "* %?\nEntered on %U\n  %i\n  %a")

        ("k" "Cliplink capture" entry (file "")
         "* TODO %(org-cliplink-capture) \n  SCHEDULED: %t\n" :empty-lines 1)

        ("l" "Log Time" entry (file+olp+datetree "~/org~/timelog.org") "** %U - %^{Activity}  :TIME:")

        ("m" "Brain" entry (function org-brain-goto-end) "* %i%?" :empty-lines 1)

        ("n" "Notes" entry (file+olp+datetree "~/org~/my-notes.org") "* %^{Description} %^g %?\nAdded: %U")

        ;; you have to set hugo up for this
        ;; ("o" "Posts" (file+olp+datetree "~/org~/my-post.org") "* TODO %^{Description} %^g\n%?\nAdded: %U")

        ("t" "Tasks" entry (file+olp+datetree "~/org~/tasks.org")
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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-capture with w3m or eww
;; http://www.bobnewell.net/publish/35years/webclipper.html
;;
;; org-eww and org-w3m should be in your org distribution, but see
;; note below on patch level of org-eww.
;; NOTE: perhaps you will need to comment next line if you get an error
;; and emacs stops building itself

(add-load-path! "~/.emacs.d/local-repo/org-eww")
(add-load-path! "~/.emacs.d/local-repo/org-w3m")
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

;; This thing has to be placed in this from
;; about lines 2470 up to 2624

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-roam

(use-package! org-roam
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/org~/deft-notes")
  :bind (:map org-roam-mode-map
         (("C-c n l" . org-roam)
          ("C-c n f" . org-roam-find-file)
          ("C-c n g" . org-roam-graph)
          ("C-c n i" . org-roam-insert)
          ("C-c n c" . org-roam-capture))
         ;; :map org-mode-map
         ;; (("C-c n i" . org-roam-insert))
         )
  :config
  (require 'org-roam-protocol))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; org-roam-bibtex

;; (use-package! org-roam-bibtex)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; company-org-roam

;; (use-package! company-org-roam)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-roam-server

;; you also have to install org-protocol
;; https://www.orgroam.com/manual/Installation-_00281_0029.html#Installation-_00281_0029

(require 'org-roam-protocol)

(unless (server-running-p)
  (org-roam-server-mode))

;; (use-package! org-roam-server)

(use-package! org-roam-server
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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
(add-hook 'notdeft-mode-hook #'evil-emacs-state)

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
    (setq notdeft-directories '("~/org~/deft-notes"
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

;; notdeft-hydra

(add-load-path! "~/.emacs.d/.local/straight/repos/notdeft/extras")

(autoload 'notdeft-global-hydra/body "notdeft-global-hydra" nil t)
(global-set-key [f6] 'notdeft-global-hydra/body)

(autoload 'notdeft-mode-hydra/body "notdeft-mode-hydra")
(eval-after-load "notdeft"
  '(define-key notdeft-mode-map (kbd "C-c h") 'notdeft-mode-hydra/body))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; notdeft hydra
;;  https://tero.hasu.is/notdeft/
;;
;; TODO
;; (autoload 'notdeft-global-hydra/body "notdeft-global-hydra" nil t)
;; (global-set-key [f6] 'notdeft-global-hydra/body)

;; TODO
;; (autoload 'notdeft-mode-hydra/body "notdeft-mode-hydra")
;; (eval-after-load "notdeft"
;;   '(define-key notdeft-mode-map (kbd "C-c h") 'notdeft-mode-hydra/body))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! zetteldeft
  :after deft
  :config
  (setq deft-new-file-format zetteldeft-id-format)
  (zetteldeft-set-classic-keybindings))

 ;; (defun zetteldeft-generate-id ()
 ;;   "Generate an ID in the format of `zetteldeft-id-format'."
 ;;   ;; (format-time-string zetteldeft-id-format)
 ;;   (format-time-string "%Y-%m-%d %H:%M ")
 ;;   )

;; a fix to the bug
;; https://github.com/EFLS/zetteldeft/issues/70#issuecomment-650784731

;; This was an attempt to fix the bug
;; (after! zetteldeft
;; (setq zetteldeft-title-prefix nil))
;;
;; let us try this one

   (set-file-template! "\\.org$" :ignore t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; deft

;; (use-package! deft
;;   :custom
;;   (deft-directory "~/org~/deft-notes")
;;   (deft-extensions '("org" "md"))
;;   (deft-recursive t)
;;   (deft-use-filename-as-title t)
;;   (deft-filter-only-filenames t)
;;   ;; (deft-auto-save-interval 30.0)
;;   (deft-file-limit 200))
;;   (setq deft-auto-save-interval 15.0)

;;  :config
   (setq deft-directory "~/org~/deft-notes")
   (setq deft-extensions '("org" "md"))
   (setq deft-recursive t)
   (setq deft-use-filename-as-title t)
   (setq deft-filter-only-filenames t)
;; (setq deft-auto-save-interval 30.0)
   (setq deft-auto-save-interval 15.0)
   (setq deft-file-limit 200)
;; )

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elfeed
;; stolen from protasilaos
;; https://protesilaos.com/dotemacs/
;; if you need to update the database because of a
;; stuborn address, just do:
;; rm -fr ./emacs.d/elfeed/data/*
;; https://blog.feedspot.com/world_news_rss_feeds/#et-navigation

(setq elfeed-feeds
      '(
        ("https://paper.li/~api/papers/b9243f30-82ec-012f-25ad-12313d16b843/rss" things about God)
        ("https://world.wng.org/taxonomy/term/72/feed" world news group)
        ("https://www.christianitytoday.com/ct/feed" christianity today)
        ("https://exposure.opendoorsusa.org/feed.rss" opendoors)
        ("https://www.wycliffe.org/feeds/blog" wycliffe)
        ("https://seedsofthekingdom.org/rss/" seeds of the kingdom)
        ("https://www.vice.com/en_us/topic/news" vice news)
        ("https://aljazeera.com/xml/rss/all.xml" aljazeera)
        ("https://feeder.co/discover/250915df59/news-nationalgeographic-com" natgeo)
        ("https://thecipherbrief.com/feed" cypher brief)
        ("https://channelnewsasia.com/rssfeeds/8395884" news asia)
        ("https://yahoo.com/news/world/rss" yahoo)
        ("https://theguardian.com/world/rss" the guardian)
        ("https://independent.co.uk/news/world/news" the independent)
        ("https://euronews.com/rss?level=theme&name=news" euronews)
        ("https://smh.com.au/rssheadlines/world/article/rss.xml" sydney morning herald)
        ("https://globalnews.ca/world/feed" global news)
        ("https://rt.com/rss/news" russian fed)
        ("https://feeds.reuters.com/Reuters/worldNews" reuters)
        ("https://www.archlinux.org/feeds/news/" linux distro)
        ("https://planet.emacslife.com/atom.xml" emacs community)
        ("https://feeds.arstechnica.com/arstechnica/index" ars technica)
        ("https://rss.slashdot.org/Slashdot/slashdot slashdot" slashdot)
        ("https://feeds.bbci.co.uk/news/rss.xml?edition=int" bbc uk)
        ("https://www.sciencenews.org/feed" science news)
        ("https://planet.debian.org/rss20.xml" planet debian)
        ("https://debian-administration.org/atom.xml" debian administration)
        ("https://debian-community.org/planets/en/index.rss" debian community)
        ("https://freemusicarchive.org/recent.atom" free music archive)
        ("https://xkcd.com/atom.xml" comics)
        ("https://irreal.org/blog" irreal blog)
	("https://www.youtube.com/feeds/videos.xml?user=NishaMadhulika" NishaMadhulika)
        ("https://www.youtube.com/feeds/videos.xml?user=sanjeevkapoorkhazana" sanjeev kapoor)
        ("https://www.archanaskitchen.com/?format=feed&type=atom" archanas kitchen)
        ("http://feeds.feedburner.com/blogspot/sRmz" sRmz)
        ("https://www.singaporehomecooks.com/feeds/posts/default?alt=rss" singapore cooks)
        ("https://blog.hungri.ly/rss" hungri.ly)
        ("http://www.mothersagenda.com/feed/" mothers agenda)
        ("https://kimikoskitchen.wordpress.com/feed/" kimikos kitchen)
        ("https://feeds.feedburner.com/latestrecipes/eegC" latest recipes)
        ("https://italianhomecooking.co.uk/feed/" italian home)
        ("https://www.foodcanon.com/feeds/posts/default?alt=rss" food canon)
        ("https://www.kitchennostalgia.com/feed" kitchen nostalgia)
        ("https://www.thefoodblog.net/feed/" food blog)
        ("https://dingoozatfood.blogspot.com/feeds/posts/default?alt=rss" dingoozat food)
        ("https://www.mydiasporakitchen.com/feed" diaspora kitchen)
        ("https://feedproxy.google.com/elise/simplyrecipes" simply recipes)
        ("https://thestayathomechef.com/feed" stay at home chef)
        ("https://cookiesandcups.com/feed" cookie sand cups)
        ("https://barefeetinthekitchen.com/feed/" barefeet kitchen)
        ("https://damndelicious.net/feed" damn delicious)
        ("https://www.koreanbapsang.com/feed" korean bapsang)
        ("https://www.kitchensanctuary.com/feed" kitchen sanctuary)
        ("https://www.manusmenu.com/feed" menus menu)
        ("https://www.mexicoinmykitchen.com/feed" mexico kitchen)
        ("https://www.dadcooksdinner.com/feed/" dad cooks dinner)
        ("https://www.sooperchef.pk/feed/" sooper chef)))

(use-package! elfeed
  :config
  (setq elfeed-use-curl t)
  (setq elfeed-curl-max-connections 10)
  (setq elfeed-db-directory "~/Downloads/elfeed")
  (setq elfeed-enclosure-default-dir "~/Downloads/elfeed")
  (setq elfeed-search-filter "@4-months-ago +unread")
  (setq elfeed-sort-order 'descending)
  (setq elfeed-search-clipboard-type 'CLIPBOARD)
  (setq elfeed-search-title-max-width 100)
  (setq elfeed-search-title-min-width 30)
  (setq elfeed-search-trailing-width 25)
  (setq elfeed-show-truncate-long-urls t)
  (setq elfeed-show-unique-buffers t)

  (defun cypher/elfeed-feeds ()
    "Load file containing the `elfeed-feeds' list.
Add this to `elfeed-search-mode-hook'."
    (let ((feeds "~/.emacs.d/feeds.el.gpg"))
      (if (file-exists-p feeds)
          (load-file feeds)
        (user-error "Missing feeds' file"))))

  (defun cypher/elfeed-show-eww (&optional link)
    "Browse current `elfeed' entry link in `eww'.
Only show the readable part once the website loads.  This can
fail on poorly-designed websites."
    (interactive)
    (let* ((entry (if (eq major-mode 'elfeed-show-mode)
                      elfeed-show-entry
                    (elfeed-search-selected :ignore-region)))
           (link (if link link (elfeed-entry-link entry))))
      (eww link)
      (add-hook! 'eww-after-render-hook 'eww-readable nil t)))

  (defun cypher/elfeed-search-other-window (&optional arg)
    "Browse `elfeed' entry in the other window.
With \\[universal-argument] browse the entry in `eww' using the
`cypher/elfeed-show-eww' wrapper."
    (interactive "P")
    (let* ((entry (if (eq major-mode 'elfeed-show-mode)
                      elfeed-show-entry
                    (elfeed-search-selected :ignore-region)))
           (link (elfeed-entry-link entry))
           (win (selected-window)))
      (with-current-buffer (get-buffer "*elfeed-search*")
        (unless (one-window-p)              ; experimental
          (delete-other-windows win))
        (split-window win (/ (frame-height) 5) 'below)
        (other-window 1)
        (if arg
            (progn
              (when (eq major-mode 'elfeed-search-mode)
                (elfeed-search-untag-all-unread))
              (cypher/elfeed-show-eww link))
          (elfeed-search-show-entry entry)))))

  (defun cypher/elfeed-kill-buffer-close-window-dwim ()
    "Do-what-I-mean way to handle `elfeed' windows and buffers.

When in an entry buffer, kill the buffer and return to the Elfeed
Search view.  If the entry is in its own window, delete it as
well.

When in the search view, close all other windows.  Else just kill
the buffer."
    (interactive)
    (let ((win (selected-window)))
      (cond ((eq major-mode 'elfeed-show-mode)
             (elfeed-kill-buffer)
             (unless (one-window-p) (delete-window win))
             (switch-to-buffer "*elfeed-search*"))
            ((eq major-mode 'elfeed-search-mode)
             (if (one-window-p)
                 (elfeed-search-quit-window)
               (delete-other-windows win))))))

  (defvar cypher/elfeed-mpv-hook nil
    "Hook called before `cypher/elfeed-mpv-dwim'.")

  ;; TODO make this buffer more useful, such as running it in a
  ;; shell-aware mode.
  (defun cypher/elfeed-mpv-buffer ()
    "Prepare \"*elfeed-mpv-output*\" buffer.
For use by `cypher/elfeed-mpv-dwim'.  To be called from
`cypher/elfeed-mpv-hook'."
    (let ((buf (get-buffer "*elfeed-mpv-output*"))
          (inhibit-read-only t))
      (with-current-buffer buf
        (erase-buffer))))

  (defun cypher/elfeed-mpv-dwim ()
    "Play entry link with external `mpv' program.
When there is an audio enclosure (podcast), play just the audio.
Else spawn a video player at a resolution that accounts for the
current monitor's width."
    (interactive)
    (let* ((entry (if (eq major-mode 'elfeed-show-mode)
                      elfeed-show-entry
                    (elfeed-search-selected :ignore-region)))
           (link (elfeed-entry-link entry))
           (enclosure (elt (car (elfeed-entry-enclosures entry)) 0)) ; fragile?
           (audio "--no-video")
           ;; Here the display width checks if I am on the laptop
           (height (if (<= (display-pixel-width ) 1366) 720 1080))
           (video (format "--ytdl-format=bestvideo[height<=?%s]+bestaudio/best" height))
           (buf (pop-to-buffer "*elfeed-mpv-output*")))
      (run-hooks 'cypher/elfeed-mpv-hook)
      (if enclosure              ; make this its own parametrised function
          (progn
            (start-process "audio-mpv" buf "mpv" audio enclosure)
            (message (concat "Launching MPV for " (propertize enclosure 'face 'success))))
        (start-process "video-mpv" buf "mpv" video link)
        (message (concat "Launching MPV for " (propertize link 'face 'success))))))

  (defun cypher/elfeed-show-search-update (direction)
    "Update `elfeed-search-buffer' to match entry in DIRECTION.

This is useful when Elfeed is split in two windows, with the
search buffer on one side and an entry buffer on the other.  The
user is changing entries while in the latter, while the former
gets updated to put point on the current item.

EXPERIMENTAL."
    (interactive "s")
    (let* ((entry (if (eq major-mode 'elfeed-show-mode)
                      elfeed-show-entry
                    (elfeed-search-selected :ignore-region)))
           (title (elfeed-entry-title entry))
           (es "*elfeed-search*")
           (buf (get-buffer es))
           (win (get-buffer-window buf)))
      (funcall (intern (concat "elfeed-show-"
                               (substring `,direction 0 4))))
      (when (window-live-p win)
        (with-current-buffer buf
          (goto-char (point-min)) ; Elfeed way to find entry window?
          (search-forward (format "%s" title))
          (funcall (intern (concat `,direction "-line")))
          (set-window-point win (point-at-bol))
          (cypher/pulse-line 'modus-theme-subtle-cyan)))))

  (defun cypher/elfeed-search-tag-filter ()
    "Filter `elfeed' by tags using completion.

Arbitrary input is also possible, but you may need to exit the
minibuffer with `exit-minibuffer' (I bind it to C-j in
`minibuffer-local-completion-map')."
    (interactive)
    (unwind-protect
        (elfeed-search-clear-filter)
      ;; NOTE for the `crm-separator' to work with just a space, you
      ;; need to make SPC self-insert in the minibuffer (the default is
      ;; to behave like tab-completion).
      (let* ((crm-separator " ")
             (elfeed-search-filter-active :live)
             (db-tags (elfeed-db-get-all-tags))
             (plus-tags (delete-dups
                         (mapcar (lambda (x)
                                   (concat "+" (format "%s" x)))
                                 db-tags)))
             (minus-tags (delete-dups
                          (mapcar (lambda (x)
                                    (concat "-" (format "%s" x)))
                                  db-tags)))
             (all-tags (append plus-tags minus-tags))
             (tags (completing-read-multiple
                    "Apply tag: "
                    all-tags nil t))
             (input (string-join `(,elfeed-search-filter ,@tags) " ")))
        (setq elfeed-search-filter input))
      (elfeed-search-update :force)))

  (defun cypher/elfeed-show-archive ()
    "Create an archive copy of the current `elfeed' entry."
    (interactive)
    (let* ((entry (if (eq major-mode 'elfeed-show-mode)
                      elfeed-show-entry
                    (elfeed-search-selected :ignore-region)))
           ;; TODO how to cleanly add hyphens instead of spaces?
           (title (elfeed-entry-title entry))
           (elfeed-show-truncate-long-urls nil)
           (archives "~/Documents/feeds/")
           (file (format "%s%s.txt" archives title)))
      (unless (file-exists-p archives)
        (make-directory archives t))
      (when (derived-mode-p 'elfeed-show-mode)
        ;; Refresh to expand truncated URLs
        (elfeed-show-refresh)
        (write-file file t)
        (message "Saved buffer at %s" file))))

  :hook ((elfeed-search-mode-hook . cypher/elfeed-feeds)
         (cypher/elfeed-mpv-hook . cypher/elfeed-mpv-buffer))
  :bind (("C-c f" . elfeed)
         :map elfeed-search-mode-map
         ("s" . cypher/elfeed-search-tag-filter)
         ("w" . elfeed-search-yank)
         ("g" . elfeed-update)
         ("G" . elfeed-search-update--force)
         ("o" . cypher/elfeed-search-other-window)
         ("v" . cypher/elfeed-mpv-dwim)
         ("q" . cypher/elfeed-kill-buffer-close-window-dwim)
         :map elfeed-show-mode-map
         ("a" . cypher/elfeed-show-archive)
         ;; TODO any way to do this without a lambda?
         ("n" . (lambda ()
                  (interactive)
                  (cypher/elfeed-show-search-update "next")))
         ("p" . (lambda ()
                  (interactive)
                  (cypher/elfeed-show-search-update "previous")))
         ("e" . cypher/elfeed-show-eww)
         ("q" . cypher/elfeed-kill-buffer-close-window-dwim)
         ("v" . cypher/elfeed-mpv-dwim)
         ("w" . elfeed-show-yank)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; nov for epubs
;; just call "M-x nov-mode"

(use-package! nov)

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; elpher

;; (use-package! elpher)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO kotlin

 ;; (use-package! kotlin-mode)
 ;; (use-package! flycheck-kotlin)
 ;; (use-package! ob-kotlin)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; type-tutor - touch typing
;; you have to:
;; M-x company/toggle-autocompletion (disable it)
;; M-x smartparens-mode (disable it)
;; for properly using type-tutor

(add-load-path! "~/.emacs.d/local-repo/type-tutor")
(require 'type-tutor)

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
;;
;;


 ;; ;; youtube format exportation

(after! org
  (org-link-set-parameters "yt" :export #'+org-export-yt)
  (defun +org-export-yt (path desc backend _com)
    (cond ((org-export-derived-backend-p backend 'html)
           (format "<iframe width='440' \
height='335' \
src='https://www.youtube.com/embed/%s' \
frameborder='0' \
allowfullscreen>%s</iframe>" path (or "" desc)))
          ((org-export-derived-backend-p backend 'latex)
           (format "\\href{https://youtu.be/%s}{%s}" path (or desc "youtube")))
          (t (format "https://youtu.be/%s" path)))))

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
;; circe is alread in doom by default
;;
;; ;; (package! circe) - add this to "packages.el"
;; ;; see lines: 1048-1080 of init.el_good

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO company-emoji and emojify - if needed
;; you have to setup
;; company-emoji in company-backends
;; then you call "M-x company-emoji-init"
;; if you get an error or bug about
;; https://github.com/dunn/company-emoji
;; company tooltips, disable company-emoji
;; see lines: 1090-1215 of init.el_good

(use-package! emojify)

;; (use-package! company-emoji)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Dired plus
(add-load-path! "~/.emacs.d/local-repo/dired+")
(require 'dired+)

(setq dired-dwim-target t)
;; Hide details by default
(add-hook! 'dired-mode-hook 'dired-hide-details-mode)
;; Not spawn endless amount of dired buffers
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; dtrt-indent
(use-package! dtrt-indent
  :diminish t
  :config
  (dtrt-indent-mode +1))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; emacs-wget

(add-load-path! "/usr/local/share/emacs/site-lisp/emacs-wget")

(require 'w3m-wget)
(load "w3m-wget")
(autoload 'wget "wget" "wget interface for Emacs." t)
(autoload 'wget-web-page "wget" "wget interface to download whole web page." t)
(autoload 'w3-wget "w3-wget" "wget interface for Emacs/W3." t)
(setq wget-process-buffer nil)
(setq wget-command "/usr/bin/wget")

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
;;
;; dictionaries

(use-package! dictionary)
(use-package! sdcv)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; flyspell
;; ;; https://simpleit.rocks/lisp/emacs/writing-in-emacs-checking-spelling-style-and-grammar/


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

;; https://200ok.ch/posts/2020-08-22_setting_up_spell_checking_with_multiple_dictionaries.html

;; hunspell

;; (setq ispell-program-name "hunspell")

   (require 'ispell)
   (require 'flyspell)
   (require 'flymake-aspell)

;; Set $DICPATH to "$HOME/Library/Spelling" for hunspell.
(setenv
  "DICPATH"
  "/usr/share/hunspell/")
;; Tell ispell-mode to use hunspell.
(setq
  ispell-program-name
  "/usr/bin/hunspell")

 ;; (global-set-key [f6] 'check-doc-spell-current-buffer)
 (global-set-key [f7] 'ispell-buffer)

;; (if (file-exists-p "/usr/bin/hunspell")
;;     (progn
;;       (setq ispell-program-name "hunspell")
;;       (eval-after-load "ispell"
;;         '(progn (defun ispell-get-coding-system () 'utf-8)))))

;; (use-package! flyspell
;;   :config
;;   (setq flyspell-issue-message-flag nil)
;;   (setq flyspell-issue-welcome-flag nil)
;;   (setq ispell-program-name "aspell")
;;   (setq ispell-dictionary "en_GB")

;;   (defvar cypher/ispell-dictionaries
;;     '(("English" . "en")
;;       ("Brasileiro" . "pt_BR")
;;       ("Greek" . "el")
;;       ("Français" . "fr")
;;       ("Espanõl" . "es"))
;;     "Alist of dictionaries I may use.
;; It is used by `cypher/ispell-dictionaries-complete'.")

;;   (defun cypher/ispell-dictionaries-complete ()
;;     "Select an item from `cypher/ispell-dictionaries'."
;;     (interactive)
;;     (let* ((dicts (mapcar #'car cypher/ispell-dictionaries))
;;            (choice (completing-read "Select dictionary: " dicts nil t))
;;            (key (cdr (assoc `,choice cypher/ispell-dictionaries))))
;;       (ispell-change-dictionary key)
;;       (message "Switched to %s" key)))

;;   (defun cypher/flyspell-dwim ()
;;     "Spell check region or select dictionary.

;; Use `flyspell-region' on the active region, else invoke
;; `cypher/ispell-dictionaries-complete'."
;;     (interactive)
;;     (let ((beg (region-beginning))
;;           (end (region-end)))
;;       (if (use-region-p)
;;           (flyspell-region beg end)
;;         (cypher/ispell-dictionaries-complete))))

;;   :bind (("M-$" . cypher/flyspell-dwim)
;;          ("C-M-$" . cypher/ispell-dictionaries-complete)
;;          :map flyspell-mode-map
;;          ("C-;" . nil)))

;; (use-package! flymake-aspell
;;   :after (flyspell flymake)
;;   ;; :ensure
;;   :init
;;   (dolist (mode '("markdown-mode" "org-mode" "text-mode"))
;;     (add-hook (intern (concat mode "-hook")) #'flymake-aspell-setup)))

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

;; cypher-toggle-previous-letter-case

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-select-line

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-select-text-in-quote

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-select-block

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; cypher-extend-selection

(defun cypher-extend-selection ()
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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO cypher-brackets
;; find a keybind for this function

(defvar cypher-brackets nil "string of left/right brackets pairs.")
(setq cypher-brackets "()[]{}<>（）［］｛｝⦅⦆〚〛⦃⦄“”‘’‹›«»「」〈〉《》【】〔〕⦗⦘『』〖〗〘〙｢｣⟦⟧⟨⟩⟪⟫⟮⟯⟬⟭⌈⌉⌊⌋⦇⦈⦉⦊❛❜❝❞❨❩❪❫❴❵❬❭❮❯❰❱❲❳〈〉⦑⦒⧼⧽﹙﹚﹛﹜﹝﹞⁽⁾₍₎⦋⦌⦍⦎⦏⦐⁅⁆⸢⸣⸤⸥⟅⟆⦓⦔⦕⦖⸦⸧⸨⸩｟｠⧘⧙⧚⧛⸜⸝⸌⸍⸂⸃⸄⸅⸉⸊᚛᚜༺༻༼༽⏜⏝⎴⎵⏞⏟⏠⏡﹁﹂﹃﹄︹︺︻︼︗︘︿﹀︽︾﹇﹈︷︸")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO cypher-left-brackets
;; ;; find a keybind for this function

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO cypher-backward-left-bracket
;; find a keybind for this function

(defun cypher-backward-left-bracket ()
  "Move cursor to the previous occurrence of left bracket.
    The list of brackets to jump to is defined by `cypher-left-brackets'.
    URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
    Version 2015-10-01"
  (interactive)
  (re-search-backward (regexp-opt cypher-left-brackets) nil t))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO cypher-forward-right-bracket
;; find a keybind for this function

(defun cypher-forward-right-bracket ()
  "Move cursor to the next occurrence of right bracket.
    The list of brackets to jump to is defined by `cypher-right-brackets'.
    URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
    Version 2015-10-01"
  (interactive)
  (re-search-forward (regexp-opt cypher-right-brackets) nil t))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO cypher-goto-matching-bracket
;; find a keybind for this function

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO cypher-forward-quote-smart
;; find a keybind for this function

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO cypher-backward-quote
;; find a keybind for this function

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;  TODO cypher-change-bracket-pairs
;;  find a keybind for this function

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

;; TODO
;; cypher-change-bracket-pairs
;; find a keybind for this function

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; flyspell-mode

;; (defun my-turn-spell-checking-on ()
;;   "Turn flyspell-mode on."
;;   (flyspell-mode 1))

;; (add-hook! 'text-mode-hook 'my-turn-spell-checking-on)

;; enable flyspell in text mode (and derived modes)


;; (add-hook! 'telega-chat-mode-hook 'flyspell-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; genealogy

;; (add-load-path! "~/.emacs.d/local-repo/gedcom")

;; (autoload 'gedcom-mode "gedcom")
;; (setq auto-mode-alist (cons '("\\.ged$" . gedcom-mode) auto-mode-alist))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ggtags

(use-package! ggtags
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'php-mode 'web-mode)
                (ggtags-mode 1)))))

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

;; ;; TODO pdf-tools
;; ;; see bellow about line numbers

(use-package! pdf-tools
  :config
  ;; (pdf-tools-install)
     (add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))
 )

     (setq doc-view-conversion-refresh-interval 5)

;; then call "M-x doc-view"

;; (add-hook! 'pdf-view-mode-hook (lambda() (linum-mode -1)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO org-pdfview
;; you have to disable linum-mode
;; or see "display-line-numbers"
;; in the doom/help-faq
;; for configuring it or
;; Use ~M-x doom/toggle-line-numbers~ (bound to =SPC t l= by default)
;; through the available line number styles in the current buffer.
;; e.g. =normal -> relative -> visual -> disabled -> normal=.
;; to cycle

(use-package! org-pdfview)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (global-undo-tree-mode)

; (defun linum-update-window-scale-fix (win)
;;   "fix linum for scaled text"
;;   (set-window-margins win
;;                       (ceiling (* (if (boundp 'text-scale-mode-step)
;;                                       (expt text-scale-mode-step
;;                                             text-scale-mode-amount) 1)
;;                                   (if (car (window-margins))
;;                                       (car (window-margins)) 1)
;;                                   ))))
;; (advice-add #'linum-update-window :after #'linum-update-window-scale-fix)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ;; message-mode
 ;; colorizing multiply-quoted lines

 (add-hook! 'message-mode-hook
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

 (defun message-send-current-buffer ()
   (interactive (list (ido-completing-read "To: " known-email-addresses)))
   (let ((orig-buffer (current-buffer)))

     (message-goto-body)
     (insert (with-current-buffer(set-buffer orig-buffer)
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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; more niceties

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Mouse scrolling

(setq mouse-wheel-scroll-amount '(1)
      mouse-wheel-progressive-speed nil
      scroll-conservatively 101
      hscroll-margin 1
      hscroll-step 1
      scroll-preserve-screen-position t)

;; gtk-tooltipos
(setq x-gtk-use-system-tooltips nil
	    use-dialog-box nil)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Desktop mode
;; (desktop-save-mode t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Save minibuffer history.

;; (savehist-mode 1)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Each file in a new window.
;; ;; (setq pop-up-frames t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Buffer auto-save
;; auto-save

(global-auto-revert-mode 1)
(setq undo-limit 80000000
      evil-want-fine-undo t
      auto-save-default t
      inhibit-compacting-font-caches t
      truncate-string-ellipsis "…")
(whitespace-mode -1)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Disk space is cheap. Save lots. (c) Sacha Chua
;; Backups

(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
      delete-old-versions -1
      version-control t
      vc-make-backup-files t
      auto-save-list-file-prefix "~/.emacs.d/auto-save/"
      auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save/" t))
      undo-tree-auto-save-history t
      undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo/")))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; But don't create stupid lockfiles

(setq create-lockfiles nil)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(setq-default history-length 1000)
(setq-default prescient-history-length 1000)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Which-key
;; ;; C-x to access it

;; (use-package! which-key
;;   :config
;;   (which-key-mode t))

(setq which-key-idle-delay 0.5) ;; I need the help, I really do
(setq which-key-allow-multiple-replacements t)
(after! which-key
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))
   ))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; TODO diminishing-modes

(use-package! diminish
  :init
  (diminish 'which-key-mode)
  ;; (diminish 'linum-mode) ;; doom does not use linum
  ;; (diminish 'linum-relative-mode) ;; doom does not use linum
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
  ;; (diminish 'company-mode)
  ;; (diminish 'flyspell-mode)
  )

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; mu4e - email client

(add-load-path! "/usr/local/share/emacs/site-lisp/mu4e/")
(use-package! mu4e)

(global-set-key (kbd "C-<f10>") 'mu4e)

;; default
(setq mu4e-root-maildir "~/gmail")
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


(setq
send-mail-function 'smtpmail-send-it
 message-send-mail-function 'smtpmail-send-it
user-full-name "Vagner Rener"
 starttls-use-gnutls t
 smtpmail-stream-type 'starttls
 ;; smtpmail-starttls-credentials
 ;; '(("smtp.gmail.com" 587 nil nil))
 ;; smtpmail-auth-credentials
 ;; (expand-file-name "~/.authinfo.gpg")
 ;; (setq auth-sources
 ;;  '((:source "~/.authinfo.gpg")))
 ;; (setq auth-sources
 ;;       '((:source "~/.authinfo.gpg")))
 smtpmail-local-domain "gmail.com"
 smtpmail-default-smtp-server "smtp.gmail.com" ; needs to be specified before the (require)
 smtpmail-smtp-server "smtp.gmail.com"
 user-mail-address (concat "vagnerrener@" smtpmail-local-domain)
 smtpmail-smtp-service 587
 smtpmail-debug-info t)

(require 'smtpmail)
;; for sending a message, just hit "C-c C-s"

(setq mu4e~get-mail-password-regexp
      "^Password (gmail): $")

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; https://github.com/bandresen/mu4e-send-delay

(add-load-path! "~/.emacs.d/local-repo/mu4e-send-delay")
(require 'mu4e-send-delay)
(add-hook 'mu4e-main-mode-hook 'mu4e-send-delay-initialize-send-queue-timer)

(setq mu4e-maildir "~/gmail")

;; Right now the sent buffer will be re-encoded to utf-8, to avoid mml.el complaining upon a scheduled sent. If you notice your mails arriving garbled despite looking okay in the Drafts, please consider the following emacs options:

;; (prefer-coding-system 'utf-8)
;; (set-language-environment "UTF-8")

;; Recommended settings

;; Assigning the scheduled enabled send to C-c C-c

(add-hook! 'mu4e-main-mode-hook (lambda ()
                                  (define-key mu4e-compose-mode-map
                                    (kbd "C-c C-c") 'mu4e-send-delay-send-and-exit)))

;; Now you can C-c C-c every mail
;; Defaults

;; mu4e-send-delay-default-delay is set to “3m”
;; mu4e-send-delay-timer is set to every 2 minutes
;; mu4e-send-delay-include-header-in-draft is true
;; mu4e-send-strip-header-before-send is true

(setq mu4e-org-contacts-file  "~/org~/contacts.org")
       (add-to-list 'mu4e-headers-actions
         '("org-contact-add" . mu4e-action-add-org-contact) t)
       (add-to-list 'mu4e-view-actions
         '("org-contact-add" . mu4e-action-add-org-contact) t)

(add-hook! 'mu4e-compose-mode-hook (lambda () (use-hard-newlines -1)))

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! rotate)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO multiple-cursors
;; You do not need it in doom.
;; Since you have evil-multiedit

;; (use-package! multiple-cursors
;;   :bind
;;   (("C->" . mc/mark-next-like-this)
;;    ("C-<" . mc/mark-previous-like-this)
;;    ("C-M->" . mc/unmark-next-like-this)
;;    ("C-M-<" . mc/unmark-previous-like-this)
;;    ("-*" . mc/mark-all-like-this))
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

;; evil-multiedit

(use-package! evil-multiedit)
(setq evil-multiedit-default-keybinds t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; my-save-word

(global-set-key (kbd "<f5>") 'my-save-word)
(defun my-save-word ()
  (interactive)
  (let ((current-location (point))
        (word (flyspell-get-word)))
    (when (consp word)
      (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; networking

(use-package! net-utils
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


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO slime-swank
;; if needed - lines: 4152 - 4207
;; init.el_good

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Parens faces

(defvar parens-mode-command-exclusions '(mwheel-scroll scroll-up scroll-down)
  "List of functions that are excluded from triggering the function `parens'.")

(defvar parens-mode-syntax-table
  (let ((st (make-syntax-table)))
    st)
  "Syntax table used while executing the function `parens'.")

(defgroup parens nil
  "Faces for highlighting parentheses in `parens-mode'."
  :group 'parens)

(defface parens-one-face
  '((t (:foreground "magenta")))
  "Face for `parens-one-face'."
  :group 'parens)

(defface parens-two-face
  '((t (:foreground "red")))
  "Face for `parens-two-face'."
  :group 'parens)

(defface parens-three-face
  '((t (:foreground "yellow")))
  "Face for `parens-three-face'."
  :group 'parens)

(defface parens-four-face
  '((t (:foreground "green")))
  "Face for `parens-four-face'."
  :group 'parens)

(defface parens-five-face
  '((t (:foreground "cyan")))
  "Face for `parens-five-face'."
  :group 'parens)

(defface parens-six-face
  '((t (:foreground "orange")))
  "Face for `parens-six-face'."
  :group 'parens)

(defface parens-seven-face
  '((t (:foreground "purple")))
  "Face for `parens-seven-face'."
  :group 'parens)

(defface parens-eight-face
  '((t (:foreground "blue")))
  "Face for `parens-eight-face'."
  :group 'parens)

(defface parens-nine-face
  '((t (:foreground "brown")))
  "Face for `parens-nine-face'."
  :group 'parens)

(defface parens-ten-face
  '((t (:foreground "white")))
  "Face for `parens-ten-face'."
  :group 'parens)

(defvar parens-overlays-exist-p nil
"Simple test to see whether the parens overlays have been placed.")
(make-variable-buffer-local 'parens-overlays-exist-p)

(defun parens ()
"Portions of this function were borrowed from the library
`highlight-parentheses` written by Nikolaj Schumacher.
https://github.com/nschum/highlight-parentheses.el"
  (unless (memq this-command parens-mode-command-exclusions)
    (with-syntax-table parens-mode-syntax-table
      (let* (
          (pt (point))
          (pos1 (if
                  (or
                    (= pt (point-min))
                    (eq (preceding-char) 40) ;; open-parentheses
                    (eq (preceding-char) 91) ;; open-squre-bracket
                    (eq (preceding-char) 123)) ;; open-wavy-bracket
              pt
              (1- pt)))
          pos2
          selected-face
          (i 0) )
        (remove-parens-overlays)
        (save-excursion
          (condition-case nil
            (while (setq pos1 (cadr (syntax-ppss pos1)))
              (if (= i 10)
                (setq i 1)
                (setq i (1+ i)))
              (cond
                ((= i 1)
                  (setq selected-face 'parens-one-face))
                ((= i 2)
                  (setq selected-face 'parens-two-face))
                ((= i 3)
                  (setq selected-face 'parens-three-face))
                ((= i 4)
                  (setq selected-face 'parens-four-face))
                ((= i 5)
                  (setq selected-face 'parens-five-face))
                ((= i 6)
                  (setq selected-face 'parens-six-face))
                ((= i 7)
                  (setq selected-face 'parens-seven-face))
                ((= i 8)
                  (setq selected-face 'parens-eight-face))
                ((= i 9)
                  (setq selected-face 'parens-nine-face))
                ((= i 10)
                  (setq selected-face 'parens-ten-face)) )
              (overlay-put (make-overlay pos1 (1+ pos1)) 'face selected-face)
              (when (setq pos2 (scan-sexps pos1 1))
                (overlay-put (make-overlay (1- pos2) pos2) 'face selected-face)))
            (error nil) ))
        (setq parens-overlays-exist-p t)))))

(defun remove-parens-overlays ()
  (when parens-overlays-exist-p
    (dolist (face '(
        parens-one-face
        parens-two-face
        parens-three-face
        parens-four-face
        parens-five-face
        parens-six-face
        parens-seven-face
        parens-eight-face
        parens-nine-face
        parens-ten-face))
      (remove-overlays nil nil 'face face))
    (setq parens-overlays-exist-p nil)))

(defun turn-off-parens-mode ()
  (parens-mode -1))

(define-minor-mode parens-mode
"A minor-mode for highlighting parentheses."
  :init-value nil
  :lighter " ‹›"
  :keymap nil
  :global nil
  :group 'parens
  (cond
    (parens-mode
      (add-hook! 'post-command-hook 'parens t t)
      (add-hook! 'change-major-mode-hook 'turn-off-parens-mode nil t)
      (when (called-interactively-p 'any)
        (message "Turned ON `parens-mode`.")))
    (t
      (remove-hook 'post-command-hook 'parens t)
      (remove-hook 'change-major-mode-hook 'turn-off-parens-mode t)
      (remove-parens-overlays)
      (when (called-interactively-p 'any)
        (message "Turned OFF `parens-mode`.")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; emacs package

(use-package! emacs
  :commands (cypher/window-dired-vc-root-left
             cypher/make-frame-floating-with-current-buffer
             cypher/display-buffer-at-bottom)
  :config
  (defun cypher/window-dired-vc-root-left ()
    "Open project or dir `dired' in a side window.

NOTE: For demo purposes."
    (interactive)
    (let ((dir (if (eq (vc-root-dir) nil)
                   (dired-noselect default-directory)
                 (dired-noselect (vc-root-dir)))))
      (display-buffer-in-side-window
       dir `((side . left)
             (slot . -1)
             (window-width . 0.16)
             (window-parameters
              . ((no-other-window . t)
                 (no-delete-other-windows . t)
                 (mode-line-format
                  . (" "
                     mode-line-buffer-identification))))))
      (with-current-buffer dir
        (rename-buffer "*Dired-Side*")
        (setq-local window-size-fixed 'width)))
    (with-eval-after-load 'ace-window
      (when (boundp 'aw-ignored-buffers)
        (add-to-list 'aw-ignored-buffers "*Dired-Side*"))))

  (defun cypher/make-frame-floating-with-current-buffer ()
    "Display the current buffer in a new floating frame.

This passes certain parameters to the newly created frame:

- use a different name than the default;
- use a graphical frame;
- do not display the minibuffer.

The name is meant to be used by the external rules of my tiling
window manager (BSPWM) to present the frame in a floating state.

NOTE: For demo purposes."
    (interactive)
    (make-frame '((name . "my_float_window")
                  (window-system . x)
                  (minibuffer . nil))))

  (defun cypher/display-buffer-at-bottom ()
    "Move the current buffer to the bottom of the frame.
This is useful to take a buffer out of a side window.

NOTE: For demo purposes."
    (interactive)
    (let ((buffer (current-buffer)))
      (with-current-buffer buffer
        (delete-window)
        (display-buffer-at-bottom
         buffer
         `((window-parameters
            . ((mode-line-format
                . (" "
                   mode-line-buffer-identification))))))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; winner-mode

(use-package! winner
  :hook (after-init-hook . winner-mode)
  :bind ("<s-right>" . winner-redo)
  ("<s-left>" . winner-undo))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-password-manager
;; https://melpa.org/#/org-password-manager

(use-package! org-password-manager)

(global-set-key (kbd "C-c C-p u") 'org-password-manager-get-username)
(global-set-key (kbd "C-c C-p p") 'org-password-manager-get-password)
(global-set-key (kbd "C-c C-p g") 'org-password-manager-generate-password)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; olivetti-mode

  ;; (use-package! olivetti
  ;;   :bind ("C-$" . olivetti-mode)
  ;;   :config
  ;;   (olivetti-mode 1))

;; https://protesilaos.com/dotemacs/#h:7591160f-052a-4d24-8a12-0f7f2e1d5ecd

(use-package! olivetti
  ;; :ensure
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; writeroom

  (use-package! writeroom-mode
    :bind ("C-#" . writeroom-mode)
    :config
    (global-writeroom-mode t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; auctex

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

;; (use-package org-ref
;;   :straight t)

;;  papis for bibliography
(add-to-list 'load-path "~/.emacs.d/local-repo/papis")
(require 'papis)

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
;;     (setq reftex-default-bibliography '("~/org~/references.bib/")); So that RefTeX in Org-mode knows bibliography
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Emacs CAT
;;
(add-load-path! "~/.emacs.d/local-repo/emacs-cat")
(require 'emacs-cat)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Edit-server
;; install the firefox addon
;; https://addons.mozilla.org/en-US/firefox/addon/edit-with-emacs1/

(use-package! edit-server)
(require 'edit-server)
(edit-server-start)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; shell or terminal jump to current directory

(defun shell-jump-to-current-directory ()
  "Open *shell* and change to directory of the given
 buffer. Start shell if needed. Handles dired-mode specially to
 look for the 'closest' subdirectory when multiple directories are
 open."
  (interactive)
  (let* ((dir (if (equal major-mode 'dired-mode)
                  (dired-find-directory-at-point)
                default-directory))
         (dir (replace-regexp-in-string " " "\\\\ " dir))
         (cmd (concat "cd " dir )))
    (when (one-window-p)
      (split-window-right))
    (if (get-buffer "*shel*")
        (progn
          (other-window 1)
          (switch-to-buffer "*shell*"))
      (progn
        (shell)
        (sleep-for 0 10)))
    (end-of-buffer)
    (insert cmd)
    (comint-sent-input)))

(global-set-key "\C-cj" 'shell-jump-to-current-directory)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; mode states

(loop for (mode . state) in '((inferior-emacs-lisp-mode . emacs)
                              (nrepl-mode . insert)
                              (pylookup-mode . emacs)
                              (comint-mode . normal)
                              (shell-mode . insert)
                              (git-commit-mode . insert)
                              (git-rebase-mode . emacs)
                              (term-mode . emacs)
                              (help-mode . emacs)
                              (helm-grep-mode . emacs)
                              (grep-mode . emacs)
                              (bc-menu-mode . emacs)
                              (magit-branch-manager-mode . emacs)
                              (rdictcc-buffer-mode . emacs)
                              (dired-mode . emacs)
                              (w3m-mode . emacs)
                              (eww-mode . emacs)
                              (wdired-mode . normal))
      do (evil-set-initial-state mode state))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; call-xcowsay

(defun call-xcowsay (in-minutes message)
  (interactive "nIn how many minutes: \nsWhat: ")
  (run-at-time (* in-minutes 60)
               nil
               (lambda ()
                 (message "%S" message)
                 (shell-command (format "xcowsay %s" (shell-quote-argument message))))))

(define-key evil-normal-state-map (kbd "SPC cn") #'call-xcowsay)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Ess

;; For julia programming language,
;; enable it - julia and ess - in your init.el and install these packages:
;; apt-get install julia ess julia-doc vim-julia pspp jags
;; Then you can:
;; M-x run-ess-julia

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; eyebrowser

;; (use-package! eyebrowse)
(require 'eyebrowse)

(setq doom-modeline-workspace-name nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; tabbar

(use-package! tabbar
  :after doom-modeline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; equake

;; https://github.com/emacsmirror/equake
;; https://babbagefiles.xyz/equake-elisp-console/

(use-package! equake
  :config                           ; some examples of optional settings follow:
  (global-set-key (kbd "M-H") 'equake-check-if-in-equake-frame-before-closing) ; prevent accidental frame-closure
  (setq equake-size-width 0.99) ; set width a bit less than full-screen (prevent 'overflow' on multi-monitor)
  ;; set distinct face for Equake: white foreground with dark blue background, and different font
  (set-face-attribute 'equake-buffer-face 'nil :inherit 'default :family "DejaVu Sans Mono" :background "#000022" :foreground "white"))

(add-load-path! "~/.emacs.d/local-repo/init-eshell")
(with-eval-after-load 'eshell (require 'init-eshell))

(require 'eshell)
(require 'em-smart)
(add-hook 'eshell-mode-hook 'eshell-smart-initialize)
(require 'esh-module) ; require modules
(add-to-list 'eshell-modules-list 'eshell-tramp)

(use-package! esh-autosuggest)
(use-package! dash)
(use-package! tco)

;; Run with

;; emacsclient -n -e '(equake-invoke)'

;; after launching an Emacs daemon of course. I recommend binding this command to a key like F12 in your DE/WM. Executing this command will create a new equake console on your screen the first time, and subsequently toggle the console (i.e. hide or show it)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yequake

(use-package! yequake)

(setq yequake-frames
      '(("Yequake & scratch" .
         ((width . 0.75)
          (height . 0.5)
          (alpha . 0.95)
          (buffer-fns . ("~/.emacs.d/yequake/yequake.el"
                         split-window-horizontally
                         "*scratch*"))
          (frame-parameters . ((undecorated . t)))))))

;; To activate it, call this command from a shell, e.g. by binding it to a global
;; keyboard shortcut:

;; emacsclient -n -e '(yequake-toggle "Yequake & scratch")'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; selectric-mode
(use-package! selectric-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! undo-tree)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! undo-fu-session
  :config
  (setq undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'")))

(global-undo-fu-session-mode)
(global-undo-tree-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (after! counsel
;;   (ivy-add-actions
;;    'counsel-fzf
;;    '(("j" find-file-other-window "open in other window"))))

   (setq counsel-fzf-cmd "/usr/bin/fzf -f %s")

;; Just-in-time fontification.
(with-eval-after-load "jit-lock"

  ;; Stealth fontification should show status messages.
  (setq jit-lock-stealth-verbose t))

  (setq flycheck-checker-error-threshold 5000)


;; fix-for buffer-has-long-lines
(defun doom-buffer-has-long-lines-p ()
  (when comment-use-syntax
    (so-long-detected-long-line-p)))
(setq so-long-predicate #'doom-buffer-has-long-lines-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO org-transclusion
;; https://github.com/alphapapa/transclusion-in-emacs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! chess)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; eaf - Emacs application framework
;; https://github.com/manateelazycat/emacs-application-framework/
;; https://github.com/manateelazycat/emacs-application-framework/issues/464

(use-package! eaf
  :load-path "~/.emacs.d/local-repo/eaf"
  :custom
  (eaf-find-alternate-file-in-dired t)
  :config
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; People with great doom configs

;; https://github.com/atanasj/.doom.d.gi
;; https://gitlab.com/wef/dotfiles/-/tree/master/.emacs.d.minimal

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#5a5475" "#CC6666" "#C2FFDF" "#FFEA00" "#55b3cc" "#FFB8D1" "#96CBFE" "#F8F8F0"])
 '(beacon-push-mark 10)
 '(custom-safe-themes
   (quote
    ("31772cd378fd8267d6427cec2d02d599eee14a1b60e9b2b894dd5487bd30978e" "b5cff93c3c6ed12d09ce827231b0f5d4925cfda018c9dcf93a2517ce3739e7f1" "0ca71d3462db28ebdef0529995c2d0fdb90650c8e31631e92b9f02bd1bfc5f36" "a92e9da0fab90cbec4af4a2035602208cebf3d071ea547157b2bfc5d9bd4d48d" "1f126eb4a1e5d6b96b3faf494c8c490f1d1e5ad4fc5a1ce120034fe140e77b88" "aad7fd3672aad03901bf91e338cd530b87efc2162697a6bef79d7f8281fd97e3" "6213a6047cc19f580c37ef3f6d47fd5a55ebdf9b5590475d8f7a6aecd79a1cc0" "6b4f7bde1ce64ea4604819fe56ff12cda2a8c803703b677fdfdb603e8b1f8bcb" "780c67d3b58b524aa485a146ad9e837051918b722fd32fd1b7e50ec36d413e70" "2d5c40e709543f156d3dee750cd9ac580a20a371f1b1e1e3ecbef2b895cf0cd2" "9bd5ee2b24759fbc97f86c2783d1bf8f883eb1c0dd2cf7bda2b539cd28abf6a9" "a455366c5cdacebd8adaa99d50e37430b0170326e7640a688e9d9ad406e2edfd" "7bd626fcc9fbfb44186cf3f08b8055d5a15e748d5338e47f9391d459586e20db" "ed92c27d2d086496b232617213a4e4a28110bdc0730a9457edf74f81b782c5cf" default)))
 '(deft-auto-save-interval 30.0)
 '(deft-directory "~/org~/deft-notes")
 '(deft-extensions (quote ("org" "md")))
 '(deft-file-limit 200)
 '(deft-filter-only-filenames t)
 '(deft-recursive t)
 '(deft-use-filename-as-title t)
 '(dtk-default-module "KJVA" t)
 '(dtk-default-module-category "Biblical Texts" t)
 '(dtk-word-wrap t t)
 '(fci-rule-color "#B8A2CE")
 '(global-visual-line-mode t)
 '(jdee-db-active-breakpoint-face-colors (cons "#464258" "#C5A3FF"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#464258" "#C2FFDF"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#464258" "#656565"))
 '(objed-cursor-color "#CC6666")
 '(org-journal-carryover-items nil)
 '(org-journal-date-format "%A, %d %B %Y")
 '(org-journal-dir "~/org~/journal/")
 '(org-journal-enable-agenda-integration t)
 '(org-reveal-root "file:/home/vagner/reveal-slides/reveal.js")
 '(org-roam-directory "~/org~/deft-notes")
 '(package-selected-packages
   (quote
    (sly-repl-ansi-color sly-quicklisp yasnippet-classic-snippets yasnippet-snippets ob-kotlin slime jabber ivy-rtags helm-rtags helm-projectile helm-ag flycheck-rtags company-rtags ac-rtags org-plus-contrib org-msg fd-dired counsel-fd all-the-icons-ivy)))
 '(pdf-view-midnight-colors (cons "#F8F8F0" "#5a5475"))
 '(rustic-ansi-faces
   ["#5a5475" "#CC6666" "#C2FFDF" "#FFEA00" "#55b3cc" "#FFB8D1" "#96CBFE" "#F8F8F0"])
 '(send-mail-function (quote smtpmail-send-it))
 '(telega-notifications-mode t)
 '(vc-annotate-background "#5a5475")
 '(vc-annotate-color-map
   (list
    (cons 20 "#C2FFDF")
    (cons 40 "#d6f894")
    (cons 60 "#eaf14a")
    (cons 80 "#FFEA00")
    (cons 100 "#f6dc00")
    (cons 120 "#eece00")
    (cons 140 "#E6C000")
    (cons 160 "#eebd45")
    (cons 180 "#f6ba8b")
    (cons 200 "#FFB8D1")
    (cons 220 "#ee9cad")
    (cons 240 "#dd8189")
    (cons 260 "#CC6666")
    (cons 280 "#b26565")
    (cons 300 "#986565")
    (cons 320 "#7e6565")
    (cons 340 "#B8A2CE")
    (cons 360 "#B8A2CE")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "#2a2e38"))))
 '(markdown-header-face-1 ((t (:height 1.25 :weight extra-bold :inherit markdown-header-face))))
 '(markdown-header-face-2 ((t (:height 1.15 :weight bold :inherit markdown-header-face))))
 '(markdown-header-face-3 ((t (:height 1.08 :weight bold :inherit markdown-header-face))))
 '(markdown-header-face-4 ((t (:height 1.0 :weight bold :inherit markdown-header-face))))
 '(markdown-header-face-5 ((t (:height 0.9 :weight bold :inherit markdown-header-face))))
 '(markdown-header-face-6 ((t (:height 0.75 :weight extra-bold :inherit markdown-header-face)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
(put 'customize-variable 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'customize-group 'disabled nil)

;; test here dude
