(package-initialize)
;;;; Theme and Visual Settings

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
(setq backup-directory-alist `(("." . "~/.saves")))
(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode t)
(show-paren-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(global-set-key (kbd "C-c <tab>") 'hs-toggle-hiding)
(global-set-key (kbd "C-c h") 'hs-hide-all)
(global-set-key (kbd "C-c s") 'hs-show-all)


;; Package Settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-count-format "(%d/%d) ")
 '(ivy-use-virtual-buffers t)
 '(ivy-virtual-abbreviate (quote full))
 '(package-selected-packages
   (quote
	(org-cliplink fontawesome evil-better-visual-line company-c-headers yasnippet-snippets company-mode dumb-jump which-key auctex-lua auctex-latexmk auctex autex magit swiper ivy-rich counsel diminish blacken flychecK flycheck elpy helm zenburn-theme use-package smart-tabs-mode nlinum-relative jbeans-theme ivy evil doom-themes doom-modeline company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load "~/.emacs.d/package-init.el")
