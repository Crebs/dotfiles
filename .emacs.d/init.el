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
  :bind (:map evil-motion-state-map
	      ("j" . evil-next-visual-line)
	      ("k" . evil-previous-visual-line)
	      ("C-j" . evil-scroll-down)
	      ("C-k" . evil-scroll-up)
	      :map evil-normal-state-map
	      ("[ q" . previous-error)
	      ("] q" . next-error))
  :config
  (evil-mode t))

(use-package company
    :ensure t
    :diminish ""
    :config
    (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-j") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous)
    (define-key company-active-map (kbd "C-k") #'company-select-previous)
    (setq company-idle-delay 0.5
          company-dabbrev-downcase nil    ; pretty sure company has a bug in the default
          company-require-match nil
          company-selection-wrap-around t
          company-tooltip-align-annotations t)
    (global-company-mode t))

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
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages
   (quote
    (company-rtags ivy-rtags flycheck-rtags rtags exec-path-from-shell counsel-projectile projectile-ripgrep lenlen-theme projectile counsel ivy-hydra swiper ivy smex ido-vertical-mode ido-completing-read+ solarized-theme color-theme-solarized evil-magit magit which-key evil-org evil use-package)))
 '(safe-local-variable-values
   (quote
    ((projectile-project-test-cmd . "make ios.test | xcpretty")
     (projectile-project-compilation-cmd . "make ios.build | xcpretty")
     (projectile-globally-unignored-directories "generated-src")
     (projectile-enable-caching . t)
     (ghub-base-url . "https://git.soma.salesforce.com/api/v3")))))
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

(use-package color-theme-solarized
    :ensure t
    :config (load-theme 'solarized t))

(use-package ido
    :init
    (setq ido-create-new-buffer 'always
          ido-enable-flex-matching t
          ido-use-faces nil)
    :config
    (ido-mode t)
    (ido-everywhere t))

  (use-package ido-completing-read+
    :ensure t
    :config (ido-ubiquitous-mode t))
 
 (use-package ido-vertical-mode
    :ensure t
    :after ido
    :init
    (setq ido-vertical-indicator "─►")
    :config
    (defun jafo/ido-setup-hook ()
      (define-key ido-completion-map (kbd "C-j") #'ido-next-match)
      (define-key ido-completion-map (kbd "C-k") #'ido-prev-match))
    (add-hook 'ido-setup-hook #'jafo/ido-setup-hook)
    (setq ido-vertical-define-keys 'C-n-and-C-p-only)
    (ido-vertical-mode t))

   (use-package smex
     :ensure t)

  (use-package ivy
    :ensure t
    :diminish ivy-mode
    :bind (:map ivy-minibuffer-map
                ("C-j" . ivy-next-line)
                ("C-k" . ivy-previous-line))
    :init
    (setq ivy-count-format ""
          ivy-format-function #'ivy-format-function-arrow
          ivy-use-virtual-buffers t
          ;;ivy-re-builders-alist '((t . ivy--regex-fuzzy))
          )
    :config
    (ivy-mode t)
    (with-eval-after-load 'magit
      (setq magit-completing-read-function 'ivy-completing-read))
    (with-eval-after-load 'projectile
      (setq projectile-completion-system 'ivy)))

  (use-package swiper
    :ensure t)

  (use-package ivy-hydra
    :ensure t)

(use-package counsel
    :ensure t
    :bind (("M-x" . counsel-M-x)
           ("C-x C-f" . counsel-find-file)
           ("C-h f" . counsel-describe-function)
           ("C-h v" . counsel-describe-variable)
           :map evil-normal-state-map
           ("<SPC> i" . counsel-imenu)))

  (use-package counsel-projectile
    :ensure t
    :after projectile
    :bind (:map projectile-command-map
                ("/" . counsel-projectile-rg))
    :config (counsel-projectile-on))

(use-package projectile
    :ensure t
    :pin melpa-stable
    :init
    (setq projectile-mode-line '(:eval (format " P⟨%s⟩" (projectile-project-name))))
    :config
    (with-eval-after-load 'evil
      (define-key evil-normal-state-map (kbd "<SPC> p") 'projectile-command-map))
    (projectile-global-mode))

 (use-package djinni-mode
    :load-path "~/Documents/github/djinni-mode.el")

(setq inhibit-default-init t
      load-prefer-newer t
      indicate-empty-lines t
      inhibit-startup-screen t
      initial-scratch-message nil
      ring-bell-function 'ignore
      scroll-conservatively 10000
      scroll-preserve-screen-position t
      use-dialog-box nil
      )

(setq-default
 cursor-in-non-selected-windows nil
 )

(fset 'yes-or-no-p #'y-or-n-p)
(global-hl-line-mode t)
(global-visual-line-mode 0)
(line-number-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(tool-bar-mode 0)

(use-package projectile-ripgrep
  :ensure t
  :after projectile
  :bind (:map projectile-command-map
	      ("s r" . projectile-ripgrep)))

(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

(use-package rtags
    :ensure t
    :config
    (defvar my-rtags-command-map (make-sparse-keymap))
    (fset 'my-rtags-command-map my-rtags-command-map)
    (setq rtags-autostart-diagnostics t
          rtags-completions-enabled t)
    ;; (rtags-enable-standard-keybindings)
    (rtags-enable-standard-keybindings my-rtags-command-map "")
    (with-eval-after-load 'evil
      (evil-define-key 'normal c-mode-base-map (kbd "<SPC> r") 'my-rtags-command-map))
    (rtags-diagnostics)
    )

 (use-package flycheck-rtags
    :ensure t
    :after rtags)

  (use-package ivy-rtags
    :ensure t
    :after rtags
    :config
    (setq rtags-display-result-backend 'ivy))

  (use-package company-rtags
    :ensure t
    :after rtags
    :config
    (push 'company-rtags company-backends))

(setq compilation-always-kill t
        compilation-ask-about-save nil
        compilation-read-command nil
        compilation-scroll-output 'always)

  (require 'ansi-color)
  (defun my-colorize-compilation-buffer ()
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region compilation-filter-start (point))))
  (add-hook 'compilation-filter-hook #'my-colorize-compilation-buffer)

  (with-eval-after-load 'compile
    (add-to-list 'compilation-error-regexp-alist 'xcpretty)
    (add-to-list 'compilation-error-regexp-alist-alist
                 '(xcpretty
                   "^\\(?:\\(\u26a0\ufe0f\\|\\[!\\]\\)\\|\\(?:\u274c\\|\\[x\\]\\)\\)\\s-+\\([^:]+?\\):\\([0-9]+\\):\\([0-9]+\\): .*"
                   2 3 4 nil 2)))
