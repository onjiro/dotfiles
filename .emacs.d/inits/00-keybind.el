;; C-c C-l で折り返しの on/off
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)

;; C-c C-c でコメント on/off
(global-set-key "\C-c\C-c" 'comment-or-uncomment-region)

;; C-c C-f でfind-grep -> helm-ag を利用するように変更
;;(global-set-key "\C-c\C-f" 'find-grep)

;; キーを連打することで何とかするための怠惰な設定
(el-get-bundle! 'uk-ar/key-combo)
(global-key-combo-mode 1)
(key-combo-define-global (kbd "[") '("[`!!']" "{`!!'}" "(`!!')"))
(key-combo-define-global (kbd "\\") '("\\" "_"))

;;; 00-keybind.el ends here
