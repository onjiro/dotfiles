;; php-mode
(package-install-unless-installed 'php-mode)
(require 'php-mode)
(add-hook 'php-mode-hook
          (lambda ()
            ;(require 'php-completion)
            ;(php-completion-mode t)
            ;(define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
            (c-set-offset 'case-label' 2)
            (c-set-offset 'arglist-intro' 2)
            (c-set-offset 'arglist-cont-nonempty' 2)
            (c-set-offset 'arglist-close' 0)))
