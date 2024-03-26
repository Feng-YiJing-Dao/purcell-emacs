;;; my-init-embark.el --- 我的embark相关配置 -*- lexical-binding: t -*-
;;; Commentary: 使得命令中断后可继续输入
;; Ref：https://github.com/oantolin/embark
;;; Code:

;;配置embark
(use-package embark
  :ensure t
  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none))))
  :bind (("C-." . embark-act)        ;; pick some comfortable binding
         ("C-;" . embark-dwim)       ;; good alternative: M-.
         ("C-h B" . embark-bindings))) ;; alternative for `describe-bindings'

(provide 'my-init-embark)
;;; my-init-embark.el ends here
