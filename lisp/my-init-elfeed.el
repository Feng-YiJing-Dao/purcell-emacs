;;; my-init-elfeed.el --- 我的elfeed相关配置 -*- lexical-binding: t -*-
;;; Commentary: 代码片段模板 
;; Ref：https://github.com/skeeto/elfeed
;;; Code:

;;配置elfeed
(use-package elfeed
  :bind (("C-x w" . elfeed))
  :config
  (setq elfeed-feeds
        '("http://nullprogram.com/feed/"
          "https://planet.emacslife.com/atom.xml"))
  (setq url-queue-timeout 30)
  (setq elfeed-feeds
        '(("http://nullprogram.com/feed/" blog emacs)
          "http://www.50ply.com/atom.xml" ; no autotagging
          ("http://nedroid.com/feed/" webcomic)))
  ;; Mark all YouTube entries
  :hook ((elfeed-new-entry . (lambda ()
                               (elfeed-make-tagger :feed-url "youtube\\.com"
                                                   :add '(video youtube)))))
  ;; Entries older than 2 weeks are marked as read
  :hook ((elfeed-new-entry . (lambda ()
                               (elfeed-make-tagger :before "2 weeks ago"
                                                   :remove 'unread))))
  :hook ((elfeed-new-entry . (lambda ()
                               (elfeed-make-tagger :feed-url "example\\.com"
                                                   :entry-title '(not "something interesting")
                                                   :add 'junk
                                                   :remove 'unread)))))


(use-package elfeed-search
  :config
  (defface important-elfeed-entry
    '((t :foreground "#f77"))
    "Marks an important Elfeed entry.")
  (push '(important important-elfeed-entry) elfeed-search-face-alist))

(use-package elfeed-meta
  :hook ((elfeed-new-entry . (lambda ()
                              (setf (elfeed-meta entry :rating) 4))))
  (message (format "%s" (elfeed-meta entry :rating))))

(use-package elfeed-feed
  :hook ((elfeed-new-entry . (lambda ()
                              (setf (elfeed-meta feed :title) "My Better Title")))))

;;配置elfeed-tube
;; Ref：https://github.com/karthink/elfeed-tube
(use-package elfeed-tube
  :ensure t ;; or :straight t
  :after elfeed
  :demand t
  :config
  ;; (setq elfeed-tube-auto-save-p nil) ; default value
  ;; (setq elfeed-tube-auto-fetch-p t)  ; default value
  (elfeed-tube-setup)

  :bind (:map elfeed-show-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)
         :map elfeed-search-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)))

(use-package elfeed-tube-mpv
  :ensure t ;; or :straight t
  :bind (:map elfeed-show-mode-map
              ("C-c C-f" . elfeed-tube-mpv-follow-mode)
              ("C-c C-w" . elfeed-tube-mpv-where)))

(provide 'my-init-elfeed)
;;; my-init-elfeed.el ends here
