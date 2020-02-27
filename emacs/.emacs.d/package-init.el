(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; DUMB-JUMP
(use-package dumb-jump
  :ensure t
  :config
  (dumb-jump-mode)
  )

;;; WHICH-KEY
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  )

;;; JBEANS
(use-package jbeans-theme
  :ensure t
  :config
  (load-theme 'jbeans t)
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
  (setq org-agenda-files '("~/org/"))
  (setq org-startup-indented 1
		org-default-notes-file (concat org-directory "/inbox.org")
		org-refile-targets '(
							 (nil :maxlevel . 9)
							 (org-agenda-files :maxlevel . 9)
							 )
		org-agenda-window-setup 'current-window
		org-agenda-restore-windows-after-quit t
		)
  (define-key global-map "\C-cc" 'org-capture)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)
  (add-hook 'org-mode-hook 'turn-on-flyspell)
  (add-hook 'org-mode-hook 'auto-fill-mode)
  )

;;; EVIL
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes)))

;;; ALL THE ICONS
(use-package all-the-icons :ensure t)

;;; NLINUM-RELATIVE
(use-package nlinum-relative
  :ensure t
  :config
  (nlinum-relative-setup-evil)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode)
  (setq nlinum-relative-redisplay-delay 0)
  (setq nlinum-relative-current-symbol "->")
  (setq nlinum-relative-offset 0))

;;; IBUFFER
(use-package ibuffer
  :ensure t
  :bind (("C-x C-b" . ibuffer)))

;;; COUNSEL
(use-package counsel
  :ensure t
  :after ivy
  :config (counsel-mode))

;; IVY
(use-package ivy
  :ensure t
  :defer 0.1
  :diminish
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
