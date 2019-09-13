;;; dtk-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "dtk" "dtk.el" (0 0 0 0))
;;; Generated autoloads from dtk.el

(autoload 'dtk "dtk" "\
If the buffer specified by DTK-BUFFER-NAME already exists, move to it. Otherwise, generate the buffer and then provide a prompt to insert content from the current module into the buffer.

\(fn)" t nil)

(autoload 'dtk-search "dtk" "\
Search for the text string WORD-OR-PHRASE. If WORD-OR-PHRASE is NIL, prompt the user for the search string.

\(fn &optional WORD-OR-PHRASE)" t nil)

(autoload 'dtk-select-module-category "dtk" "\
Prompt the user to select a module category.

\(fn)" t nil)

(autoload 'dtk-select-module "dtk" "\
Prompt the user to select a module.

\(fn)" t nil)

(autoload 'dtk-mode "dtk" "\
Major mode for displaying dtk text
\\{dtk-mode-map}
Turning on dtk mode runs `text-mode-hook', then `dtk-mode-hook'.

\(fn)" t nil)

(autoload 'dtk-search-mode "dtk" "\
Major mode for interacting with dtk search results.

\(fn)" t nil)

(autoload 'dtk-dict-mode "dtk" "\
Major mode for interacting with dtk dict results.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "dtk" '("dtk-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; dtk-autoloads.el ends here
