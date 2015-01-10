;; php-mode
(require 'php-mode)
(add-hook 'php-mode-hook
          (lambda ()
            (php-enable-symfony2-coding-style)
            (key-combo-define-local (kbd "-") nil)
            (key-combo-define-local (kbd "-") '("-" "->" "=" "=>" "==" "==="))
            (key-combo-define-local (kbd "->") nil)
            (key-combo-define-local (kbd "4") '("4" "$" "44" "444" "4444" "44444" "444444" "4444444" "44444444" "444444444"))
            ))
