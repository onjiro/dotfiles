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

;; recentf をバックエンドで記録
(when (require 'recentf nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer
        (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1))

;; file 名の補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;; バッファ自動再読み込み
(global-auto-revert-mode t)

;; 現在行をハイライト
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
(global-hl-line-mode)
