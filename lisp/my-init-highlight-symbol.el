;;; my-init-highlight-symbol.el --- 我的highlight-symbol相关配置 -*- lexical-binding: t -*-
;;; Commentary: 高亮出当前 Buffer 中所有的、与光标所在处的符号相同的符号
;; Ref：https://github.com/nschum/highlight-symbol.el
;;; Code:

;;配置highlight-symbol
(use-package highlight-symbol
  :ensure t
  :init (highlight-symbol-mode)
  :bind ("<f3>" . highlight-symbol)) ;; 按下 F3 键就可高亮当前符号
  
(provide 'my-init-highlight-symbol)
;;; my-init-highlight-symbol.el ends here