;; 行番号表示
(require 'linum)
(global-linum-mode t)

;; ツールバー/メニューバー表示なし
(if tool-bar-mode (tool-bar-mode 0))
(if menu-bar-mode (menu-bar-mode -1))

;; 対応する括弧をハイライト
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2 indent-tabs-mode nil)

;; モードラインに行数と列数を表示
(line-number-mode 1)
(column-number-mode 1)

;; 折り返し表示ON/OFF
(defun toggle-truncate-lines ()
  "折り返し表示をトグル動作します."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)
