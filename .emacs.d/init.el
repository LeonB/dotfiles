;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                 ;
;    .emacs configuration file    ;
;                                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; https://github.com/handyman5/dotfiles-emacs

(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/emacs-neotree"))
; (add-to-list 'load-path (expand-file-name "~/.emacs.d/local"))
; (add-to-list 'load-path (expand-file-name "~/.emacs.d/local/planner-el"))

; handy function to load all elisp files in a directory
(load-file "~/.emacs.d/load-directory.el")

(load "config")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "47583b577fb062aeb89d3c45689a4f2646b7ebcb02e6cb2d5f6e2790afb91a18" "fa189fcf5074d4964f0a53f58d17c7e360bb8f879bd968ec4a56dc36b0013d29" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; - dirtree
; - neotree
; - http://bling.github.io/blog/2013/10/27/emacs-as-my-leader-vim-survival-guide/
; http://www.emacswiki.org/cgi-bin/wiki/SavePlace
