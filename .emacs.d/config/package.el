;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; package.el support and archives ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
             ;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
             ;; Add the user-contributed repository
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
             ;; Add the GNU repository
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
             ;; Add the new MELPA repository

(package-initialize)


;; http://stackoverflow.com/questions/7302771/dotfiles-repository-switching-from-per-package-git-submodules-to-elpa-while-mai
