(require 'package)
(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
             ("melpa" . "https://melpa.org/packages/")
             ("org" . "http://orgmode.org/elpa/")
             ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(use-package evil
  :ensure t
  :demand t
  :config
  (evil-mode t))

(use-package evil-org
    :ensure t
    :after org
    :config
    (add-hook 'org-mode-hook 'evil-org-mode)
    (add-hook 'evil-org-mode-hook
              (lambda ()
                (evil-org-set-key-theme))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages
   (quote
    (solarized-theme color-theme-solarized evil-magit magit which-key evil-org evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package which-key
    :ensure t
    :demand t
    :diminish ""
    :bind ("C-h C-k" . which-key-show-top-level)
    :config
    (setq which-key-idle-delay 0.2
          which-key-add-column-padding 0)
    (which-key-mode t))

(use-package magit
    :ensure t
    :bind (:map evil-normal-state-map
                ("<SPC> g b" . magit-blame)
                ("<SPC> g c" . magit-clone)
                ("<SPC> g d" . magit-diff-buffer-file-popup)
                ("<SPC> g l" . magit-log-buffer-file)
                ("<SPC> g s" . magit-status)
                )
    :config
    (use-package evil-magit :ensure t)
    (magit-define-popup-switch 'magit-log-popup
                               ?m "Omit merge commits" "--no-merges")
    (magit-add-section-hook 'magit-status-sections-hook
                            'magit-insert-unpushed-to-upstream
                            'magit-insert-unpushed-to-upstream-or-recent
                            'replace)
    (setq magit-completing-read-function #'magit-ido-completing-read))

(use-package solarized-theme
    :ensure t
    :config (load-theme 'solarized-light t))
