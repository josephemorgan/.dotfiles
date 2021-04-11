;;; package-init.el --- Initializes emacs packages
;;; Commentary:
;; 

(require 'package)
;;; Code:

(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

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
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :after yasnippet
  :ensure t)

;;; DUMB-JUMP
(use-package dumb-jump
  :ensure t
  :config
  (dumb-jump-mode))

;;; WHICH-KEY
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;;; vscdark-theme
(use-package vscdark-theme
  :ensure t
  :config
  (load-theme 'vscdark t))

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
		org-startup-folded 1
		org-format-latex-options (plist-put org-format-latex-options :scale 1.5)
		org-default-notes-file (concat org-directory "/inbox.org")
		org-agenda-window-setup 'only-window
		org-agenda-restore-windows-after-quit t
		org-refile-targets '(
							 (nil :maxlevel . 9)
							 (org-agenda-files :maxlevel . 9)
							 )
		org-export-with-section-numbers nil)

  (define-key global-map "\C-cc" 'org-capture)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((C . t)
	 (java . t)
	 (shell . t)
	 (R . t)
	 ))
  :hook
  (org-mode . turn-on-flyspell)
  (org-mode . visual-line-mode)
  (org-mode . evil-org-mode))

;;; evil-org
(use-package evil-org
  :ensure t
  :after
  org
  :hook
  (evil-org-mode . (lambda () (evil-org-set-key-theme))))

;;; EVIL
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (setq evil-want-C-i-jump 't)
  (setq evil-want-keybinding nil)
  (setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes)))

(use-package evil-collection
  :ensure t
  :after evil
  :config (evil-collection-init))

;;; ALL THE ICONS
(use-package all-the-icons :ensure t)

;;; IBUFFER
(use-package ibuffer
  :ensure t
  :bind (("C-x C-b" . ibuffer)))

;; IVY
(use-package ivy
  :ensure t
  :bind (("C-s" . swiper)
		 :map ivy-minibuffer-map
		 ("TAB" . ivy-alt-done)
		 ("C-l" . ivy-alt-done)
		 ("C-j" . ivy-next-line)
		 ("C-k" . ivy-previous-line)
		 :map ivy-switch-buffer-map
		 ("C-k" . ivy-previous-line)
		 ("C-l" . ivy-done)
		 ("C-d" . ivy-switch-buffer-kill)
		 :map ivy-reverse-i-search-map
		 ("C-k" . ivy-previous-line)
		 ("C-d" . ivy-reverse-i-search-kill))
  :init (ivy-mode 1))

;;; IVY-RICH
(use-package ivy-rich
  :ensure t
  :after ivy
  :init (ivy-rich-mode 1)
  :custom
  (ivy-virtual-abbreviate 'full
						  ivy-rich-switch-buffer-align-virtual-buffer t
						  ivy-rich-path-style 'abbrev))
;;; COUNSEL
(use-package counsel
  :ensure t
  :after ivy
  :config
  (counsel-mode t)
  (counsel-projectile-mode )
  :bind (("C-c k" . counsel-ag)))

;;; SWIPER
(use-package swiper
  :ensure t
  :after ivy)
  
;;; projectile
(use-package projectile
  :ensure t
  :after ivy
  :config
  (define-key evil-normal-state-map (kbd "C-p") nil)
  (global-set-key (kbd "C-p") 'projectile-command-map)
  (projectile-mode +1)
  (define-key projectile-command-map (kbd "f") 'counsel-projectile))

;;; emmet-mode
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

;;; ELPY
(use-package elpy
  :ensure t
  :defer t
  :init
  (elpy-enable))

;;; FLYCHECK
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

;;; BLACKEN
(use-package blacken :ensure t)

;;; CALFW
(use-package calfw :ensure t)

(use-package latex-preview-pane
  :ensure t
  :defer t
  :config
  (latex-preview-pane-enable))

(use-package helpful
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
		doom-themes-enable-italic t)
  (load-theme 'doom-one t))

(use-package doom-modeline
  :ensure t
  :custom
  (doom-modeline-height 10)
  :config (setq doom-modeline-icon (display-graphic-p))
  :hook (after-init . doom-modeline-mode))

(provide 'package-init)

;;; package-init.el ends here
