;;; anything
(require 'anything-startup)
;; my-anything-filelist+
;; http://d.hatena.ne.jp/klon/20110823/1314093471
(defun my-anything-filelist+ ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-files-in-current-dir+
     anything-c-source-buffers+
     anything-c-source-recentf
     anything-c-source-mac-spotlight
     anything-c-source-locate)
   " *my-anything-filelist+*"))

(global-set-key "\C-x\C-b" 'anything-buffers+)
(global-set-key "\C-x\C-f" 'my-anything-filelist+)
(global-set-key "\C-x\C-v" 'find-file)
