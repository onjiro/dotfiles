;; C-c C-l で折り返しの on/off
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)

;; C-c C-c でコメント on/off
(global-set-key "\C-c\C-c" 'comment-or-uncomment-region)

;; C-c C-f でfind-grep
(global-set-key "\C-c\C-f" 'find-grep)

;; キーを連打することで何とかするための怠惰な設定
(package-install-unless-installed 'key-combo)
(require 'key-combo)
(global-key-combo-mode 1)
(key-combo-define-global (kbd "-") '("-" " = " " == " " === "))
(key-combo-define-global (kbd "[") '("[`!!']" "{`!!'}"))
(key-combo-define-global (kbd "2") '("2" "\"`!!'\"" "22" "222" "2222" "22222" "222222" "2222222" "22222222" "222222222"))
(key-combo-define-global (kbd "7") '("7" "'`!!''" "77" "777" "7777" "77777" "777777" "7777777" "77777777" "777777777"))
(key-combo-define-global (kbd "8") '("8" "(`!!')" "88" "888" "8888" "88888" "888888" "8888888" "88888888" "888888888"))
(key-combo-define-global (kbd "\\") '("\\" "_"))
