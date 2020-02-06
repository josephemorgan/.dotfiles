(package-initialize)
;;;; Theme and Visual Settings

(load-theme 'jbeans t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)
(setq inhibit-scratch-message "")
(setq line-number-mode t)
(setq column-number-mode t)
(setq vc-follow-symlinks t)
(setq evil-want-C-i-jump nil)


;; General Settings
(setq backup-directory-alist `(("." . "~/.saves"))
	  show-paren-mode 1)
(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode t)

;; Package Settings
(load "~/.emacs.d/package-init.el")
(custom-set-variables
  '(org-agenda-files nil)
  '(package-selected-packages
	 (quote
	   (magit swiper ivy-rich counsel diminish blacken flychecK flycheck elpy helm zenburn-theme use-package smart-tabs-mode nlinum-relative jbeans-theme ivy evil doom-themes doom-modeline company))))
(custom-set-faces
  )