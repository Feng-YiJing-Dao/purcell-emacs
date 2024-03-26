;;; my-init-rainbow-delimiters.el --- 我的rainbow-delimiters相关配置 -*- lexical-binding: t -*-
;;; Commentary: 用不同颜色标记多级括号
;; Ref：https://github.com/Fanael/rainbow-delimiters
;;; Code:

;;配置rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))
  
(provide 'my-init-rainbow-delimiters)
;;; my-init-rainbow-delimiters.el ends here