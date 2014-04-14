;;; load-dir-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (load-dirs-reload load-dirs) "load-dir" "load-dir.el"
;;;;;;  (21324 21443 61887 863000))
;;; Generated autoloads from load-dir.el

(autoload 'load-dirs "load-dir" "\
Load all Emacs Lisp files in `load-dirs'.
Will not load a file twice (use `load-dir-reload' for that).
Recurses into subdirectories if `load-dir-recursive' is t.

\(fn)" t nil)

(autoload 'load-dirs-reload "load-dir" "\
Load all Emacs Lisp files in `load-dirs'.
Clears the list of loaded files and just calls `load-dir-load'.

\(fn)" t nil)

(add-hook 'after-init-hook 'load-dirs)

;;;***

;;;### (autoloads nil nil ("load-dir-pkg.el") (21324 21443 86899
;;;;;;  221000))

;;;***

(provide 'load-dir-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; load-dir-autoloads.el ends here
