;;; my-init-undo-tree.el --- 我的undo-tree相关配置 -*- lexical-binding: t -*-
;;; Commentary: 编辑内容的历史记录树
;; Ref：https://www.emacswiki.org/emacs/UndoTree
;;; Code:

;;配置undo-tree
(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode)
  :after hydra
  :bind ("C-x C-h u" . hydra-undo-tree/body)
  :hydra (hydra-undo-tree (:hint nil)
  "
  _p_: undo  _n_: redo _s_: save _l_: load   "
  ("p"   undo-tree-undo)
  ("n"   undo-tree-redo)
  ("s"   undo-tree-save-history)
  ("l"   undo-tree-load-history)
  ("u"   undo-tree-visualize "visualize" :color blue)
  ("q"   nil "quit" :color blue)))
  
(provide 'my-init-undo-tree)
;;; my-init-undo-tree.el ends here