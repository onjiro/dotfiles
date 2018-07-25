;; recentf をバックエンドで記録
(when (require 'recentf nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 'never)
  (setq recentf-auto-save-timer
        (run-with-idle-timer 300 t 'recentf-save-list))
  (recentf-mode 1))

;; recentf で dired も記録する
(el-get-bundle! 'recentf-ext)
