;; recentf をバックエンドで記録
(when (require 'recentf nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer
        (run-with-idle-timer 60 t 'recentf-save-list))
  (recentf-mode 1))

;; recentf で dired も記録する
(require 'recentf-ext)
