;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "bookmark+/bookmark+" "bookmark+/bookmark+.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from bookmark+/bookmark+.el
 (autoload 'bmkp-version-number "bookmark+")
 (autoload 'bmkp-version "bookmark+")

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bookmark+/bookmark+" '("bmkp-version")))

;;;***

;;;### (autoloads nil "bookmark+/bookmark+-1" "bookmark+/bookmark+-1.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from bookmark+/bookmark+-1.el
 (autoload 'bmkp-autofile-access-invokes-bookmark-flag "bookmark+")
 (autoload 'bmkp-autofile-filecache "bookmark+")
 (autoload 'bmkp-auto-idle-bookmark-min-distance "bookmark+")
 (autoload 'bmkp-auto-idle-bookmark-mode "bookmark+")
 (autoload 'bmkp-auto-idle-bookmark-mode-delay "bookmark+")
 (autoload 'bmkp-auto-idle-bookmark-mode-lighter "bookmark+")
 (autoload 'bmkp-auto-idle-bookmark-mode-set-function "bookmark+")
 (autoload 'bmkp-autoname-bookmark-function "bookmark+")
 (autoload 'bmkp-autoname-format "bookmark+")
 (autoload 'bmkp-autotemp-bookmark-predicates "bookmark+")
 (autoload 'bmkp-bookmark-name-length-max "bookmark+")
 (autoload 'bmkp-count-multi-mods-as-one-flag "bookmark+")
 (autoload 'bmkp-crosshairs-flag "bookmark+")
 (autoload 'bmkp-default-bookmark-name "bookmark+")
 (autoload 'bmkp-default-handlers-for-file-types "bookmark+")
 (autoload 'bmkp-desktop-default-directory "bookmark+")
 (autoload 'bmkp-desktop-jump-save-before-flag "bookmark+")
 (autoload 'bmkp-desktop-no-save-vars "bookmark+")
 (autoload 'bmkp-annotation-modes-inherit-from "bookmark+")
 (autoload 'bmkp-handle-region-function "bookmark+")
 (autoload 'bmkp-info-sort-ignores-directories-flag "bookmark+")
 (autoload 'bmkp-incremental-filter-delay "bookmark+")
 (autoload 'bmkp-menu-popup-max-length "bookmark+")
 (autoload 'bmkp-new-bookmark-default-names "bookmark+")
 (autoload 'bmkp-other-window-pop-to-flag "bookmark+")
 (autoload 'bmkp-prompt-for-tags-flag "bookmark+")
 (autoload 'bmkp-properties-to-keep "bookmark+")
 (autoload 'bmkp-region-search-size "bookmark+")
 (autoload 'bmkp-save-new-location-flag "bookmark+")
 (autoload 'bmkp-sequence-jump-display-function "bookmark+")
 (autoload 'bmkp-show-end-of-region-flag "bookmark+")
 (autoload 'bmkp-sort-comparer "bookmark+")
 (autoload 'bmkp-su-or-sudo-regexp "bookmark+")
 (autoload 'bmkp-tags-for-completion "bookmark+")
 (autoload 'bmkp-temporary-bookmarking-mode-hook "bookmark+")
 (autoload 'bmkp-this-file/buffer-cycle-sort-comparer "bookmark+")
 (autoload 'bmkp-guess-default-handler-for-file-flag "bookmark+")
 (autoload 'bmkp-read-bookmark-file-hook "bookmark+")
 (autoload 'bmkp-temporary-bookmarking-mode-lighter "bookmark+")
 (autoload 'bmkp-use-region "bookmark+")
 (autoload 'bmkp-w3m-allow-multiple-buffers-flag "bookmark+")
 (autoload 'bmkp-write-bookmark-file-hook "bookmark+")
 (autoload 'bookmark-default-annotation-text "bookmark+")
 (autoload 'bookmark-insert-annotation "bookmark+")
 (autoload 'bookmark-edit-annotation-mode "bookmark+")
 (autoload 'bookmark-send-edited-annotation "bookmark+")
 (autoload 'bookmark-edit-annotation "bookmark+")
 (autoload 'bookmark-set "bookmark+")
 (autoload 'bookmark-yank-word "bookmark+")
 (autoload 'bookmark-jump "bookmark+")
 (autoload 'bookmark-jump-other-window "bookmark+")
 (autoload 'bookmark-jump-other-frame "bookmark+")
 (autoload 'bookmark-relocate "bookmark+")
 (autoload 'bookmark-insert-current-bookmark "bookmark+")
 (autoload 'bookmark-insert-location "bookmark+")
 (autoload 'bookmark-rename "bookmark+")
 (autoload 'bookmark-insert "bookmark+")
 (autoload 'bookmark-delete "bookmark+")
 (autoload 'bookmark-save "bookmark+")
 (autoload 'bookmark-load "bookmark+")
 (autoload 'bookmark-show-annotation "bookmark+")
 (autoload 'bookmark-show-all-annotations "bookmark+")
 (autoload 'bmkp-annotate-bookmark "bookmark+")
 (autoload 'bmkp-show-this-annotation-read-only "bookmark+")
 (autoload 'bmkp-edit-this-annotation "bookmark+")
 (autoload 'bmkp-edit-bookmark-name-and-location "bookmark+")
 (autoload 'bmkp-edit-bookmark-records-send "bookmark+")
 (autoload 'bmkp-edit-bookmark-record "bookmark+")
 (autoload 'bmkp-edit-bookmark-record-send "bookmark+")
 (autoload 'bmkp-edit-tags "bookmark+")
 (autoload 'bmkp-edit-tags-send "bookmark+")
 (autoload 'bmkp-bookmark-set-confirm-overwrite "bookmark+")
 (autoload 'bmkp-send-bug-report "bookmark+")
 (autoload 'bmkp-toggle-bookmark-set-refreshes "bookmark+")
 (autoload 'bmkp-toggle-saving-menu-list-state "bookmark+")
 (autoload 'bmkp-save-menu-list-state "bookmark+")
 (autoload 'bmkp-toggle-saving-bookmark-file "bookmark+")
 (autoload 'bmkp-jump-to-list "bookmark+")
 (autoload 'bmkp-make-function-bookmark "bookmark+")
 (autoload 'bmkp-set-dired-bookmark-for-files "bookmark+")
 (autoload 'bmkp-revert-bookmark-file "bookmark+")
 (autoload 'bmkp-switch-bookmark-file "bookmark+")
 (autoload 'bmkp-switch-to-last-bookmark-file "bookmark+")
 (autoload 'bmkp-switch-bookmark-file-create "bookmark+")
 (autoload 'bmkp-empty-file "bookmark+")
 (autoload 'bmkp-crosshairs-highlight "bookmark+")
 (autoload 'bmkp-choose-navlist-from-bookmark-list "bookmark+")
 (autoload 'bmkp-choose-navlist-of-type "bookmark+")
 (autoload 'bmkp-this-file/buffer-bmenu-list "bookmark+")
 (autoload 'bmkp-this-file-bmenu-list "bookmark+")
 (autoload 'bmkp-this-buffer-bmenu-list "bookmark+")
 (autoload 'bmkp-navlist-bmenu-list "bookmark+")
 (autoload 'bmkp-unomit-all "bookmark+")
 (autoload 'bmkp-list-all-tags "bookmark+")
 (autoload 'bmkp-remove-all-tags "bookmark+")
 (autoload 'bmkp-add-tags "bookmark+")
 (autoload 'bmkp-set-tag-value-for-navlist "bookmark+")
 (autoload 'bmkp-set-tag-value "bookmark+")
 (autoload 'bmkp-remove-tags "bookmark+")
 (autoload 'bmkp-remove-tags-from-all "bookmark+")
 (autoload 'bmkp-rename-tag "bookmark+")
 (autoload 'bmkp-copy-tags "bookmark+")
 (autoload 'bmkp-paste-add-tags "bookmark+")
 (autoload 'bmkp-paste-replace-tags "bookmark+")
 (autoload 'bmkp-url-target-set "bookmark+")
 (autoload 'bmkp-file-target-set "bookmark+")
 (autoload 'bmkp-bookmark-a-file "bookmark+")
 (autoload 'bmkp-autofile-set "bookmark+")
 (autoload 'bmkp-tag-a-file "bookmark+")
 (autoload 'bmkp-autofile-add-tags "bookmark+")
 (autoload 'bmkp-untag-a-file "bookmark+")
 (autoload 'bmkp-autofile-remove-tags "bookmark+")
 (autoload 'bmkp-purge-notags-autofiles "bookmark+")
 (autoload 'bmkp-describe-bookmark "bookmark+")
 (autoload 'bmkp-describe-bookmark-internals "bookmark+")
 (autoload 'bmkp-list-defuns-in-commands-file "bookmark+")
 (autoload 'bmkp-set-bookmark-file-bookmark "bookmark+")
 (autoload 'bmkp-bookmark-file-jump "bookmark+")
 (autoload 'bmkp-bookmark-file-load-jump "bookmark+")
 (autoload 'bmkp-bookmark-file-switch-jump "bookmark+")
 (autoload 'bmkp-set-snippet-bookmark "bookmark+")
 (autoload 'bmkp-snippet-to-kill-ring "bookmark+")
 (autoload 'bmkp-set-desktop-bookmark "bookmark+")
 (autoload 'bmkp-desktop-change-dir "bookmark+")
 (autoload 'bmkp-desktop-read "bookmark+")
 (autoload 'bmkp-desktop-delete "bookmark+")
 (autoload 'bmkp-retrieve-icicle-search-hits "bookmark+")
 (autoload 'bmkp-retrieve-more-icicle-search-hits "bookmark+")
 (autoload 'bmkp-set-icicle-search-hits-bookmark "bookmark+")
 (autoload 'bmkp-wrap-bookmark-with-last-kbd-macro "bookmark+")
 (autoload 'bmkp-set-sequence-bookmark "bookmark+")
 (autoload 'bmkp-set-variable-list-bookmark "bookmark+")
 (autoload 'bmkp-dired-subdirs "bookmark+")
 (autoload 'bmkp-jump-to-type "bookmark+")
 (autoload 'bmkp-jump-to-type-other-window "bookmark+")
 (autoload 'bmkp-autonamed-jump "bookmark+")
 (autoload 'bmkp-autonamed-jump-other-window "bookmark+")
 (autoload 'bmkp-autonamed-this-buffer-jump "bookmark+")
 (autoload 'bmkp-autonamed-this-buffer-jump-other-window "bookmark+")
 (autoload 'bmkp-bookmark-list-jump "bookmark+")
 (autoload 'bmkp-desktop-jump "bookmark+")
 (autoload 'bmkp-dired-jump "bookmark+")
 (autoload 'bmkp-dired-jump-other-window "bookmark+")
 (autoload 'bmkp-dired-this-dir-jump "bookmark+")
 (autoload 'bmkp-dired-this-dir-jump-other-window "bookmark+")
 (autoload 'bmkp-file-jump "bookmark+")
 (autoload 'bmkp-file-jump-other-window "bookmark+")
 (autoload 'bmkp-file-this-dir-jump "bookmark+")
 (autoload 'bmkp-file-this-dir-jump-other-window "bookmark+")
 (autoload 'bmkp-gnus-jump "bookmark+")
 (autoload 'bmkp-gnus-jump-other-window "bookmark+")
 (autoload 'bmkp-image-jump "bookmark+")
 (autoload 'bmkp-image-jump-other-window "bookmark+")
 (autoload 'bmkp-info-jump "bookmark+")
 (autoload 'bmkp-info-jump-other-window "bookmark+")
 (autoload 'bmkp-local-file-jump "bookmark+")
 (autoload 'bmkp-local-file-jump-other-window "bookmark+")
 (autoload 'bmkp-local-non-dir-file-jump "bookmark+")
 (autoload 'bmkp-local-non-dir-file-jump-other-window "bookmark+")
 (autoload 'bmkp-man-jump "bookmark+")
 (autoload 'bmkp-man-jump-other-window "bookmark+")
 (autoload 'bmkp-non-dir-file-jump "bookmark+")
 (autoload 'bmkp-non-dir-file-jump-other-window "bookmark+")
 (autoload 'bmkp-non-file-jump "bookmark+")
 (autoload 'bmkp-non-file-jump-other-window "bookmark+")
 (autoload 'bmkp-region-jump "bookmark+")
 (autoload 'bmkp-region-jump-other-window "bookmark+")
 (autoload 'bmkp-region-jump-narrow-indirect-other-window "bookmark+")
 (autoload 'bmkp-remote-file-jump "bookmark+")
 (autoload 'bmkp-remote-file-jump-other-window "bookmark+")
 (autoload 'bmkp-remote-non-dir-file-jump "bookmark+")
 (autoload 'bmkp-remote-non-dir-file-jump-other-window "bookmark+")
 (autoload 'bmkp-specific-buffers-jump "bookmark+")
 (autoload 'bmkp-specific-buffers-jump-other-window "bookmark+")
 (autoload 'bmkp-specific-files-jump "bookmark+")
 (autoload 'bmkp-specific-files-jump-other-window "bookmark+")
 (autoload 'bmkp-temporary-jump "bookmark+")
 (autoload 'bmkp-temporary-jump-other-window "bookmark+")
 (autoload 'bmkp-this-buffer-jump "bookmark+")
 (autoload 'bmkp-this-buffer-jump-other-window "bookmark+")
 (autoload 'bmkp-variable-list-jump "bookmark+")
 (autoload 'bmkp-url-jump "bookmark+")
 (autoload 'bmkp-url-jump-other-window "bookmark+")
 (autoload 'bmkp-w32-browser-jump "bookmark+")
 (autoload 'bmkp-w3m-jump "bookmark+")
 (autoload 'bmkp-w3m-jump-other-window "bookmark+")
 (autoload 'bmkp-all-tags-jump "bookmark+")
 (autoload 'bmkp-all-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-all-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-all-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-some-tags-jump "bookmark+")
 (autoload 'bmkp-some-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-some-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-some-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-file-all-tags-jump "bookmark+")
 (autoload 'bmkp-file-all-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-file-all-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-file-all-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-file-some-tags-jump "bookmark+")
 (autoload 'bmkp-file-some-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-file-some-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-file-some-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-file-this-dir-all-tags-jump "bookmark+")
 (autoload 'bmkp-file-this-dir-all-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-file-this-dir-all-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-file-this-dir-all-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-file-this-dir-some-tags-jump "bookmark+")
 (autoload 'bmkp-file-this-dir-some-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-file-this-dir-some-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-file-this-dir-some-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-autofile-jump "bookmark+")
 (autoload 'bmkp-autofile-jump-other-window "bookmark+")
 (autoload 'bmkp-autofile-all-tags-jump "bookmark+")
 (autoload 'bmkp-autofile-all-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-autofile-all-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-autofile-all-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-autofile-some-tags-jump "bookmark+")
 (autoload 'bmkp-autofile-some-tags-jump-other-window "bookmark+")
 (autoload 'bmkp-autofile-some-tags-regexp-jump "bookmark+")
 (autoload 'bmkp-autofile-some-tags-regexp-jump-other-window "bookmark+")
 (autoload 'bmkp-find-file-all-tags-regexp-other-window "bookmark+")
 (autoload 'bmkp-find-file-some-tags "bookmark+")
 (autoload 'bmkp-find-file-some-tags-other-window "bookmark+")
 (autoload 'bmkp-find-file-some-tags-regexp "bookmark+")
 (autoload 'bmkp-find-file-some-tags-regexp-other-window "bookmark+")
 (autoload 'bmkp-jump-in-navlist "bookmark+")
 (autoload 'bmkp-jump-in-navlist-other-window "bookmark+")
 (autoload 'bmkp-cycle "bookmark+")
 (autoload 'bmkp-cycle-other-window "bookmark+")
 (autoload 'bmkp-cycle-this-file/buffer "bookmark+")
 (autoload 'bmkp-cycle-this-file/buffer-other-window "bookmark+")
 (autoload 'bmkp-cycle-this-file "bookmark+")
 (autoload 'bmkp-cycle-this-file-other-window "bookmark+")
 (autoload 'bmkp-cycle-this-buffer "bookmark+")
 (autoload 'bmkp-cycle-this-buffer-other-window "bookmark+")
 (autoload 'bmkp-next-bookmark "bookmark+")
 (autoload 'bmkp-previous-bookmark "bookmark+")
 (autoload 'bmkp-next-bookmark-other-window "bookmark+")
 (autoload 'bmkp-previous-bookmark-other-window "bookmark+")
 (autoload 'bmkp-next-bookmark-repeat "bookmark+")
 (autoload 'bmkp-previous-bookmark-repeat "bookmark+")
 (autoload 'bmkp-next-bookmark-other-window-repeat "bookmark+")
 (autoload 'bmkp-previous-bookmark-other-window-repeat "bookmark+")
 (autoload 'bmkp-next-bookmark-this-file/buffer "bookmark+")
 (autoload 'bmkp-previous-bookmark-this-file/buffer "bookmark+")
 (autoload 'bmkp-next-bookmark-this-file/buffer-repeat "bookmark+")
 (autoload 'bmkp-previous-bookmark-this-file/buffer-repeat "bookmark+")
 (autoload 'bmkp-next-bookmark-this-file "bookmark+")
 (autoload 'bmkp-previous-bookmark-this-file "bookmark+")
 (autoload 'bmkp-next-bookmark-this-file-repeat "bookmark+")
 (autoload 'bmkp-previous-bookmark-this-file-repeat "bookmark+")
 (autoload 'bmkp-next-bookmark-this-buffer "bookmark+")
 (autoload 'bmkp-previous-bookmark-this-buffer "bookmark+")
 (autoload 'bmkp-next-bookmark-this-buffer-repeat "bookmark+")
 (autoload 'bmkp-previous-bookmark-this-buffer-repeat "bookmark+")
 (autoload 'bmkp-next-bookmark-w32 "bookmark+")
 (autoload 'bmkp-previous-bookmark-w32 "bookmark+")
 (autoload 'bmkp-next-bookmark-w32-repeat "bookmark+")
 (autoload 'bmkp-previous-bookmark-w32-repeat "bookmark+")
 (autoload 'bmkp-toggle-autonamed-bookmark-set/delete "bookmark+")
 (autoload 'bmkp-set-autonamed-bookmark "bookmark+")
 (autoload 'bmkp-set-autonamed-bookmark-at-line "bookmark+")
 (autoload 'bmkp-set-autonamed-regexp-buffer "bookmark+")
 (autoload 'bmkp-set-autonamed-regexp-region "bookmark+")
 (autoload 'bmkp-delete-all-autonamed-for-this-buffer "bookmark+")
 (autoload 'bmkp-toggle-autotemp-on-set "bookmark+")
 (autoload 'bmkp-toggle-temporary-bookmark "bookmark+")
 (autoload 'bmkp-make-bookmark-temporary "bookmark+")
 (autoload 'bmkp-make-bookmark-savable "bookmark+")
 (autoload 'bmkp-delete-all-temporary-bookmarks "bookmark+")
 (autoload 'bmkp-delete-bookmarks "bookmark+")

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bookmark+/bookmark+-1" '("bookmark" "bmk")))

;;;***

;;;### (autoloads nil "bookmark+/bookmark+-bmu" "bookmark+/bookmark+-bmu.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from bookmark+/bookmark+-bmu.el
 (autoload 'bmkp-bmenu-omitted-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-commands-file "bookmark+")
 (autoload 'bmkp-bmenu-state-file "bookmark+")
 (autoload 'bmkp-bmenu-image-bookmark-icon-file "bookmark+")
 (autoload 'bookmark-bmenu-mark "bookmark+")
 (autoload 'bookmark-bmenu-unmark "bookmark+")
 (autoload 'bmkp-bmenu-flag-for-deletion "bookmark+")
 (autoload 'bookmark-bmenu-delete "bookmark+")
 (autoload 'bmkp-bmenu-flag-for-deletion-backwards "bookmark+")
 (autoload 'bookmark-bmenu-delete-backwards "bookmark+")
 (autoload 'list-bookmarks "bookmark+")
 (autoload 'bookmark-bmenu-list "bookmark+")
 (autoload 'bookmark-bmenu-1-window "bookmark+")
 (autoload 'bookmark-bmenu-2-window "bookmark+")
 (autoload 'bookmark-bmenu-this-window "bookmark+")
 (autoload 'bookmark-bmenu-other-window "bookmark+")
 (autoload 'bookmark-bmenu-other-window "bookmark+")
 (autoload 'bookmark-bmenu-switch-other-window "bookmark+")
 (autoload 'bookmark-bmenu-other-window-with-mouse "bookmark+")
 (autoload 'bookmark-bmenu-show-annotation "bookmark+")
 (autoload 'bookmark-bmenu-execute-deletions "bookmark+")
 (autoload 'bookmark-bmenu-rename "bookmark+")
 (autoload 'bmkp-bmenu-show-only-autonamed-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-non-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-dired-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-function-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-gnus-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-icicles-search-hits-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-non-invokable-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-image-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-info-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-desktop-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-man-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-region-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-tagged-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-untagged-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-url-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-variable-list-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-snippet-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-w3m-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-temporary-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-bookmark-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-bookmark-list-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-all "bookmark+")
 (autoload 'bmkp-bmenu-show-only-autofile-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-orphaned-local-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-specific-buffer-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-show-only-specific-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-refresh-menu-list "bookmark+")
 (autoload 'bmkp-bmenu-filter-bookmark-name-incrementally "bookmark+")
 (autoload 'bmkp-bmenu-filter-file-name-incrementally "bookmark+")
 (autoload 'bmkp-bmenu-filter-annotation-incrementally "bookmark+")
 (autoload 'bmkp-bmenu-filter-tags-incrementally "bookmark+")
 (autoload 'bmkp-bmenu-toggle-show-only-unmarked "bookmark+")
 (autoload 'bmkp-bmenu-toggle-show-only-marked "bookmark+")
 (autoload 'bmkp-bmenu-mark-all "bookmark+")
 (autoload 'bmkp-bmenu-unmark-all "bookmark+")
 (autoload 'bmkp-bmenu-regexp-mark "bookmark+")
 (autoload 'bmkp-bmenu-mark-autofile-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-autonamed-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmark-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmark-list-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-desktop-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-dired-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-function-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-gnus-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-icicles-search-hits-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-image-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-info-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-man-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-non-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-non-invokable-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-orphaned-local-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-region-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-snippet-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-specific-buffer-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-specific-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-temporary-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-variable-list-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-url-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-w3m-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmarks-satisfying "bookmark+")
 (autoload 'bmkp-bmenu-toggle-marks "bookmark+")
 (autoload 'bmkp-bmenu-toggle-marked-temporary/savable "bookmark+")
 (autoload 'bmkp-bmenu-toggle-temporary "bookmark+")
 (autoload 'bmkp-bmenu-dired-marked "bookmark+")
 (autoload 'bmkp-bmenu-delete-marked "bookmark+")
 (autoload 'bmkp-bmenu-move-marked-to-bookmark-file "bookmark+")
 (autoload 'bmkp-bmenu-copy-marked-to-bookmark-file "bookmark+")
 (autoload 'bmkp-bmenu-create-bookmark-file-from-marked "bookmark+")
 (autoload 'bmkp-bmenu-set-bookmark-file-bookmark-from-marked "bookmark+")
 (autoload 'bmkp-bmenu-load-marked-bookmark-file-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-load-marking "bookmark+")
 (autoload 'bmkp-bmenu-load-marking-unmark-first "bookmark+")
 (autoload 'bmkp-bmenu-make-sequence-from-marked "bookmark+")
 (autoload 'bmkp-bmenu-omit "bookmark+")
 (autoload 'bmkp-bmenu-omit/unomit-marked "bookmark+")
 (autoload 'bmkp-bmenu-omit-marked "bookmark+")
 (autoload 'bmkp-bmenu-unomit-marked "bookmark+")
 (autoload 'bmkp-bmenu-show-only-omitted-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-search-marked-bookmarks-regexp "bookmark+")
 (autoload 'bmkp-bmenu-query-replace-marked-bookmarks-regexp "bookmark+")
 (autoload 'bmkp-bmenu-remove-all-tags "bookmark+")
 (autoload 'bmkp-bmenu-add-tags "bookmark+")
 (autoload 'bmkp-bmenu-set-tag-value "bookmark+")
 (autoload 'bmkp-bmenu-set-tag-value-for-marked "bookmark+")
 (autoload 'bmkp-bmenu-remove-tags "bookmark+")
 (autoload 'bmkp-bmenu-add-tags-to-marked "bookmark+")
 (autoload 'bmkp-bmenu-remove-tags-from-marked "bookmark+")
 (autoload 'bmkp-bmenu-list-tags-of-marked "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmarks-tagged-regexp "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmarks-tagged-all "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmarks-tagged-none "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmarks-tagged-some "bookmark+")
 (autoload 'bmkp-bmenu-mark-bookmarks-tagged-not-all "bookmark+")
 (autoload 'bmkp-bmenu-unmark-bookmarks-tagged-regexp "bookmark+")
 (autoload 'bmkp-bmenu-unmark-bookmarks-tagged-all "bookmark+")
 (autoload 'bmkp-bmenu-unmark-bookmarks-tagged-none "bookmark+")
 (autoload 'bmkp-bmenu-unmark-bookmarks-tagged-some "bookmark+")
 (autoload 'bmkp-bmenu-unmark-bookmarks-tagged-not-all "bookmark+")
 (autoload 'bmkp-bmenu-copy-tags "bookmark+")
 (autoload 'bmkp-bmenu-paste-add-tags "bookmark+")
 (autoload 'bmkp-bmenu-paste-replace-tags "bookmark+")
 (autoload 'bmkp-bmenu-paste-add-tags-to-marked "bookmark+")
 (autoload 'bmkp-bmenu-paste-replace-tags-for-marked "bookmark+")
 (autoload 'bmkp-bmenu-show-or-edit-annotation "bookmark+")
 (autoload 'bmkp-bmenu-jump-to-marked "bookmark+")
 (autoload 'bmkp-bmenu-w32-open "bookmark+")
 (autoload 'bmkp-bmenu-w32-open-with-mouse "bookmark+")
 (autoload 'bmkp-bmenu-w32-jump-to-marked "bookmark+")
 (autoload 'bmkp-bmenu-mode-status-help "bookmark+")
 (autoload 'bmkp-bmenu-define-jump-marked-command "bookmark+")
 (autoload 'bmkp-bmenu-define-command "bookmark+")
 (autoload 'bmkp-bmenu-define-full-snapshot-command "bookmark+")
 (autoload 'bmkp-define-tags-sort-command "bookmark+")
 (autoload 'bmkp-bmenu-relocate-marked "bookmark+")
 (autoload 'bmkp-bmenu-edit-bookmark-name-and-location "bookmark+")
 (autoload 'bmkp-bmenu-edit-tags "bookmark+")
 (autoload 'bmkp-bmenu-edit-bookmark-record "bookmark+")
 (autoload 'bmkp-bmenu-edit-marked "bookmark+")
 (autoload 'bmkp-bmenu-quit "bookmark+")
 (autoload 'bmkp-bmenu-change-sort-order-repeat "bookmark+")
 (autoload 'bmkp-bmenu-change-sort-order "bookmark+")
 (autoload 'bmkp-reverse-sort-order "bookmark+")
 (autoload 'bmkp-reverse-multi-sort-order "bookmark+")
 (autoload 'bmkp-bmenu-show-this-annotation+move-down "bookmark+")
 (autoload 'bmkp-bmenu-show-this-annotation+move-up "bookmark+")
 (autoload 'bmkp-bmenu-describe-this+move-down "bookmark+")
 (autoload 'bmkp-bmenu-describe-this+move-up "bookmark+")
 (autoload 'bmkp-bmenu-describe-this-bookmark "bookmark+")
 (autoload 'bmkp-bmenu-describe-marked "bookmark+")
 (autoload 'bmkp-bmenu-mouse-3-menu "bookmark+")

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bookmark+/bookmark+-bmu" '("bookmark-bmenu-" "bmkp-" "menu-bar-edit-menu" "list-bookmarks")))

;;;***

;;;### (autoloads nil "bookmark+/bookmark+-key" "bookmark+/bookmark+-key.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from bookmark+/bookmark+-key.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bookmark+/bookmark+-key" '("bmkp-" "menu-bar-bookmark-map")))

;;;***

;;;### (autoloads nil "bookmark+/bookmark+-lit" "bookmark+/bookmark+-lit.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from bookmark+/bookmark+-lit.el
 (autoload 'bmkp-auto-light-relocate-when-jump-flag "bookmark+")
 (autoload 'bmkp-auto-light-when-jump "bookmark+")
 (autoload 'bmkp-auto-light-when-set "bookmark+")
 (autoload 'bmkp-light-priorities "bookmark+")
 (autoload 'bmkp-light-style-autonamed "bookmark+")
 (autoload 'bmkp-light-style-non-autonamed "bookmark+")
 (autoload 'bmkp-light-style-autonamed-region "bookmark+")
 (autoload 'bmkp-light-style-non-autonamed-region "bookmark+")
 (autoload 'bmkp-light-threshold "bookmark+")
 (autoload 'bmkp-tooltip-content-function "bookmark+")
 (autoload 'bmkp-bmenu-show-only-lighted-bookmarks "bookmark+")
 (autoload 'bmkp-bmenu-light "bookmark+")
 (autoload 'bmkp-bmenu-light-marked "bookmark+")
 (autoload 'bmkp-bmenu-unlight "bookmark+")
 (autoload 'bmkp-bmenu-unlight-marked "bookmark+")
 (autoload 'bmkp-bmenu-set-lighting "bookmark+")
 (autoload 'bmkp-bmenu-set-lighting-for-marked "bookmark+")
 (autoload 'bmkp-bookmarks-lighted-at-point "bookmark+")
 (autoload 'bmkp-toggle-auto-light-when-jump "bookmark+")
 (autoload 'bmkp-lighted-jump "bookmark+")
 (autoload 'bmkp-lighted-jump-other-window "bookmark+")
 (autoload 'bmkp-lighted-jump-to-list "bookmark+")
 (autoload 'bmkp-unlight-bookmark "bookmark+")
 (autoload 'bmkp-unlight-bookmark-here "bookmark+")
 (autoload 'bmkp-unlight-bookmark-this-buffer "bookmark+")
 (autoload 'bmkp-unlight-bookmarks "bookmark+")
 (autoload 'bmkp-unlight-autonamed-this-buffer "bookmark+")
 (autoload 'bmkp-unlight-non-autonamed-this-buffer "bookmark+")
 (autoload 'bmkp-unlight-this-buffer "bookmark+")
 (autoload 'bmkp-toggle-auto-light-when-set "bookmark+")
 (autoload 'bmkp-set-lighting-for-bookmark "bookmark+")
 (autoload 'bmkp-set-lighting-for-buffer "bookmark+")
 (autoload 'bmkp-set-lighting-for-this-buffer "bookmark+")
 (autoload 'bmkp-light-bookmark "bookmark+")
 (autoload 'bmkp-light-bookmark-this-buffer "bookmark+")
 (autoload 'bmkp-light-bookmarks "bookmark+")
 (autoload 'bmkp-light-navlist-bookmarks "bookmark+")
 (autoload 'bmkp-light-this-buffer "bookmark+")
 (autoload 'bmkp-light-bookmarks-in-region "bookmark+")
 (autoload 'bmkp-light-autonamed-this-buffer "bookmark+")
 (autoload 'bmkp-light-non-autonamed-this-buffer "bookmark+")
 (autoload 'bmkp-cycle-lighted-this-buffer "bookmark+")
 (autoload 'bmkp-cycle-lighted-this-buffer-other-window "bookmark+")
 (autoload 'bmkp-next-lighted-this-buffer "bookmark+")
 (autoload 'bmkp-previous-lighted-this-buffer "bookmark+")
 (autoload 'bmkp-next-lighted-this-buffer-repeat "bookmark+")
 (autoload 'bmkp-previous-lighted-this-buffer-repeat "bookmark+")
 (autoload 'bmkp-describe-bookmark-lighted-here "bookmark+")

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bookmark+/bookmark+-lit" '("bmkp-")))

;;;***

;;;### (autoloads nil "bookmark+/bookmark+-mac" "bookmark+/bookmark+-mac.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from bookmark+/bookmark+-mac.el
 (autoload 'bmkp-with-help-window "bookmark+")
 (autoload 'bmkp-with-output-to-plain-temp-buffer "bookmark+")
 (autoload 'bmkp-define-cycle-command "bookmark+")
 (autoload 'bmkp-define-next+prev-cycle-commands "bookmark+")
 (autoload 'bmkp-define-show-only-command "bookmark+")
 (autoload 'bmkp-define-sort-command "bookmark+")
 (autoload 'bmkp-define-file-sort-predicate "bookmark+")
 (autoload 'bmkp-menu-bar-make-toggle "bookmark+")
 (autoload 'bmkp-with-bookmark-dir "bookmark+")

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bookmark+/bookmark+-mac" '("bmkp-")))

;;;***

;;;### (autoloads nil "dired+/dired+" "dired+/dired+.el" (0 0 0 0))
;;; Generated autoloads from dired+/dired+.el

(defvar diff-switches "-c" "\
*A string or list of strings specifying switches to be passed to diff.")

(custom-autoload 'diff-switches "dired+/dired+" t)

(defvar diredp-auto-focus-frame-for-thumbnail-tooltip-flag nil "\
*Non-nil means automatically focus the frame for a thumbnail tooltip.
If nil then you will not see a thumbnail image tooltip when you
mouseover an image-file name in Dired, unless you first give the frame
the input focus (e.g., by clicking its title bar).

This option has no effect if `diredp-image-preview-in-tooltip' is nil.
It also has no effect for Emacs versions prior to Emacs 22.")

(custom-autoload 'diredp-auto-focus-frame-for-thumbnail-tooltip-flag "dired+/dired+" t)

(defvar diredp-bind-problematic-terminal-keys t "\
*Non-nil means bind some keys that might not work in a text-only terminal.
This applies to keys that use modifiers Meta and Shift together.
If you use Emacs in text-only terminal and your terminal does not
support the use of such keys then customize this option to nil.")

(custom-autoload 'diredp-bind-problematic-terminal-keys "dired+/dired+" t)

(defvar diredp-compressed-extensions '(".tar" ".taz" ".tgz" ".arj" ".lzh" ".lzma" ".xz" ".zip" ".z" ".Z" ".gz" ".bz2" ".rar" ".rev") "\
*List of compressed-file extensions, for highlighting.

Note: If you change the value of this option then you need to restart
Emacs to see the effect of the new value on font-locking.")

(custom-autoload 'diredp-compressed-extensions "dired+/dired+" t)

(defvar diredp-do-report-echo-limit 5 "\
Echo result for each file, for fewer than this many files.
If more than this many files are acted on then there is no echoing.

Used by some do-and-report commands such as `diredp-do-emacs-command'.
Results that are not echoed are anyway reported by `dired-log', so you
can show them with `?' in the Dired buffer.")

(custom-autoload 'diredp-do-report-echo-limit "dired+/dired+" t)

(defvar diredp-dwim-any-frame-flag pop-up-frames "\
*Non-nil means the target directory can be in a window in another frame.
Only visible frames are considered.
This is used by ``dired-dwim-target-directory'.
This option has no effect for Emacs versions before Emacs 22.")

(custom-autoload 'diredp-dwim-any-frame-flag "dired+/dired+" t)

(unless (fboundp 'define-minor-mode) (defcustom diredp-highlight-autofiles-mode t "*Non-nil means highlight names of files that are autofile bookmarks.\nAutofiles that have tags are highlighted using face\n`diredp-tagged-autofile-name'.  Those with no tags are highlighted\nusing face `diredp-autofile-name'.\n\nSetting this option directly does not take effect; use either\n\\[customize] or command `diredp-highlight-autofiles-mode'.\n\nNOTE: When `dired+.el' is loaded (for the first time per Emacs\nsession), the highlighting is turned ON, regardless of the option\nvalue.  To prevent this and have the highlighting OFF by default, you\nmust do one of the following:\n\n * Put (diredp-highlight-autofiles-mode -1) in your init file, AFTER\n   it loads `dired+.el'.\n\n * Customize the option to `nil', AND ensure that your `custom-file'\n   (or the `custom-saved-variables' part of your init file) is\n   evaluated before `dired+.el' is loaded.\n\nThis option has no effect unless you use libraries `Bookmark and\n`highlight.el'." :set (lambda (symbol value) (diredp-highlight-autofiles-mode (if value 1 -1))) :initialize 'custom-initialize-default :type 'boolean :group 'Dired-Plus :require 'dired+))

(defvar diredp-ignore-compressed-flag t "\
*Non-nil means to font-lock names of compressed files as ignored files.
This applies to filenames whose extensions are in
`diredp-compressed-extensions'.  If nil they are highlighted using
face `diredp-compressed-file-name'.

Note: If you change the value of this option then you need to restart
Emacs to see the effect of the new value on font-locking.")

(custom-autoload 'diredp-ignore-compressed-flag "dired+/dired+" t)

(defvar diredp-image-preview-in-tooltip (or (and (boundp 'image-dired-thumb-size) image-dired-thumb-size) 100) "\
*Whether and what kind of image preview to show in a tooltip.
The possible values are:

 `nil'       : do not show a tooltip preview
 integer N>0 : show a thumbnail preview of that size
 `full'      : show a full-size preview of the image

To enable tooltip image preview you must turn on `tooltip-mode' and
load library `image-dired.el'.  See also option
`diredp-auto-focus-frame-for-thumbnail-tooltip-flag'.

This option has no effect for Emacs versions prior to Emacs 22.")

(custom-autoload 'diredp-image-preview-in-tooltip "dired+/dired+" t)

(defvar diredp-image-show-this-file-use-frame-flag t "\
Non-nil means `diredp-image-show-this-file' uses another frame.
If nil then it uses another window.  Using another frame means you
have more control over the image size when you use a prefix arg.

If it uses another window then the prefix arg controls only the
minimum window height, not necessarily the image scale (height).

\(If the buffer displaying the image is already considered a
special-display buffer by your Emacs setup, then a nil value of this
option has no effect.)")

(custom-autoload 'diredp-image-show-this-file-use-frame-flag "dired+/dired+" t)

(defvar diredp-list-file-attributes (list '(5 8) 'auto) "\
Which file attributes `diredp-list-file' uses, and when.")

(custom-autoload 'diredp-list-file-attributes "dired+/dired+" t)

(defvar diredp-max-frames 200 "\
*Max number of frames, for commands that find files in separate frames.
These commands are `dired-do-find-marked-files' and
`diredp-do-find-marked-files-recursive'.  See their descriptions for
the circumstances in which they show the files in separate frames.")

(custom-autoload 'diredp-max-frames "dired+/dired+" t)

(defvar diredp-prompt-for-bookmark-prefix-flag nil "\
*Non-nil means prompt for a prefix string for bookmark names.")

(custom-autoload 'diredp-prompt-for-bookmark-prefix-flag "dired+/dired+" t)

(defvar diredp-visit-ignore-regexps nil "\
Regexps matching file names for `diredp-visit-(next|previous)' to skip.
A file or directory name matching one of these regexps is skipped,
along with those with an extension in `diredp-visit-ignore-extensions'.")

(custom-autoload 'diredp-visit-ignore-regexps "dired+/dired+" t)

(defvar diredp-visit-ignore-extensions '("elc") "\
Extensions of file names for `diredp-visit-(next|previous)' to skip.
A file name with one of these extensions is skipped, along with those
matching a regexp in `diredp-visit-ignore-regexps'.")

(custom-autoload 'diredp-visit-ignore-extensions "dired+/dired+" t)

(defvar diredp-w32-local-drives '(("C:" "Local disk")) "\
*Local MS Windows drives that you want to use for `diredp-w32-drives'.
Each entry is a list (DRIVE DESCRIPTION), where DRIVE is the drive
name and DESCRIPTION describes DRIVE.")

(custom-autoload 'diredp-w32-local-drives "dired+/dired+" t)

(defvar diredp-wrap-around-flag t "\
*Non-nil means Dired \"next\" commands wrap around to buffer beginning.")

(custom-autoload 'diredp-wrap-around-flag "dired+/dired+" t)

(autoload 'diredp-image-dired-create-thumb "dired+/dired+" "\
Create thumbnail image file for FILE (default: file on current line).
With a prefix arg, replace any existing thumbnail for FILE.
With a numeric prefix arg (not a cons), use it as the thumbnail size.
Return the name of the thumbnail image file, or nil if none.

\(fn FILE &optional ARG)" t nil)

(autoload 'image-dired-dired-insert-marked-thumbs "dired+/dired+" "\
Insert thumbnails before file names of marked files in the Dired buffer.

\(fn)" t nil)

(autoload 'image-dired-dired-toggle-marked-thumbs "dired+/dired+" "\
Toggle thumbnails in front of file names in Dired.
If no files are marked, insert or hide thumbnails on the current line.
With a numeric prefix arg N, ignore marked files and act on the next N
files (previous -N files, if N < 0).

\(fn &optional ARG)" t nil)

(autoload 'diredp-image-dired-comment-file "dired+/dired+" "\
Add comment to this image file.

\(fn)" t nil)

(autoload 'diredp-image-dired-tag-file "dired+/dired+" "\
Tag this image file with an `image-dired' tag.

\(fn)" t nil)

(autoload 'diredp-image-dired-delete-tag "dired+/dired+" "\
Remove an `image-dired' tag from  this image file.

\(fn)" t nil)

(autoload 'diredp-image-dired-display-thumb "dired+/dired+" "\
Pop to thumbnail of this image file, in `image-dired-thumbnail-buffer'.
If a thumbnail image does not yet exist for this file, create it.
With a prefix arg, append the thumbnail to the thumbnails buffer,
instead of clearing the buffer first.

\(fn &optional APPEND)" t nil)

(autoload 'diredp-image-dired-copy-with-exif-name "dired+/dired+" "\
Copy this image file to your main image directory.
Uses `image-dired-get-exif-file-name' to name the new file.

\(fn)" t nil)

(autoload 'diredp-image-dired-edit-comment-and-tags "dired+/dired+" "\
Edit comment and tags for this image file.

\(fn)" t nil)

(autoload 'diredp-do-display-images "dired+/dired+" "\
Display the marked image files.
A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if < 0).
 `C-u': Use the current file (whether or not any files are marked).
 More than one `C-u' means use all files in the Dired buffer, as if
 they were all marked.

\(fn &optional ARG)" t nil)

(autoload 'diredp-image-show-this-file "dired+/dired+" "\
Show the image file named on this line in another frame or window.
Option `diredp-image-show-this-file-use-frame-flag' which is used.

With a prefix arg, shrink the image to fit a frame that many lines
high or a window at least that many lines high.
Otherwise, show the image full size.
Note:
 * To show the image full size, you can also use `\\<dired-mode-map>\\[dired-find-file]'.
 * To show the image in another window, at whatever scale fits there,
   you can use `\\[image-dired-dired-display-image]'.

\(fn &optional ARG)" t nil)

(autoload 'diredp-do-emacs-command "dired+/dired+" "\
Invoke an Emacs COMMAND in each marked file.
Visit each marked file at its beginning, then invoke COMMAND.
You are prompted for the COMMAND.

The result returned for each file is logged by `dired-log'.  Use `?'
to see all such results and any error messages.  If there are fewer
marked files than `diredp-do-report-echo-limit' then each result is
also echoed momentarily.

A prefix argument behaves according to the ARG argument of
`dired-get-marked-files'.  In particular, `C-u C-u' operates on all
files in the Dired buffer.

\(fn COMMAND &optional ARG)" t nil)

(autoload 'diredp-dired-for-files "dired+/dired+" "\
Dired file names that you enter, in a Dired buffer that you name.
You are prompted for the name of the Dired buffer to use.
You are then prompted for names of files and directories to list,
 which can be located anywhere.
Use `C-g' when you are done.

With a prefix arg you are first prompted for the `ls' switches to use.

See also `dired' (including the advice).

\(fn ARG &optional SWITCHES)" t nil)

(autoload 'diredp-dired-for-files-other-window "dired+/dired+" "\
Same as `diredp-dired-for-files', except uses another window.

\(fn ARG &optional SWITCHES)" t nil)

(autoload 'diredp-dired-recent-dirs "dired+/dired+" "\
Open Dired in BUFFER, showing recently used directories.
You are prompted for BUFFER.

No prefix arg or a plain prefix arg (`C-u', `C-u C-u', etc.) means
list all of the recently used directories.

With a prefix arg:
* If 0, `-', or plain (`C-u') then you are prompted for the `ls'
  switches to use.
* If not plain (`C-u') then:
  * If >= 0 then the directories to include are read, one by one.
  * If  < 0 then the directories to exclude are read, one by one.

When entering directories to include or exclude, use `C-g' to end.

\(fn BUFFER &optional ARG)" t nil)

(autoload 'diredp-dired-recent-dirs-other-window "dired+/dired+" "\
Same as `diredp-dired-recent-dirs', but use other window.

\(fn BUFFER &optional ARG)" t nil)

(autoload 'diredp-dired-union "dired+/dired+" "\
Create a Dired buffer that is the union of some existing Dired buffers.
With a non-negative prefix arg, you are prompted for `ls' switches.
With a non-positive prefix arg, you are prompted for file and dir
names to add to the listing - see below.

You are prompted for the name of the Dired union buffer.  Completion
against names of existing Dired buffers is available, but you can
enter any other name to create a new Dired buffer of that name.

If the union buffer name you choose names an existing Dired buffer,
then what happens depends on whether that buffer is an ordinary Dired
directory listing or a list of arbitrary file names.  That is, it
depends on whether `dired-directory' is a directory name or a cons of
a Dired buffer name plus file names.

* If the buffer is an ordinary Dired listing, then it is converted to
  an explicit list of absolute file names, just as if these had been
  chosen individually.  The existing buffer and window are replaced by
  new ones that show the explicit listing.  (This replacement is
  necessary because the list of files contained in an ordinary Dired
  listing cannot be modified.)

* If the buffer lists arbitrary file names explicitly, then it is
  updated to include also the files from any Dired buffers and any
  additional files that you specify.

If the union buffer name you choose does not name an existing Dired
buffer, then its `default-directory' is the same as the
`default-directory' before invoking the command.

If you use a non-positive prefix arg, then you can next choose
additional file and directory names to add to the listing.  Use `C-g'
when done choosing them.

Any directory names you choose this way are included as single entries
in the listing - the directory contents are not included (these
directories are not unioned).  To instead include the contents of a
directory chosen this way, use a glob pattern: `/*' after the
directory name.

You are then prompted for the Dired buffers to union.  Use `C-g' when
done choosing them.  These Dired listings to union are included in the
order that you chose them, and each entry is listed only once in the
new Dired buffer.

The new Dired listing respects the markings, subdirectory insertions,
and hidden subdirectories of the selected Dired listings.  However, in
case of conflict between marked or unmarked status for the same entry,
the entry is marked.  Similarly, in case of conflict over an included
subdirectory between it being hidden or shown, it is hidden, but its
contained files are also listed.

See also command `diredp-add-to-dired-buffer'.

From Lisp:
 DIRED-NAME is the name of the resulting Dired union buffer.
 DIRBUFS is a list of the names of Dired buffers to union.
 SWITCHES is a string of `ls' switches.
 EXTRA is a list of files & directories to be included in the listing.

\(fn DIRED-NAME DIRBUFS &optional SWITCHES EXTRA)" t nil)

(autoload 'diredp-dired-union-other-window "dired+/dired+" "\
Same as `diredp-dired-union', except use other window.

\(fn DIRED-NAME DIRBUFS &optional SWITCHES EXTRA)" t nil)

(autoload 'diredp-add-to-dired-buffer "dired+/dired+" "\
Add individual file and directory names to a Dired buffer.
You are prompted for the buffer name.
With a prefix arg, you are also prompted for the `ls' switches.

The buffer must either not exist yet or must list arbitrary file and
directory names.  That is, it cannot be an ordinary Dired directory
listing - those cannot be modified.

Any directory names you choose this way are included as single entries
in the listing - the directory contents are not included (these
directories are not unioned).  To instead include the contents of a
directory chosen this way, use a glob pattern: `/*' after the
directory name.

See also command `diredp-dired-union'.

From Lisp:
 DIRED-NAME is the name of the Dired buffer to modify.
 TO-ADD is the list of files and dirs to add to it.
 SWITCHES is the string of `ls' switches.

\(fn DIRED-NAME TO-ADD &optional SWITCHES)" t nil)

(autoload 'diredp-add-to-dired-buffer-other-window "dired+/dired+" "\
Same as `diredp-add-to-dired-buffer', except use other window.

\(fn DIRED-NAME TO-ADD &optional SWITCHES)" t nil)

(autoload 'diredp-add-to-this-dired-buffer "dired+/dired+" "\
Same as `diredp-add-to-dired-buffer' for this Dired buffer.

\(fn DIRED-NAME TO-ADD &optional SWITCHES)" t nil)

(autoload 'diredp-fileset "dired+/dired+" "\
Open Dired on the files in fileset FLSET-NAME.

\(fn FLSET-NAME)" t nil)

(autoload 'diredp-fileset-other-window "dired+/dired+" "\
Open Dired in another window on the files in fileset FLSET-NAME.

\(fn FLSET-NAME)" t nil)

(autoload 'diredp-dired-this-subdir "dired+/dired+" "\
Open Dired for the subdir at or above point.
If point is not on a subdir line, but is in an inserted subdir
listing, then use that subdir.

With a prefix arg:
 If the subdir is inserted and point is in the inserted listing then
 remove that listing and move to the ordinary subdir line.  In other
 words, when in an inserted listing, a prefix arg tears off the
 inserted subdir to its own Dired buffer.

\(fn &optional TEAR-OFF-P MSGP)" t nil)

(autoload 'diredp-dired-inserted-subdirs "dired+/dired+" "\
Open Dired for each of the subdirs inserted in this Dired buffer.
A separate Dired buffer is used for each of them.
With a prefix arg, create the Dired buffers but do not display them.
Markings and current Dired switches are preserved.

\(fn &optional NO-SHOW-P MSGP)" t nil)

(autoload 'diredp-find-line-file-other-window "dired+/dired+" "\
Visit file named by current line, in another window.
The full text of the line is used as the file name.

\(fn)" t nil)

(autoload 'diredp-mouse-find-line-file-other-window "dired+/dired+" "\
Visit file named by clicked line, in another window.
The full text of the line is used as the file name.

\(fn E)" t nil)

(autoload 'diredp-list-marked "dired+/dired+" "\
List the marked files in this Dired buffer.
A prefix arg specifies files to use instead of the marked files:

 * Numeric prefix arg N: The next N files (previous -N, if < 0).
 * C-u C-u: All files, but no directories.
 * C-u C-u C-u: All files and directories, except `.' and `..'
 * C-u C-u C-u C-u: All files and directories, including `.' and `..'
 * Any other prefix arg: The current line's file only.

You can use `RET' or `mouse-2' to visit any of the files.
If `tooltip-mode' is on then moving the mouse over image-file names
shows image previews.

When called from Lisp:
 Non-nil optional arg PREDICATE is a file-name predicate.  List only
  the files for which it returns non-nil.
 Non-nil optional arg DETAILS is passed to `diredp-list-files'.

\(fn &optional ARG PREDICATE INTERACTIVEP DETAILS)" t nil)

(defalias 'diredp-paste-files 'diredp-yank-files)

(autoload 'diredp-yank-files "dired+/dired+" "\
Paste files, whose absolute names you copied, to the current directory.
With a non-negative prefix arg you are instead prompted for the target
 directory.
With a non-positive prefix arg you can see details about the files if
 you hit `l' when prompted to confirm pasting.  Otherwise you see only
 the file names.  The details you see are defined by option
 `diredp-list-file-attributes'.

You should have copied the list of file names as a string to the kill
ring using \\<dired-mode-map>`M-0 \\[dired-copy-filename-as-kill]' or \\[diredp-copy-abs-filenames-as-kill].
Those commands also set variable `diredp-last-copied-filenames' to the
same string.  `diredp-yank-files' uses the value of that variable, not
whatever is currently at the head of the kill ring.

When called from Lisp:

Optional arg NO-CONFIRM-P means do not ask for confirmation to copy.
Optional arg DETAILS is passed to `diredp-y-or-n-files-p'.

\(fn &optional DIR NO-CONFIRM-P DETAILS)" t nil)

(autoload 'diredp-move-files-named-in-kill-ring "dired+/dired+" "\
Move files, whose absolute names you copied, to the current directory.
With a non-negative prefix arg you are instead prompted for the target
 directory.
With a non-positive prefix arg you can see details about the files if
 you hit `l' when prompted to confirm pasting.  Otherwise you see only
 the file names.  The details you see are defined by option
 `diredp-list-file-attributes'.

You should have copied the list of file names as a string to the kill
ring using \\<dired-mode-map>`M-0 \\[dired-copy-filename-as-kill]' or \\[diredp-copy-abs-filenames-as-kill].
Those commands also set variable `diredp-last-copied-filenames' to the
same string.  `diredp-move-files-named-in-kill-ring' uses the value of
that variable, not whatever is currently at the head of the kill ring.

When called from Lisp:

Optional arg NO-CONFIRM-P means do not ask for confirmation to move.
Optional arg DETAILS is passed to `diredp-y-or-n-files-p'.

\(fn &optional DIR NO-CONFIRM-P DETAILS)" t nil)

(when (> emacs-major-version 21) (defun diredp-kill-this-tree nil "Remove this subdir listing and lower listings." (interactive) (dired-kill-tree (dired-current-directory) nil 'KILL-ROOT)))

(autoload 'diredp-insert-subdirs "dired+/dired+" "\
Insert the marked subdirectories.
Like using \\<dired-mode-map>`\\[dired-maybe-insert-subdir]' at each marked directory line.

\(fn &optional SWITCHES INTERACTIVEP)" t nil)

(autoload 'diredp-insert-subdirs-recursive "dired+/dired+" "\
Insert the marked subdirs, including those in marked subdirs.
Like `diredp-insert-subdirs', but act recursively on subdirs.
The subdirs inserted are those that are marked in the current Dired
buffer, or ALL subdirs in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way (their marked
subdirs are inserted...).

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-do-shell-command-recursive "dired+/dired+" "\
Run shell COMMAND on the marked files, including those in marked subdirs.
Like `dired-do-shell-command', but act recursively on subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn COMMAND &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-do-symlink-recursive "dired+/dired+" "\
Make symbolic links to marked files, including those in marked subdirs.
Like `dired-do-symlink', but act recursively on subdirs to pick up the
files to link.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-do-create-files-recursive'.

\(fn &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-do-hardlink-recursive "dired+/dired+" "\
Add hard links for marked files, including those in marked subdirs.
Like `dired-do-hardlink', but act recursively on subdirs to pick up the
files to link.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-do-create-files-recursive'.

\(fn &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-do-print-recursive "dired+/dired+" "\
Print the marked files, including those in marked subdirs.
Like `dired-do-print', but act recursively on subdirs to pick up the
files to print.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-image-dired-display-thumbs-recursive "dired+/dired+" "\
Display thumbnails of marked files, including those in marked subdirs.
Like `image-dired-display-thumbs', but act recursively on subdirs.
Optional arguments APPEND and DO-NOT-POP are as for
`image-dired-display-thumbs'.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn &optional IGNORE-MARKS-P APPEND DO-NOT-POP DETAILS)" t nil)

(autoload 'diredp-image-dired-tag-files-recursive "dired+/dired+" "\
Tag marked files with an `image-dired' tag, including in marked subdirs.
Like `image-dired-tag-files', but act recursively on subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-image-dired-delete-tag-recursive "dired+/dired+" "\
Remove `image-dired' tag for marked files, including in marked subdirs.
Like `image-dired-delete-tag', but act recursively on subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-image-dired-comment-files-recursive "dired+/dired+" "\
Add comment to marked files in dired, including those in marked subdirs.
Like `image-dired-dired-comment-files' but act recursively on subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-do-bookmark-recursive "dired+/dired+" "\
Bookmark the marked files, including those in marked subdirs.
Like `diredp-do-bookmark', but act recursively on subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn &optional IGNORE-MARKS-P PREFIX DETAILS)" t nil)

(autoload 'diredp-do-bookmark-dirs-recursive "dired+/dired+" "\
Bookmark this Dired buffer and marked subdirectory Dired buffers, recursively.
Create a Dired bookmark for this directory and for each of its marked
subdirectories.  Handle each of the marked subdirectory similarly:
bookmark it and its marked subdirectories, and so on, recursively.
Name each of these Dired bookmarks with the Dired buffer name.

After creating the Dired bookmarks, create a sequence bookmark, named
`DIRBUF and subdirs', where DIRBUF is the name of the original buffer.
This bookmark represents the whole Dired tree rooted in the directory
where you invoked the command.  Jumping to this sequence bookmark
restores all of the Dired buffers making up the tree, by jumping to
each of their bookmarks.

With a prefix arg, bookmark the marked and unmarked subdirectory Dired
buffers, recursively, that is, ignore markings.

Note:

* If there is more than one Dired buffer for a given subdirectory then
  only the first such is used.

* This command creates new bookmarks.  It never updates or overwrites
  an existing bookmark.

You need library `Bookmark+' for this command.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-subdirs'.

\(fn IGNORE-MARKS-P &optional DETAILS MSGP)" t nil)

(autoload 'diredp-do-bookmark-in-bookmark-file-recursive "dired+/dired+" "\
Bookmark files here and below in BOOKMARK-FILE and save BOOKMARK-FILE.
Like `diredp-do-bookmark-in-bookmark-file', but act recursively on
subdirs.  The files included are those that are marked in the current
Dired buffer, or all files in the directory if none are marked.
Marked subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp:
 * Optional arg BFILE-BOOKMARKP non-nil means create a bookmark-file
   bookmark for BOOKMARK-FILE.
 * Optional arg DETAILS is passed to `diredp-get-files'.

\(fn BOOKMARK-FILE &optional PREFIX IGNORE-MARKS-P BFILE-BOOKMARKP DETAILS)" t nil)

(autoload 'diredp-set-bookmark-file-bookmark-for-marked-recursive "dired+/dired+" "\
Bookmark the marked files and create a bookmark-file bookmark for them.
Like `diredp-set-bookmark-file-bookmark-for-marked', but act
recursively on subdirs.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-do-bookmark-in-bookmark-file-recursive'.

\(fn BOOKMARK-FILE &optional PREFIX IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-do-find-marked-files-recursive "dired+/dired+" "\
Find marked files simultaneously, including those in marked subdirs.
Like `dired-do-find-marked-files', but act recursively on subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With (explicit) numeric prefix ARG >= 0, find the files but do not
display them.

With numeric prefix ARG <= 0, ignore all marks - include all files in
this Dired buffer and all subdirs, recursively.

Note that prefix-argument behavior is different for this command than
for `dired-do-find-marked-files'.  In particular, a negative numeric
prefix arg does not cause the files to be shown in separate frames.
Only non-nil `pop-up-frames' (or equivalent configuration) causes
the files to be shown in separate frames.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn &optional ARG DETAILS)" t nil)

(autoload 'diredp-do-query-replace-regexp-recursive "dired+/dired+" "\
Do `query-replace-regexp' on marked files, including in marked subdirs.
Query-replace FROM with TO.

Like `dired-do-query-replace', but act recursively on subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With an (explicit) numeric prefix argument:

* >= 0 means ignore all marks - include ALL files in this Dired buffer
  and all subdirs, recursively.

* <= 0 means replace only word-delimited matches.

If you exit (`\\[keyboard-quit]', `RET' or `q'), you can resume the query replacement
using `\\[tags-loop-continue]'.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn FROM TO &optional ARG DETAILS)" t nil)

(autoload 'diredp-do-grep-recursive "dired+/dired+" "\
Run `grep' on marked files, including those in marked subdirs.
Like `diredp-do-grep', but act recursively on subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn COMMAND-ARGS &optional DETAILS)" t nil)

(autoload 'diredp-marked-recursive "dired+/dired+" "\
Open Dired on marked files, including those in marked subdirs.
Like `diredp-marked', but act recursively on subdirs.

See `diredp-do-find-marked-files-recursive' for a description of the
files included.  In particular, if no files are marked here or in a
marked subdir, then all files in the directory are included.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, DIRNAME here must be a string, not a cons.  It
is used as the name of the new Dired buffer.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn DIRNAME &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-marked-recursive-other-window "dired+/dired+" "\
Same as `diredp-marked-recursive', but uses a different window.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn DIRNAME &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-list-marked-recursive "dired+/dired+" "\
List the files marked here and in marked subdirs, recursively.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, all marks are ignored: all files in this Dired
buffer and all descendant directories are included.

You can use `RET' or `mouse-2' to visit any of the files.
If `tooltip-mode' is on then moving the mouse over image-file names
shows image previews.

When called from Lisp:
 Non-nil optional arg IGNORE-MARKS-P means ignore marks.
 Non-nil optional arg PREDICATE is a file-name predicate.  List only
  the files for which it returns non-nil.
 Non-nil optional arg DETAILS is passed to `diredp-list-files'.

\(fn &optional IGNORE-MARKS-P PREDICATE DETAILS)" t nil)

(autoload 'diredp-flag-auto-save-files-recursive "dired+/dired+" "\
Flag all auto-save files for deletion, including in marked subdirs.
A non-negative prefix arg means to unmark (unflag) them instead.

A non-positive prefix arg means to ignore subdir markings and act
instead on ALL subdirs.  That is, flag all in this directory and all
descendant directories.

When called from Lisp, optional arg DETAILS is passed to
`diredp-mark-recursive-1'.

\(fn &optional ARG DETAILS)" t nil)

(autoload 'diredp-copy-filename-as-kill-recursive "dired+/dired+" "\
Copy names of marked files here and in marked subdirs, to `kill-ring'.
The names are separated by a space.

Like `dired-copy-filename-as-kill', but act recursively on subdirs.
\(Do not copy subdir names themselves.)

With no prefix arg, use relative file names.
With a zero prefix arg, use absolute file names.
With a plain prefix arg (`C-u'), use names relative to the current
Dired directory.  (This might contain slashes if in a subdirectory.)

If on a subdir headerline, use absolute subdir name instead - prefix
arg and marked files are ignored in this case.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

The names are copied to the kill ring and to variable
`diredp-last-copied-filenames'.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn &optional ARG DETAILS)" t nil)

(autoload 'diredp-copy-abs-filenames-as-kill-recursive "dired+/dired+" "\
Copy absolute names of files marked here and in marked subdirs, recursively.
The names are copied to the kill ring and to variable
`dired-copy-filename-as-kill'.

The files whose names are copied are those that are marked in the
current Dired buffer, or all files in the directory if none are
marked.  Marked subdirectories are handled recursively in the same
way.

When called from Lisp, optional arg DETAILS is passed to
`diredp-copy-filename-as-kill-recursive'.

\(fn &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-mark-files-regexp-recursive "dired+/dired+" "\
Mark all files matching REGEXP, including those in marked subdirs.
Like `dired-mark-files-regexp' but act recursively on marked subdirs.

The file names to be matched by this command are always absolute -
they include the full directory.  Note that this does NOT correspond
to the default behavior for `dired-mark-files-regexp'.  The other
matching possibilities offered by `dired-mark-files-regexp' are not
available for this command.

Directories `.' and `..' are never marked.

A non-negative prefix arg means to UNmark the files instead.

A non-positive prefix arg means to ignore subdir markings and act
instead on ALL subdirs.  That is, mark all matching files in this
directory and all descendant directories.

REGEXP is an Emacs regexp, not a shell wildcard.  Thus, use `\\.o$' for
object files--just `.o' will mark more than you might think.

REGEXP is added to `regexp-search-ring', for regexp search.

Note: If there is more than one Dired buffer for a given subdirectory
then only the first such is used.

When called from Lisp, DETAILS is passed to `diredp-get-subdirs'.

\(fn REGEXP &optional MARKER-CHAR IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-mark-files-containing-regexp-recursive "dired+/dired+" "\
Mark files with contents containing a REGEXP match, including in marked subdirs.
Like `dired-mark-files-containing-regexp' but act recursively on
marked subdirs.

A non-negative prefix arg means to UNmark the files instead.

A non-positive prefix arg means to ignore subdir markings and act
instead on ALL subdirs.  That is, mark all matching files in this
directory and all descendant directories.

REGEXP is added to `regexp-search-ring', for regexp search.

Note: If there is more than one Dired buffer for a given subdirectory
then only the first such is used.

If a file is visited in a buffer and `dired-always-read-filesystem' is
nil, this looks in the buffer without revisiting the file, so the
results might be inconsistent with the file on disk if its contents
have changed since it was last visited.

When called from Lisp, DETAILS is passed to `diredp-get-subdirs'.

\(fn REGEXP &optional MARKER-CHAR IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-mark-autofiles-recursive "dired+/dired+" "\
Mark all autofiles, including in marked subdirs.
Autofiles are files that have an autofile bookmark.
A non-negative prefix arg means to unmark them instead.

A non-positive prefix arg means to ignore subdir markings and act
instead on ALL subdirs.  That is, mark all in this directory and all
descendant directories.

When called from Lisp, optional arg DETAILS is passed to
`diredp-mark-recursive-1'.

\(fn &optional ARG DETAILS)" t nil)

(autoload 'diredp-mark-executables-recursive "dired+/dired+" "\
Mark all executable files, including in marked subdirs.
The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

A non-negative prefix arg means to unmark them instead.

A non-positive prefix arg means to ignore subdir markings and act
instead on ALL subdirs.  That is, mark all in this directory and all
descendant directories.

When called from Lisp, optional arg DETAILS is passed to
`diredp-mark-recursive-1'.

\(fn &optional ARG DETAILS)" t nil)

(autoload 'diredp-mark-directories-recursive "dired+/dired+" "\
Mark all directories except `.' and `..', including in marked subdirs.
The directories included are those that are marked in the current
Dired buffer, or all subdirs in the directory if none are marked.
Marked subdirectories are handled recursively in the same way.

A non-negative prefix arg means to unmark them instead.

A non-positive prefix arg means to ignore subdir markings and act
instead on ALL subdirs.  That is, mark all in this directory and all
descendant directories.

When called from Lisp, optional arg DETAILS is passed to
`diredp-mark-recursive-1'.

\(fn &optional ARG DETAILS)" t nil)

(autoload 'diredp-mark-symlinks-recursive "dired+/dired+" "\
Mark all symbolic links, including in marked subdirs.
The symlinks included are those that are marked in the current Dired
buffer, or all symlinks in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

A non-negative prefix arg means to unmark them instead.

A non-positive prefix arg means to ignore subdir markings and act
instead on ALL subdirs.  That is, mark all in this directory and all
descendant directories.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-subdirs'.

\(fn &optional ARG DETAILS)" t nil)

(autoload 'diredp-capitalize-recursive "dired+/dired+" "\
Rename marked files, including in marked subdirs, by capitalizing them.
Like `diredp-capitalize', but act recursively on subdirs.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-create-files-non-directory-recursive'.

\(fn &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-upcase-recursive "dired+/dired+" "\
Rename marked files, including in marked subdirs, making them uppercase.
Like `dired-upcase', but act recursively on subdirs.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-create-files-non-directory-recursive'.

\(fn &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-downcase-recursive "dired+/dired+" "\
Rename marked files, including in marked subdirs, making them lowercase.
Like `dired-downcase', but act recursively on subdirs.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-create-files-non-directory-recursive'.

\(fn &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-do-apply-function-recursive "dired+/dired+" "\
Apply FUNCTION to the marked files.
Like `diredp-do-apply-function' but act recursively on subdirs and do
no result or error logging or echoing.

The files acted on are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

With a plain prefix ARG (`C-u'), visit each file and invoke FUNCTION
 with no arguments.
Otherwise, apply FUNCTION to each file name.

Any other prefix arg behaves according to the ARG argument of
`dired-get-marked-files'.  In particular, `C-u C-u' operates on all
files in the Dired buffer.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn FUNCTION &optional ARG DETAILS)" t nil)

(autoload 'diredp-do-delete-recursive "dired+/dired+" "\
Delete marked (not flagged) files, including in marked subdirs.
Like `dired-do-delete' but act recursively on subdirs.

The files to be deleted are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files' and `diredp-get-subdirs'.

\(fn ARG &optional DETAILS)" t nil)

(autoload 'diredp-do-move-recursive "dired+/dired+" "\
Move marked files, including in marked subdirs, to a given directory.
Like `dired-do-rename', but act recursively on subdirs to pick up the
files to move.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

This means move the marked files of marked subdirs and their marked
subdirs, etc.  It does not mean move or rename the subdirs themselves
recursively.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

Renames any buffers that are visiting the files.

The default suggested for the target directory depends on the value of
`dired-dwim-target', which see.

\(fn &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-do-copy-recursive "dired+/dired+" "\
Copy marked files, including in marked subdirs, to a given directory.
Like `dired-do-copy', but act recursively on subdirs to pick up the
files to copy.

The files included are those that are marked in the current Dired
buffer, or all files in the directory if none are marked.  Marked
subdirectories are handled recursively in the same way.

This means copy the marked files of marked subdirs and their marked
subdirs, etc.  It does not mean copy the subdirs themselves
recursively.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

Preserves the last-modified date when copying, unless
`dired-copy-preserve-time' is nil.

The default suggested for the target directory depends on the value of
`dired-dwim-target', which see.

This command copies symbolic links by creating new ones, like UNIX
command `cp -d'.

When called from Lisp, optional arg DETAILS is passed to
`diredp-do-create-files-recursive'.

\(fn &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-do-chmod-recursive "dired+/dired+" "\
Change the mode of the marked files, including those in marked subdirs.
Symbolic modes like `g+w' are allowed.

Note that marked subdirs are not changed.  Their markings are used only
to indicate that some of their files are to be changed.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files' and `diredp-do-redisplay-recursive'.

\(fn &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-do-touch-recursive "dired+/dired+" "\
Change the timestamp of marked files, including those in marked subdirs.
This calls `touch'.  Like `dired-do-touch', but act recursively on
subdirs.  The subdirs inserted are those that are marked in the
current Dired buffer, or all subdirs in the directory if none are
marked.  Marked subdirectories are handled recursively in the same
way.

With a prefix argument, ignore all marks - include all files in this
Dired buffer and all subdirs, recursively.

When called from Lisp, optional arg DETAILS is passed to
`diredp-do-chxxx-recursive'.

\(fn &optional IGNORE-MARKS-P DETAILS)" t nil)

(autoload 'diredp-do-redisplay-recursive "dired+/dired+" "\
Redisplay marked file lines, including those in marked subdirs.
Non-nil MSGP means show status messages.
Like `dired-do-redisplay' with no args, but act recursively on
subdirs.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn &optional DETAILS MSGP)" t nil)

(autoload 'diredp-marked "dired+/dired+" "\
Open Dired on only the marked files or the next N files.
With a non-zero numeric prefix arg N, use the next abs(N) files.
A plain (`C-u'), zero, or negative prefix arg prompts for listing
switches as in command `dired'.

Note that the marked files can include files in inserted
subdirectories, so the Dired buffer that is opened can contain files
from multiple directories in the same tree.

\(fn DIRNAME &optional N SWITCHES)" t nil)

(autoload 'diredp-marked-other-window "dired+/dired+" "\
Same as `diredp-marked', but uses a different window.

\(fn DIRNAME &optional N SWITCHES)" t nil)

(autoload 'diredp-mark/unmark-extension "dired+/dired+" "\
Mark all files with a certain EXTENSION for use in later commands.
A `.' is not automatically prepended to the string entered.
Non-nil prefix argument UNMARK-P means unmark instead of mark.

Non-interactively, EXTENSION is the extension (a string).  It can also
  be a list of extension strings.
Optional argument UNMARK-P is the prefix arg.

\(fn EXTENSION &optional UNMARK-P)" t nil)

(autoload 'diredp-mark-files-tagged-all "dired+/dired+" "\
Mark all files that are tagged with *each* tag in TAGS.
As a special case, if TAGS is empty, then mark the files that have
 any tags at all (i.e., at least one tag).
With a prefix arg, mark all that are *not* tagged with *any* TAGS.
You need library `bookmark+.el' to use this command.

\(fn TAGS &optional NONE-P PREFIX)" t nil)

(autoload 'diredp-mark-files-tagged-none "dired+/dired+" "\
Mark all files that are not tagged with *any* tag in TAGS.
As a special case, if TAGS is empty, then mark the files that have
 no tags at all.
With a prefix arg, mark all that are tagged with *each* tag in TAGS.
You need library `bookmark+.el' to use this command.

\(fn TAGS &optional ALLP PREFIX)" t nil)

(autoload 'diredp-mark-files-tagged-some "dired+/dired+" "\
Mark all files that are tagged with *some* tag in TAGS.
As a special case, if TAGS is empty, then mark the files that have
 any tags at all (i.e., at least one tag).
With a prefix arg, mark all that are *not* tagged with *all* TAGS.
You need library `bookmark+.el' to use this command.

\(fn TAGS &optional SOMENOTP PREFIX)" t nil)

(autoload 'diredp-mark-files-tagged-not-all "dired+/dired+" "\
Mark all files that are not tagged with *all* TAGS.
As a special case, if TAGS is empty, then mark the files that have
 no tags at all.
With a prefix arg, mark all that are tagged with *some* TAGS.
You need library `bookmark+.el' to use this command.

\(fn TAGS &optional SOMEP PREFIX)" t nil)

(autoload 'diredp-mark-files-tagged-regexp "dired+/dired+" "\
Mark files that have at least one tag that matches REGEXP.
With a prefix arg, mark all that are tagged but have no matching tags.
You need library `bookmark+.el' to use this command.

\(fn REGEXP &optional NOTP PREFIX)" t nil)

(autoload 'diredp-unmark-files-tagged-regexp "dired+/dired+" "\
Unmark files that have at least one tag that matches REGEXP.
With a prefix arg, unmark all that are tagged but have no matching tags.
You need library `bookmark+.el' to use this command.

\(fn REGEXP &optional NOTP PREFIX)" t nil)

(autoload 'diredp-unmark-files-tagged-all "dired+/dired+" "\
Unmark all files that are tagged with *each* tag in TAGS.
As a special case, if TAGS is empty, then unmark the files that have
 any tags at all (i.e., at least one tag).
With a prefix arg, unmark all that are *not* tagged with *any* TAGS.
You need library `bookmark+.el' to use this command.

\(fn TAGS &optional NONE-P PREFIX)" t nil)

(autoload 'diredp-unmark-files-tagged-none "dired+/dired+" "\
Unmark all files that are *not* tagged with *any* tag in TAGS.
As a special case, if TAGS is empty, then unmark the files that have
 no tags at all.
With a prefix arg, unmark all that are tagged with *each* tag in TAGS.
You need library `bookmark+.el' to use this command.

\(fn TAGS &optional ALLP PREFIX)" t nil)

(autoload 'diredp-unmark-files-tagged-some "dired+/dired+" "\
Unmark all files that are tagged with *some* tag in TAGS.
As a special case, if TAGS is empty, then unmark the files that have
 any tags at all.
With a prefix arg, unmark all that are *not* tagged with *all* TAGS.
You need library `bookmark+.el' to use this command.

\(fn TAGS &optional SOMENOTP PREFIX)" t nil)

(autoload 'diredp-unmark-files-tagged-not-all "dired+/dired+" "\
Unmark all files that are *not* tagged with *all* TAGS.
As a special case, if TAGS is empty, then unmark the files that have
 no tags at all.
With a prefix arg, unmark all that are tagged with *some* TAGS.
You need library `bookmark+.el' to use this command.

\(fn TAGS &optional SOMEP PREFIX)" t nil)

(autoload 'diredp-do-tag "dired+/dired+" "\
Tag the marked (or the next prefix argument) files.
You need library `bookmark+.el' to use this command.

Hit `RET' to enter each tag, then hit `RET' again after the last tag.
You can use completion to enter each tag.  Completion is lax: you are
not limited to existing tags.

TAGS is a list of strings.  PREFIX is as for `diredp-do-bookmark'.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if < 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.

\(fn TAGS &optional PREFIX ARG)" t nil)

(autoload 'diredp-mouse-do-tag "dired+/dired+" "\
In Dired, add some tags to this file.
You need library `bookmark+.el' to use this command.

\(fn EVENT)" t nil)

(autoload 'diredp-do-untag "dired+/dired+" "\
Remove some tags from the marked (or the next prefix arg) files.
You need library `bookmark+.el' to use this command.

Hit `RET' to enter each tag, then hit `RET' again after the last tag.
You can use completion to enter each tag.  Completion is lax: you are
not limited to existing tags.

TAGS is a list of strings.  PREFIX is as for `diredp-do-bookmark'.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if < 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.

\(fn TAGS &optional PREFIX ARG)" t nil)

(autoload 'diredp-mouse-do-untag "dired+/dired+" "\
In Dired, remove some tags from this file.
You need library `bookmark+.el' to use this command.

\(fn EVENT)" t nil)

(autoload 'diredp-do-remove-all-tags "dired+/dired+" "\
Remove all tags from the marked (or the next prefix arg) files.
You need library `bookmark+.el' to use this command.

PREFIX is as for `diredp-do-bookmark'.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if < 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.

\(fn &optional PREFIX ARG)" t nil)

(autoload 'diredp-mouse-do-remove-all-tags "dired+/dired+" "\
In Dired, remove all tags from the marked (or next prefix arg) files.
You need library `bookmark+.el' to use this command.

\(fn EVENT)" t nil)

(autoload 'diredp-do-paste-add-tags "dired+/dired+" "\
Add previously copied tags to the marked (or next prefix arg) files.
The tags were previously copied from a file to `bmkp-copied-tags'.
You need library `bookmark+.el' to use this command.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if < 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.

\(fn &optional PREFIX ARG)" t nil)

(autoload 'diredp-mouse-do-paste-add-tags "dired+/dired+" "\
In Dired, add previously copied tags to this file.
The tags were previously copied from a file to `bmkp-copied-tags'.
You need library `bookmark+.el' to use this command.

\(fn EVENT)" t nil)

(autoload 'diredp-do-paste-replace-tags "dired+/dired+" "\
Replace tags for marked (or next prefix arg) files with copied tags.
The tags were previously copied from a file to `bmkp-copied-tags'.
You need library `bookmark+.el' to use this command.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if < 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.

\(fn &optional PREFIX ARG)" t nil)

(autoload 'diredp-mouse-do-paste-replace-tags "dired+/dired+" "\
In Dired, replace tags for this file with tags copied previously.
The tags were previously copied from a file to `bmkp-copied-tags'.
You need library `bookmark+.el' to use this command.

\(fn EVENT)" t nil)

(autoload 'diredp-do-set-tag-value "dired+/dired+" "\
Set TAG value to VALUE, for the marked (or next prefix arg) files.
This does not change the TAG name.
You need library `bookmark+.el' to use this command.

PREFIX is as for `diredp-do-bookmark'.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if < 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.

\(fn TAG VALUE &optional PREFIX ARG)" t nil)

(autoload 'diredp-mouse-do-set-tag-value "dired+/dired+" "\
In Dired, set the value of a tag for this file.
This does not change the tag name.
You need library `bookmark+.el' to use this command.

\(fn EVENT)" t nil)

(autoload 'diredp-mark-autofiles "dired+/dired+" "\
Mark all autofiles, that is, files that have an autofile bookmark.

\(fn)" t nil)

(autoload 'diredp-unmark-autofiles "dired+/dired+" "\
Unmark all autofiles, that is, files that have an autofile bookmark.

\(fn)" t nil)

(autoload 'diredp-mark/unmark-autofiles "dired+/dired+" "\
Mark all autofiles, or unmark if UNMARKP is non-nil.

\(fn &optional UNMARKP)" nil nil)

(autoload 'diredp-do-bookmark "dired+/dired+" "\
Bookmark the marked (or the next prefix argument) files.
Each bookmark name is the non-directory portion of the file name,
 prefixed by PREFIX if it is non-nil.
Interactively, you are prompted for the PREFIX if
 `diredp-prompt-for-bookmark-prefix-flag' is non-nil.
The bookmarked position is the beginning of the file.
If you use library `bookmark+.el' then the bookmark is an autofile.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if < 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.

\(fn &optional PREFIX ARG)" t nil)

(autoload 'diredp-mouse-do-bookmark "dired+/dired+" "\
In Dired, bookmark this file.  See `diredp-do-bookmark'.

\(fn EVENT)" t nil)

(autoload 'diredp-set-bookmark-file-bookmark-for-marked "dired+/dired+" "\
Bookmark the marked files and create a bookmark-file bookmark for them.
The bookmarked position is the beginning of the file.
Jumping to the bookmark-file bookmark loads the set of file bookmarks.
You need library `bookmark+.el' to use this command.

Each bookmark name is the non-directory portion of the file name,
 prefixed by PREFIX if it is non-nil.
Interactively, you are prompted for PREFIX if
 `diredp-prompt-for-bookmark-prefix-flag' is non-nil.

A prefix argument ARG specifies files to use instead of those marked.
 An integer means use the next ARG files (previous -ARG, if < 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.

You are also prompted for the bookmark file, BOOKMARK-FILE.  The
default is `.emacs.bmk' in the current directory, but you can enter
any file name, anywhere.

The marked-file bookmarks are added to file BOOKMARK-FILE, but this
command does not make BOOKMARK-FILE the current bookmark file.  To
make it current, just jump to the bookmark-file bookmark created by
this command.  That bookmark (which bookmarks BOOKMARK-FILE) is
defined in that current bookmark file.

Example:

 Bookmark file `~/.emacs.bmk' is current before invoking this command.
 The current (Dired) directory is `/foo/bar'.
 The marked files are bookmarked in the (possibly new) bookmark file
   `/foo/bar/.emacs.bmk'.
 The bookmarks for the marked files have names prefixed by `FOOBAR '.
 The name of the bookmark-file bookmark is `Foobar Files'.
 Bookmark `Foobar Files' is itself in bookmark file `~/.emacs.bmk'.
 Bookmark file `~/.emacs.bmk' is current after invoking this command.

You are prompted for the name of the bookmark-file bookmark, the
BOOKMARK-FILE for the marked-file bookmarks, and a PREFIX string for
each of the marked-file bookmarks.

See also command `diredp-do-bookmark-in-bookmark-file'.

\(fn BOOKMARK-FILE &optional PREFIX ARG)" t nil)

(autoload 'diredp-do-bookmark-in-bookmark-file "dired+/dired+" "\
Bookmark marked files in BOOKMARK-FILE and save BOOKMARK-FILE.
The files bookmarked are the marked files, by default.
The bookmarked position is the beginning of the file.
You are prompted for BOOKMARK-FILE.  The default is `.emacs.bmk' in
the current directory, but you can enter any file name, anywhere.
You need library `bookmark+.el' to use this command.

The marked files are bookmarked in file BOOKMARK-FILE, but this
command does not make BOOKMARK-FILE the current bookmark file.  To
make it current, use `\\[bmkp-switch-bookmark-file]' (`bmkp-switch-bookmark-file').

Each bookmark name is the non-directory portion of the file name,
 prefixed by PREFIX if it is non-nil.
Interactively, you are prompted for PREFIX if
 `diredp-prompt-for-bookmark-prefix-flag' is non-nil.

Interactively, a prefix argument ARG specifies the files to use
instead of those marked.

 An integer means use the next ARG files (previous -ARG, if < 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.

See also command `diredp-set-bookmark-file-bookmark-for-marked'.

Non-interactively:

 * Non-nil BFILE-BOOKMARKP means create a bookmark-file bookmark for
   BOOKMARK-FILE.
 * Non-nil FILES is the list of files to bookmark.

\(fn BOOKMARK-FILE &optional PREFIX ARG BFILE-BOOKMARKP FILES)" t nil)

(autoload 'diredp-find-a-file "dired+/dired+" "\
`find-file', but use file on current line as default (`M-n').

\(fn FILENAME &optional WILDCARDS)" t nil)

(autoload 'diredp-find-a-file-other-frame "dired+/dired+" "\
`find-file-other-frame', but use file under cursor as default (`M-n').

\(fn FILENAME &optional WILDCARDS)" t nil)

(autoload 'diredp-find-a-file-other-window "dired+/dired+" "\
`find-file-other-window', but use file under cursor as default (`M-n').

\(fn FILENAME &optional WILDCARDS)" t nil)

(autoload 'diredp-find-a-file-read-args "dired+/dired+" "\


\(fn PROMPT MUSTMATCH)" nil nil)

(autoload 'diredp-find-file-reuse-dir-buffer "dired+/dired+" "\
Like `dired-find-file', but reuse Dired buffers.
Unlike `dired-find-alternate-file' this does not use
`find-alternate-file' unless (1) the target is a directory that is not
yet visited as a Dired buffer, and (2) the current (Dired) buffer is
not visited also in some other window (possibly in an iconified
frame).

\(fn)" t nil)

(autoload 'diredp-mouse-find-file-reuse-dir-buffer "dired+/dired+" "\
Like `dired-mouse-find-file', but reuse Dired buffers.
Unlike `dired-find-alternate-file' this does not use
`find-alternate-file' unless (1) the target is a directory that is not
yet visited as a Dired buffer, and (2) the current (Dired) buffer is
not visited also in some other window (possibly in an iconified
frame).

Non-nil optional args FIND-FILE-FUNC and FIND-DIR-FUNC specify
functions to visit the file and directory, respectively.
Defaults: `find-file' and `dired', respectively.

\(fn EVENT &optional FIND-FILE-FUNC FIND-DIR-FUNC)" t nil)

(defalias 'toggle-diredp-find-file-reuse-dir 'diredp-toggle-find-file-reuse-dir)

(autoload 'diredp-toggle-find-file-reuse-dir "dired+/dired+" "\
Toggle whether Dired `find-file' commands reuse directories.
This applies also to `dired-w32-browser' commands and
`diredp-up-directory'.

A prefix arg specifies directly whether or not to reuse.
 If its numeric value is non-negative then reuse; else do not reuse.

To set the behavior as a preference (default behavior), put this in
your ~/.emacs, where VALUE is 1 to reuse or -1 to not reuse:

 (diredp-toggle-find-file-reuse-dir VALUE)

Note: This affects only these commands:

  `dired-find-file'
  `dired-mouse-find-file'

It does not affect the corresponding `-other-window' commands.  Note
too that, by default, mouse clicks to open files or directories open
in another window: command `diredp-mouse-find-file-other-window', not
`dired-mouse-find-file'.  If you want a mouse click to reuse a
directory then bind `mouse-2' to `dired-mouse-find-file' instead.

\(fn FORCE-P)" t nil)

(autoload 'diredp-omit-marked "dired+/dired+" "\
Omit lines of marked files.  Return the number of lines omitted.

\(fn)" t nil)

(autoload 'diredp-omit-unmarked "dired+/dired+" "\
Omit lines of unmarked files.  Return the number of lines omitted.

\(fn)" t nil)

(autoload 'diredp-ediff "dired+/dired+" "\
Compare file at cursor with file FILE2 using `ediff'.
FILE2 defaults to the file at the cursor as well.  If you enter just a
directory name for FILE2, then the file at the cursor is compared with
a file of the same name in that directory.  FILE2 is the second file
given to `ediff'; the file at the cursor is the first.

Try to guess a useful default value for FILE2, as follows:

* If the mark is active, use the file at mark.
* Else if the file at cursor is a autosave file or a backup file, use
  the corresponding base file.
* Else if there is any backup file for the file at point, use the
  newest backup file for it.
* Else use the file at point.

\(fn FILE2)" t nil)

(autoload 'diredp-do-apply-function "dired+/dired+" "\
Apply FUNCTION to the marked files.
You are prompted for the FUNCTION.

With a plain prefix ARG (`C-u'), visit each file and invoke FUNCTION
 with no arguments.
Otherwise, apply FUNCTION to each file name.

Any prefix arg other than single `C-u' behaves according to the ARG
argument of `dired-get-marked-files'.  In particular, `C-u C-u'
operates on all files in the Dired buffer.

The result returned for each file is logged by `dired-log'.  Use `?'
to see all such results and any error messages.  If there are fewer
marked files than `diredp-do-report-echo-limit' then each result is
also echoed momentarily.

\(fn FUNCTION &optional ARG)" t nil)

(autoload 'dired-do-compress "dired+/dired+" "\
Compress or uncompress marked (or next prefix argument) files.
A prefix argument ARG specifies files to use instead of marked.
 An integer means use the next ARG files (previous -ARG, if < 0).
 `C-u': Use the current file (whether or not any are marked).
 `C-u C-u': Use all files in Dired, except directories.
 `C-u C-u C-u': Use all files and directories, except `.' and `..'.
 `C-u C-u C-u C-u': Use all files and all directories.

\(fn &optional ARG)" t nil)

(autoload 'dired-do-byte-compile "dired+/dired+" "\
Byte compile marked Emacs Lisp files.
A prefix argument ARG specifies files to use instead of those marked.
 * An integer means use the next ARG files (previous -ARG, if < 0).
 * Two or more `C-u' (e.g. `C-u C-u') means ignore any marks and use
   all files in the Dired buffer.
 * Any other prefix arg means use the current file.

\(fn &optional ARG)" t nil)

(autoload 'dired-do-load "dired+/dired+" "\
Load the marked Emacs Lisp files.
A prefix argument ARG specifies files to use instead of those marked.
 * An integer means use the next ARG files (previous -ARG, if < 0).
 * Two or more `C-u' (e.g. `C-u C-u') means ignore any marks and use
   all files in the Dired buffer.
 * Any other prefix arg means use the current file.

\(fn &optional ARG)" t nil)

(autoload 'dired-do-search "dired+/dired+" "\
Search through all marked files for a match for REGEXP.
Stops when a match is found.
To continue searching for next match, use command \\[tags-loop-continue].

A prefix arg behaves as follows:
 * An integer means use the next ARG files (previous -ARG, if < 0).
 * Two or more `C-u' (e.g. `C-u C-u') means ignore any marks and use
   all files in the Dired buffer.
 * Any other prefix arg means use the current file.

When invoked interactively, raise an error if no files are marked.

\(fn REGEXP &optional ARG INTERACTIVEP)" t nil)

(autoload 'dired-do-query-replace-regexp "dired+/dired+" "\
Do `query-replace-regexp' of FROM with TO, on all marked files.
NOTE: A prefix arg for this command acts differently than for other
commands, so that you can use it to request word-delimited matches.

With a prefix argument:
 * An odd number of plain `C-u': act on the marked files, but replace
   only word-delimited matches.
 * More than one plain `C-u': act on all files, ignoring whether any
   are marked.
 * Any other prefix arg: Act on the next numeric-prefix files.

So for example:
 * `C-u C-u C-u': act on all files, replacing word-delimited matches.
 * `C-u 4': act on the next 4 files.  `C-4' means the same thing.
 * `C-u': act on the marked files, replacing word-delimited matches.

When invoked interactively, raise an error if no files are marked.

If you exit (\\[keyboard-quit], RET or q), you can resume the query replace
with the command \\[tags-loop-continue].

\(fn FROM TO &optional ARG INTERACTIVEP)" t nil)

(autoload 'diredp-do-grep "dired+/dired+" "\
Run `grep' on marked (or next prefix arg) files.
A prefix argument behaves according to the ARG argument of
`dired-get-marked-files'.  In particular, `C-u C-u' operates on all
files in the Dired buffer.

\(fn COMMAND-ARGS)" t nil)

(autoload 'dired-maybe-insert-subdir "dired+/dired+" "\
Move to Dired subdirectory line or subdirectory listing.
This bounces you back and forth between a subdirectory line and its
inserted listing header line.  Using it on a non-directory line in a
subdirectory listing acts the same as using it on the subdirectory
header line.

* If on a subdirectory line, then go to the subdirectory's listing,
  creating it if not yet present.

* If on a subdirectory listing header line or a non-directory file in
  a subdirectory listing, then go to the line for the subdirectory in
  the parent directory listing.

* If on a non-directory file in the top Dired directory listing, do
  nothing.

Subdirectories are listed in the same position as for `ls -lR' output.

With a prefix arg, you can edit the `ls' switches used for this
listing.  Add `R' to the switches to expand the directory tree under a
subdirectory.

Dired remembers the switches you specify with a prefix arg, so
reverting the buffer does not reset them.  However, you might
sometimes need to reset some subdirectory switches after a
`dired-undo'.  You can reset all subdirectory switches to the
default value using \\<dired-mode-map>\\[dired-reset-subdir-switches].  See Info node
`(emacs)Subdir switches' for more details.

\(fn DIRNAME &optional SWITCHES NO-ERROR-IF-NOT-DIR-P)" t nil)

(autoload 'dired-do-find-marked-files "dired+/dired+" "\
Find marked files, displaying all of them simultaneously.
With no prefix argument:

* If `pop-up-frames' is nil then split the current window across all
  marked files, as evenly as possible.  Remaining lines go to the
  bottom-most window.  The number of files that can be displayed this
  way is restricted by the height of the current window and
  `window-min-height'.

* If `pop-up-frames' is non-nil then show each marked file in a
  separate frame (not window).

With a prefix argument:

* One or more plain `C-u' behaves as for `dired-get-marked-files'.
  In particular, `C-u C-u' means ignore any markings and operate on
  ALL files and directories (except `.' and `..') in the Dired buffer.

* A numeric prefix arg >= 0 means just find (visit) the marked files -
  do not show them.

* A numeric prefix arg < 0 means show each marked file in a separate
  frame (not window).  (This is the same behavior as no prefix arg
  with non-nil `pop-up-frames'.)

Note that a numeric prefix argument acts differently with this command
than it does with other `dired-do-*' commands: it does NOT act on the
next or previous (abs ARG) files, ignoring markings.

To keep the Dired buffer displayed, split the window (e.g., `C-x 2')
first.  To show only the marked files, type `\\[delete-other-windows]' first.

When invoked interactively, raise an error if no files are marked.

\(fn &optional ARG INTERACTIVEP)" t nil)

(autoload 'diredp-up-directory "dired+/dired+" "\
Run Dired on parent directory of current directory.
Find the parent directory either in this buffer or another buffer.
Creates a buffer if necessary.

With a prefix arg, Dired the parent directory in another window.

On MS Windows, if you are already at the root directory, invoke
`diredp-w32-drives' to visit a navigable list of Windows drives.

\(fn &optional OTHER-WINDOW)" t nil)

(autoload 'diredp-up-directory-reuse-dir-buffer "dired+/dired+" "\
Like `diredp-up-directory', but reuse Dired buffers.
With a prefix arg, Dired the parent directory in another window.

On MS Windows, moving up from a root Dired buffer does not kill that
buffer (the Windows drives buffer is not really a Dired buffer).

\(fn &optional OTHER-WINDOW)" t nil)

(autoload 'diredp-next-line "dired+/dired+" "\
Move down lines then position cursor at filename.
If `goal-column' is non-nil then put the cursor at that column.
Optional prefix ARG says how many lines to move; default is one line.

If `diredp-wrap-around-flag' is non-nil then wrap around if none is
found before the buffer end (buffer beginning, if ARG is negative).
Otherwise, just move to the buffer limit.

\(fn ARG)" t nil)

(autoload 'diredp-previous-line "dired+/dired+" "\
Move up lines then position cursor at filename.
If `goal-column' is non-nil then put the cursor at that column.
Optional prefix ARG says how many lines to move; default is one line.

If `diredp-wrap-around-flag' is non-nil then wrap around if none is
found before the buffer beginning (buffer end, if ARG is negative).
Otherwise, just move to the buffer limit.

\(fn ARG)" t nil)

(autoload 'diredp-next-dirline "dired+/dired+" "\
Goto ARGth next directory file line.
If `diredp-wrap-around-flag' is non-nil then wrap around if none is
found before the buffer beginning (buffer end, if ARG is negative).
Otherwise, raise an error or, if NO-ERROR-IF-NOT-FOUND is nil, return
nil.

\(fn ARG &optional OPOINT)" t nil)

(autoload 'diredp-prev-dirline "dired+/dired+" "\
Goto ARGth previous directory file line.

\(fn ARG)" t nil)

(autoload 'diredp-next-subdir "dired+/dired+" "\
Go to the next subdirectory, regardless of level.
If ARG = 0 then go to this directory's header line.

If `diredp-wrap-around-flag' is non-nil then wrap around if none is
found before the buffer end (buffer beginning, if ARG is negative).
Otherwise, raise an error or, if NO-ERROR-IF-NOT-FOUND is nil, return
nil.

Non-nil NO-SKIP means do not move to end of header line, and return
the position moved to so far.

\(fn ARG &optional NO-ERROR-IF-NOT-FOUND NO-SKIP)" t nil)

(autoload 'diredp-prev-subdir "dired+/dired+" "\
Go to the previous subdirectory, regardless of level.
When called interactively and not on a subdir line, go to this subdir's line.
Otherwise, this is a mirror image of `diredp-next-subdir'.

\(fn ARG &optional NO-ERROR-IF-NOT-FOUND NO-SKIP)" t nil)

(autoload 'dired-do-flagged-delete "dired+/dired+" "\
In Dired, delete the files flagged for deletion.
NOTE: This deletes flagged, not marked, files.
If arg NO-MSG is non-nil, no message is displayed.

User option `dired-recursive-deletes' controls whether deletion of
non-empty directories is allowed.

\(fn &optional NO-MSG)" t nil)

(autoload 'dired-do-delete "dired+/dired+" "\
Delete all marked (or next ARG) files.
NOTE: This deletes marked, not flagged, files.
`dired-recursive-deletes' controls whether deletion of
non-empty directories is allowed.

\(fn &optional ARG)" t nil)

(autoload 'dired-mark-files-regexp "dired+/dired+" "\
Mark all file names matching REGEXP for use in later commands.
`.' and `..' are never marked or unmarked by this command.

Whether to mark or unmark, and what form of file name to match, are
governed by the prefix argument.  For this, a plain (`C-u') or a
double-plain (`C-u C-u') prefix arg is considered only as such - it is
not considered numerically.

Whether to mark or unmark:

 - No prefix arg, a positive arg, or a negative arg means mark.

 - Plain (`C-u'), double-plain (`C-u C-u'), or zero (e.g. `M-0' means
   unmark.

The form of a file name used for matching:

 - No prefix arg (to mark) or a plain prefix arg (`C-u', to unmark)
   means use the relative file name (no directory part).

 - A negative arg (e.g. `M--', to mark) or a zero arg (e.g. `M-0', to
   unmark) means use the absolute file name, that is, including all
   directory components.

 - A positive arg (e.g. `M-+', to mark) or a double plain arg (`C-u
   C-u', to unmark) means construct the name relative to
   `default-directory'.  For an entry in an inserted subdir listing,
   this means prefix the relative file name (no directory part) with
   the subdir name relative to `default-directory'.

Note that the default matching behavior of this command is different
for Dired+ than it is for vanilla Emacs.  Using a positive prefix arg
or a double plain prefix arg (`C-u C-u') gives you the same behavior
as vanilla Emacs (marking or unmarking, respectively): matching
against names that are relative to the `default-directory'.

What Dired+ offers in addition is the possibility to match against
names that are relative (have no directory part - no prefix arg or
`C-u' to mark and unmark, respectively) or absolute (`M--' or `M-0',
respectively).  The default behavior uses relative names because this
is likely to be the more common use case.  But matching against
absolute names gives you more flexibility.

REGEXP is an Emacs regexp, not a shell wildcard.  Thus, use `\\.o$'
for object files--just `.o' might mark more than you might expect.

REGEXP is added to `regexp-search-ring', for regexp search.

Non-interactively:
 MARKER-CHAR is the marker character - used for `dired-marker-char'.
 LOCALP is passed to `dired-get-filename'.  It determines the form of
   filename that is matched against REGEXP.

\(fn REGEXP &optional MARKER-CHAR LOCALP)" t nil)

(autoload 'dired-mark-files-containing-regexp "dired+/dired+" "\
Mark files with contents containing a REGEXP match.
A prefix argument means unmark them instead.
`.' and `..' are never marked.

If a file is visited in a buffer and `dired-always-read-filesystem' is
nil, this looks in the buffer without revisiting the file, so the
results might be inconsistent with the file on disk if its contents
have changed since it was last visited.

\(fn REGEXP &optional MARKER-CHAR)" t nil)

(autoload 'dired-mark-symlinks "dired+/dired+" "\
Mark all symbolic links.
With prefix argument, unmark or unflag all those files.

\(fn UNFLAG-P)" t nil)

(autoload 'dired-mark-directories "dired+/dired+" "\
Mark all directory file lines except `.' and `..'.
With prefix argument, unmark or unflag the files instead.

\(fn UNFLAG-P)" t nil)

(autoload 'dired-mark-executables "dired+/dired+" "\
Mark all executable files.
With prefix argument, unmark or unflag the files instead.

\(fn UNFLAG-P)" t nil)

(autoload 'dired-flag-auto-save-files "dired+/dired+" "\
Flag for deletion files whose names suggest they are auto save files.
A prefix argument says to unmark or unflag the files instead.

\(fn &optional UNFLAG-P)" t nil)

(autoload 'diredp-capitalize "dired+/dired+" "\
Rename all marked (or next ARG) files by capitalizing them.
Makes the first char of the name uppercase and the others lowercase.

\(fn &optional ARG)" t nil)

(autoload 'diredp-delete-this-file "dired+/dired+" "\
In Dired, delete the file on the cursor line, upon confirmation.
This uses `delete-file'.
If the file is a symlink, remove the symlink.  If the file has
multiple names, it continues to exist with the other names.

For Emacs 24 and later, a prefix arg means that if
`delete-by-moving-to-trash' is non-nil then trash the file instead of
deleting it.

\(fn &optional USE-TRASH-CAN)" t nil)

(autoload 'diredp-capitalize-this-file "dired+/dired+" "\
In Dired, rename the file on the cursor line by capitalizing it.
Makes the first char of the name uppercase and the others lowercase.

\(fn)" t nil)

(autoload 'diredp-downcase-this-file "dired+/dired+" "\
In Dired, rename the file on the cursor line to lower case.

\(fn)" t nil)

(autoload 'diredp-upcase-this-file "dired+/dired+" "\
In Dired, rename the file on the cursor line to upper case.

\(fn)" t nil)

(autoload 'diredp-rename-this-file "dired+/dired+" "\
In Dired, rename the file on the cursor line.

\(fn)" t nil)

(autoload 'diredp-copy-this-file "dired+/dired+" "\
In Dired, copy the file on the cursor line.

\(fn)" t nil)

(autoload 'diredp-relsymlink-this-file "dired+/dired+" "\
In Dired, make a relative symbolic link to file on cursor line.

\(fn)" t nil)

(autoload 'diredp-symlink-this-file "dired+/dired+" "\
In Dired, make a symbolic link to the file on the cursor line.

\(fn)" t nil)

(autoload 'diredp-hardlink-this-file "dired+/dired+" "\
In Dired, add a name (hard link) to the file on the cursor line.

\(fn)" t nil)

(autoload 'diredp-print-this-file "dired+/dired+" "\
In Dired, print the file on the cursor line.

\(fn)" t nil)

(autoload 'diredp-grep-this-file "dired+/dired+" "\
In Dired, grep the file on the cursor line.

\(fn)" t nil)

(autoload 'diredp-compress-this-file "dired+/dired+" "\
In Dired, compress or uncompress the file on the cursor line.

\(fn)" t nil)

(autoload 'diredp-async-shell-command-this-file "dired+/dired+" "\
Run a shell COMMAND asynchronously on the file on the Dired cursor line.
Like `diredp-shell-command-this-file', but adds `&' at the end of
COMMAND to execute it asynchronously.  The command output appears in
buffer `*Async Shell Command*'.

\(fn COMMAND FILELIST)" t nil)

(autoload 'diredp-shell-command-this-file "dired+/dired+" "\
In Dired, run a shell COMMAND on the file on the cursor line.

\(fn COMMAND FILELIST)" t nil)

(autoload 'diredp-bookmark-this-file "dired+/dired+" "\
In Dired, bookmark the file on the cursor line.
See `diredp-do-bookmark'.

\(fn &optional PREFIX)" t nil)

(autoload 'diredp-tag-this-file "dired+/dired+" "\
In Dired, add some tags to the file on the cursor line.
You need library `bookmark+.el' to use this command.

\(fn TAGS &optional PREFIX)" t nil)

(autoload 'diredp-untag-this-file "dired+/dired+" "\
In Dired, remove some tags from the file on the cursor line.
With a prefix arg, remove all tags from the file.
You need library `bookmark+.el' to use this command.

\(fn TAGS &optional PREFIX ARG)" t nil)

(autoload 'diredp-remove-all-tags-this-file "dired+/dired+" "\
In Dired, remove all tags from this file.
You need library `bookmark+.el' to use this command.

\(fn &optional PREFIX MSGP)" t nil)

(autoload 'diredp-paste-add-tags-this-file "dired+/dired+" "\
In Dired, add previously copied tags to this file.
See `diredp-paste-add-tags'.
You need library `bookmark+.el' to use this command.

\(fn &optional PREFIX MSGP)" t nil)

(autoload 'diredp-paste-replace-tags-this-file "dired+/dired+" "\
In Dired, replace tags for this file with previously copied tags.
See `diredp-paste-replace-tags'.
You need library `bookmark+.el' to use this command.

\(fn &optional PREFIX MSGP)" t nil)

(autoload 'diredp-set-tag-value-this-file "dired+/dired+" "\
In Dired, Set value of TAG to VALUE for this file.
See `diredp-set-tag-value'.
You need library `bookmark+.el' to use this command.

\(fn TAG VALUE &optional PREFIX MSGP)" t nil)

(autoload 'diredp-copy-tags-this-file "dired+/dired+" "\
In Dired, copy the tags from this file, so you can paste them to another.
See `diredp-copy-tags'.
You need library `bookmark+.el' to use this command.

\(fn &optional PREFIX MSGP)" t nil)

(autoload 'diredp-mouse-copy-tags "dired+/dired+" "\
In Dired, copy the tags from this file, so you can paste them to another.
You need library `bookmark+.el' to use this command.

\(fn EVENT)" t nil)

(defalias 'diredp-show-metadata 'diredp-describe-autofile)

(autoload 'diredp-describe-autofile "dired+/dired+" "\
Show the metadata for the file of the current line.
The file must name an autofile bookmark.  The metadata is the bookmark
information.

With a prefix argument, show the internal definition of the bookmark.

You need library `bookmark+.el' for this command.

\(fn &optional INTERNAL-FORM-P)" t nil)

(defalias 'diredp-show-metadata-for-marked 'diredp-describe-marked-autofiles)

(autoload 'diredp-describe-marked-autofiles "dired+/dired+" "\
Show metadata for the marked files.
If no file is marked, describe ALL autofiles in this directory.
With a prefix argument, show the internal (Lisp) form of the metadata.
When invoked interactively, raise an error if no files are marked.
You need library `bookmark+.el' for this command.

When called from Lisp, optional arg DETAILS is passed to
`diredp-get-files'.

\(fn &optional INTERNAL-FORM-P INTERACTIVEP DETAILS)" t nil)

(autoload 'diredp-byte-compile-this-file "dired+/dired+" "\
In Dired, byte compile the (Lisp source) file on the cursor line.

\(fn)" t nil)

(autoload 'diredp-load-this-file "dired+/dired+" "\
In Dired, load the file on the cursor line.

\(fn)" t nil)

(autoload 'diredp-chmod-this-file "dired+/dired+" "\
In Dired, change the mode of the file on the cursor line.

\(fn)" t nil)

(autoload 'dired-mark-sexp "dired+/dired+" "\
Mark files for which PREDICATE returns non-nil.
With a prefix arg, unmark or unflag those files instead.

PREDICATE is a lisp sexp that can refer to the following symbols as
variables:

    `mode'   [string]  file permission bits, e.g. \"-rw-r--r--\"
    `nlink'  [integer] number of links to file
    `size'   [integer] file size in bytes
    `uid'    [string]  owner
    `gid'    [string]  group (If the gid is not displayed by `ls',
                       this will still be set (to the same as uid))
    `time'   [string]  the time that `ls' displays, e.g. \"Feb 12 14:17\"
    `name'   [string]  the name of the file
    `sym'    [string]  if file is a symbolic link, the linked-to name,
                       else \"\"
    `inode'  [integer] the inode of the file (only for `ls -i' output)
    `blks'   [integer] the size of the file for `ls -s' output
                       (ususally in blocks or, with `-k', in Kbytes)
Examples:
  Mark zero-length files: `(equal 0 size)'
  Mark files last modified on Feb 2: `(string-match \"Feb  2\" time)'
  Mark uncompiled Emacs Lisp files (`.el' file without a `.elc' file):
     First, Dired just the source files: `dired *.el'.
     Then, use \\[dired-mark-sexp] with this sexp:
          (not (file-exists-p (concat name \"c\")))

There's an ambiguity when a single integer not followed by a unit
prefix precedes the file mode: It is then parsed as inode number
and not as block size (this always works for GNU coreutils ls).

Another limitation is that the uid field is needed for the
function to work correctly.  In particular, the field is not
present for some values of `ls-lisp-emulation'.

This function operates only on the Dired buffer content.  It does not
refer at all to the underlying file system.  Contrast this with
`find-dired', which might be preferable for the task at hand.

\(fn PREDICATE &optional UNMARK-P)" t nil)

(autoload 'diredp-mark-region-files "dired+/dired+" "\
Mark all of the files in the current region (if it is active).
With non-nil prefix arg, unmark them instead.

\(fn &optional UNMARK-P)" t nil)

(autoload 'diredp-unmark-region-files "dired+/dired+" "\
Unmark all of the files in the current region (if it is active).
With non-nil prefix arg, mark them instead.

\(fn &optional MARK-P)" t nil)

(autoload 'diredp-flag-region-files-for-deletion "dired+/dired+" "\
Flag all of the files in the current region (if it is active) for deletion.

\(fn)" t nil)

(autoload 'diredp-toggle-marks-in-region "dired+/dired+" "\
Toggle marks in the region.

\(fn START END)" t nil)

(autoload 'diredp-mouse-3-menu "dired+/dired+" "\
Dired pop-up `mouse-3' menu, for files in selection or current line.

\(fn EVENT)" t nil)

(autoload 'diredp-find-file-other-frame "dired+/dired+" "\
In Dired, visit this file or directory in another frame.

\(fn)" t nil)

(autoload 'diredp-mouse-find-file-other-frame "dired+/dired+" "\
In Dired, visit file or directory clicked on in another frame.

\(fn EVENT)" t nil)

(autoload 'dired-mouse-find-file-other-window "dired+/dired+" "\
In Dired, visit the file or directory name you click on.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-view-file "dired+/dired+" "\
Examine this file in view mode, returning to Dired when done.
When file is a directory, show it in this buffer if it is inserted;
otherwise, display it in another buffer.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-ediff "dired+/dired+" "\
Compare this file (pointed by mouse) with file FILE2 using `ediff'.
FILE2 defaults to this file as well.  If you enter just a directory
name for FILE2, then this file is compared with a file of the same
name in that directory.  FILE2 is the second file given to `ediff';
this file is the first given to it.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-diff "dired+/dired+" "\
Compare this file (pointed by mouse) with file FILE2 using `diff'.
FILE2 defaults to the file at the mark.  This file is the first file
given to `diff'.  With prefix arg, prompt for second arg SWITCHES,
which are options for `diff'.

\(fn EVENT &optional SWITCHES)" t nil)

(autoload 'diredp-mouse-backup-diff "dired+/dired+" "\
Diff this file with its backup file or vice versa.
Use the latest backup, if there are several numerical backups.
If this file is a backup, diff it with its original.
The backup file is the first file given to `diff'.
With prefix arg, prompt for SWITCHES which are the options for `diff'.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-mark "dired+/dired+" "\
In Dired, mark this file.
If on a subdir headerline, mark all its files except `.' and `..'.

Use \\[dired-unmark-all-files] to remove all marks,
and \\[dired-unmark] on a subdir to remove the marks in this subdir.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-unmark "dired+/dired+" "\
In Dired, unmark this file.
If looking at a subdir, unmark all its files except `.' and `..'.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-mark/unmark "dired+/dired+" "\
Mark/unmark file or directory at mouse EVENT.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-mark-region-files "dired+/dired+" "\
Mark files between point and the mouse.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-mark/unmark-mark-region-files "dired+/dired+" "\
Mark/unmark file or mark files in region.
If the file the cursor is on is marked, then mark all files between it
 and the line clicked (included).
Otherwise (cursor's file is unmarked):
 If the file clicked is marked, then unmark it.
 If it is unmarked, then mark it.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-flag-file-deletion "dired+/dired+" "\
In Dired, flag this file for deletion.
If on a subdir headerline, mark all its files except `.' and `..'.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-do-copy "dired+/dired+" "\
In Dired, copy this file.
This normally preserves the last-modified date when copying.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-do-rename "dired+/dired+" "\
In Dired, rename this file.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-upcase "dired+/dired+" "\
In Dired, rename this file to upper case.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-downcase "dired+/dired+" "\
In Dired, rename this file to lower case.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-do-delete "dired+/dired+" "\
In Dired, delete this file, upon confirmation.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-do-shell-command "dired+/dired+" "\
Run a shell COMMAND on this file.
If there is output, it goes to a separate buffer.

No automatic redisplay of Dired buffers is attempted, as there's no
telling what files the command may have changed.  Type
\\[dired-do-redisplay] to redisplay.

The shell command has the top level directory as working directory, so
output files usually are created there instead of in a subdir.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-do-symlink "dired+/dired+" "\
Make symbolic link to this file.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-do-hardlink "dired+/dired+" "\
Make hard link (alias) to this file.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-do-print "dired+/dired+" "\
Print this file.
Uses the shell command coming from variables `lpr-command' and
`lpr-switches' as default.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-do-grep "dired+/dired+" "\
Run grep against this file.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-do-compress "dired+/dired+" "\
Compress or uncompress this file.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-do-byte-compile "dired+/dired+" "\
Byte compile this file.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-do-load "dired+/dired+" "\
Load this Emacs Lisp file.

\(fn EVENT)" t nil)

(autoload 'diredp-mouse-do-chmod "dired+/dired+" "\
Change the mode of this file.
This calls chmod, so symbolic modes like `g+w' are allowed.

\(fn EVENT)" t nil)

(autoload 'diredp-describe-mode "dired+/dired+" "\
Describe Dired mode, including Dired+ features.
This is `describe-mode' plus a description of Dired+ features.
For just the latter, use \\<dired-mode-map>`\\[diredp-dired-plus-help]'.

\(fn &optional BUFFER)" t nil)

(autoload 'diredp-dired-plus-help "dired+/dired+" "\
Describe Dired+.

\(fn)" t nil)

(autoload 'diredp-send-bug-report "dired+/dired+" "\
Send a bug report about a Dired+ problem.

\(fn)" t nil)

(autoload 'diredp-visit-next-file "dired+/dired+" "\
Move down a line and visit its file in another window.
With numeric prefix arg N, move down N-1 lines first.

After moving N lines, skip any lines with file names that match either
`diredp-visit-ignore-extensions' or `diredp-visit-ignore-regexps'. 

Kill the last buffer visited by a `dired-visit-*' command.

\(fn &optional ARG)" t nil)

(autoload 'diredp-visit-previous-file "dired+/dired+" "\
Move up a line and visit its file in another window.
With numeric prefix arg N, move up N-1 lines first.

After moving N lines, skip any lines with file names that match either
`diredp-visit-ignore-extensions' or `diredp-visit-ignore-regexps'. 

Kill the last buffer visited by a `dired-visit-*' command.

\(fn &optional ARG)" t nil)

(autoload 'diredp-visit-this-file "dired+/dired+" "\
View the file on this line in another window in the same frame.
If it was not already shown there then kill the previous buffer
visited by a `dired-visit-*' command.

If it was already shown there, and if it and Dired are the only
windows there, then delete its window (toggle : show/hide the file).

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "dired+/dired+" '("dired")))

;;;***

;;;### (autoloads nil "el-get/el-get" "el-get/el-get.el" (0 0 0 0))
;;; Generated autoloads from el-get/el-get.el

(autoload 'el-get-version "el-get/el-get" "\
Message the current el-get version

\(fn)" t nil)

(autoload 'el-get-install "el-get/el-get" "\
Cause the named PACKAGE to be installed after all of its
dependencies (if any).

PACKAGE may be either a string or the corresponding symbol.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update "el-get/el-get" "\
Update PACKAGE.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update-all "el-get/el-get" "\
Performs update of all installed packages.

\(fn &optional NO-PROMPT)" t nil)

(autoload 'el-get-update-packages-of-type "el-get/el-get" "\
Update all installed packages of type TYPE.

\(fn TYPE)" t nil)

(autoload 'el-get-self-update "el-get/el-get" "\
Update el-get itself.  The standard recipe takes care of reloading the code.

\(fn)" t nil)

(autoload 'el-get-remove "el-get/el-get" "\
Remove any PACKAGE that is know to be installed or required.

\(fn PACKAGE)" t nil)

(autoload 'el-get-reinstall "el-get/el-get" "\
Remove PACKAGE and then install it again.

\(fn PACKAGE)" t nil)

(autoload 'el-get-cd "el-get/el-get" "\
Open dired in the package directory.

\(fn PACKAGE)" t nil)

(autoload 'el-get-make-recipes "el-get/el-get" "\
Loop over `el-get-sources' and write a recipe file for each
entry which is not a symbol and is not already a known recipe.

\(fn &optional DIR)" t nil)

(autoload 'el-get-checksum "el-get/el-get" "\
Compute the checksum of the given package, and put it in the kill-ring

\(fn PACKAGE)" t nil)

(autoload 'el-get-self-checksum "el-get/el-get" "\
Compute the checksum of the running version of el-get itself.

Also put the checksum in the kill-ring.

\(fn)" t nil)

(autoload 'el-get "el-get/el-get" "\
Ensure that packages have been downloaded once and init them as needed.

This will not update the sources by using `apt-get install' or
`git pull', but it will ensure that:

* the packages have been installed
* load-path is set so their elisp files can be found
* Info-directory-list is set so their info files can be found
* Autoloads have been prepared and evaluated for each package
* Any post-installation setup (e.g. `(require 'feature)') happens

When SYNC is nil (the default), all installations run
concurrently, in the background.

When SYNC is 'sync, each package will be installed synchronously,
and any error will stop it all.

Please note that the `el-get-init' part of `el-get' is always
done synchronously. There's `byte-compile' support though, and
the packages you use are welcome to use `autoload' too.

PACKAGES is expected to be a list of packages you want to install
or init.  When PACKAGES is omited (the default), the list of
already installed packages is considered.

\(fn &optional SYNC &rest PACKAGES)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-autoloading" "el-get/el-get-autoloading.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-autoloading.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-autoloading" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-build" "el-get/el-get-build.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-build.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-build" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-bundle" "el-get/el-get-bundle.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-bundle.el

(autoload 'el-get-bundle-el-get "el-get/el-get-bundle" "\


\(fn SRC SYNC)" nil nil)

(autoload 'el-get-bundle "el-get/el-get-bundle" "\
Install PACKAGE and run initialization FORM.

PACKAGE can be either a simple package name or a package name
with a modifier before the name to specify local recipe source
information:

* `<owner>/' : specifies a Github owner name
* `gist:<id>' : specifies a Gist ID
* `<type>:' : specifies a type of the package source

If `FEATURE in PACKAGE' form is used instead of PACKAGE, then
that FEATURE is `require'd after installing PACKAGE.  You can
also use `el-get-bundle!' macro if FEATURE and PACKAGE are the
same.  If you wish to `require' more than one feature, then use
`:features' property in FORM.

The initialization FORM may start with a property list that
describes a local recipe.  The property list may include the keyword
`:bundle-sync' with a value of either `t' or `nil' to request that
`el-get-bundle' invoke `el-get' synchronously (respectively asynchronously).
The keyword `:bundle-async' is the inverse of `:bundle-sync'.
\(Note that the request to run el-get synchronously may not be respected in all
circumstances: see the definition of `el-get-bundle-el-get' for details.)
The FORM after the property list is treated as initialization code,
which is actually an `:after' property of the local recipe.

A copy of the initialization code is stored in a directory
specified by `el-get-bundle-init-directory' and its byte-compiled
version is used if `el-get-bundle-byte-compile' is non-nil.

\(fn PACKAGE &rest FORM)" nil t)

(function-put 'el-get-bundle 'lisp-indent-function 'defun)

(autoload 'el-get-bundle! "el-get/el-get-bundle" "\
Install PACKAGE and run initialization form.
It is the same as `el-get-bundle' except that PACKAGE is explicitly
required.

\(fn PACKAGE &rest ARGS)" nil t)

(function-put 'el-get-bundle! 'lisp-indent-function 'defun)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-bundle" '("el-get-bundle-")))

;;;***

;;;### (autoloads nil "el-get/el-get-byte-compile" "el-get/el-get-byte-compile.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-byte-compile.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-byte-compile" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-check" "el-get/el-get-check.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-check.el

(autoload 'el-get-check-recipe "el-get/el-get-check" "\
Check the format of the recipe.
Please run this command before sending a pull request.
Usage: M-x el-get-check-recipe RET

You can run this function from checker script like this:
    test/check-recipe.el PATH/TO/RECIPE.rcp

When used as a lisp function, FILE-OR-BUFFER must be a buffer
object or a file path.

\(fn FILE-OR-BUFFER)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-check" '("el-get-check-")))

;;;***

;;;### (autoloads nil "el-get/el-get-core" "el-get/el-get-core.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-core.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-core" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-custom" "el-get/el-get-custom.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-custom.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-custom" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-dependencies" "el-get/el-get-dependencies.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-dependencies.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-dependencies" '("el-get-" "topological-sort")))

;;;***

;;;### (autoloads nil "el-get/el-get-list-packages" "el-get/el-get-list-packages.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-list-packages" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-methods" "el-get/el-get-methods.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-methods.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-methods" '("el-get-insecure-check")))

;;;***

;;;### (autoloads nil "el-get/el-get-notify" "el-get/el-get-notify.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-notify.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-notify" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-recipes" "el-get/el-get-recipes.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-recipes.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-recipes" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-status" "el-get/el-get-status.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-status.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-status" '("el-get-")))

;;;***

;;;### (autoloads nil "shell-completion/shell-completion" "shell-completion/shell-completion.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from shell-completion/shell-completion.el

(autoload 'shell-completion-get-column "shell-completion/shell-completion" "\


\(fn START END COL &optional SEP)" nil nil)

(autoload 'shell-completion-get-file-column "shell-completion/shell-completion" "\


\(fn FILE COL &optional SEP)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "shell-completion/shell-completion" '("shell-completion-")))

;;;***

;;;### (autoloads nil "telega/telega" "telega/telega.el" (0 0 0 0))
;;; Generated autoloads from telega/telega.el

(autoload 'telega "telega/telega" "\
Start telegramming.
If prefix ARG is given, then will not pop to telega root buffer.

\(fn ARG)" t nil)

(autoload 'telega-kill "telega/telega" "\
Kill currently running telega.
With prefix arg FORCE quit without confirmation.

\(fn FORCE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega" '("telega-")))

;;;***

;;;### (autoloads nil "telega/telega-chat" "telega/telega-chat.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-chat.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-chat" '("telega-" "with-telega-chatbuf-action")))

;;;***

;;;### (autoloads nil "telega/telega-company" "telega/telega-company.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-company.el

(autoload 'telega-company-emoji "telega/telega-company" "\
Backend for `company' to complete emojis.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(autoload 'telega-company-username "telega/telega-company" "\
Backend for `company' to complete usernames.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(autoload 'telega-company-hashtag "telega/telega-company" "\
Backend for `company' to complete recent hashtags.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(autoload 'telega-company-botcmd "telega/telega-company" "\


\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-company" '("telega-company-")))

;;;***

;;;### (autoloads nil "telega/telega-core" "telega/telega-core.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-core.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-core" '("telega-" "with-telega-")))

;;;***

;;;### (autoloads nil "telega/telega-customize" "telega/telega-customize.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-customize.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-customize" '("telega-")))

;;;***

;;;### (autoloads nil "telega/telega-ffplay" "telega/telega-ffplay.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-ffplay.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-ffplay" '("telega-ffplay-")))

;;;***

;;;### (autoloads nil "telega/telega-filter" "telega/telega-filter.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-filter.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-filter" '("type" "top" "telega-" "tracking" "label" "saved-messages" "custom" "contact" "restriction" "opened" "has-" "mention" "me-is-member" "ids" "verified" "user-status" "pin" "not" "name" "any" "all" "define-telega-filter")))

;;;***

;;;### (autoloads nil "telega/telega-i18n" "telega/telega-i18n.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-i18n.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-i18n" '("telega-")))

;;;***

;;;### (autoloads nil "telega/telega-info" "telega/telega-info.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-info.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-info" '("telega-")))

;;;***

;;;### (autoloads nil "telega/telega-inline" "telega/telega-inline.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-inline.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-inline" '("telega-")))

;;;***

;;;### (autoloads nil "telega/telega-ins" "telega/telega-ins.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-ins.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-ins" '("telega-")))

;;;***

;;;### (autoloads nil "telega/telega-media" "telega/telega-media.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-media.el

(autoload 'telega-media-auto-download-mode "telega/telega-media" "\
Toggle automatic media download for incoming messages.
With positive ARG - enables automatic downloads, otherwise disables.
To customize automatic downloads, use `telega-auto-download'.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-media" '("telega-")))

;;;***

;;;### (autoloads nil "telega/telega-modes" "telega/telega-modes.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-modes.el

(defvar telega-mode-line-mode nil "\
Non-nil if Telega-Mode-Line mode is enabled.
See the `telega-mode-line-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `telega-mode-line-mode'.")

(custom-autoload 'telega-mode-line-mode "telega/telega-modes" nil)

(autoload 'telega-mode-line-mode "telega/telega-modes" "\
Toggle display of the unread chats/mentions in the modeline.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-modes" '("telega-mode-line-")))

;;;***

;;;### (autoloads nil "telega/telega-msg" "telega/telega-msg.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-msg.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-msg" '("telega-")))

;;;***

;;;### (autoloads nil "telega/telega-notifications" "telega/telega-notifications.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-notifications.el

(defvar telega-notifications-mode nil "\
Non-nil if Telega-Notifications mode is enabled.
See the `telega-notifications-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `telega-notifications-mode'.")

(custom-autoload 'telega-notifications-mode "telega/telega-notifications" nil)

(autoload 'telega-notifications-mode "telega/telega-notifications" "\
Telega D-Bus notifications.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-notifications" '("telega-")))

;;;***

;;;### (autoloads nil "telega/telega-root" "telega/telega-root.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-root.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-root" '("telega-")))

;;;***

;;;### (autoloads nil "telega/telega-server" "telega/telega-server.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-server.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-server" '("telega-" "with-telega-deferred-events")))

;;;***

;;;### (autoloads nil "telega/telega-sticker" "telega/telega-sticker.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-sticker.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-sticker" '("telega-")))

;;;***

;;;### (autoloads nil "telega/telega-tme" "telega/telega-tme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-tme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-tme" '("telega-tme-")))

;;;***

;;;### (autoloads nil "telega/telega-user" "telega/telega-user.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-user.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-user" '("telega-")))

;;;***

;;;### (autoloads nil "telega/telega-util" "telega/telega-util.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-util.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-util" '("telega-")))

;;;***

;;;### (autoloads nil "telega/telega-voip" "telega/telega-voip.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-voip.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-voip" '("telega-")))

;;;***

;;;### (autoloads nil "telega/telega-vvnote" "telega/telega-vvnote.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-vvnote.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-vvnote" '("telega-vvnote-")))

;;;***

;;;### (autoloads nil "telega/telega-webpage" "telega/telega-webpage.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from telega/telega-webpage.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "telega/telega-webpage" '("telega-")))

;;;***

;;;### (autoloads nil "visual-fill-column/visual-fill-column" "visual-fill-column/visual-fill-column.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from visual-fill-column/visual-fill-column.el

(autoload 'visual-fill-column-mode "visual-fill-column/visual-fill-column" "\
Wrap lines according to `fill-column' in `visual-line-mode'.

\(fn &optional ARG)" t nil)

(defvar global-visual-fill-column-mode nil "\
Non-nil if Global Visual-Fill-Column mode is enabled.
See the `global-visual-fill-column-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-visual-fill-column-mode'.")

(custom-autoload 'global-visual-fill-column-mode "visual-fill-column/visual-fill-column" nil)

(autoload 'global-visual-fill-column-mode "visual-fill-column/visual-fill-column" "\
Toggle Visual-Fill-Column mode in all buffers.
With prefix ARG, enable Global Visual-Fill-Column mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Visual-Fill-Column mode is enabled in all buffers where
`turn-on-visual-fill-column-mode' would do it.
See `visual-fill-column-mode' for more information on Visual-Fill-Column mode.

\(fn &optional ARG)" t nil)

(autoload 'visual-fill-column-split-window-sensibly "visual-fill-column/visual-fill-column" "\
Split WINDOW sensibly, unsetting its margins first.
This function unsets the window margins and calls
`split-window-sensibly'.

By default, `split-window-sensibly' does not split a window
vertically if it has wide margins, even if there is enough space
for a vertical split.  This function can be used as the value of
`split-window-preferred-function' to enable vertically splitting
windows with wide margins.

\(fn &optional WINDOW)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "visual-fill-column/visual-fill-column" '("visual-fill-column-" "turn-on-visual-fill-column-mode")))

;;;***

;;;### (autoloads nil nil ("bookmark+/bookmark+-chg.el" "bookmark+/bookmark+-doc.el"
;;;;;;  "el-get/el-get-install.el" "telega/telega-autoloads.el" "telega/telega-pkg.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here