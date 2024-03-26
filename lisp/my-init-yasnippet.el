;;; my-init-yasnippet.el --- 我的yasnippet相关配置 -*- lexical-binding: t -*-
;;; Commentary: 代码片段模板 
;; Ref：https://github.com/joaotavora/yasnippet
;;; Code:

;;配置yasnippet
(use-package yasnippet
  :ensure t
  :hook (prog-mode . yas-minor-mode)
  :config
  ;; add company-yasnippet to company-backends    ;
  (yas-reload-all)
  (defun company-mode/backend-with-yas (backend)
    (if (and (listp backend) (member 'company-yasnippet backend))
	backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  ;; unbind <TAB> completion
  (define-key yas-minor-mode-map [(tab)]        nil)
  (define-key yas-minor-mode-map (kbd "TAB")    nil)
  (define-key yas-minor-mode-map (kbd "<tab>")  nil)
  :bind (:map yas-minor-mode-map ("S-<tab>" . yas-expand)))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(provide 'my-init-yasnippet)
;;; my-init-yasnippet.el ends here
