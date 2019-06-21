(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package diminish :defer t)

(use-package org
  :config
  (setq org-agenda-files (quote ("~/org/"))
		org-export-with-section-numbers nil
		org-startup-indented 1
		org-default-notes-file (concat org-directory "/inbox.org")
		org-refile-targets '((org-agenda-files :maxlevel . 3)))
  (define-key global-map "\C-cc" 'org-capture))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes)))

(use-package all-the-icons :ensure t)

(use-package nlinum-relative
  :ensure t
  :config
  (nlinum-relative-setup-evil)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode)
  (setq nlinum-relative-redisplay-delay 0)
  (setq nlinum-relative-current-symbol "->")
  (setq nlinum-relative-offset 0))

(use-package ibuffer
  :bind
  (("C-x C-b" . ibuffer)))

(use-package helm :ensure t)
