(add-to-list 'load-path "~/.emacs.d/site-lisp")
;; install されていない場合、package install を行う
(defun package-install-unless-installed(package)
  (ignore package))

;; cask を利用
(require 'cask)
(cask-initialize)

;; init-loader.el を利用して設定を分割
;; "~/.emacs.d/inits" はデフォルトのロードパス
(require 'init-loader)
(setq init-loader-byte-compile t)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
