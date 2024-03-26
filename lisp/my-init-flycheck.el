;;; my-init-flycheck.el --- 我的flycheck相关配置 -*- lexical-binding: t -*-
;;; Commentary: 语法检查
;; Ref: https://www.flycheck.org/en/latest/
;;; Code:

;;配置flycheck
(use-package flycheck
  :ensure t
  :config (setq truncate-lines nil) ; 如果单行信息很长会自动换行
  :hook (prog-mode . flycheck-mode))
  
(provide 'my-init-flycheck)
;;; my-init-flycheck.el ends here
