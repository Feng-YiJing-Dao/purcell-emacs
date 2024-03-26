;;; my-init-company.el --- 我的company相关配置 -*- lexical-binding: t -*-
;;; Commentary: 代码自动补全
;; Ref：http://company-mode.github.io/
;;; Code:

;;配置company
(use-package company
  :ensure t
  :init (global-company-mode)
  :config
    (setq company-minimum-prefix-length 1) ; 只需敲 1 个字母就开始进行自动补全
    (setq company-tooltip-align-annotations t)
    (setq company-idle-delay 0.0)
    (setq company-show-numbers t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
    (setq company-selection-wrap-around t)
    (setq company-transformers '(company-sort-by-occurrence))) ; 根据选择的频率进行排序

(use-package company-box
  :ensure t
  :if window-system
  :hook (company-mode . company-box-mode))

(provide 'my-init-company)
;;; my-init-company.el ends here