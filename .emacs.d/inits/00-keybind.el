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
