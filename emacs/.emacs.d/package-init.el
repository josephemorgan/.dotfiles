(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; org-cliplink
(use-package org-cliplink
  :ensure t
  )

;;; yasnippet
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (use-package yasnippet-snippets
	:ensure t
	)
  )

;;; DUMB-JUMP
(use-package dumb-jump
  :ensure t
  :config
  (dumb-jump-mode)
  )

;;; company
(use-package company
  :ensure t
  :defer t
  :config
  (progn
	;; Use Company for completion
	(bind-key [remap completion-at-point] #'company-complete company-mode-map))
  (setq company-idle-delay 0.5)
  :hook (prog-mode . company-mode)
  )

(use-package company-ycmd
  :ensure t
  :config
  (company-ycmd-setup)
  )

(use-package ycmd
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'global-ycmd-mode)
  (set-variable 'ycmd-server-command '("python" "/home/joe/make/ycmd/ycmd/"))
										;(set-variable 'ycmd-global-config "/home/joe/.dotfiles/utils/ycm_config.py")
  )

;;; WHICH-KEY
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  )

;;; vscdark-theme
(use-package vscdark-theme
  :ensure t
  :config
  (load-theme 'vscdark t)
  )

;;; MAGIT
(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  )

;;; DIMINISH
(use-package diminish :defer t
  :ensure t
  )

;;; ORG
(use-package org
  :ensure t
  :config
  (setq org-agenda-files '("~/org"
						   "~/org/teamProject"))
  (setq org-startup-indented 1
		org-default-notes-file (concat org-directory "/inbox.org")
		org-refile-targets '(
							 (nil :maxlevel . 9)
							 (org-agenda-files :maxlevel . 9)
							 )
		org-agenda-window-setup 'other-window
		org-agenda-restore-windows-after-quit t
		org-export-with-section-numbers nil
		)
  (define-key global-map "\C-cc" 'org-capture)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((C . t)
	 (java . t)
	 (shell . t)
	 ))
  (add-hook 'org-mode-hook 'turn-on-flyspell)
  (add-hook 'org-mode-hook 'visual-line-mode)
  )

;;; EVIL
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes)))

;;; ALL THE ICONS
(use-package all-the-icons :ensure t)

;;; IBUFFER
(use-package ibuffer
  :ensure t
  :bind (("C-x C-b" . ibuffer)))

;; IVY
(use-package ivy
  :ensure t
  :defer 0.1
  :bind (("C-c C-r" . ivy-resume)
		 ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))

;;; IVY-RICH
(use-package ivy-rich
  :ensure t
  :after ivy
  :custom
  (ivy-virtual-abbreviate 'full
						  ivy-rich-switch-buffer-align-virtual-buffer t
						  ivy-rich-path-style 'abbrev))
;;; projectile
(use-package projectile
  :ensure t
  :after ivy
  :config
  (define-key evil-normal-state-map (kbd "C-p") nil)
  (global-set-key (kbd "C-p") 'projectile-command-map)
  (projectile-mode +1)
  (define-key projectile-command-map (kbd "f") 'counsel-projectile)
  )

;;; COUNSEL
(use-package counsel
  :ensure t
  :after ivy
  :config
  (counsel-mode +1)
  (counsel-projectile-mode +1)
  )

;;; emmet-mode
										; Expands various key combinations into html/css code
(use-package emmet-mode
  :ensure t
  )

;;; web-mode
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  )

;;; SWIPER
  (use-package swiper
	:ensure t
	:after ivy
	:bind (("C-s" . swiper)
		   ("C-r" . swiper)))

;;; ELPY
  (use-package elpy
	:ensure t
	:defer t
	:init
	(elpy-enable))

;;; FLYCHECK
  (use-package flycheck
	:ensure t
	:init (global-flycheck-mode))

;;; BLACKEN
  (use-package blacken :ensure t)

;;; CALFW
  (use-package calfw
	:ensure t
	)
