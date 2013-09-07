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