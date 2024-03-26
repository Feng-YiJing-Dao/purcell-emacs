;;; my-init-font.el --- 我的font相关配置 -*- lexical-binding: t -*-
;;; Commentary: 配置字体
;; 英文采用Iosevka字体
;; 中文采用LXGW WenKai字体
;; emoji采用Apple Color Emoji字体
;;; Code:

;; 添加下钩子延迟加载字体
(defun defer-font-setup (frame)
  "Deferred font setup, as the window system may not be initialized yet."
  (select-frame frame)
  (when (display-graphic-p frame)
    (set-frame-font "Iosevka" t t)))

(add-hook 'after-make-frame-functions 'defer-font-setup)

;;配置font
(defun qiang-font-existsp (font)
  (if (null (x-list-fonts font)) nil t))

;; LXGW WenKai Mono 配合 Iosevka 按照 1:1 缩放，偶数字号就可以做到等高等宽。
(defvar zh-font-list '("LXGW WenKai" "HanaMinB"))
(defvar en-font-list '("Iosevka" "Fira Code" "IBM Plex Mono"))

(defun qiang-make-font-string (font-name font-size)
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

(defun qiang-set-font (english-fonts
                       english-font-size
                       chinese-fonts
                       &optional chinese-font-scale)
  (setq chinese-font-scale (or chinese-font-scale 1))
  (setq face-font-rescale-alist
        (cl-loop for x in zh-font-list
                 collect (cons x chinese-font-scale)))
  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-scale to nil, it will follow english-font-size"
  (let ((en-font (qiang-make-font-string
                  (cl-find-if #'qiang-font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (cl-find-if #'qiang-font-existsp chinese-fonts))))
    ;; Set the default English font
    (message "Set English Font to %s" en-font)
    (set-face-attribute 'default nil :font en-font)
    ;; Set Chinese font
    ;; Do not use 'unicode charset, it will cause the English font setting invalid
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset zh-font))))

(qiang-set-font en-font-list 12 zh-font-list)
(add-to-list 'face-font-rescale-alist '("Apple Color Emoji" . 0.8))

(provide 'my-init-font)
;;; my-init-font.el ends here
