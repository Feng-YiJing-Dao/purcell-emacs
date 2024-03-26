;;; my-init-treemacs.el --- 我的treemacs相关配置 -*- lexical-binding: t -*-
;;; Commentary: 工作区管理
;; Ref: https://github.com/Alexander-Miller/treemacs
;;; Code:

;;配置treemacs
(use-package treemacs
  :ensure t
  :defer t
  :config (treemacs-tag-follow-mode)
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ;; ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag))
  (:map treemacs-mode-map
	("/" . treemacs-advanced-helpful-hydra)))

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile))

(use-package lsp-treemacs
  :ensure t
  :after (treemacs lsp))

(provide 'my-init-treemacs)
;;; my-init-treemacs.el ends here
