;;; my-init-rime.el --- 我的rime相关配置 -*- lexical-binding: t -*-
;;; Commentary: 配置输入法
;; Ref: 
;; rime: https://github.com/DogLooksGood/emacs-rime
;; meow: https://github.com/meow-edit/meow
;; meow设计思路:https://github.com/meow-edit/meow/blob/master/EXPLANATION.org
;;             https://esrh.me/posts/2021-12-18-switching-to-meow.html
;;; Code:

;;配置rime
(use-package rime
  :ensure t
  :custom (default-input-method "rime")
  :config
      (define-key rime-mode-map (kbd "C-i") 'rime-force-enable)
      (define-key rime-mode-map (kbd "C-`") 'rime-send-keybinding) ;; 方案切换选择
      ;; 在一些特定的场景下需要自动使用英文,当其中有任何一个断言的值不是nil时，会自动使用英文
      (setq rime-disable-predicates
          '(meow-normal-mode-p
              meow-motion-mode-p
              meow-keypad-mode-p
              rime-predicate-prog-in-code-p
              rime-predicate-ace-window-p
              rime-predicate-hydra-p
              rime-predicate-tex-math-or-command-p
              rime-predicate-after-alphabet-char-p
              rime-predicate-punctuation-after-space-cc-p
              rime-predicate-special-ascii-line-begin-p))
      ;; 这个功能主要用来实现输入带空格的临时英文的场景
      (setq rime-inline-predicates
          '(rime-predicate-space-after-cc-p
              rime-predicate-current-uppercase-letter-p))
      (setq rime-inline-ascii-trigger 'shift-l)
    :hook
      (meow-insert-enter .
        (lambda() (when (derived-mode-p 'org-mode 'telega-chat-mode)(set-input-method "rime"))))
      (meow-insert-exit . (lambda() (set-input-method nil))))
  ;;自定义断言函数
  (defun rime-predicate-special-ascii-line-begin-p ()
    "If '/' or '#' at the beginning of the line."
    (and (> (point) (save-excursion (back-to-indentation) (point)))
        (let ((string (buffer-substring (point) (max (line-beginning-position) (- (point) 80)))))
          (string-match-p "^[\/#]" string))))

;;配置meow
(use-package meow
  :ensure t
  :hook (focus-out . meow-insert-exit)
  :config
  (meow-setup)
  (meow-global-mode 1))

;;自定义meow-setup函数
(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev)
   '("<escape>" . ignore))
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . "H-j")
   '("k" . "H-k")
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-yank)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("<escape>" . ignore)))

(provide 'my-init-rime)
;;; my-init-rime.el ends here
