;;; my-init-hydra.el --- 我的hydra相关配置 -*- lexical-binding: t -*-
;;; Commentary: 把一组命令组织到一起
;; Ref：https://github.com/abo-abo/hydra
;;; Code:

;;配置
(use-package hydra
  :ensure t)

;;让use-package 多一个 :hydra 关键字
(use-package use-package-hydra
  :ensure t
  :after hydra) 
  
(provide 'my-init-hydra)
;;; my-init-hydra.el ends here