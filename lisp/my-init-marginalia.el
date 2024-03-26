;;; my-init-marginalia.el --- 我的marginalia相关配置 -*- lexical-binding: t -*-
;;; Commentary: 为 Emacs minibuffer 中的选项添加注解
;; Ref：https://github.com/minad/marginalia
;;; Code:

;;配置marginalia
(use-package marginalia
  :ensure t
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map ("M-A" . marginalia-cycle)))

(provide 'my-init-marginalia)
;;; my-init-marginalia.el ends here
