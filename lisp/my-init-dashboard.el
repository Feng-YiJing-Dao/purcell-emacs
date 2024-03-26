;;; my-init-dashboard.el --- 我的dashboard相关配置 -*- lexical-binding: t -*-
;;; Commentary: 设置欢迎界面
;; Ref：https://github.com/emacs-dashboard/emacs-dashboard
;;; Code:

;;配置dashboard
(use-package dashboard
  :ensure t
  :config
  (add-to-list 'dashboard-items '(agenda) t)
  (setq dashboard-week-agenda t)
  (setq dashboard-center-content t)
  ;; (setq dashboard-show-shortcuts nil)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)
  (setq dashboard-set-footer nil)
  (setq dashboard-banner-logo-title "hello,欢迎来到我的世界!") ;; 个性签名，随读者喜好设置
  (setq dashboard-projects-backend 'projectile)
  (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
  (setq dashboard-items '((recents  . 5)   ;; 显示多少个最近文件
                          (bookmarks . 5)  ;; 显示多少个最近书签
                          (projects . 5) ;; 显示多少个最近项目
                          (agenda . 5))) ;; 显示多少个agenda
  (setq dashboard-projects-switch-function 'projectile-persp-switch-project)
  (dashboard-setup-startup-hook))
  (dashboard-modify-heading-icons '((recents . "file-text")
                                  (bookmarks . "book")))
;;配置good-scroll
(use-package good-scroll
  :ensure t
  :if window-system          ; 在图形化界面时才使用这个插件
  :init (good-scroll-mode 1))

(provide 'my-init-dashboard)
;;; my-init-dashboard.el ends here
