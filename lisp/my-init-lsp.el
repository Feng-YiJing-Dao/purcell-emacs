;;; my-init-lsp.el --- 我的lsp相关配置 -*- lexical-binding: t -*-
;;; Commentary: 代码分析 Language Server Protocol (LSP) 
;; LSP 将代码分析解耦合为前端（即编辑器提供的功能，语言无关）和后端（语法分析，语言相关）两部分，
;; 二者通过一个规定好的协议来通信，也就是 LSP 协议，这样一来，编辑器开发者只需要做好前端部分，也就是 LSP client，后端的语言相关部分由语言开发者完成，称为 LSP server
;; Ref: 
;; lsp: https://emacs-lsp.github.io/lsp-mode/
;; eglot: https://github.com/joaotavora/eglot
;;; Code:

;;配置lsp
(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l"
	lsp-file-watch-threshold 500)
  :hook (lsp-mode . lsp-enable-which-key-integration) ; which-key integration
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-completion-provider :none) ;; 阻止 lsp 重新设置 company-backend 而覆盖我们 yasnippet 的设置
  (setq lsp-headerline-breadcrumb-enable t))

(use-package lsp-ui
  :ensure t
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (setq lsp-ui-doc-position 'top))

(use-package lsp-ivy
  :ensure t
  :after (lsp-mode))

(provide 'my-init-lsp)
;;; my-init-lsp.el ends here
