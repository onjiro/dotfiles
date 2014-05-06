;; capitalize を backword で適用
(global-set-key "\M-C" 'capitalize-backward-word)
(defun capitalize-backward-word (arg)
  "Capitalize previous word (or arg words)."
  (interactive "p")
  (capitalize-word (- arg)))

;; C-c C-l で折り返しの on/off
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)

;; C-c C-c でコメント on/off
(global-set-key "\C-c\C-c" 'comment-or-uncomment-region)

;; C-c C-f でfind-grep
(global-set-key "\C-c\C-f" 'find-grep)

;; キーを連打することで何とかするための怠惰な設定
(package-install-unless-installed 'key-combo)
(require 'key-combo)
(key-combo-define-global (kbd "-") '("-" " = " " == " " === "))
(key-combo-define-global (kbd "[") '("[`!!']" "{`!!'}"))
