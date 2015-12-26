(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; bootstrap use-package
;; http://www.lunaryorn.com/
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; and call it?
(eval-when-compile (require 'use-package))

;; some window things
(menu-bar-mode -1)
(tool-bar-mode -1)

;; let's start interactively doing things
(use-package ido
  :config
  (ido-mode t))

;; smex because I don't know commands
(use-package smex
  :ensure t
  :bind (("M-x" . smex)
	 ("M-X" . smex-major-mode-commands)
	 ("C-c C-c M-x" . execute-extended-command)))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;;TODO: checkout guru-mode
(use-package guru-mode
  :ensure t
  :config
  (guru-global-mode +1))

;;TODO: checkout windmove
(use-package windmove
  :config
  (windmove-default-keybindings))

;;TODO: checkout eshell things here: https://www.masteringemacs.org/article/complete-guide-mastering-eshell
;;especially em-smart

;;TODO: checkout magit


;; Autosave
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
