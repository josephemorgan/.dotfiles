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
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("7f9dc0c7bc8e5b4a1b9904359ee449cac91fd89dde6aca7a45e4ed2e4985664c" default)))
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
	(zzz-to-char magit swiper ivy-rich counsel diminish blacken flychecK flycheck elpy helm zenburn-theme use-package smart-tabs-mode nlinum-relative jbeans-theme ivy evil doom-themes doom-modeline company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
