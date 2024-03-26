;;; my-init-translate.el --- 我的translate相关配置 -*- lexical-binding: t -*-
;;; Commentary: 代码片段模板 
;; Ref：https://github.com/Elilif/emacs-immersive-translate
;;; Code:

;;配置translate
(use-package immersive-translate
  :load-path "/path-to/emacs-immersive-translate/"
  :hook ((elfeed-show-mode . immersive-translate-setup)
         (nov-pre-html-render . immersive-translate-setup))
  :config
  (setq immersive-translate-backend 'baidu
        immersive-translate-baidu-appid "your-appid"))

;; Uncomment the section below to use ChatGPT
;; (use-package immersive-translate
;;   :hook ((elfeed-show-mode . immersive-translate-setup)
;;          (nov-pre-html-render . immersive-translate-setup)))

;; Uncomment the section below to use translate-shell
;; (use-package immersive-translate
;;   :hook ((elfeed-show-mode . immersive-translate-setup)
;;          (nov-pre-html-render . immersive-translate-setup)))

(provide 'my-init-translate)
;;; my-init-translate.el ends here
