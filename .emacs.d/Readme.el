
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
