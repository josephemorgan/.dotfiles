;;; init.el --- Emacs Basic Configuration

;;; Commentary:
;; 

;;; Code:

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
 '(counsel-describe-function-function 'helpful-callable)
 '(counsel-describe-variable-function 'helpful-variable)
 '(custom-safe-themes
   '("75b8719c741c6d7afa290e0bb394d809f0cc62045b93e1d66cd646907f8e6d43" "2c49d6ac8c0bf19648c9d2eabec9b246d46cb94d83713eaae4f26b49a8183fc4" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "31f8d16d264e14e8e39c4f291e26cdd5516772a41660ef2ad895244c22024bd2" "4318c8136e18752719d5df209ec2576f0559dd02b9bef6be334c2e6aff57a1e4" "a70b47c87e9b0940f6fece46656200acbfbc55e129f03178de8f50934ac89f58" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "8ca8fbaeaeff06ac803d7c42de1430b9765d22a439efc45b5ac572c2d9d09b16" "7f9dc0c7bc8e5b4a1b9904359ee449cac91fd89dde6aca7a45e4ed2e4985664c" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "8885761700542f5d0ea63436874bf3f9e279211707d4b1ca9ed6f53522f21934" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" default))
 '(doom-modeline-height 10)
 '(doom-modeline-mode t)
 '(flycheck-checker-error-threshold 1000)
 '(ivy-count-format "(%d/%d) ")
 '(ivy-use-virtual-buffers t)
 '(ivy-virtual-abbreviate 'full)
 '(line-number-mode nil)
 '(org-agenda-files
   '("/home/joe/org/gen.org" "/home/joe/org/inbox.org" "/home/joe/org/internships.org"))
 '(package-archives
   '(("melpa" . "http://melpa.org/packages/")
	 ("gnu" . "https://elpa.gnu.org/packages/")))
 '(package-selected-packages
   '(evil-collection helpful latex-preview-pane org-fragtog-mode evil-org org-fragtog web-mode emmet-mode color-identifiers-mode ycmd counsel-projectile projectile vscdark-theme yoshi-theme kaolin-themes spacemacs-theme humanoid-themes zenburn noctilux-theme gruvbox-theme org-cliplink fontawesome evil-better-visual-line company-c-headers yasnippet-snippets company-mode dumb-jump which-key auctex-lua auctex-latexmk auctex autex magit swiper ivy-rich counsel diminish blacken flychecK flycheck elpy helm zenburn-theme use-package smart-tabs-mode jbeans-theme ivy evil doom-themes doom-modeline company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#151515" :foreground "#cccccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 101 :width normal :foundry "CYEL" :family "Iosevka Slab")))))
(load "~/.emacs.d/package-init.el")

(provide 'init)

;;; init.el ends here
