;;; my-init-avy.el --- 我的avy相关配置 -*- lexical-binding: t -*-
;;; Commentary: 快速对文本进行复制、剪切、粘贴
;; Ref：https://github.com/abo-abo/avy
;;; Code:

;;配置avy
(use-package avy
  :ensure t
  :config
  (defun avy-action-embark (pt)
    (unwind-protect (save-excursion (goto-char pt) (embark-act))
      (select-window (cdr (ring-ref avy-ring 0)))) t)
  (setf (alist-get ?e avy-dispatch-alist) 'avy-action-embark)
  :bind (("C-c C-SPC" . avy-goto-char-timer)))

(provide 'my-init-avy)
;;; my-init-avy.el ends here
