;;; init-local.el --- 相关配置 -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; 我的自定义配置
(require 'my-init-font nil t) ;; font配置：字体
(require 'my-init-rime nil t) ;; rime配置：输入法
(require 'my-init-hydra nil t) ;; hydra配置：把一组命令组织到一起
(require 'my-init-org-roam nil t) ;; org-roam 与 org-roam-ui 等相关配置：
(require 'my-init-ivy nil t) ;; ivy配置：Emacs 补全功能增强插件
(require 'my-init-amx nil t) ;; amx配置：记录命令历史，ace-window实现window标记跳转
(require 'my-init-mwim nil t) ;; mwim配置：覆盖优化光标操作
(require 'my-init-undo-tree nil t) ;; undo-tree配置：编辑内容的历史记录树
(require 'my-init-avy nil t) ;; avy配置：快速对文本进行复制、剪切、粘贴
(require 'my-init-marginalia nil t) ;; marginalia配置：为 Emacs minibuffer 中的选项添加注解
(require 'my-init-embark nil t) ;; embark配置：使得命令中断后可继续输入
(require 'my-init-multiple-cursors nil t) ;; multiple-cursors配置：提供了多种生成多光标的方式
(require 'my-init-dashboard nil t) ;; dashboard配置：设置欢迎界面
(require 'my-init-tiny nil t) ;; tiny配置：序号宏展开
(require 'my-init-highlight-symbol nil t) ;; highlight-symbol配置：高亮出当前 Buffer 中所有的与光标所在处的符号相同的符号
(require 'my-init-rainbow-delimiters nil t) ;; rainbow-delimiters配置：用不同颜色标记多级括号
(require 'my-init-company nil t) ;; company配置：代码自动补全
(require 'my-init-yasnippet nil t) ;; yasnippet配置：代码片段模板
(require 'my-init-flycheck nil t) ;; flycheck配置：语法检查
(require 'my-init-lsp nil t) ;; lsp配置：代码分析
(require 'my-init-dap nil t) ;; dap配置：代码调试
(require 'my-init-projectile nil t) ;; projectile配置：项目管理
(require 'my-init-magit nil t) ;; magit配置：版本管理
(require 'my-init-treemacs nil t) ;; treemacs配置：工作区管理
(require 'my-init-telega nil t) ;; telega配置：telegram

(provide 'init-local)
;;; init-local.el ends here
