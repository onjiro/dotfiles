(el-get-bundle 'helm
  :features (helm-config))

(defun my-helm-mini+ ()
  (interactive)
  (helm-other-buffer '(
    helm-source-files-in-current-dir
    helm-source-buffers-list
    helm-source-recentf
    helm-source-buffer-not-found
    )
  "*my-helm-mini*"))

(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'my-helm-mini+)
(global-set-key (kbd "M-u C-f") 'find-FILE)

(custom-set-variables '(helm-buffer-max-length 50))
(setq recentf-max-menu-items 200)
(setq recentf-max-saved-items 3000)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
