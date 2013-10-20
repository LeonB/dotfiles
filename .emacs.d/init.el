;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                 ;
;    .emacs configuration file    ;
;                                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; https://github.com/handyman5/dotfiles-emacs

(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
; (add-to-list 'load-path (expand-file-name "~/.emacs.d/local"))
; (add-to-list 'load-path (expand-file-name "~/.emacs.d/local/planner-el"))
(load "config")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("47583b577fb062aeb89d3c45689a4f2646b7ebcb02e6cb2d5f6e2790afb91a18" "fa189fcf5074d4964f0a53f58d17c7e360bb8f879bd968ec4a56dc36b0013d29" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
