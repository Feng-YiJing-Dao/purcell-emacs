;;; init-preload-local.el --- 相关配置 -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; purcell配置中使用了在init-elpa.el中自定义的辅助函数require-package等实现插件的自动安装
;; 我打算使用use-package插件管理自己添加的额外插件和配置
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  ;; (add-to-list 'load-path "~/.emacs.d/elpa-28.1/use-package-20220910.25")
  ;; (add-to-list 'load-path "~/.emacs.d/elpa-28.1/bind-key-20220910.2157")
  (require 'use-package))

(require 'diminish nil t)                ;; if you use :diminish
(require 'bind-key nil t)                ;; if you use any :bind variant

;; 文本展开，emacs内置功能
(global-set-key (kbd "M-/") 'hippie-expand)

;; melpa镜像
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; 国内腾讯镜像
;; (require 'package)
;; (setq package-archives '(("gnu"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/")))
;; (package-initialize)

(provide 'init-preload-local)
;;; init-preload-local.el ends here