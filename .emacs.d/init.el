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
