;;; my-init-mwim.el --- 我的mwim相关配置 -*- lexical-binding: t -*-
;;; Commentary: 覆盖优化光标操作
;; Ref：https://github.com/alezost/mwim.el
;;; Code:

;;配置mwim
(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))

(provide 'my-init-mwim)
;;; my-init-mwim.el ends here