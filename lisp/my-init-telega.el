;;; my-init-telega.el --- 我的telega相关配置 -*- lexical-binding: t -*-
;;; Commentary: telegram
;; Ref：
;; https://zevlg.github.io/telega.el/#running-telega-server-in-docker
;; https://github.com/zevlg/telega.el
;;; Code:

;;配置telega
(use-package telega
  :ensure t
  :init (setq telega-server-libs-prefix "/usr/local/lib")
  ;;   :config
  ;;   (setq telega-use-docker t) ;; 自己编译tdlib的要省略
  )

(provide 'my-init-telega)
;;; my-init-telega.el ends here
