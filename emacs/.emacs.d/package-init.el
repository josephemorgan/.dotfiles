(require 'package)

(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defun config/org-font-setup ()
  (org-indent-mode)
  (org-superstar-mode)
  (visual-line-mode 1)
  (variable-pitch-mode 1)
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Noto Sans" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
  (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))

(use-package org
  :ensure t
  :config (setq org-ellipsis " ▼"
                org-hide-emphasis-markers t
                org-agenda-files '("~/org/")
                org-startup-indented 1
                org-startup-folded 1
                org-default-notes-file (concat org-directory "/inbox.org")
                org-agenda-window-setup 'only-window
                org-export-with-section-numbers nil
                org-deadline-warning-days 28
                org-format-latex-options (plist-put org-format-latex-options :scale 1.25)
                org-agenda-custom-commands '(("D" "Upcoming Deadlines" tags "DEADLINE>=\"<today>\""))
                org-file-apps '((auto-mode . emacs)
                                (directory . emacs)
                                ("\\.mm\\'" . default)
                                ("\\.x?html?\\'" . default)
                                ("\\.pdf\\'" . "zathura \"%s\"")))
  (define-key global-map "\C-cc" 'org-capture)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((C . t)
     (java . t)
     (shell . t)
     (emacs-lisp . t)
     (python . t)
     (sql . t)
     (js . t)))
  (setq org-confirm-babel-evaluate nil)
  (require 'org-tempo)
  (add-to-list 'org-structure-template-alist  '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist  '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist  '("py" . "src python"))
  (add-to-list 'org-structure-template-alist  '("sql" . "src sql"))
  (add-to-list 'org-structure-template-alist  '("js" . "src js"))
  (add-hook 'org-mode-hook #'config/org-font-setup)
  (add-hook 'org-mode-hook #'turn-on-flyspell))

(use-package org-superstar
  :after org
  :config
  (setq org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun config/visual-fill-column-setup()
  (setq visual-fill-column-width 120
        visual-fill-column-center-text t)
  (visual-fill-column-mode))

(use-package visual-fill-column
  :ensure t
  :config
  (add-hook 'org-mode-hook #'config/visual-fill-column-setup))

(use-package org-cliplink
  :ensure t)

(use-package evil
  :ensure t
  :init
  (setq evil-respect-visual-line-mode t) 
  (setq evil-want-C-i-jump nil)
  (setq evil-want-keybinding nil)
  :config
  (setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))
  (evil-mode 1))

(use-package undo-tree
  :ensure t
  :after evil
  :config
  (global-undo-tree-mode)
  (evil-set-undo-system 'undo-tree))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :after yasnippet
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package diminish
  :defer t
  :ensure t)

(use-package all-the-icons :ensure t)

(use-package ibuffer
  :ensure t
  :bind (("C-x C-b" . ibuffer)))

(use-package ivy
  :ensure t
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-partial-or-done)
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

(use-package ivy-rich
  :ensure t
  :after ivy
  :init (ivy-rich-mode 1)
  :custom
  (ivy-virtual-abbreviate 'full-ivy-rich-path-style 'abbrev))

(use-package counsel-projectile
  :ensure t)

(use-package counsel
  :ensure t
  :after ivy
  :config
  (counsel-mode t)
  (counsel-projectile-mode t)
  :config (setq ivy-initial-inputs-alist nil)
  :bind (("C-c k" . counsel-ag)))

(use-package swiper
  :ensure t
  :after ivy)

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config (projectile-mode)
  :custom (projectile-completion-system 'ivy)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/dev/")
    (setq projectile-project-search-path '("~/dev")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package elpy
  :ensure t
  :defer t
  :init
  (elpy-enable))

(use-package blacken :ensure t)

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

(use-package vscdark-theme
  :ensure t
  :config
  (load-theme 'vscdark t))

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

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/roam"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol)

(add-to-list 'display-buffer-alist
             '("\\org-roam\\*"
               (display-buffer-in-direction)
               (direction . bottom)
               (window-height . 0.25)))

(setq org-roam-dailies-directory "daily/")

(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n")))))

(use-package websocket
  :after org-roam)

(use-package org-roam-ui
  :after org-roam ;; or :after org
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))
