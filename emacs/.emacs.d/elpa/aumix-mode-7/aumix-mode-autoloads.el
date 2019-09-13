;;; aumix-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "aumix-mode" "aumix-mode.el" (22324 54382 451119
;;;;;;  623000))
;;; Generated autoloads from aumix-mode.el

(let ((loads (get 'aumix-mode 'custom-loads))) (if (member '"aumix-mode" loads) nil (put 'aumix-mode 'custom-loads (cons '"aumix-mode" loads))))

(put 'aumix-mode-switches 'risky-local-variable t)

(autoload 'aumix-mode "aumix-mode" "\
Major mode for running the aumix program.
Key bindings are per the aumix program.  Press `k' for a summary,
or see KEYS in \"man aumix\".  `\\[aumix-mode-quit]' quits and kills the buffer.

The various terminal setups of `term-mode' are unchanged.  Note
in Emacs 24 the ANSI colours use `font-lock-mode' so be sure
that's turned on (which it is by default).  In Emacs 21 the
opposite was true; if you turn on font lock then you lose the
colours.

In XEmacs 21.4, term.el doesn't seem to work very well with
ncurses programs.  A message \"Error opening terminal: eterm\" is
from aumix (the ncurses library) complaining the terminfo is not
found.  Adding TERMINFO=/usr/share/xemacs21/xemacs-packages/etc/
or wherever the /e/eterm file lives might help.  If something
doesn't work then C-c C-x C-k will kill the buffer.

`clone-buffer' doesn't work on an aumix-mode buffer, as of Emacs
24.3.  Two or more aumix programs can run simultaneously (their
displays update with the underlying mixer settings), so perhaps
`clone-buffer' could be made to work.  A `rename-buffer' and
second `M-x aumix' works.  But normally only a single aumix-mode
buffer is desired.

----
The aumix home page is
  URL `http://jpj.net/~trevor/aumix.html'
The aumix-mode.el home page is
  URL `http://user42.tuxfamily.org/aumix-mode/index.html'

----
\\{aumix-mode-map}

\(fn)" nil nil)

(autoload 'aumix "aumix-mode" "\
Run the aumix program in a buffer.
An *aumix* buffer is created if it doesn't already exist.
See `aumix-mode' for details of operating the mode.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; aumix-mode-autoloads.el ends here
