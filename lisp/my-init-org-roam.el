;;; my-init-org-roam.el --- 我的org-roam与org-roam-ui相关配置 -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;配置org
(setq user-full-name "Feng"
      user-mail-address "caizaifa1314@gmail.com")
(setq org-directory "~/org")
;; (setq display-line-numbers-type t)

;;配置org-roam
(use-package org-roam
  :ensure t
  :init (setq org-roam-v2-ack t)
  :after org
  :custom
  (org-roam-directory "~/org/roam")
  (org-roam-dalies-directory "journal/")
  (org-roam-completion-everywhere t)
  (setq org-default-notes-file "~/org/inbox.org")
  ;; org-roam模板设置
  ;; 激活(active)和未激活(inactive)的 timestamp 的区别在于，后者不会出现在 agenda
  ;; %<%H:%M> 为24小时制，%<%I:%M %p> 为12小时制
  ;; olp: 文件中的 headline 路径
  ;; %^g: 交互式地输入标签，并用 target 所在文件中的标签进行补全
  ;; %^G: 类似 %^g，但用所有 org-agenda-files 涉及文件中的标签进行补全
  (org-roam-capture-templates
   `(("d" "default" plain 
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+date:%U\n")
      :unnarrowed t)
     ("b" "book notes" plain
      (file "~/org/Templates/BookNoteTemplate.org")
      :if-new (file+head "books/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :Book: %^g\n#+date:%U\n")
      :unnarrowed t)
     ("a" "article notes" plain
      (file "~/org/Templates/AriticleTemplate.org")
      :if-new (file+head "article/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :Article: %^g\n#+date:%U\n")
      :unnarrowed t)
     ("p" "project" plain 
      "* Goal\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
      :if-new(file+head "project/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :Project: %^g\n#+date:%U\n")
      :unnarrowed t)
     ("z" "zkcards" plain
      (file "~/org/Templates/ZKCardsTemplate.org")
      :if-new (file+head "zkcards/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :ZK: %^g\n#+date:%U\n")
      :unnarrowed t)
     ("s" "source" plain
      (file "~/org/Templates/SourceTemplate.org")
      :if-new (file+head "source/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :Source: %^g\n#+date:%U\n")
      :unnarrowed t)))
  (org-roam-dailies-capture-templates
   '(("d" "default" entry "* %<%H:%M>: %?"
      :if-new(file+head+olp "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n" ("%<%Y-%m-%d>")))
     ("i" "列表" item "* %<%H:%M>: %?"
      :if-new(file+head+olp "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n" ("%<%Y-%m-%d>" "列表")))
     ("c" "chekbox 列表项" checkitem "* %<%H:%M>: %?"
      :if-new(file+head+olp "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n" ("%<%Y-%m-%d>" "列表项")))
     ("t" "表格行" table-line "* %<%H:%M>: %?"
      :if-new(file+head+olp "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n" ("%<%Y-%m-%d>" "表格行")))))
  :bind(
        ("C-c n c" . org-roam-capture)
        ("C-c n l" . org-roam-buffer-toggle)
        ("C-c n f" . org-roam-node-find)
        ("C-c n i" . org-roam-node-insert)
        ("C-c n t" . org-roam-tag-add)
        ("C-c n T" . org-roam-tag-remove)
        :map org-mode-map
        ("C-c i" . completion-at-point)
        :map org-roam-dailies-map
        ("Y" . org-roam-dailies-capture-yesterday)
        ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap ("C-c n d" . org-roam-dailies-map)
  ;; ([mouse-1] org-roam-visit-thing))
  :config (require 'org-roam-dailies) (org-roam-setup))

;; for org-roam-buffer-toggle;; Use side-window like V1;; This can take advantage of slots available with it
(add-to-list 'display-buffer-alist
             '("\\*org-roam||*"
               (display-buffer-in-side-window)
               (side . right)
               (slot . 0)
               (window-width . 0.25)
               (preserve-size . (t nil))
               (window-parameters . ((no-other-window . t)
                                     (no-delete-other-windows . t)))))

;;配置org-roam-ui
;; (use-package websocket
;;             :after org-roam)
(use-package org-roam-ui
  :after org-roam ;; or :after org
;;  :hook (after-init . org-roam-ui-mode)
  :config
    (setq org-roam-ui-sync-theme t
      org-roam-ui-follow t
      org-roam-ui-update-on-save t
      org-roam-ui-open-on-start nil))
  ;; (setq org-roam-ui-custom-theme
  ;;     '((bg . "#1E2029")
  ;;         (bg-alt . "#282a36")
  ;;         (fg . "#f8f8f2")
  ;;         (fg-alt . "#6272a4")
  ;;         (red . "#ff5555")
  ;;         (orange . "#f1fa8c")
  ;;         (yellow ."#ffb86c")
  ;;         (green . "#50fa7b")
  ;;         (cyan . "#8be9fd")
  ;;         (blue . "#ff79c6")
  ;;         (violet . "#8be9fd")
  ;;         (magenta . "#bd93f9")))

(provide 'my-init-org-roam)
;;; my-init-org-roam.el ends here
