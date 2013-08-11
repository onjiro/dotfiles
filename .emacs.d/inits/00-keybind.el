;; capitalize を backword で適用
(global-set-key "\M-C" 'capitalize-backward-word)
(defun capitalize-backward-word (arg)
  "Capitalize previous word (or arg words)."
  (interactive "p")
  (capitalize-word (- arg)))
