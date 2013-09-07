(package-install-unless-installed 'helm)

(require 'helm-config)
;; (require 'anything-startup)

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
(global-set-key "\C-x\C-f" 'my-helm-mini+)
(global-set-key "\C-x\C-v" 'find-file)