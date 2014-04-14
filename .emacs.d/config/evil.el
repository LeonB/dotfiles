;; enable evil-mode everywhere!
;; TODO: this is probably more reasonable: https://github.com/prooftechnique/.emacs.d/blob/master/config/jhenahan-evil.el
;;       also: https://github.com/edwtjo/evil-org-mode
(setq evil-normal-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)

; (define-key evil-window-map "q" 'evil-window-delete)
(define-key evil-window-map "q" 'quit-window)
; (define-key evil-window-map "q" 'evil-quit)

;; Use C-u for scrolling
(setq evil-want-C-u-scroll t)

;; undo in small steps
(setq evil-want-fine-undo t)

;; auto indent
; (setq evil-auto-indent t)

;; Initialize evil-mode
(require 'evil)
(evil-mode t)
