;;; my-init-ivy.el --- 我的ivy相关配置 -*- lexical-binding: t -*-
;;; Commentary:Emacs 补全功能增强插件
;; Ref：https://link.zhihu.com/?target=https%3A//github.com/abo-abo/swiper
;;; Code:

(use-package counsel
  :ensure t)

;;配置ivy
(use-package ivy
  :ensure t
  :init (ivy-mode 1) (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind(("C-s" . 'swiper)
        ("C-x b" . 'ivy-switch-buffer)
        ("C-c v" . 'ivy-push-view)
        ("C-c s" . 'ivy-switch-view)
        ("C-c V" . 'ivy-pop-view)
        ;; ("C-x C-@" . 'counsel-mark-ring); 在某些终端上 C-x C-SPC 会被映射为 C-x C-@，比如在 macOS 上，所以要手动设置
        ;; ("C-x C-SPC" . 'counsel-mark-ring)
        :map minibuffer-local-map
        ("C-r" . counsel-minibuffer-history)))

(provide 'my-init-ivy)
;;; my-init-ivy.el ends here
