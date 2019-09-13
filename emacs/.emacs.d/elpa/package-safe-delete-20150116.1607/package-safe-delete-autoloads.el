;;; package-safe-delete-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "package-safe-delete" "package-safe-delete.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from package-safe-delete.el

(autoload 'package-safe-delete-packages "package-safe-delete" "\
Delete PACKAGES.

PACKAGES is a list of package name symbols.
None of the PACKAGES are deleted when there's a package depending on one of
them, or if one of the PACKAGES is not installed.
With FORCE non-nil, the user is not prompted for confirmation before the
packages are deleted.

\(fn PACKAGES &optional FORCE)" nil nil)

(autoload 'package-safe-delete "package-safe-delete" "\
Delete a PACKAGE.

PACKAGE is a package name symbol.
PACKAGE is not deleted when there are other packages requiring it.
Interactively, prompt for its name.

\(fn PACKAGE)" t nil)

(autoload 'package-safe-delete-packages-recursively "package-safe-delete" "\
Delete PACKAGES.
Each of the PACKAGES and all packages required only by the PACKAGES are deleted.

PACKAGES is a list of package name symbols.
None of the PACKAGES are deleted when there's a package depending on one of
them, or if one of the PACKAGES is not installed.
With FORCE non-nil, the user is not prompted for confirmation before the
packages are deleted.

\(fn PACKAGES &optional FORCE)" nil nil)

(autoload 'package-safe-delete-recursively "package-safe-delete" "\
Recursively delete a PACKAGE.
PACKAGE and all packages required only by it are deleted.

PACKAGE is a package name symbol.
PACKAGE is not deleted when there are other packages requiring it.
Interactively, prompt for its name.

\(fn PACKAGE)" t nil)

(autoload 'package-safe-delete-all "package-safe-delete" "\
Delete all packages not explicitly required.

With FORCE non-nil, the user is not prompted for confirmation before the
packages are deleted.

\(fn &optional FORCE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "package-safe-delete" '("package-safe-delete-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; package-safe-delete-autoloads.el ends here
