;; we will use emacs own package.el for package management
;; with use-package for autoloading
(require 'package)

;; We don't want to activate packages at startup.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Package-Installation.html
(setq package-enable-at-startup nil)

;; Some of our packages will come from melpa
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; bootstrap use-package (the rest of packages will be installed by use-package)
;; http://www.lunaryorn.com/
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; and call it?
(eval-when-compile (require 'use-package))

;; some window things
;; Hide menu bar and tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; let's start interactively doing things
;; ido comes with useful ways to navigate buffers (C-x b) and files (C-x f)
;; When navigating buffers, can switch to files with (C-f)
(use-package ido
  :config
  ;; Activate ido by default
  (ido-mode t)
  ;; Make ido remember buffers that are closed (so that it is easier to re-open them)
  (setq ido-use-virtual-buffers t))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;; Evil because vim navigation is much better on fingers
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

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

;; Magit is a complete git client
;; https://magit.vc/manual/magit.html
(use-package magit
  :ensure t
  ;; Start magit magic with C-x g, use q to quit
  :bind (("C-x g" . magit-status)))

;; Manually downloaded for moffitt into lisp folder
;; jekyll-directory must be set in custom faces
(use-package jekyll
  :load-path "lisp/"
  :bind (("C-c b n" . jekyll-draft-post)
	 ("C-c b P" . jekyll-publish-post)))

;; http://editorconfig.org/
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
