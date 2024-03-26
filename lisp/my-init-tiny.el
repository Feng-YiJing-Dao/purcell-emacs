;;; my-init-tiny.el --- 我的tiny相关配置 -*- lexical-binding: t -*-
;;; Commentary: 序号宏展开
;; Ref：https://github.com/abo-abo/tiny
;;; Code:

;;配置tiny
(use-package tiny
  :ensure t
  :bind ("C-;" . tiny-expand))

(provide 'my-init-tiny)
;;; my-init-tiny.el ends here
