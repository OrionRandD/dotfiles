;;; memrise-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "memrise-dashboard" "memrise-dashboard.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from memrise-dashboard.el

(autoload 'memrise-dashboard "memrise-dashboard" "\
Shpw your Memrise dashboard in the *dashboard* buffer.

This function is the main entry point to memrise.el.  If the user is not
logged in it will ask for credentials.

The content of the dashboard includes all of the courses *attended* by the user.
Each course includes a number of words learned, a number of words for review, and
a number of difficult words.  Additionally it includes a short description of the
course.

The user can jump between all of her courses and start either learning or review
sessions.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "memrise-dashboard" '("memrise-")))

;;;***

;;;### (autoloads nil "memrise-media" "memrise-media.el" (0 0 0 0))
;;; Generated autoloads from memrise-media.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "memrise-media" '("memrise-")))

;;;***

;;;### (autoloads nil "memrise-request" "memrise-request.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from memrise-request.el

(autoload 'memrise-login "memrise-request" "\
Login to memrise account using `USERNAME' and `PASSWORD'.

\(fn USERNAME PASSWORD)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "memrise-request" '("memrise-")))

;;;***

;;;### (autoloads nil "memrise-session" "memrise-session.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from memrise-session.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "memrise-session" '("memrise-")))

;;;***

;;;### (autoloads nil "memrise-session-parser" "memrise-session-parser.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from memrise-session-parser.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "memrise-session-parser" '("memrise-")))

;;;***

;;;### (autoloads nil "memrise-ui" "memrise-ui.el" (0 0 0 0))
;;; Generated autoloads from memrise-ui.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "memrise-ui" '("memrise-")))

;;;***

;;;### (autoloads nil "memrise-utils" "memrise-utils.el" (0 0 0 0))
;;; Generated autoloads from memrise-utils.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "memrise-utils" '("memrise-")))

;;;***

;;;### (autoloads nil "memrise-widget" "memrise-widget.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from memrise-widget.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "memrise-widget" '("memrise-")))

;;;***

;;;### (autoloads nil nil ("memrise-pkg.el" "memrise-session-objects.el"
;;;;;;  "memrise.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; memrise-autoloads.el ends here
