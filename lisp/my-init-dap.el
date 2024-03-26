;;; my-init-dap.el --- 我的dap相关配置 -*- lexical-binding: t -*-
;;; Commentary: 代码调试 Debug Adapter Protocol
;; Ref: https://emacs-lsp.github.io/dap-mode/
;;; Code:

;;配置dap
(use-package dap-mode
  :ensure t
  :after hydra lsp-mode
  :commands dap-debug
  :custom (dap-auto-configure-mode t)
  :config (dap-ui-mode 1)
  :hydra  (hydra-dap-mode
           (:color pink :hint nil :foreign-keys run)
           "
^Stepping^          ^Switch^                 ^Breakpoints^         ^Debug^                     ^Eval
^^^^^^^^----------------------------------------------------------------------------------------------------------------
_n_: Next           _ss_: Session            _bb_: Toggle          _dd_: Debug                 _ee_: Eval
_i_: Step in        _st_: Thread             _bd_: Delete          _dr_: Debug recent          _er_: Eval region
_o_: Step out       _sf_: Stack frame        _ba_: Add             _dl_: Debug last            _es_: Eval thing at point
_c_: Continue       _su_: Up stack frame     _bc_: Set condition   _de_: Edit debug template   _ea_: Add expression.
_r_: Restart frame  _sd_: Down stack frame   _bh_: Set hit count   _ds_: Debug restart
_Q_: Disconnect     _sl_: List locals        _bl_: Set log message
                  _sb_: List breakpoints
                  _sS_: List sessions
"
           ("n" dap-next)
           ("i" dap-step-in)
           ("o" dap-step-out)
           ("c" dap-continue)
           ("r" dap-restart-frame)
           ("ss" dap-switch-session)
           ("st" dap-switch-thread)
           ("sf" dap-switch-stack-frame)
           ("su" dap-up-stack-frame)
           ("sd" dap-down-stack-frame)
           ("sl" dap-ui-locals)
           ("sb" dap-ui-breakpoints)
           ("sS" dap-ui-sessions)
           ("bb" dap-breakpoint-toggle)
           ("ba" dap-breakpoint-add)
           ("bd" dap-breakpoint-delete)
           ("bc" dap-breakpoint-condition)
           ("bh" dap-breakpoint-hit-condition)
           ("bl" dap-breakpoint-log-message)
           ("dd" dap-debug)
           ("dr" dap-debug-recent)
           ("ds" dap-debug-restart)
           ("dl" dap-debug-last)
           ("de" dap-debug-edit-template)
           ("ee" dap-eval)
           ("ea" dap-ui-expressions-add)
           ("er" dap-eval-region)
           ("es" dap-eval-thing-at-point)
           ("q" nil "quit" :color blue)
           ("Q" dap-disconnect :color red)))
   
(provide 'my-init-dap)
;;; my-init-dap.el ends here
