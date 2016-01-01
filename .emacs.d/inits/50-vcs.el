;; git-gutter
;; diffを常に表示する。便利
;; @see https://github.com/syohex/emacs-git-gutter
(el-get-bundle 'git-gutter)
(global-git-gutter-mode +1)

;; バージョン2以降ではキーバインドがまだ安定していないためしばらく1系を使う
(el-get-bundle 'magit/git-modes
  :features ("git-commit-mode" "git-rebase-mode" "gitattributes-mode" "gitconfig-mode" "gitignore-mode")
  :branch "1.0.0")
(el-get-bundle! 'magit/magit
  :depends (git-modes)
  :branch "1.4.2")
(setq magit-last-seen-setup-instructions "1.4.0")
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

(add-hook 'git-commit-mode-hook (setq auto-fill-mode nil))
