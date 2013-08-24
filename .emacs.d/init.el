;; ===================================================
;; for Emacs24's package.el
;; @see Known Issue on http://melpa.milkbox.net/
(defadvice package-compute-transaction
  (before package-compute-transaction-reverse (package-list requirements) activate compile)
    "reverse the requirements"
    (setq requirements (reverse requirements))
    (print requirements))
;; ===================================================

(add-to-list 'load-path "~/.emacs.d/site-lisp")
;; install されていない場合、package install を行う
(defun not-installed(package) (not (package-installed-p package)))
(defun package-install-unless-installed(package)
  (when (not-installed package) (package-install package)))

;; package.el を利用してインストール
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; init-loader.el を利用して設定を分割
;; "~/.emacs.d/inits" はデフォルトのロードパス
(require 'init-loader)
(setq init-loader-byte-compile t)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

;; プラットフォーム判別用ライブラリ
(add-to-list 'load-path "~/.emacs.d/vendor/platform-p")
(require 'platform-p)

(add-to-list 'default-frame-alist '(alpha . 85))
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;;; 起動時のウィンドウサイズ
(add-to-list 'default-frame-alist '(width . 120))
(add-to-list 'default-frame-alist '(height . 40))

(put 'set-goal-column 'disabled nil)
