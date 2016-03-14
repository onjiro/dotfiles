;; 行番号表示
(require 'linum)
(global-linum-mode t)

;; ツールバー/メニューバー表示なし
(if tool-bar-mode (tool-bar-mode 0))
(if menu-bar-mode (menu-bar-mode -1))

;; インデントの設定
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2 indent-tabs-mode nil)

;; モードラインに行数と列数を表示
(line-number-mode 1)
(column-number-mode 1)

;; 行移動時には桁位置を固定
(put 'set-goal-column 'disabled nil)

;; ファイル名がかぶった場合にわかりやすくする
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; file 名の補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;; バッファ自動再読み込み
(global-auto-revert-mode t)

;; 現在行をハイライト
;; カーソル移動が重くなる対策
;; http://rubikitch.com/2015/05/14/global-hl-line-mode-timer/
(require 'hl-line)
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "#98FB98"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(defun global-hl-line-timer-function ()
  (global-hl-line-unhighlight-all)
  (let ((global-hl-line-mode t))
    (global-hl-line-highlight)))
(setq global-hl-line-timer
      (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))
;; (cancel-timer global-hl-line-timer)

;; dired からファイル名変更を可能に
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; タブの表示幅を4に
(setq tab-width 4)

;; system-type predicates
;; from http://d.hatena.ne.jp/tomoya/20090807/1249601308
(setq darwin-p   (eq system-type 'darwin)
      linux-p    (eq system-type 'gnu/linux)
      carbon-p   (eq system-type 'mac)
      meadow-p   (featurep 'meadow))

;; Emacs と Mac のクリップボード共有
;; from http://hakurei-shain.blogspot.com/2010/05/mac.html
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(if (or darwin-p carbon-p)
    (setq interprogram-cut-function 'paste-to-osx)
    (setq interprogram-paste-function 'copy-from-osx))
