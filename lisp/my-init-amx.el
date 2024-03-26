;;; my-init-amx.el --- 我的amx相关配置 -*- lexical-binding: t -*-
;;; Commentary: 
;; Ref：
;; https://github.com/DarwinAwardWinner/amx
;; https://github.com/abo-abo/ace-window
;;; Code:

;;配置amx和amx-window
;;记录我们每次调用 M-x 时输入的命令历史，然后每次将最常用的显示在前面
(use-package amx
  :ensure t
  :init (amx-mode))

;;window标记跳转  
(use-package ace-window
  :ensure t
  :bind (("C-x o" . 'ace-window)))

(provide 'my-init-amx)
;;; my-init-amx.el ends here
