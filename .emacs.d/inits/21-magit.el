(package-install-unless-installed 'magit)
(require 'magit)
(global-set-key (kbd "C-c C-SPC") 'magit-status)

;; magit-statusを実行する前に Window構成を保存, その後最大化して
;; magit-statusを開いて, セッション終了後, 保存した状態に戻す
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun my/magit-quit-session ()
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'my/magit-quit-session)

(defadvice git-commit-commit (after move-to-magit-buffer activate)
  (delete-window))

(add-hook 'git-commit-mode-hook 'turn-off-auto-fill)
