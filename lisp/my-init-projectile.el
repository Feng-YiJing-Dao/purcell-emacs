;;; my-init-projectile.el --- 我的projectile相关配置 -*- lexical-binding: t -*-
;;; Commentary: 项目管理
;; Ref: https://github.com/bbatsov/projectile
;;; Code:

;;配置projectile
(use-package projectile
  :ensure t
  :bind (("C-c p" . projectile-command-map))
  :config
  (setq projectile-mode-line "Projectile")
  (setq projectile-track-known-projects-automatically nil))

(use-package counsel-projectile
  :ensure t
  :after (projectile)
  :init (counsel-projectile-mode))
  
(provide 'my-init-projectile)
;;; my-init-projectile.el ends here