;; php-mode
(package-install-unless-installed 'php-mode)
(require 'php-mode)
(add-hook 'php-mode-hook
          (lambda ()
            (php-enable-symfony2-coding-style)))
