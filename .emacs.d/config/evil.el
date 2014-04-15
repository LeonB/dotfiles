; enable evil-mode everywhere!
;; TODO: this is probably more reasonable: https://github.com/prooftechnique/.emacs.d/blob/master/config/jhenahan-evil.el
;;       also: https://github.com/edwtjo/evil-org-mode
; (setq evil-normal-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
; (setq evil-emacs-state-modes nil)

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

;(define-minor-mode evil-buffer-menu-mode
;    "Buffer local minor mode for evil-org"
;    :init-value nil
;    :lighter " EvilOrg"
;    :keymap (make-sparse-keymap) ; defines evil-org-mode-map
;    :group 'evil-org)

; (add-hook 'org-mode-hook 'evil-buffer-menu-mode) ;; only load with org-mode

(require 'evil-states)
; (require 'evil-motions)

; (evil-define-key 'normal Buffer-menu-mode-map "k" 'previous-line)
; (evil-define-key 'normal Buffer-menu-mode-map "j" 'next-line)

(require 'evil-maps)
(require 'evil-core)
(require 'evil-macros)
(require 'evil-types)
(require 'evil-repeat)

;;; Buffer-menu
; (evil-add-hjkl-bindings Buffer-menu-mode-map 'normal)

(evil-set-initial-state 'neotree-mode 'motion)
(evil-add-hjkl-bindings neotree-mod 'motion)
