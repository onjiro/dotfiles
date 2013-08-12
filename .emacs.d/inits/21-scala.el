;;; scalaモード用にロードパスを追加
;;(add-to-list 'load-path "~/.emacs.d/scala-mode")
;;    (require 'scala-mode-auto)

;; Load the ensime lisp code...
;;(add-to-list 'load-path "~/etc/ensime/elisp/")
;;(require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
;;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; MINI HOWTO:
;; Open .scala file. M-x ensime (once per project)
;;(put 'scroll-left 'disabled nil)
