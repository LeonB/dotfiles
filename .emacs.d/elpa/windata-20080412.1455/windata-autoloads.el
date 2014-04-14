;;; windata-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (windata-display-buffer windata-restore-named-winconf
;;;;;;  windata-name-winconf) "windata" "windata.el" (21324 21288
;;;;;;  31093 303000))
;;; Generated autoloads from windata.el

(autoload 'windata-name-winconf "windata" "\
Save window configuration with NAME.
After save the window configuration you can restore it by NAME using
`windata-restore-named-winconf'.

\(fn NAME)" t nil)

(autoload 'windata-restore-named-winconf "windata" "\
Restore saved window configuration.

\(fn NAME)" t nil)

(autoload 'windata-display-buffer "windata" "\
Display buffer more precisely.
FRAME-P is non-nil and not window, the displayed buffer affect
the whole frame, that is to say, if DIR is right or left, the
displayed buffer will show on the right or left in the frame. If
it is nil, the buf will share space with current window.

DIR can be one of member of (right left top bottom).

SIZE is the displayed windowed size in width(if DIR is left or
right) or height(DIR is top or bottom). It can be a decimal which
will stand for percentage of window(frame) width(heigth)

DELETE-P is non-nil, the other window will be deleted before
display the BUF.

\(fn BUF FRAME-P DIR SIZE &optional DELETE-P)" nil nil)

;;;***

;;;### (autoloads nil nil ("windata-pkg.el") (21324 21288 58593 830000))

;;;***

(provide 'windata-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; windata-autoloads.el ends here
